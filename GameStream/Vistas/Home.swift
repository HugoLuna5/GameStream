//
//  Home.swift
//  GameStream
//
//  Created by Hugo Luna on 24/07/21.
//

import SwiftUI
import AVKit

struct Home: View {
    
    @State var tabSelected: Int = 2
    
    
    var body: some View {
        
        TabView(selection: $tabSelected) {
            
            ProfileView().tabItem {
                    Image(systemName: "person")
                    Text("Perfil")
                }.tag(0)
            
            
            GamesView().tabItem {
                Image(systemName: "gamecontroller")
                Text("Juegos")
            }.tag(1)
            
            ScreenHome().tabItem {
                Image(systemName: "house")
                Text("Inicio")
            }.tag(2)
            
            
            FavoritesView().tabItem {
                    Image(systemName: "heart")
                    Text("Favoritos")
                }.tag(3)
            
            
            
            
        }
        .accentColor(.white)
        
    }
    
    
    init() {
        UITabBar.appearance().barTintColor = UIColor(Color("tabBarColor"))
        
        UITabBar.appearance().isTranslucent = true
        
    }
    
}


struct ScreenHome: View {
    
    var body: some View {
        
        ZStack {
            
            Color("marine").ignoresSafeArea()
            
            VStack {
                
                Image("appLogo").resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 250)
                    .padding(.horizontal, 11)
                
                
                
                ScrollView(showsIndicators: false){
                    
                    SubModuloHome()
                    
                }
                
                
                
                
                
            }.padding(.horizontal, 18)
            
            
            
            
        }.navigationBarHidden(true)
        .navigationBarBackButtonHidden(true)
        
    }
    
    
    
}

struct SubModuloHome:View {
    
    @State var isGameInfoEmpty: Bool = false;
    @State var textoBusqueda: String = ""
    
    @ObservedObject var juegoEncontrado = SearchGame()
    @State var isGameViewActive: Bool = false
    
    @State var url: String = ""
    @State var title: String = ""
    @State var studio: String = ""
    @State var calificacion: String = ""
    @State var anoPublicacion: String = ""
    @State var descripcion: String = ""
    @State var tags: [String] = [""]
    @State var imgsUrl: [String] = [""]
    
    
    
    
    
    var body: some View {
        
        VStack {
            
            
            HStack {
                Button(action: {
                    
                    watchGame(name: textoBusqueda)
                    
                    
                    
                    
                }, label: {
                    Image(systemName: "magnifyingglass")
                        .foregroundColor(textoBusqueda.isEmpty ? Color(.yellow) : Color("Dark-Cian"))
                    
                }).alert(isPresented: $isGameInfoEmpty){
                    
                    Alert(title: Text("Error"), message: Text("No se encontro el juego"), dismissButton: .default(Text("Entendido")))
                    
                }
                
                
                ZStack(alignment: .leading) {
                    
                    if textoBusqueda.isEmpty {
                        
                        Text("Buscar un video")
                            .foregroundColor(Color(red: 174/255, green: 177/255, blue: 185/255, opacity: 1.0))
                        
                    }
                    
                    TextField("", text: $textoBusqueda)
                        .foregroundColor(.white)
                    
                    
                }
                
                
            }.padding([.top, .leading, .bottom], 11.0)
            .background(Color("Blue-Gray"))
            .clipShape(Capsule())
            
            
            Text("LOS MÁS POPULARES")
                .font(.title3)
                .foregroundColor(.white)
                .bold()
                .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
                .padding(.top)
            
            ZStack {
                
                Button( action: {watchGame(name: "The Witcher 3")}, label: {
                    
                    VStack(spacing: 0) {
                        
                        Image("The Witcher 3").resizable().scaledToFill()
                        
                        
                        Text("The Witcher 3: Wild Hunt").frame(minWidth: 0,  maxWidth: .infinity,  alignment: .leading).background(Color("Blue-Gray"))
                        
                        
                        
                    }
                    
                    
                })
                
                
                Image(systemName: "play.circle.fill")
                    .resizable()
                    .foregroundColor(.white)
                    .frame(width: 42, height: 42)
                
                
                
                
                
                
            }.frame(minWidth: 0, maxWidth: .infinity, alignment: .center)
            .padding(.vertical)
            
            
            Text("CATEGORÍAS SUGERIDAS PARA TI")
                .font(.title3)
                .foregroundColor(.white)
                .bold()
                .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
            
            ScrollView(.horizontal, showsIndicators: false){
                
                
                HStack {
                    
                    Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                        
                        ZStack {
                            
                            RoundedRectangle(cornerRadius: 8)
                                .fill(Color("Blue-Gray"))
                                .frame(width: 160, height: 90)
                            
                            
                            Image("FPS").resizable()
                                .scaledToFit()
                                .frame(width: 42, height: 42)
                            
                            
                        }
                        
                    })
                    
                    Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                        
                        ZStack {
                            
                            RoundedRectangle(cornerRadius: 8)
                                .fill(Color("Blue-Gray"))
                                .frame(width: 160, height: 90)
                            
                            
                            Image("RPG").resizable()
                                .scaledToFit()
                                .frame(width: 42, height: 42)
                            
                            
                        }
                        
                    })
                    
                    
                    Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                        
                        ZStack {
                            
                            RoundedRectangle(cornerRadius: 8)
                                .fill(Color("Blue-Gray"))
                                .frame(width: 160, height: 90)
                            
                            
                            Image("openWorld").resizable()
                                .scaledToFit()
                                .frame(width: 42, height: 42)
                            
                            
                        }
                        
                    })
                    
                    
                }
                
                
            }
            
            Text("RECOMENDADOS PARA TI")
                .font(.title3)
                .foregroundColor(.white)
                .bold()
                .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
            
            
            ScrollView(.horizontal, showsIndicators: false){
                
                
                HStack {
                    
                    Button(action: {watchGame(name: "Abzu")}, label: {
                        
                        
                        
                        Image("Abzu").resizable().scaledToFit().frame(width: 240, height: 135)
                        
                        
                        
                        
                    })
                    
                    Button(action: {watchGame(name: "Crash Bandicoot")}, label: {
                        
                        
                        
                        Image("Crash Bandicoot").resizable().scaledToFit().frame(width: 240, height: 135)
                        
                        
                        
                        
                    })
                    
                    
                    Button(action: {watchGame(name: "DEATH STRANDING")}, label: {
                        
                        
                        
                        Image("DEATH STRANDING").resizable().scaledToFit().frame(width: 240, height: 135)
                        
                        
                        
                        
                    })
                    
                }
                
            }
            
            
            
            Text("VIDEOS QUE PODRIAN GUSTARTE").font(.title3).foregroundColor(.white).bold().frame(minWidth: 0, maxWidth: .infinity,alignment: .leading)
            
            ScrollView(.horizontal,showsIndicators: false){
                
                
                HStack{
                    
                    Button(action: {watchGame(name: "Cuphead")}, label: {
                        
                        
                        
                        Image("Cuphead").resizable().scaledToFit().frame(width: 240, height: 135)
                        
                        
                        
                        
                    })
                    
                    Button(action: {watchGame(name: "Hades")}, label: {
                        
                        
                        
                        Image("Hades").resizable().scaledToFit().frame(width: 240, height: 135)
                        
                        
                        
                        
                    })
                    
                    
                    Button(action: {watchGame(name: "Grand Theft Auto V")}, label: {
                        
                        
                        
                        Image("Grand Theft Auto V").resizable().scaledToFit().frame(width: 240, height: 135)
                        
                        
                        
                        
                    })
                }
            }
            
            
            // para agregar insets a scrollview
            Color.clear.frame(width: 1, height: 8, alignment: .center)
            
            
            
        }
        
        
        
        NavigationLink(
            destination: GameView(url: url, title: title, studio: studio, calificacion: calificacion, anoPublicacion: anoPublicacion, descripcion: descripcion, tags: tags, imgsUrl: imgsUrl),
            isActive: $isGameViewActive,
            label: {
                EmptyView()
            })
        
        
    }
    
    func watchGame(name: String) {
        
        juegoEncontrado.search(gameName: name)
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.3){
            
            
            print("Cantidad E: \(juegoEncontrado.gamesInfo.count)")
            
            
            if juegoEncontrado.gamesInfo.count == 0 {
                
                isGameInfoEmpty = true
                
            }else{
                
                
                url = juegoEncontrado.gamesInfo[0].videosUrls.mobile
                title = juegoEncontrado.gamesInfo[0].title
                studio = juegoEncontrado.gamesInfo[0].studio
                calificacion = juegoEncontrado.gamesInfo[0].contentRaiting
                anoPublicacion = juegoEncontrado.gamesInfo[0].publicationYear
                descripcion = juegoEncontrado.gamesInfo[0].description
                tags = juegoEncontrado.gamesInfo[0].tags
                imgsUrl = juegoEncontrado.gamesInfo[0].galleryImages
                
                
                isGameViewActive = true
                
                
                
            }
            
            
        }
        
        
    }
    
    
}


struct Home_Previews: PreviewProvider {
    static var previews: some View {
        Home()
    }
}
