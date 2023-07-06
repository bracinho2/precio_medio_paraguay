import 'package:precio_medio_paraguay/app/core/enums/car_fuel_type_enum.dart';
import 'package:precio_medio_paraguay/app/core/enums/car_gear_enum.dart';
import 'package:precio_medio_paraguay/app/core/enums/car_sale_type_enum.dart';
import 'package:precio_medio_paraguay/app/modules/search_page/domain/entities/search_result/search_result_price_entity.dart';

import '../../domain/entities/search_result/search_result_entity.dart';

const fakeSearchResulEntity = SearchResultEntity(
  uid: 'myUID',
  manufacturer: 'Audi',
  model: 'A1',
  minimum: 200.00,
  medium: 400.00,
  maximum: 800.00,
  year: '1998',
  prices: [
    SearchResultPriceEntity(
      uid: '01',
      manufacturer: 'Toyota',
      model: 'Vios',
      departamento: 'Canindeyú',
      municipio: 'Salto del Guaira',
      saleType: CarSaleTypeENUM.direct,
      dolar: 8000,
      guarani: 2000000,
      color: 'Negro',
      gear: CarGearTypeENUM.automatic,
      fuel: CarFuelTypeENUM.gasoline,
      ondometer: 55000,
      year: '2000',
      informedBy: 'bracinho2',
      phone: '+5959886697862',
      email: 'py5th@qsl.net',
      anouncementDate: '2023-03-06 16: 32: 00.000Z',
    )
  ],
);
