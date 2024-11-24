// Define the Either class with two generic types L and R
abstract class Either<L, R> {
  const Either();

  // Factory constructors for creating Either instances
  factory Either.left(L l) => Left(l);
  factory Either.right(R r) => Right(r);

  // Fold function to handle both Left and Right cases
  T fold<T>(T Function(L) left, T Function(R) right);

  // Check if the instance is Left
  bool isLeft();

  // Check if the instance is Right
  bool isRight();
}

// Define the Left subclass with a value of type L
class Left<L, R> extends Either<L, R> {
  final L _value;
  const Left(this._value);

  @override
  T fold<T>(T Function(L) left, T Function(R) right) => left(_value);

  @override
  bool isLeft() => true;

  @override
  bool isRight() => false;

  L get value => _value; // Getter to access the value
}

// Define the Right subclass with a value of type R
class Right<L, R> extends Either<L, R> {
  final R _value;
  const Right(this._value);

  @override
  T fold<T>(T Function(L) left, T Function(R) right) => right(_value);

  @override
  bool isLeft() => false;

  @override
  bool isRight() => true;

  R get value => _value; // Getter to access the value
}
