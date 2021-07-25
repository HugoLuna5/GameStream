//
//  GamesView.swift
//  GameStream
//
//  Created by Hugo Luna on 24/07/21.
//

import SwiftUI

struct GamesView: View {
    var body: some View {
        Text("Hola desde pantallas GamesView")
        
        
            .navigationBarHidden(true)
            .navigationBarBackButtonHidden(true)
            .onAppear(
                perform: {
                    print("Primer elemento de Json")
                    print("Titulo del primer videojuego")
                }
            )
    }
}

struct GamesView_Previews: PreviewProvider {
    static var previews: some View {
        GamesView()
    }
}
