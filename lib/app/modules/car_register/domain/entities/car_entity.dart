import 'package:precio_medio_paraguay/app/core/value_objects/car_color_vo.dart';
import 'package:precio_medio_paraguay/app/core/value_objects/car_manufacturer_vo.dart';
import 'package:precio_medio_paraguay/app/core/value_objects/car_name_vo.dart';
import 'package:precio_medio_paraguay/app/core/value_objects/id_vo.dart';

import '../../../../core/enums/car_gear_enum.dart';
import '../../../../core/enums/car_sale_type.dart';
import '../../../../core/value_objects/car_model_year_vo.dart';
import '../../../../core/value_objects/date_time_vo.dart';

class CarEntity {
  ID _id;
  CarName _name;
  CarManufacturer _manufacturer;
  CarModelYear _year;
  CarGearType _gear;
  CarColor _color;
  CarSaleType _saleTipe;
  String _municipio;
  String _departamento;
  Date _informedAt;
  Date _updateAt;
  ID _informedByID;
  CarEntity({
    required String id,
    required String name,
    required String manufacturer,
    required String year,
    required String gear,
    required String color,
    required CarSaleType saleType,
    required String municipio,
    required String departamento,
    required DateTime informedAt,
    required DateTime updateAt,
    required String informedByID,
  })  : _id = ID(id),
        _name = CarName(name),
        _year = CarModelYear(year),
        _manufacturer = CarManufacturer(manufacturer),
        _gear = CarGearType.fromString(gear),
        _color = CarColor(color),
        _saleTipe = CarSaleType.private,
        _municipio = municipio,
        _departamento = departamento,
        _informedAt = Date(DateTime.now()),
        _updateAt = Date(DateTime.now()),
        _informedByID = ID(informedByID);

  ID get getID => _id;
  void setID(String? value) => _id = ID(value ?? '');

  CarName get getName => _name;
  void setCarName(String? value) => _name = CarName(value ?? '');

  CarManufacturer get getManufacturer => _manufacturer;
  void setCarManufacturer(String? value) =>
      _manufacturer = CarManufacturer(value ?? '');

  CarModelYear get getModelYear => _year;
  void setCarModelYear(String? value) => _year = CarModelYear(value ?? '');

  CarGearType get getGearType => _gear;
  void setCarGearType(CarGearType value) => _gear = _gear = value;

  CarColor get getColor => _color;
  void setCarColor(String? value) => _color = CarColor(value ?? '');

  CarSaleType get getSaleType => _saleTipe;
  void setCarSaleType(CarSaleType value) => _saleTipe = value;

  String get getMunicipio => _municipio;
  void setMunicipio(String? value) => _municipio = value ?? '';

  String get getDepartamento => _departamento;
  void setDepartamento(String value) => _departamento = value;

  Date get getInformedAt => _informedAt;
  void setInformedAt(DateTime value) => _informedAt = Date(value);

  Date get getUpdateAt => _updateAt;
  void setUpdateAt(DateTime value) => _updateAt = Date(value);

  ID get getInformedByID => _informedByID;
  void setInformedByID(String? value) => _informedByID = ID(value ?? '');

  String? validate() {
    if (_id.hasError()) {
      return _id.message;
    } else if (_name.hasError()) {
      return _name.message;
    } else if (_manufacturer.hasError()) {
      return _manufacturer.message;
    } else if (_year.hasError()) {
      return _year.message;
    } else if (_color.hasError()) {
      return _color.message;
    } else if (_informedAt.hasError()) {
      return _informedAt.message;
    } else if (_updateAt.hasError()) {
      return _updateAt.message;
    } else if (_informedByID.hasError()) {
      return _informedByID.message;
    }
    return null;
  }

  bool hasError() {
    if (_id.hasError()) {
      return _id.hasError();
    } else if (_name.hasError()) {
      return _name.hasError();
    } else if (_manufacturer.hasError()) {
      return _manufacturer.hasError();
    } else if (_year.hasError()) {
      return _year.hasError();
    } else if (_color.hasError()) {
      return _color.hasError();
    } else if (_informedAt.hasError()) {
      return _informedAt.hasError();
    } else if (_updateAt.hasError()) {
      return _updateAt.hasError();
    } else if (_informedByID.hasError()) {
      return _informedByID.hasError();
    }
    return false;
  }

  factory CarEntity.isEmpty() {
    return CarEntity(
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
      informedByID: '',
    );
  }

  @override
  bool operator ==(covariant CarEntity other) {
    if (identical(this, other)) return true;

    return other._id == _id &&
        other._name == _name &&
        other._manufacturer == _manufacturer &&
        other._year == _year &&
        other._gear == _gear &&
        other._color == _color &&
        other._saleTipe == _saleTipe &&
        other._municipio == _municipio &&
        other._departamento == _departamento &&
        other._informedAt == _informedAt &&
        other._updateAt == _updateAt &&
        other._informedByID == _informedByID;
  }

  @override
  int get hashCode {
    return _id.hashCode ^
        _name.hashCode ^
        _manufacturer.hashCode ^
        _year.hashCode ^
        _gear.hashCode ^
        _color.hashCode ^
        _saleTipe.hashCode ^
        _municipio.hashCode ^
        _departamento.hashCode ^
        _informedAt.hashCode ^
        _updateAt.hashCode ^
        _informedByID.hashCode;
  }

  @override
  String toString() {
    return 'CarEntity(_id: $_id, _name: $_name, _manufacturer: $_manufacturer, _year: $_year, _gear: $_gear, _color: $_color, _saleTipe: $_saleTipe, _municipio: $_municipio, _departamento: $_departamento, _informedAt: $_informedAt, _updateAt: $_updateAt, _informedByID: $_informedByID)';
  }
}
