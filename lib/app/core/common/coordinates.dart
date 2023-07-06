class Coordinates {
  String latitude;
  String longitude;
  Coordinates({
    required this.latitude,
    required this.longitude,
  });

  factory Coordinates.isEmpty() {
    return Coordinates(latitude: '', longitude: '');
  }

  bool isValid() {
    return latitude.isNotEmpty && longitude.isNotEmpty;
  }

  @override
  String toString() =>
      'Coordinates(latitude: $latitude, longitude: $longitude)';
}
