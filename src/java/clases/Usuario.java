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
public class Usuario {
    
    public String usuario;
    public String clave;
    public String rol;
    public String foto;

    public Usuario() {
    }

    public Usuario(String usuario) {
       
        String cadenaSQL="select usuario, clave, rol, foto from usuario"
                + "where usuario= "+"'"+usuario+"'";
        
        ConectorBD conector = new ConectorBD();
        conector.conectar();
        try {
            PreparedStatement sentencia=conector.conexion.prepareStatement(cadenaSQL);
            ResultSet resultado = sentencia.executeQuery();
            if(resultado.next()){
                this.usuario=usuario;
                this.clave=resultado.getString("clave");
                this.rol=resultado.getString("rol");
                this.foto=resultado.getString("foto");
            }
            
        } catch (Exception e) {
            out.println("error al ejecutar "+cadenaSQL + " "+e.getMessage());
        }
    }

    public Usuario(String usuario, String clave) {
        String cadenaSQL="select usuario, clave, rol, foto from usuario where usuario = "+usuario+" and clave = "+clave+"";
        String datos[][]=ConectorBD.getDatos(cadenaSQL);
        if(datos.length>0){
            this.usuario=usuario;
            this.clave=datos[0][1];
            this.rol=datos[0][2];
            this.foto=datos[0][3];
        }
        
        
    }

    public String getUsuario() {
        return usuario;
    }

    public void setUsuario(String usuario) {
        this.usuario = usuario;
    }

    public String getClave() {
        return clave;
    }

    public void setClave(String clave) {
        this.clave = clave;
    }

    public String getRol() {
        return rol;
    }

    public void setRol(String rol) {
        this.rol = rol;
    }

    public String getFoto() {
        return foto;
    }

    public void setFoto(String foto) {
        this.foto = foto;
    }
    
    public void grabar(){
        
        String cadenaSQL="insert into usuario(usuario,clave,rol,foto) "
                + "values('"+this.usuario+"','"+this.clave+"','"+this.rol+"','"+this.foto+"')";
        ConectorBD.actualizarDatos(cadenaSQL);
    }
    
    
    
}
