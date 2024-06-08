import 'package:mongo_dart/mongo_dart.dart';
import 'package:ru_app/networks/env.dart';

/// Class that connects to the MongoDB database.
///
/// This class is responsible for establishing a connection to the MongoDB
/// database. It provides a single method [connect] that returns a [Db]
/// object when the connection is successful.
class ConnectMongo {
  /// Constructor for the [ConnectMongo] class.
  ConnectMongo();

  /// Method to connect to the MongoDB database.
  ///
  /// This method creates a [Db] object by calling [Db.create] with the [host]
  /// constant as the argument. It then opens the connection to the database
  /// using [db.open()]. Finally, it returns the opened [Db] object.
  ///
  /// Returns a [Future<Db>] that resolves to the opened [Db] object.
  Future<Db> connect() async {
    final db = await Db.create(Env.host);
    await db.open();
    return db;
  }
}
