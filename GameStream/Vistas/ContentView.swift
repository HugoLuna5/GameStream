//
//  ContentView.swift
//  GameStream
//
//  Created by Hugo Luna on 24/07/21.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView {
            
            
            
            ZStack {
                
                Spacer()
                
                Color(red: 19/255, green: 30/255, blue: 53/255, opacity: 1.0)
                    .ignoresSafeArea()
                
                
                VStack {
                    
                    Image("appLogo").resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 250)
                        .padding(.bottom, 42)
                    
                    
                    
                    InicioYRegistroView()
                    
                }
                
            }
        }
        .navigationBarHidden(true)
    }
}



struct InicioYRegistroView: View {
    
    @State var tipoInicioSesion: Bool = true
    
    var body: some View {
        
        VStack {
            HStack {
                
                Spacer()
                
                Button("INICIA SESIÓN"){
                    tipoInicioSesion = true;
                }.foregroundColor(tipoInicioSesion ? .white : .gray)
                
                Spacer()
                
                Button("REGÍSTRATE"){
                    tipoInicioSesion = false;
                }.foregroundColor(tipoInicioSesion ? .gray : .white)
                
                Spacer()
            }
            
            Spacer(minLength: 42)
            
            if tipoInicioSesion {
                InicioSesionView()
            }else{
                RegistroView()
            }
            
        }
        
    }
}


struct InicioSesionView: View {
    
    @State var correo: String = ""
    
    @State var contraseña: String = ""
    
    @State var isScreenHomeActive: Bool = false
    
    var body: some View {
        
        
        ScrollView {
            
            VStack(alignment: .leading) {
                
                Text("Correo electrónico")
                    .foregroundColor(Color("Dark-Cian"))
                
                ZStack(alignment: .leading) {
                    
                    if correo.isEmpty  {
                        Text("ejemplo@gmail.com")
                            .font(.caption)
                            .foregroundColor(.gray)
                    }
                    
                    TextField("", text: $correo)
                        .foregroundColor(.white)
                    
                    
                }
                
                Divider()
                    .frame(height: 1)
                    .background(Color("Dark-Cian"))
                    .padding(.bottom)
                
                
                Text("Contraseña")
                    .foregroundColor(.white)
                
                
                ZStack(alignment: .leading) {
                    
                    if contraseña.isEmpty  {
                        Text("Escribe tu contraseña")
                            .font(.caption)
                            .foregroundColor(.gray)
                    }
                    
                    
                    SecureField("", text: $contraseña)
                        .foregroundColor(.white)
                    
                }
                
                Divider()
                    .frame(height: 1)
                    .background(Color("Dark-Cian"))
                    .padding(.bottom)
                
                
                Text("¿Olvidaste tu contraseña?")
                    .font(.footnote)
                    .foregroundColor(Color("Dark-Cian"))
                    .frame(width: 300, alignment: .trailing)
                    .padding(.bottom)
                
                
                Button(action: iniciarSesion, label: {
                    Text("INICIAR SESIÓN")
                        .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                        .foregroundColor(.white)
                        .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                        .padding(EdgeInsets(top: 11, leading: 18, bottom: 11, trailing: 18))
                        .overlay(RoundedRectangle(cornerRadius: 6.0).stroke(Color("Dark-Cian"), lineWidth: 1.0).shadow(color: .white, radius: 6))
                })
                
        
                
                Text("Inicia sesión con redes sociales").foregroundColor(.white)
                    .frame( maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                    .padding()
                
                HStack(alignment: .center) {
                    
                  
                    
                    Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                        Text("Facebook")
                            .font(.subheadline)
                            .fontWeight(.bold)
                            .foregroundColor(.white)
                            .padding(.vertical, 3.0)
                            .frame(maxWidth: .infinity, alignment: .center)
                            .background(Color("Blue-Gray"))
                            .clipShape(RoundedRectangle(cornerRadius: 4.0))
                    }).padding()
                    
                    Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                        Text("Twitter")
                            .font(.subheadline)
                            .fontWeight(.bold)
                            .foregroundColor(.white)
                            .padding(.vertical, 3.0)
                            .frame(maxWidth: .infinity, alignment: .center)
                            .background(Color("Blue-Gray"))
                            .clipShape(RoundedRectangle(cornerRadius: 4.0))
                            
                    }).padding()
                    
                   
                    
                }
                
                
            }.padding(.horizontal, 77.0)
        
        
        NavigationLink(
            destination: Home(),
            isActive: $isScreenHomeActive,
            label: {
                EmptyView()
            })
        
        }
        
        
        
    }
    
    func iniciarSesion() {
        print("Estoy iniciando sesion")
        isScreenHomeActive = true
    }
    
    
}




struct RegistroView: View {
    
    @State var correo: String = ""
    
    @State var contraseña: String = ""
    
    @State var confirmarContraseña: String = ""
    
    
    
    var body: some View {
        ScrollView {
            
            VStack(alignment: .center) {
                
                Text("Elije una foto de perfil")
                    .fontWeight(.bold)
                    .foregroundColor(.white)
                
                Text("Puedes cambiar o elegirlas más adelante")
                    .font(.footnote)
                    .fontWeight(.light)
                    .foregroundColor(.gray)
                    .padding(.bottom)
                
                
                Button(action: tomarFoto, label: {
                    
                    ZStack {
                        
                        Image("perfilEjemplo").resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 80, height: 80)
                        
                        Image(systemName: "camera")
                            .foregroundColor(.white)
                        
                        
                        
                        
                    }
                    
                }).padding(.bottom)
                
                
                
                
            }
            
            
            
            VStack(alignment: .leading) {

                VStack(alignment: .leading) {
                Text("Correo electrónico*")
                    .foregroundColor(Color("Dark-Cian"))
                    .frame(width: 300, alignment: .leading)

                ZStack(alignment: .leading) {

                    if correo.isEmpty  {
                        Text("ejemplo@gmail.com")
                            .font(.caption)
                            .foregroundColor(.gray)
                    }

                    TextField("", text: $correo)
                        .foregroundColor(.white)

                }

                Divider()
                    .frame(height: 1)
                    .background(Color("Dark-Cian"))
                    .padding(.bottom)


                Text("Contraseña*")
                    .foregroundColor(.white)


                ZStack(alignment: .leading) {

                    if contraseña.isEmpty  {
                        Text("Escribe tu contraseña")
                            .font(.caption)
                            .foregroundColor(.gray)
                    }


                    SecureField("", text: $contraseña)
                        .foregroundColor(.white)

                }
                    Divider()
                        .frame(height: 1)
                        .background(Color("Dark-Cian"))
                        .padding(.bottom)
                
                Text("Confirmar contraseña*")
                    .foregroundColor(.white)


                ZStack(alignment: .leading) {

                    if confirmarContraseña.isEmpty  {
                        Text("Vuelve a escribir tu contraseña")
                            .font(.caption)
                            .foregroundColor(.gray)
                    }


                    SecureField("", text: $confirmarContraseña)
                        .foregroundColor(.white)

                }.frame(maxWidth: .infinity)
                

                Divider()
                    .frame(height: 1)
                    .background(Color("Dark-Cian"))
                    .padding(.bottom)
                    

             

                
            }

                Button(action: registrate, label: {
                    Text("REGISTRATE")
                        .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                        .foregroundColor(.white)
                        .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                        .padding(EdgeInsets(top: 11, leading: 18, bottom: 11, trailing: 18))
                        .overlay(RoundedRectangle(cornerRadius: 6.0).stroke(Color("Dark-Cian"), lineWidth: 1.0).shadow(color: .white, radius: 6))
                })



                Text("Registrate con redes sociales").foregroundColor(.white)
                    .frame( maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                    .padding()

                HStack(alignment: .center) {



                    Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                        Text("Facebook")
                            .font(.subheadline)
                            .fontWeight(.bold)
                            .foregroundColor(.white)
                            .padding(.vertical, 3.0)
                            .frame(maxWidth: .infinity, alignment: .center)
                            .background(Color("Blue-Gray"))
                            .clipShape(RoundedRectangle(cornerRadius: 4.0))
                    }).padding()

                    Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                        Text("Twitter")
                            .font(.subheadline)
                            .fontWeight(.bold)
                            .foregroundColor(.white)
                            .padding(.vertical, 3.0)
                            .frame(maxWidth: .infinity, alignment: .center)
                            .background(Color("Blue-Gray"))
                            .clipShape(RoundedRectangle(cornerRadius: 4.0))

                    }).padding()



                }


            }.padding(.horizontal, 77.0)


        
        }
    }
}


func tomarFoto()  {
    print("Voy a tomar una foto")
}

func registrate() {
    print("Te registraste")
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        Image("pantalla2").resizable()
        ContentView()
        
    }
}
