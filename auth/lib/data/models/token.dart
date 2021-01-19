/// A wrapper around a string that holds the authentication token.
///
/// The reason it has been implemented this way is that passing the Token object
/// around, instead of simply passing a string provides a nicer path for features
/// to be added later on, by expanding this class.
class Token {
  // The auth token itself
  final String value;

  // Constructor
  const Token({this.value});
}
