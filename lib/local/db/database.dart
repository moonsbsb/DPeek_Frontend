import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:drift_flutter/drift_flutter.dart';
import 'dart:io';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as p;
import 'package:mypal/local/table/Subscription.dart';
import 'package:mypal/local/table/SubscriptionPeriod.dart';

part 'database.g.dart';
 
@DriftDatabase(tables: [Subscription, SubscriptionPeriod])
class Database extends _$Database{
  Database() : super(_openConnection());

  @override
  int get schemaVersion => 1;

  // 데이터 가져오기
  Stream<List<SubscriptionData>> watchAllSubscription(){
    return select(subscription).watch();
  }
  // 데이터 추가
  Future<int> addSubscription(SubscriptionCompanion entry){
    return into(subscription).insert(entry);
  }
  // 데이터 수정
  Future<bool> updateSubscription(SubscriptionData entry){
    return update(subscription).replace(entry);
  }
  // 데이터 삭제
  Future<int> deleteSubscriptioin(SubscriptionData entry){
    return delete(subscription).delete(entry);
  }
}

QueryExecutor _openConnection(){
  return driftDatabase(name: 'subscription_db');
}