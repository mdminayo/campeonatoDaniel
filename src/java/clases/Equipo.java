/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package clases;

import static java.lang.System.out;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

/**
 *
 * @author gemelos
 */
public class Equipo {
    
    public String codigo;
    public String nombre;

    public Equipo() {
    }

    public Equipo(String codigo) {
        String cadenaSQL="select nombre from equipo where codigo ="+codigo;
        ConectorBD conector = new ConectorBD();
        conector.conectar();
        try {
            PreparedStatement sentencia=conector.conexion.prepareStatement(cadenaSQL);
            ResultSet resultado = sentencia.executeQuery();
            if(resultado.next()){
                this.codigo=codigo;
                this.nombre=resultado.getString("nombre");
                
            }
            
        } catch (Exception e) {
            out.println("error al ejecutar "+cadenaSQL+" "+e.getMessage());
        }
    }

    public String getCodigo() {
        return codigo;
    }

    public void setCodigo(String codigo) {
        this.codigo = codigo;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }
    
    public void grabar(){
        String cadenaSQL=" insert into equipo(nombre) values ('"+this.nombre+"')";
        ConectorBD.actualizarDatos(cadenaSQL);
    }
    
    public static String [][] getDatos(String filtro){
        
        String cadenaSQL="select * from equipo";
        if(filtro!=null) cadenaSQL+=" where "+filtro;
        String datos[][]=ConectorBD.getDatos(cadenaSQL);
               
        return datos;
    }
    
    public static Equipo[] getDatosEnObjetos(String filtro){
        
        String [][] datos=Equipo.getDatos(filtro);
        Equipo[] equipos=new Equipo[datos.length];
        for (int i = 0; i < datos.length; i++) {
            Equipo equipo = new Equipo();
            equipo.setCodigo(datos[i][0]);
            equipo.setNombre(datos[i][1]);
            equipos[i]=equipo;
            
        }
        return equipos;
    }
    
    
    
    
    
}
