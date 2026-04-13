import 'dart:io';
class Navegacion {
  static String inicio = "pantallaPrincipal";
  static String menuAcciones(){
    String? opcion;
    do{
    stdout.writeln("Bienvenido, seleccione una opcion:");
    stdout.writeln("1. Consultar existencias");//si las existencias son menores de cierto numero se marcaran para reponerlas
    stdout.writeln("2. Gestionar existencias");//para añadir y ajustar las cantidades que hay en stock
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
      return "reajustarExistencias";
      case "3":
      return "salidasProducto";
    }
    return "menuAcciones";
  }
  static String consultarExistencias(){
    
  }
}