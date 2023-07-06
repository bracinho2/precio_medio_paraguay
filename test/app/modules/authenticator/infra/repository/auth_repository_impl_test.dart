import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:precio_medio_paraguay/app/core/common/coordinates.dart';
import 'package:precio_medio_paraguay/app/modules/users/model/user_entity.dart';
import 'package:precio_medio_paraguay/app/modules/authenticator/domain/errors/user_error.dart';
import 'package:precio_medio_paraguay/app/modules/authenticator/domain/repository/auth_repository.dart';
import 'package:precio_medio_paraguay/app/modules/authenticator/infra/datasource/auth_datasource.dart';
import 'package:precio_medio_paraguay/app/modules/authenticator/infra/repository/auth_repository_impl.dart';

class AuthDatasourceMock extends Mock implements AuthDatasource {}

void main() {
  late final AuthDatasource datasource;
  late final AuthRepository repository;

  setUpAll(() {
    datasource = AuthDatasourceMock();
    repository = AuthRepositoryImpl(datasource);

    registerFallbackValue(UserEntity(
      uid: '01',
      name: 'Fake',
      identify: '01010',
      email: 'fake@fake.com',
      password: 'fakePassword',
      coordinates: Coordinates.isEmpty(),
      phone: '+595986697862',
      registeredAt: DateTime(2017, 9, 7, 17, 30),
    ));
  });

  group('Register User', () {
    test('Register User Sucess', () async {
      final user = UserEntity(
        name: 'Fake',
        identify: '01010',
        email: 'fake@fake.com',
        password: 'fakePassword',
        coordinates: Coordinates.isEmpty(),
        phone: '+595986697862',
        registeredAt: DateTime(2017, 9, 7, 17, 30),
      );
      when(
        () => datasource.registerUser(user: user),
      ).thenAnswer((_) async => Future.value(true));

      final result = await repository.registerUser(user: user);

      expect(result, isTrue);
      verify(() => datasource.registerUser(user: user)).called(1);
      verifyNoMoreInteractions(datasource);
    });
    test('Register User Error', () async {
      final user = UserEntity(
        name: 'Fake',
        identify: '01010',
        email: 'fake@fake.com',
        password: 'fakePassword',
        coordinates: Coordinates.isEmpty(),
        phone: '+595986697862',
        registeredAt: DateTime(2017, 9, 7, 17, 30),
      );
      when(
        () => datasource.registerUser(user: user),
      ).thenAnswer((_) async => Future.value(false));

      final result = await repository.registerUser(user: user);

      expect(result, isFalse);
      verify(() => datasource.registerUser(user: user)).called(1);
      verifyNoMoreInteractions(datasource);
    });

    test('Register User With a Repository Crash', () async {
      final user = UserEntity(
        name: 'Fake',
        identify: '01010',
        email: 'fake@fake.com',
        password: 'fakePassword',
        coordinates: Coordinates.isEmpty(),
        phone: '+595986697862',
        registeredAt: DateTime(2017, 9, 7, 17, 30),
      );
      when(
        () => datasource.registerUser(user: any(named: 'user')),
      ).thenThrow(SomethingWrong());

      var result = repository.registerUser(user: user);

      expectLater(result, throwsA(isA<SomethingWrong>()));
      verify(
        () => datasource.registerUser(user: user),
      ).called(1);
      verifyNoMoreInteractions(datasource);
    });
  });

  group('Update User', () {
    test('Update User Sucess', () async {
      final user = UserEntity(
        name: 'Fake',
        identify: '01010',
        email: 'fake@fake.com',
        password: 'fakePassword',
        coordinates: Coordinates.isEmpty(),
        phone: '+595986697862',
        registeredAt: DateTime(2017, 9, 7, 17, 30),
      );
      when(
        () => datasource.registerUser(user: user),
      ).thenAnswer((_) async => Future.value(true));

      final result = await repository.registerUser(user: user);

      expect(result, isTrue);
      verify(() => datasource.registerUser(user: user)).called(1);
      verifyNoMoreInteractions(datasource);
    });
    test('Update User Error', () async {
      final user = UserEntity(
        name: 'Fake',
        identify: '01010',
        email: 'fake@fake.com',
        password: 'fakePassword',
        coordinates: Coordinates.isEmpty(),
        phone: '+595986697862',
        registeredAt: DateTime(2017, 9, 7, 17, 30),
      );
      when(
        () => datasource.registerUser(user: user),
      ).thenAnswer((_) async => Future.value(false));

      final result = await repository.registerUser(user: user);

      expect(result, isFalse);
      verify(() => datasource.registerUser(user: user)).called(1);
      verifyNoMoreInteractions(datasource);
    });

    test('Update User With a Repository Crash', () async {
      final user = UserEntity(
        name: 'Fake',
        identify: '01010',
        email: 'fake@fake.com',
        password: 'fakePassword',
        coordinates: Coordinates.isEmpty(),
        phone: '+595986697862',
        registeredAt: DateTime(2017, 9, 7, 17, 30),
      );
      when(
        () => datasource.registerUser(user: any(named: 'user')),
      ).thenThrow(SomethingWrong());

      var result = repository.registerUser(user: user);

      expectLater(result, throwsA(isA<SomethingWrong>()));
      verify(
        () => datasource.registerUser(user: user),
      ).called(1);
      verifyNoMoreInteractions(datasource);
    });

    test('Update User With a Rethrow Repository Crash', () async {
      final user = UserEntity(
        name: 'Fake',
        identify: '01010',
        email: 'fake@fake.com',
        password: 'fakePassword',
        coordinates: Coordinates.isEmpty(),
        phone: '+595986697862',
        registeredAt: DateTime(2017, 9, 7, 17, 30),
      );
      when(
        () => datasource.registerUser(user: any(named: 'user')),
      ).thenThrow(Exception());

      var result = repository.registerUser(user: user);

      expectLater(result, throwsA(isA<CantRegisterUser>()));
      verify(
        () => datasource.registerUser(user: user),
      ).called(1);
      verifyNoMoreInteractions(datasource);
    });
  });

  group('Get User By ID', () {
    test('Get User By ID Success', () async {
      final user = UserEntity(
        uid: '01',
        name: 'Fake',
        identify: '01010',
        email: 'fake@fake.com',
        password: 'fakePassword',
        coordinates: Coordinates.isEmpty(),
        phone: '+595986697862',
        registeredAt: DateTime(2017, 9, 7, 17, 30),
      );
      when(
        () => datasource.getUserById(uid: '01'),
      ).thenAnswer((_) async => Future.value(user));

      final result = await repository.getUserById(uid: '01');

      expect(result, user);
      verify(() => datasource.getUserById(uid: '01')).called(1);
      verifyNoMoreInteractions(datasource);
    });
    test('Get User by ID Error', () async {
      when(
        () => datasource.getUserById(uid: '01'),
      ).thenAnswer((_) async => Future.value(null));

      final result = await repository.getUserById(uid: '01');

      expect(result, isNull);
      verify(() => datasource.getUserById(uid: '01')).called(1);
      verifyNoMoreInteractions(datasource);
    });

    test('Get User by ID With a Repository Crash', () async {
      when(
        () => datasource.getUserById(uid: '01'),
      ).thenThrow(NotFoundUser());

      final result = repository.getUserById(uid: '01');

      expect(result, throwsA(isA<NotFoundUser>()));
      verify(
        () => datasource.getUserById(uid: '01'),
      ).called(1);
      verifyNoMoreInteractions(datasource);
    });
  });
}
