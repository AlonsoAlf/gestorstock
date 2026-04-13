import 'utils/utils.dart';
String main(){
bool ejecutando = true;
String pantalla = Navegacion.inicio;
while(ejecutando){
  switch(pantalla){
    case "pantallaPrincipal":
    return pantalla = Navegacion.menuAcciones();
    
  }
}
}
