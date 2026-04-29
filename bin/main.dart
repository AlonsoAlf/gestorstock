import 'utils/utils.dart';
void main()async{
DataBase.crearDataBase();
String pantalla = Navegacion.inicio;
bool ejecutando = true;
while(ejecutando) {
  switch(pantalla){
    case "pantallaPrincipal":
    pantalla = await Navegacion.menuAcciones();
    break;
    case "menuAcciones":
    pantalla = await Navegacion.menuAcciones();
    break;
    case "consultarExistencias":
    pantalla = await Navegacion.consultarExistencias();
    break;
    case "salir":
    if(pantalla == "salir"){
      print("Saliendo");
      ejecutando = false;
    }
  }
}
}
