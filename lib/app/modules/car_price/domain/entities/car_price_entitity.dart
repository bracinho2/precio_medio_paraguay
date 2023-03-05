// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:precio_medio_paraguay/app/core/enums/car_gear_enum.dart';
import 'package:precio_medio_paraguay/app/core/municipio_departamentos_paraguay/departamento_paraguay.dart';
import 'package:precio_medio_paraguay/app/core/municipio_departamentos_paraguay/municipio_paraguay.dart';
import 'package:precio_medio_paraguay/app/core/value_objects/id_vo.dart';
import 'package:precio_medio_paraguay/app/core/value_objects/price_vo.dart';
import 'package:precio_medio_paraguay/app/modules/car_register/domain/entities/car_entity.dart';

import '../../../../core/enums/car_sale_type.dart';

class CarPriceEntity {
  ID _id;
  CarEntity _car;
  Departamento _departamento;
  Municipio _municipio;
  CarSaleType _saleType;
  PriceUSD _price;

  CarPriceEntity({
    required String id,
    required CarEntity car,
    required Departamento departamento,
    required Municipio municipio,
    required CarSaleType saleType,
    required PriceUSD price,
  })  : _id = ID(id),
        _car = car,
        _departamento = departamento,
        _municipio = municipio,
        _saleType = saleType,
        _price = price;

  ID get getID => _id;
  void setID(String? value) => _id = ID(value ?? '');

  CarEntity get car => _car;
  void setCar(CarEntity value) => _car = value;

  Departamento get departamento => _departamento;
  void setDepartamento(Departamento value) => _departamento = value;

  Municipio get municipio => _municipio;
  void setMunicipio(Municipio value) => _municipio = value;

  CarSaleType get saleType => _saleType;
  void setSaleType(CarSaleType value) => _saleType = value;

  PriceUSD get price => _price;
  void setPrice(PriceUSD value) => _price = value;

  String? validade() {
    if (_id.hasError()) {
      return _id.message;
    } else if (_car.hasError()) {
      return _car.validate();
    } else if (_price.hasError()) {
      return _price.message;
    }
    return null;
  }

  factory CarPriceEntity.isEmpty() {
    return CarPriceEntity(
      id: '',
      car: CarEntity(
          id: '',
          name: '',
          manufacturer: '',
          year: '',
          gear: CarGearType.manual,
          color: '',
          saleType: CarSaleType.private,
          municipio: Municipio(id: 0, name: '', departamento: 0),
          departamento: Departamento(id: 0, name: '', capital: ''),
          informedAt: DateTime.now(),
          updateAt: DateTime.now(),
          informedByID: ''),
      departamento: Departamento(id: 0, name: '', capital: ''),
      municipio: Municipio(id: 0, name: '', departamento: 0),
      saleType: CarSaleType.private,
      price: PriceUSD(0.0),
    );
  }

  @override
  bool operator ==(covariant CarPriceEntity other) {
    if (identical(this, other)) return true;

    return other._id == _id &&
        other._car == _car &&
        other._departamento == _departamento &&
        other._municipio == _municipio &&
        other._saleType == _saleType &&
        other._price == _price;
  }

  @override
  int get hashCode {
    return _id.hashCode ^
        _car.hashCode ^
        _departamento.hashCode ^
        _municipio.hashCode ^
        _saleType.hashCode ^
        _price.hashCode;
  }

  @override
  String toString() {
    return 'CarPriceEntity(_id: $_id, _car: $_car, _departamento: $_departamento, _municipio: $_municipio, _saleType: $_saleType, _price: $_price)';
  }
}
