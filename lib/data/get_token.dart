import 'package:ru_app/networks/network.dart';

/// A class that handles inserting a token into the server.
///
/// This class has a single method, [insertToken], which sends a POST
/// request to the server with the token. The server will ignore the
/// token if it is not provided.
class GetToken {
  GetToken();

  /// Inserts a token into the server.
  ///
  /// This method makes a POST request to the server with the token
  /// and awaits for the response.
  ///
  /// The [token] is an optional parameter. If it is not provided,
  /// the server will ignore the token.
  void insertToken({String? token}) async {
    // Create a NetworkHelper instance to handle network requests.
    NetworkHelper networkHelper = NetworkHelper();

    // Send a POST request to the server with the token.
    // The server will ignore the token if it is not provided.
    await networkHelper.postUserToken(token: token);
  }
}
