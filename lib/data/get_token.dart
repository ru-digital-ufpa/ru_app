import 'package:ru_app/networks/connect_mongo.dart';

class GetToken {
  GetToken();

  /// Inserts a token to the 'tokens' collection in the MongoDB database.
  ///
  /// The token is inserted as a document in the 'tokens' collection.
  ///
  /// Parameters:
  ///  - [token] (optional): The token to be inserted. If not provided, the token will be null.
  ///
  /// Returns:
  ///  None.
  void insertToken({String? token}) async {
    // Connect to the MongoDB database
    //   ConnectMongo connectMongo = ConnectMongo();
    //   // var db = await connectMongo.connect();

    //   // var collection = db.collection('tokens');

    //   // var existingItem = await collection.findOne({'token': token});

    //   // Insert the cardapio item only if the token is unique
    //   if (existingItem == null) {
    //     // Create a new cardapio item with the unique token
    //     Map<String, dynamic> newCardapioItem = {
    //       'token': token,
    //       // ... other cardapio data ...
    //     };

    //     // Insert the token as a document in the 'tokens' collection
    //     await collection.insert(newCardapioItem);
    //   }

    //   // Close the database connection
    //   db.close();
  }
}
