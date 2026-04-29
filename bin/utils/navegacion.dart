import 'dart:io';
import '../entities.dart/entities.dart';
class Navegacion {
  static String inicio = "pantallaPrincipal";
  static String menuAcciones(){
    String? opcion;
    do{
    stdout.writeln("Bienvenido, seleccione una opcion:");
    stdout.writeln("1. Consultar existencias");//si las existencias son menores de cierto numero se marcaran para reponerlas
    stdout.writeln("2. Añadir existencias");//para añadir y ajustar las cantidades que hay en stock
    stdout.writeln("3. Salidas de producto");//para marcar los productso que salen del alamcenFf
    stdout.writeln("4. Salir");
      opcion = stdin.readLineSync()?? "";
    if(opcion.isEmpty){
      stdout.writeln("Valor invalido, intentelo de nuevo");
      continue;
    }
    if(opcion != "1" && opcion != "2" && opcion != "3" && opcion != "4"){
      stdout.writeln("Valor invalido, intentelo de nuevo");
      continue;
    }
    }while(opcion != "1" && opcion != "2" && opcion != "3" && opcion != "4");
    switch(opcion){
      case "1":
      return "consultarExistencias";
      case "2":
      return "addExistencias";
      case "3":
      return "salidasProducto";
      case "4":
      return "salir";
    }
    return "menuAcciones";
  }
  static Future<String> addExistencias() async{
    String? nombreArticulo;
    String? proveedor;
    String? entrada;
    int? cantidad;
    stdout.writeln("Introduzca el nombre del articulo");
    nombreArticulo = stdin.readLineSync()?? "";
    stdout.writeln("Introduzca el proveedor del articulo");
    proveedor = stdin.readLineSync()?? "";
    stdout.writeln("Introduzca la cantidad");
    entrada = stdin.readLineSync()?? "";
    cantidad = int.tryParse(entrada);
    
  }
  static Future<String> consultarExistencias() async{
  List<Producto> existencias = await Producto.recuperarStock();
  for(int i = 0; i < existencias.length; i++){
    print("${existencias[i].id} [${existencias[i].nombre},${existencias[i].proveedor},${existencias[i].cantidad}]");
  }
  return "menuAcciones";
  }
}