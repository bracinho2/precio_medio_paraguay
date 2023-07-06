class Address {
  String departament;
  String city;

  Address({
    required this.departament,
    required this.city,
  });

  factory Address.isEmpty() {
    return Address(departament: '', city: '');
  }

  bool isValid() {
    return departament.isNotEmpty && city.isNotEmpty;
  }

  @override
  String toString() =>
      'AddressAggregate(departament: $departament, city: $city)';
}
