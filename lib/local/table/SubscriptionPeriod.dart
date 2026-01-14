import 'package:drift/drift.dart';
import 'Subscription.dart';

class SubscriptionPeriod extends Table{
  IntColumn get id => integer().autoIncrement()();

  IntColumn get subscriptionId => integer().references(Subscription, #id)();

  DateTimeColumn get startDate => dateTime()(); // 구독 시작일, 재개일
  DateTimeColumn get endDate => dateTime().nullable()(); // 구독 중지일
}