import 'package:precio_medio_paraguay/app/core/enums/car_fuel_type_enum.dart';
import 'package:precio_medio_paraguay/app/core/enums/car_gear_enum.dart';
import 'package:precio_medio_paraguay/app/core/enums/car_sale_type_enum.dart';

class SearchResultPriceEntity {
  final String? uid;
  final String manufacturer;
  final String model;
  final String departamento;
  final String municipio;
  final CarSaleTypeENUM saleType;
  final double dolar;
  final double guarani;
  final String color;
  final CarGearTypeENUM gear;
  final CarFuelTypeENUM fuel;
  final double ondometer;
  final String year;
  final String informedBy;
  final String phone;
  final String email;
  final String anouncementDate;

  const SearchResultPriceEntity({
    this.uid,
    required this.manufacturer,
    required this.model,
    required this.departamento,
    required this.municipio,
    required this.saleType,
    required this.dolar,
    required this.guarani,
    required this.color,
    required this.gear,
    required this.fuel,
    required this.ondometer,
    required this.year,
    required this.informedBy,
    required this.phone,
    required this.email,
    required this.anouncementDate,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'uid': uid,
      'manufacturer': manufacturer,
      'model': model,
      'departamento': departamento,
      'municipio': municipio,
      'saleType': saleType.value,
      'dolar': dolar.toString(),
      'guarani': guarani.toString(),
      'color': color,
      'gear': gear.value,
      'fuel': fuel.name,
      'ondometer': ondometer.toString(),
      'year': year,
      'informedBy': informedBy,
      'phone': phone,
      'email': email,
      'anouncementDate': anouncementDate,
    };
  }
}
