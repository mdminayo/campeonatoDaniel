/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package clases;



/**
 *
 * @author gemelos
 */
public class Partido {

    public String fecha;
    public String hora;
    public String lugar;
    public String lolcal;
    public String codElocal;
    public String codEvisitante;
    public String glocal;
    public String visitante;
    public String gvisitante;
    public String puntoslocal;
    public String puntosvisitante;

    public Partido() {
    }

    public String getFecha() {
        return fecha;
    }

    public void setFecha(String fecha) {
        this.fecha = fecha;
    }

    public String getHora() {
        return hora;
    }

    public void setHora(String hora) {
        this.hora = hora;
    }

    public String getLugar() {
        return lugar;
    }

    public String getLolcal() {
        return lolcal;
    }

    public void setLolcal(String lolcal) {
        this.lolcal = lolcal;
    }

    public String getVisitante() {
        return visitante;
    }

    public void setVisitante(String visitante) {
        this.visitante = visitante;
    }

    public void setLugar(String lugar) {
        this.lugar = lugar;
    }

    public String getCodElocal() {
        return codElocal;
    }

    public void setCodElocal(String codElocal) {
        this.codElocal = codElocal;
    }

    public String getCodEvisitante() {
        return codEvisitante;
    }

    public void setCodEvisitante(String codEvisitante) {
        this.codEvisitante = codEvisitante;
    }

    public String getGlocal() {
        return glocal;
    }

    public void setGlocal(String glocal) {
        this.glocal = glocal;
    }

    public String getGvisitante() {
        return gvisitante;
    }

    public void setGvisitante(String gvisitante) {
        this.gvisitante = gvisitante;
    }

    public String getPuntoslocal() {
        return puntoslocal;
    }

    public void setPuntoslocal(String puntoslocal) {
        this.puntoslocal = puntoslocal;
    }

    public String getPuntosvisitante() {
        return puntosvisitante;
    }

    public void setPuntosvisitante(String puntosvisitante) {
        this.puntosvisitante = puntosvisitante;
    }

    public void grabar() {
        System.out.println(" " + this.codElocal + "," + this.codEvisitante + "," + this.glocal + "," + this.gvisitante + this.fecha);
        String cadenaSQL = "insert into partido (fecha,hora,lugar,codigoEquipoLocal,codigoEquipoVisitante,golesLocal,golesVisitante)"
                + "values('" + this.fecha + "','" + this.hora + "','" + this.lugar + "', " + this.codElocal + ", " + this.codEvisitante + ", " + this.glocal + ", " + this.gvisitante + " )";
        ConectorBD.actualizarDatos(cadenaSQL);

    }

    public static String[][] getDatos() {
        String cadenaSQL = "select fecha,hora,lugar,local.nombre as local,goleslocal, visitante.nombre as visitante, golesvisitante, local.codigo as codlocal, visitante.codigo as codvisitante\n"
                + "from equipo as local, equipo as visitante, partido \n"
                + "where codigoequipolocal=local.codigo\n"
                + "and codigoequipovisitante=visitante.codigo;";
        String datos[][] = ConectorBD.getDatos(cadenaSQL);
        return datos;
    }

    public static Partido[] getDatosEnObjetos() {

        String datos[][] = Partido.getDatos();
        Partido partidos[] = new Partido[datos.length];
        for (int i = 0; i < datos.length; i++) {
            Partido partido = new Partido();

            partido.setFecha(datos[i][0]);
            partido.setHora(datos[i][1]);
            partido.setLugar(datos[i][2]);
            partido.setLolcal(datos[i][3]);
            partido.setGlocal(datos[i][4]);
            partido.setVisitante(datos[i][5]);
            partido.setGvisitante(datos[i][6]);
            partido.setCodElocal(datos[i][7]);
            partido.setCodEvisitante(datos[i][8]);

            int goleslocal = Integer.parseInt(datos[i][4]);
            int golesvisitante = Integer.parseInt(datos[i][6]);
            if (goleslocal == golesvisitante) {
                partido.setPuntoslocal("1");
                partido.setPuntosvisitante("1");

            } else {
                if (goleslocal > golesvisitante) {
                    partido.setPuntoslocal("3");
                    partido.setPuntosvisitante("0");

                } else {
                    partido.setPuntoslocal("0");
                    partido.setPuntosvisitante("3");
                }

            }

            partidos[i] = partido;
            

        }
      
        
        return partidos;
    }

    public  static String[][] tablaDePosiciones() {
        // Equipo equipo=new Equipo();
        Equipo[] datosequipo = Equipo.getDatosEnObjetos(null);
        Partido[] datos = Partido.getDatosEnObjetos();
        //String tabla[][] = new String[100][9];
         String[][] tabla=new String[20][];
         tabla=new String[20][10];
        int s=0;

        for (int i = 0; i < datosequipo.length; i++) {
            Equipo equipo = datosequipo[i];
            String codEquipo = equipo.getCodigo();
            String nomEquipo = equipo.getNombre();

            int partidosjugados = 0;
            int partidosganados = 0;
            int partidosperdidos = 0;
            int partidosempatados = 0;
            int golesafavor = 0;
            int golesencontra = 0;
            int difgol = 0;
            int puntostotales = 0;
            for (int j = 0; j < datos.length; j++) {

                Partido partido = datos[j];
                String codlocal = partido.getCodElocal();
                String local = partido.getLolcal();
                String goleslocal = partido.getGlocal();
                String puntoslocal = partido.getPuntoslocal();
                String codvisitante = partido.getCodEvisitante();
                String visitante = partido.getVisitante();
                String golesvisitante = partido.getGvisitante();
                String puntosvisitante = partido.getPuntosvisitante();

                if (codEquipo.equals(codlocal)) {

                    partidosjugados++;
                    puntostotales += Integer.parseInt(puntoslocal);
                    golesafavor += Integer.parseInt(goleslocal);
                    golesencontra += Integer.parseInt(golesvisitante);
                    if (puntoslocal.equals("3")) {
                        partidosganados++;

                    } else {
                        if (puntoslocal.equals("1")) {
                            partidosempatados++;

                        } else {
                            partidosperdidos++;
                        }
                    }

                } else {
                    if (codEquipo.equals(codvisitante)) {

                        partidosjugados++;
                        puntostotales += Integer.parseInt(puntosvisitante);
                        golesafavor += Integer.parseInt(golesvisitante);
                        golesencontra += Integer.parseInt(goleslocal);

                        if (puntosvisitante.equals("3")) {
                            partidosganados++;

                        } else {
                            if (puntosvisitante.equals("1")) {
                                partidosempatados++;

                            } else {
                                partidosperdidos++;
                            }
                        }
                    }

                }

            }
            
            difgol=golesafavor-golesencontra;
            
            tabla[i][0]=codEquipo;
            tabla[i][1]=nomEquipo;
            tabla[i][2]=Integer.toString(puntostotales);
            tabla[i][3]=Integer.toString(partidosjugados);
            tabla[i][4]=Integer.toString(partidosganados);
            tabla[i][5]=Integer.toString(partidosperdidos);
            tabla[i][6]=Integer.toString(partidosempatados);
            tabla[i][7]=Integer.toString(golesafavor);
            tabla[i][8]=Integer.toString(golesencontra);
            tabla[i][9]=Integer.toString(difgol);
         
            
            s++;

        }
      /*  for (int i = 0; i < tabla.length; i++) {
            int puntosp=Integer.parseInt(tabla[i][2]);
            for (int j = 0; j < tabla.length; j++) {
                int puntoss=Integer.parseInt(tabla[j][2]);
                if (puntosp<puntoss) {
                    
                   String var1=tabla[i][0];
                   String var2=tabla[i][1];
                   String var3=tabla[i][2];
                   String var4=tabla[i][3];
                   String var5=tabla[i][4];
                   String var6=tabla[i][5];
                   String var7=tabla[i][6];
                   String var8=tabla[i][7];
                   String var9=tabla[i][8];
                   String var10=tabla[i][9];
                   
                   tabla[i][0]=tabla[j][0];
                   tabla[i][1]=tabla[j][1];
                   tabla[i][2]=tabla[j][2];
                   tabla[i][3]=tabla[j][3];
                   tabla[i][4]=tabla[j][4];
                   tabla[i][5]=tabla[j][5];
                   tabla[i][6]=tabla[j][6];
                   tabla[i][7]=tabla[j][7];
                   tabla[i][8]=tabla[j][8];
                   tabla[i][9]=tabla[j][9];
                   
                   tabla[j][0]=var1;
                   tabla[j][1]=var2;
                   tabla[j][2]=var3;
                   tabla[j][3]=var4;
                   tabla[j][4]=var5;
                   tabla[j][5]=var6;
                   tabla[j][6]=var7;
                   tabla[j][7]=var8;
                   tabla[j][8]=var9;
                   tabla[j][9]=var10;
                           
                    
                }
                
            }
          
            
            
        }*/
        return tabla;
    }

}
