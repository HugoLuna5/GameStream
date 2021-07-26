//
//  EditProfileView.swift
//  GameStream
//
//  Created by Hugo Luna on 25/07/21.
//

import SwiftUI

struct EditProfileView: View {
    
    @State var imagenPerfil:Image? = Image("perfilEjemplo")
    @State var isCameraActive: Bool = false
    
    var body: some View {
        ZStack {
            
            Color("marine").ignoresSafeArea()
            
            ScrollView {
                
                VStack {
                    
                    Button(action: {
                        
                        isCameraActive = true
                        
                    }, label: {
                        
                        ZStack {
                            imagenPerfil!
                                .resizable()
                                .aspectRatio(contentMode: .fill)
                                .frame(width: 118, height: 118)
                                .clipShape(Circle())
                                .sheet(isPresented: $isCameraActive, content: {
                                    
                                    SUImagePickerView(sourceType: .photoLibrary, image: self.$imagenPerfil, isPresented: $isCameraActive)
                                    
                                    
                                })
                            
                            
                            Image(systemName: "camera").foregroundColor(.white)
                            
                            
                        }
                        
                        
                    })
                    
                    
                }.padding(.bottom, 18)
                
                
                ModuloEditar()
                
                
            }
        }
    }
}


struct ModuloEditar: View {
    
    @State var correo: String = ""
    @State var contraseña: String = ""
    @State var nombre: String = ""
    
    var body: some View {
        
        VStack(alignment: .leading) {
            
            
            
            Text("Correo electrónico")
                .foregroundColor(Color("Dark-Cian"))
            
            ZStack(alignment: .leading) {
                
                if correo.isEmpty {
                    
                    Text("ejemplo@gmail.com")
                        .font(.caption)
                        .foregroundColor(.gray)
                    
                }
                
                
                TextField("", text: $correo)
                    .foregroundColor(.white)
                    .textContentType(.emailAddress)
                    .keyboardType(.emailAddress)
                
                
            }
            
            
            Divider().frame(height: 1)
                .background(Color("Dark-Cian"))
                .padding(.bottom)
            
            Text("Contraseña")
                .foregroundColor(.white)
            
            ZStack(alignment: .leading) {
                
                if contraseña.isEmpty {
                    
                    Text("Introduce tu contraseña")
                        .font(.caption)
                        .foregroundColor(.gray)
                    
                }
                
                
                SecureField("", text: $contraseña)
                    .foregroundColor(.white)
                
                
                
            }
            
            
            Divider().frame(height: 1)
                .background(Color("Dark-Cian"))
                .padding(.bottom)
            
            
            
            Text("Nombre")
                .foregroundColor(.white)
            
            ZStack(alignment: .leading) {
                
                if nombre.isEmpty {
                    
                    Text("Introduce tu nombre")
                        .font(.caption)
                        .foregroundColor(.gray)
                    
                }
                
                
                TextField("", text: $nombre)
                    .foregroundColor(.white)
                
                
                
            }
            
            
            Divider().frame(height: 1)
                .background(Color("Dark-Cian"))
                .padding(.bottom, 32)
            
            
            Button(action: {
                actualizarDatos()
            }, label: {
                
                Text("ACTUALIZAR DATOS")
                    .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                    .foregroundColor(.white)
                    .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                    .padding(EdgeInsets(top: 11, leading: 18, bottom: 11, trailing: 18))
                    .overlay(RoundedRectangle(cornerRadius: 6.0).stroke(Color("Dark-Cian"), lineWidth: 1.0).shadow(color: .white, radius: 3))
                
            }).padding(.bottom)
            
            
            
            
        }.padding(.horizontal, 42.0)
        
    }
    
    func actualizarDatos() {
        let objActualizadorDatos = SaveData()
        
        
        let resultado = objActualizadorDatos.guardarDatos(correo: correo, contraseña: contraseña, nombre: nombre)
        
        if resultado {
            print("Datos actualizados")
        }
        
        
    }
    
}

struct EditProfileView_Previews: PreviewProvider {
    static var previews: some View {
        EditProfileView()
    }
}
