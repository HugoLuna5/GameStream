//
//  SaveData.swift
//  GameStream
//
//  Created by Hugo Luna on 25/07/21.
//

import Foundation

class SaveData {
    
    var correo: String = ""
    
    var contraseña: String = ""
    
    var nombre: String = ""
    
    
    func guardarDatos(correo: String, contraseña: String, nombre: String) -> Bool {
        
        UserDefaults.standard.set([correo, contraseña, nombre], forKey: "datosUsuario")
        
       
        return true
    }
    
    func recuperarDatos() -> [String] {
        
        let datosUsuario: [String] = UserDefaults.standard.stringArray(forKey: "datosUsuario")!
        
        return datosUsuario
        
    }
    
    
    func validar(correo:String, contraseña: String) -> Bool {
        
        var correoGuardado: String = ""
        var contraseñaGuardada: String = ""
        
        
        if  UserDefaults.standard.object(forKey: "datosUsuario") != nil{
            
            correoGuardado = UserDefaults.standard.stringArray(forKey: "datosUsuario")![0]
            
            contraseñaGuardada = UserDefaults.standard.stringArray(forKey: "datosUsuario")![1]
            
            
            if (correo == correoGuardado && contraseña == contraseñaGuardada) {
                return true
            }else{
                
                return false
            }
            
            
            
        }else{
            return false
        }
        
        
    }
    
    
    
}
