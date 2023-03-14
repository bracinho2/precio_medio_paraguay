import 'package:precio_medio_paraguay/app/modules/car_price/domain/entities/car_price_entitity.dart';

class CarPriceMapper {
  static CarPriceEntity fromMap({required Map<String, dynamic> map}) {
    return CarPriceEntity(
      id: map['id'],
      car: map['car'],
      departamento: map['departamento'],
      municipio: map['municipio'],
      saleType: map['saleType'],
      price: map['price'],
      informedAt: map['informedAt'],
      informedByID: map['informedByID'],
    );
  }

  static Map<String, dynamic> toMap({required CarPriceEntity carPrice}) {
    return {
      "id": carPrice.getID,
      "car": carPrice.getCar,
      "departamento": carPrice.getDepartamento,
      "municipio": carPrice.getMunicipio,
      "saleType": carPrice.getSaleType,
      "price": carPrice.getPrice,
      "informedAt": carPrice.getInformedAt,
      "informedByID": carPrice.getInformedByID,
    };
  }
}
