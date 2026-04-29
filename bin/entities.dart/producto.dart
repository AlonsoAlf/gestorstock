import '../utils/utils.dart';
import 'package:mysql1/mysql1.dart';

 class Producto {
  int? id;
  String? nombre;
  String? proveedor;
  int? cantidad;
  Producto(this.id, this.nombre, this.proveedor, this.cantidad);
    Producto.fromDataBase(ResultRow row) {
    id = row["idproducto"];
    nombre = row["nombre"];
    proveedor = row["proveedor"];
    cantidad = row["cantidad"];
  }
  static Future<List<Producto>> recuperarStock() async {
    var conn = await DataBase.establecerConexion(); //llamamos a la bbdd
    var registros = await conn.query("""SELECT * FROM cuentas""");
    List<Producto> listado = [];
    for (ResultRow registro in registros) {
      Producto producto = Producto.fromDataBase(registro);

      listado.add(producto);
    }
    return listado;
  }


}
