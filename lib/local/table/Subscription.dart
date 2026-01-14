import 'package:drift/drift.dart';



class Subscription extends Table {

  IntColumn get id => integer().autoIncrement()();
  TextColumn get title => text()(); // 구독 이름
  TextColumn get category => text()();  // 구독 유형
  IntColumn get fee => integer()(); // 결제 요금
  IntColumn get paymentDay => integer()(); // 매월 결제일
  BoolColumn get isUsing => boolean().withDefault(const Constant(true))(); // 구독/중지 상태
}
