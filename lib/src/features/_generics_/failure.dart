/// Custom Error class
class Failure implements Exception {
  final String message;
  const Failure(this.message);
}