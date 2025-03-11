//
//  DetailView.swift
//  Examen-intefaces
//
//  Created by Pablo  on 11/3/25.
//

import SwiftUI

struct DetailView: View {
    
    var item: Item
  
    var body: some View {
        ScrollView{
            
            //Stack vertical de toda la vista
            VStack(alignment: .leading) {
                
                // Imagen
                
                AsyncImage(url: URL(string: item.image)) { image in
                    image
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(maxWidth: .infinity, maxHeight: 300)
                        .shadow(color: Color.black.opacity(0.3), radius: 10, y: 8)
                        .edgesIgnoringSafeArea(.top)
                } placeholder: {
                    ProgressView()
                }
                
                
                //Stack vertical con toda la información
                VStack(alignment: .leading, spacing: 10) {
                    
                    // Titulo
                    Text(item.title)
                        .font(Font.custom("Raleway", size: 26).weight(.bold))
                        .tracking(1.30)
                        .foregroundColor(.black)
                        .padding(.bottom, 10)
                    
                
                    
                    
                    Text("Descripcion")
                        .font(Font.custom("Raleway", size: 20).weight(.light))
                        .tracking(0.80)
                        .foregroundColor(Color(.gray))
                        .padding(.bottom, 10)
                    
                    
                    Text(item.description)
                        .font(Font.custom("Raleway", size: 18).weight(.light))
                        .tracking(0.80)
                        .foregroundColor(.black)
                        .lineLimit(nil)
                        .fixedSize(horizontal: false, vertical: true)
                        .padding (.bottom, 15)
                    
                    
                    
                    
                    //Categorias
                    
                    Text ("Categorias")
                        .font(Font.custom("Raleway", size: 20).weight(.light))
                        .foregroundColor(Color(.gray))
                    
             
                    // Stack Horizontal duracion
                    HStack{
                        
                            
                        Text(item.category)
                                .font(Font.custom("Raleway", size: 16).weight(.bold))
                                .tracking(0.80)
                                .foregroundColor(.black)
                                .offset(x: 0.27, y: 16.50)
                            
                        }
                    }
                                 
                    Spacer()
                }
                .padding(.top ,200 )
                .padding(.horizontal, 20)
            }
            .edgesIgnoringSafeArea(.all)
        }
                       
                       
    }
                       
                       
                       

struct Previews_DetailView_Previews: PreviewProvider {
    static var previews: some View {
        let itemSimulado = Item(
            id: 1,
            title: "Inception",
            price: 123,
            description: "Un ladrón especializado en robar secretos a través del uso de la tecnología de invasión de sueños.",
            category: "prueba",
            image: "https://fakestoreapi.com/img/61IBBVJvSDL._AC_SY879_.jpg"
            
        )
        
        
        
        // Aquí estamos utilizando las películas simuladas
        DetailView(item: itemSimulado)
    }
}
