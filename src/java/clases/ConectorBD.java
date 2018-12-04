/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package clases;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

/**
 *
 * @author gemelos
 */
public class ConectorBD {
        private String servidor;
        private String puerto;
        private String bd;
        private String usuario;
        private String clave;

        public Connection conexion;

        public ConectorBD() {
            this.servidor="localhost";//127.0.0.1
            this.puerto="5432";
            this.bd="preparacion";
            this.usuario="adsi";
            this.clave="utilizar";
        }

        public Connection conectar(){
            try {
                Class.forName("org.postgresql.Driver");
                this.conexion=DriverManager.getConnection("jdbc:postgresql://"+servidor+":"+puerto+"/"+bd,usuario,clave);
                return this.conexion;
            } catch (Exception e) {
                System.out.println("Error al conectarse a la base de datos. "+e.getMessage());
                return null;
            }
        }

        public void desconectar(){
            try {
                this.conexion.close();
            } catch (Exception e) {
                System.out.println("Error al desconectarse de la base de datos. "+e.getMessage());
            }
        }

        public static void actualizarDatos(String cadenaSQL){//insert, update, delete
            ConectorBD conector=new ConectorBD();
            conector.conectar();
            try {
                PreparedStatement sentencia=conector.conexion.prepareStatement(cadenaSQL);
                sentencia.execute();
                conector.desconectar();
            } catch (Exception e) {
                System.out.println("Error al ejecutar: "+cadenaSQL+" Mensaje: "+e.getMessage());
                conector.desconectar();
            }                
        }

        public static String[][] getDatos(String cadenaSQL){
            String[][] datos=null;
            ConectorBD conector=new ConectorBD();
            conector.conectar();
            try {            
                PreparedStatement sentencia=conector.conexion.prepareStatement(cadenaSQL);
                ResultSet resultado=sentencia.executeQuery();
                int columnas=resultado.getMetaData().getColumnCount();//devuelve la cantidad de columnas de la consulta
                int filas=0;
                while(resultado.next()) filas++;            
                datos=new String[filas][columnas];
                resultado=sentencia.executeQuery();
                int contador=0;
                while(resultado.next()){
                    for (int i = 1; i <= columnas; i++) {
                        datos[contador][i-1]=resultado.getString(i);
                    }                    
                    contador++;
                }            
                conector.desconectar();
                return datos;
            } catch (Exception e) {
                System.out.println("Error al ejecutar "+cadenaSQL+" Mensaje: "+e.getMessage());
                conector.desconectar();            
                return datos;
            }
        }
}
