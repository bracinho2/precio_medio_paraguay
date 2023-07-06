abstract class CarRegisterError {}

class InvalidCar extends CarRegisterError {}

class CarMapperError extends CarRegisterError {}

class CantAddCar extends CarRegisterError {}

class CantGetAllCars extends CarRegisterError {}

class CantUpdateCar extends CarRegisterError {}

class CarNotFound extends CarRegisterError {}

class CarListNotFound extends CarRegisterError {}

class CantRemoveCar extends CarRegisterError {}
