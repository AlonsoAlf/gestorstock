import 'package:mysql1/mysql1.dart';
abstract class DataBase {
  static final String _host = "localhost";
  static final int _port = 3306;
  static final String _user = "root";
  static final String _dbName = "stockalmacen_db";

  static Future<void> crearDataBase() async{

    var settings = ConnectionSettings(
      host: _host,
      port: _port,
      user: _user,
     db: _dbName
    );
    MySqlConnection conn = await MySqlConnection.connect(settings);
    await conn.query("CREATE DATABASE IF NOT EXISTS stockalmacen_db");
    await conn.query("USE $_dbName");
    await crearTablaProducto(conn);
    await conn.close();//importante cerrar conexion
  }
  static Future<MySqlConnection> establecerConexion() async{
    var settings = ConnectionSettings(      
      host: _host,
      port: _port,
      user: _user,
      db: _dbName
      );
      MySqlConnection conn = await MySqlConnection.connect(settings);
      return conn;
  }
  static Future<void> crearTablaProducto(MySqlConnection conn) async{
    await conn.query("""CREATE TABLE IF NOT EXISTS producto(
        idproducto INT PRIMARY KEY AUTO_INCREMENT,
        nombre VARCHAR(100) NOT NULL,
        proveedor VARCHAR(100) NOT NULL,
        cantidad VARCHAR(100) NOT NULL
    );
    """);
  }
}
/*abstract class DataBase{
  static final String _host = "localhost";
  static final int _port = 3306;
  static final String _user = "root";
 static final String _dbName = "stockalmacen_db";

  static Future<void> instalacion() async{
    var settings = ConnectionSettings(
      host: _host,
      port: _port,
      user: _user,
      db: _dbName
    );
    MySqlConnection conn = await MySqlConnection.connect(settings);
    await conn.query("CREATE DATABASE IF NOT EXIST stockalmacen_db");
    await conn.query("USE $_dbName");
    await crearTablaProducto(conn);
    await conn.close();
  }
  static Future<MySqlConnection> crearTablaProducto() async{
    var settings = ConnectionSettings(      
    host: _host,
    port: _port,
    user: _user,
    db: _dbName
    );
    MySqlConnection conn = await MySqlConnection.connect(settings);
    return conn;
  }
  static Future<void> crearTablaProducto(MySqlConnection conn) async{
  await conn.query("""CREATE TABLE IF NOT EXISTS stock(
      idproducto INT PRIMARY KEY AUTO_INCREMENT,
      producto VARCHAR(100) NOT NULL,
      proveedor VARCHAR(100) NOT NULL,
      cantidad VARCHAR(100) NOT NULL
  );
  """);
  } 
}*/