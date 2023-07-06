import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:precio_medio_paraguay/app/core/services/locations/location_service.dart';
import 'package:precio_medio_paraguay/app/core/services/snackbar_manager/snackbar_manager.dart';
import 'package:precio_medio_paraguay/app/core/services/whatsapp/whatsapp.dart';

import 'services/firestore/firebase_remote_storage_service.dart';
import 'services/firestore/remote_storage_service_interface.dart';
import 'services/google_maps/lauch_map_location.dart';
import 'services/local_cache_service/local_cache_service.dart';
import 'services/shared_preferences/shared_preferences.dart';

class CoreModule extends Module {
  @override
  final List<Bind> binds = [
    Bind.lazySingleton<IRemoteStorage>(
        (i) => FirebaseRemoteStorage(FirebaseFirestore.instance),
        export: true),
    Bind.lazySingleton<ILocalStoragePreferences>(
        (i) => LocalStoragePreferences(),
        export: true),
    Bind.lazySingleton<SnackBarManager>((i) => SnackBarManager(), export: true),
    Bind.lazySingleton<ILocationService>((i) => LocationService(),
        export: true),
    Bind.lazySingleton<LocalCacheService>((i) => LocalCacheService(i()),
        export: true),
    Bind.lazySingleton<AppMessager>((i) => SystemWhatsappMessage(),
        export: true),
    Bind.lazySingleton<MapLocationService>((i) => GoogleMapsLocationService(),
        export: true),
  ];
}
