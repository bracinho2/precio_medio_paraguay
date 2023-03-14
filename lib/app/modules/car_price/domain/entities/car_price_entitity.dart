import 'package:precio_medio_paraguay/app/core/value_objects/date_time_vo.dart';
import 'package:precio_medio_paraguay/app/core/value_objects/id_vo.dart';
import 'package:precio_medio_paraguay/app/core/value_objects/price_vo.dart';
import 'package:precio_medio_paraguay/app/modules/car_register/domain/entities/car_entity.dart';

import '../../../../core/enums/car_sale_type.dart';

class CarPriceEntity {
  ID _id;
  CarEntity _car;
  String _departamento;
  String _municipio;
  CarSaleType _saleType;
  PriceUSD _price;
  Date _informedAt;
  ID _informedByID;

  CarPriceEntity({
    required String id,
    required CarEntity car,
    required String departamento,
    required String municipio,
    required CarSaleType saleType,
    required PriceUSD price,
    required DateTime informedAt,
    required String informedByID,
  })  : _id = ID(id),
        _car = car,
        _departamento = departamento,
        _municipio = municipio,
        _saleType = saleType,
        _price = price,
        _informedAt = Date(DateTime.now()),
        _informedByID = ID(
          informedByID,
        );

  ID get getID => _id;
  void setID(String? value) => _id = ID(value ?? '');

  CarEntity get getCar => _car;
  void setCar(CarEntity value) => _car = value;

  String get getDepartamento => _departamento;
  void setDepartamento(String value) => _departamento = value;

  String get getMunicipio => _municipio;
  void setMunicipio(String value) => _municipio = value;

  CarSaleType get getSaleType => _saleType;
  void setSaleType(CarSaleType value) => _saleType = value;

  PriceUSD get getPrice => _price;
  void setPrice(PriceUSD value) => _price = value;

  Date get getInformedAt => _informedAt;
  void setInformedAt(DateTime value) => _informedAt = Date(value);

  ID get getInformedByID => _informedByID;
  void setInformedByID(String value) => _informedByID = ID(value);

  String? validade() {
    if (_id.hasError()) {
      return _id.message;
    } else if (_car.hasError()) {
      return _car.validate();
    } else if (_price.hasError()) {
      return _price.message;
    } else if (_informedByID.hasError()) {
      return _informedByID.message;
    }
    return null;
  }

  bool hasError() {
    if (_id.hasError()) {
      return _id.hasError();
    } else if (_car.hasError()) {
      return _car.hasError();
    } else if (_price.hasError()) {
      return _price.hasError();
    } else if (_informedByID.hasError()) {
      return _informedByID.hasError();
    }
    return false;
  }

  factory CarPriceEntity.isEmpty() {
    return CarPriceEntity(
      id: '',
      car: CarEntity(
          id: '',
          name: '',
          manufacturer: '',
          year: '',
          gear: 'manual',
          color: '',
          saleType: CarSaleType.private,
          municipio: '',
          departamento: '',
          informedAt: DateTime.now(),
          updateAt: DateTime.now(),
          informedByID: ''),
      departamento: '',
      municipio: '',
      saleType: CarSaleType.private,
      price: PriceUSD(0.0),
      informedAt: DateTime.now(),
      informedByID: '',
    );
  }

  @override
  String toString() {
    return 'CarPriceEntity(_id: $_id, _car: $_car, _departamento: $_departamento, _municipio: $_municipio, _saleType: $_saleType, _price: $_price, _informedAt: $_informedAt, _informedByID: $_informedByID)';
  }

  @override
  bool operator ==(covariant CarPriceEntity other) {
    if (identical(this, other)) return true;

    return other._id == _id &&
        other._car == _car &&
        other._departamento == _departamento &&
        other._municipio == _municipio &&
        other._saleType == _saleType &&
        other._price == _price &&
        other._informedAt == _informedAt &&
        other._informedByID == _informedByID;
  }

  @override
  int get hashCode {
    return _id.hashCode ^
        _car.hashCode ^
        _departamento.hashCode ^
        _municipio.hashCode ^
        _saleType.hashCode ^
        _price.hashCode ^
        _informedAt.hashCode ^
        _informedByID.hashCode;
  }
}
