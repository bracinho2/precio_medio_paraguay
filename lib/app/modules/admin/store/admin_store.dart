import 'package:rx_notifier/rx_notifier.dart';

import '../../car_register/domain/entities/car_entity.dart';

class AdminStore {
  final carListState = RxNotifier<List<CarEntity>>([]);

  final getAllCarsAction = RxAction();
}
