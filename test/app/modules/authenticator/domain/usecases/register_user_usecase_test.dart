import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:precio_medio_paraguay/app/core/common/coordinates.dart';
import 'package:precio_medio_paraguay/app/modules/users/model/user_entity.dart';
import 'package:precio_medio_paraguay/app/modules/authenticator/domain/repository/auth_repository.dart';
import 'package:precio_medio_paraguay/app/modules/authenticator/domain/usecases/register_user_usecase.dart';
import 'package:precio_medio_paraguay/app/modules/authenticator/domain/errors/user_error.dart';

class AuthRepositoryMock extends Mock implements AuthRepository {}

void main() {
  late final AuthRepository repository;
  late final RegisterUserUsecase usecase;

  setUpAll(() {
    repository = AuthRepositoryMock();
    usecase = RegisterUser(repository);
    registerFallbackValue(
      UserEntity(
        uid: '01',
        name: 'Fake',
        identify: '01010',
        email: 'fake@fake.com',
        coordinates: Coordinates.isEmpty(),
        password: 'fakePassword',
        phone: '+595986697862',
        registeredAt: DateTime(2017, 9, 7, 17, 30),
      ),
    );
  });

  group(UserEntity, () {
    test('Register User with ID informed', () async {
      var result = usecase.call(
          user: UserEntity(
        uid: '01',
        name: 'Fake',
        identify: '01010',
        email: 'fake@fake.com',
        password: 'fakePassword',
        coordinates: Coordinates.isEmpty(),
        phone: '+595986697862',
        registeredAt: DateTime(2017, 9, 7, 17, 30),
      ));

      expectLater(result, throwsA(isA<InvalidUser>()));
    });

    test('Register User with Empty Name', () async {
      var result = usecase.call(
          user: UserEntity(
        name: '',
        identify: '01010',
        email: 'fake@fake.com',
        password: 'fakePassword',
        coordinates: Coordinates.isEmpty(),
        phone: '+595986697862',
        registeredAt: DateTime(2017, 9, 7, 17, 30),
      ));

      expectLater(result, throwsA(isA<InvalidUser>()));
    });

    test('Register User with Empty Email', () async {
      var result = usecase.call(
          user: UserEntity(
        name: 'fake',
        identify: '01010',
        email: '',
        password: 'fakePassword',
        coordinates: Coordinates.isEmpty(),
        phone: '+595986697862',
        registeredAt: DateTime(2017, 9, 7, 17, 30),
      ));

      expectLater(result, throwsA(isA<InvalidEmail>()));
    });

    test('Register User with Invalid Email', () async {
      var result = usecase.call(
          user: UserEntity(
        name: 'Fake Name',
        identify: '01010',
        email: 'fake.com',
        password: 'fakePassword',
        coordinates: Coordinates.isEmpty(),
        phone: '+595986697862',
        registeredAt: DateTime(2017, 9, 7, 17, 30),
      ));

      expectLater(result, throwsA(isA<InvalidEmail>()));
    });

    test('Register User with Empty Password', () async {
      var result = usecase.call(
          user: UserEntity(
        uid: '01',
        name: 'Fake Name',
        identify: '01010',
        email: 'fake@fake.com',
        password: '',
        coordinates: Coordinates.isEmpty(),
        phone: '+595986697862',
        registeredAt: DateTime(2017, 9, 7, 17, 30),
      ));

      expectLater(result, throwsA(isA<InvalidUser>()));
    });
    test('Register User with Empty Phone', () async {
      var result = usecase.call(
          user: UserEntity(
        uid: '01',
        name: 'Fake Name',
        identify: '01010',
        email: 'fake@fake.com',
        password: 'fake',
        phone: '+595986697862',
        coordinates: Coordinates.isEmpty(),
        registeredAt: DateTime(02 - 06 - 2023),
      ));

      expectLater(result, throwsA(isA<InvalidUser>()));
    });

    test('Register User with Invalid Range Date', () async {
      var result = usecase.call(
          user: UserEntity(
        name: 'Fake Name',
        identify: '01010',
        email: 'fake@fake.com',
        password: 'S.com222',
        phone: '+595986697862',
        coordinates: Coordinates.isEmpty(),
        registeredAt: DateTime(2017, 9, 7, 17, 30),
        lastUpdate: DateTime(2017, 9, 6, 17, 30),
      ));

      expectLater(result, throwsA(isA<InvalidUser>()));
    });
    test('Register User', () async {
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
        () => repository.registerUser(user: user),
      ).thenAnswer((_) async => Future.value(true));

      final result = await usecase.call(user: user);

      expect(result, isTrue);
      verify(() => repository.registerUser(user: user)).called(1);
      verifyNoMoreInteractions(repository);
    });
  });
}
