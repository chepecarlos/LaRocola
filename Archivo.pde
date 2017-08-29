
// devuelve los nombre de archivo en un areglo   
String[] ListaNombreArchivo(String dir) {
  File file = new File(dir);
  if (file.isDirectory()) {
    String names[] = file.list();
    return names;
  } else {
    //No es directorio
    return null;
  }
}