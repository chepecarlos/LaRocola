
//Direcion de la musica
String RutaPista;
//Drivercion 
String RutaDriver;
//Nombre de 
String NombrePortada;
//Nombre

Table Configuracion;

void CargarConfiguracion () {
  println("Cargando Configuracion");
  Configuracion = loadTable("Configuracion.csv", "header");
  println("Cantidad de Datos -> "+Configuracion.getRowCount());

  for (TableRow Celda : Configuracion.rows()) {
    if (Celda.getString("Informacion").equals("CarpetaPista")) {
      RutaPista = Celda.getString("Dato");
    }
    if (Celda.getString("Informacion").equals("NombreCaratula")) {
      NombrePortada = Celda.getString("Dato");
    }
    if(Celda.getString("Informacion").equals("CarpetaDriver")) {
      RutaDriver = Celda.getString("Dato");
    }
  }
}