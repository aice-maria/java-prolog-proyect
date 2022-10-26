/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package javaapplication2;

import java.awt.List;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Map;
import javax.swing.JOptionPane;
import org.jpl7.PrologException;
import org.jpl7.Query;
import org.jpl7.Term;

/**
 *
 * @author Aice
 */
public class Conector {
    
    String consulta;
    String resultado;
    Query q;
   

    public void conexion() {
        
        consulta = "consult('covid.pl')";
        q = new Query(consulta);
        if (!q.hasSolution()) {
            JOptionPane.showMessageDialog(null, "No se encuentra en la base de conocimiento");
        }
    
    }

    public String consulta_enfermedad(String name) {
        String cov = "covid_19";
        consulta = "enfermedad(\'" + name + "\',"+ cov +").";
        q = new Query(consulta);
        resultado = "";

        try {
            if (!q.hasSolution()) {
                resultado = "NO DIO POSITIVO";
            } else {
                    resultado = "POSITIVO";
                }
            }
        catch (PrologException e) {
            resultado = "ERROR";
        }
        return resultado;
       
    }
    
    public String consulta_recomendacion(String name) {
        consulta = "servicios_medicos_urgentes(\'" + name + "\').";
        q = new Query(consulta);
        resultado = "";
        
        String temp = consulta_enfermedad(name);
        if (temp.equals("POSITIVO")){
            try {
            if (q.hasSolution()) {
                
                resultado = "TIENE SINTOMAS GRAVES POR TANTO, \n REQUIERE ATENCION MEDICA URGENTE!!";
            } else {
                    resultado = "TIENE LOS SINTOMAS GENERALES DE LA ENFERMEDAD,\n CONSULTE SU MEDICO!!";
                }
            }
        catch (PrologException e) {
            resultado = "ERROR";
        }
        }else{
            resultado = "USTED NO TIENE EL VIRUS, PERO EVITE LA PROPAGACION \n Y CONTAGIARSE!!";
        }
        
        return resultado;
       
    }
    
   /* public String consulta_tratamiento(String name) {
        String sg = "sintomas_graves";
        String sgen = "sintomas_generales";
        ArrayList<String> sol;
        String consGrav = "servicios_medicos_urgentes(\'" + name + "\').";
        Query qq;
        consulta = "tratamiento_paciente_gv(\'" + name + "\',L).";
        q = new Query(consulta);
        
        qq = new Query(consGrav);
        resultado = "";
       
        String temp = consulta_enfermedad(name);
        
        if (temp.equals("POSITIVO")){
        if (qq.hasSolution()){
        
            if (!q.hasSolution()) {
                
                resultado = "ERROR";
               
               
               }else{
                while(q.hasMoreSolutions()){
                     resultado += q.nextSolution().get("L") + "\n";
                     
                    }
            }
          
            
        }else{
            
                
        
                sg = "sintomas_generales"; 
                consulta = "tratamiento_paciente_gen(\'" + name + "\',L).";
                q = new Query(consulta);
               // resultado = q.oneSolution().get("X") + "\n";
                while(q.hasMoreSolutions()){
                     
                   resultado += q.nextSolution().get("L") + "\n";
                    
                }
        
                 
               
            }      
       
        } else{
            resultado = "USTED NO TIENE EL VIRUS, EVITE SU PROPAGACION!!";
        }
            
    
 
        
        return resultado;
       
    }*/

    
    
}
