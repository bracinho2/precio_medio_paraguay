import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:precio_medio_paraguay/app/core/common/coordinates.dart';
import 'package:precio_medio_paraguay/app/core/services/firestore/remote_storage_service_interface.dart';
import 'package:precio_medio_paraguay/app/modules/users/model/user_entity.dart';
import 'package:precio_medio_paraguay/app/modules/authenticator/external/http/firebase_auth_datasource_impl.dart';
import 'package:precio_medio_paraguay/app/modules/authenticator/external/http/mappers/user_mapper.dart';
import 'package:precio_medio_paraguay/app/modules/authenticator/infra/datasource/auth_datasource.dart';
import 'package:precio_medio_paraguay/app/modules/authenticator/domain/errors/user_error.dart';

class FirebaseRemoteStorageMock extends Mock implements IRemoteStorage {}

void main() {
  late AuthDatasource datasource;
  late IRemoteStorage storage;

  setUp(() {
    storage = FirebaseRemoteStorageMock();
    datasource = FireaseAuthDatasourceImpl(storage);
  });
  group('Register User', () {
    test('Should User Register', () async {
      final user = UserEntity(
        name: 'Fake',
        identify: '01010',
        email: 'fake@fake.com',
        password: 'S.com222',
        coordinates: Coordinates.isEmpty(),
        phone: '+595986697862',
        registeredAt: DateTime(2000),
      );

      when(
        () => storage.addItem(
            map: UserMapper.toMap(user), collectionPath: 'users'),
      ).thenAnswer((_) async => Future.value(true));

      var result = await datasource.registerUser(user: user);
      expect(result, isTrue);
    });

    test('Should Get User By ID', () async {
      final user = UserEntity(
        uid: '01',
        name: 'Fake',
        identify: '01010',
        email: 'fake@fake.com',
        password: 'S.com222',
        coordinates: Coordinates.isEmpty(),
        phone: '+595986697862',
        registeredAt: DateTime(2000),
      );

      when(
        () => storage.getByID(id: '01', collectionPath: 'users'),
      ).thenAnswer((_) async => Future.value(UserMapper.toMap(user)));

      final result = await datasource.getUserById(uid: '01');

      expect(result, isA<UserEntity>());
    });

    test('Should throw an UserNotFound when has no items', () async {
      final result = datasource.getUserById(uid: '01');

      expectLater(result, throwsA(isA<NotFoundUser>()));
    });

    test('Should User update', () async {
      final user = UserEntity(
        uid: '01',
        name: 'Fake',
        identify: '01010',
        email: 'fake@fake.com',
        password: 'S.com222',
        coordinates: Coordinates.isEmpty(),
        phone: '+595986697862',
        registeredAt: DateTime(2000),
      );

      when(
        () => storage.updateItem(
            map: UserMapper.toMap(user), collectionPath: 'users'),
      ).thenAnswer((_) async => Future.value(true));

      final result = await datasource.updateUser(user: user);

      expect(result, isTrue);
    });
  });
}
