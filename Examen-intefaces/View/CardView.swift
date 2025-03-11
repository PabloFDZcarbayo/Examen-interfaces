import SwiftUI

struct CardView: View {
    
    var item: Item
    
    @ObservedObject var itemViewModel: ItemViewModel

    
    var body: some View {
        
        HStack {
            VStack(alignment: .leading, spacing: 8) {
                
                ZStack(alignment: .topTrailing) {
                    AsyncImage(url: URL(string: item.image)) { image in
                        image.resizable()
                            .frame(width: 150.54, height: 240)
                            .cornerRadius(10)
                            .padding(5)
                    } placeholder: {
                        ProgressView()
                    }
                    
                   
                }
                
                
                Text(item.title)
                    .font(Font.custom("Raleway", size: 14).weight(.bold))
                    .tracking(0.80)
                    .foregroundColor(.black)
                    .padding(.leading, 11)
                
            }
            
        }
            
        
    }
        
        struct CardView_Previews: PreviewProvider {
            static var previews: some View {
                // Datos de prueba para la previsualización
                let itemSimulado = Item(
                    id: 1,
                    title: "Inception",
                    price: 123,
                    description: "Un ladrón especializado en robar secretos a través del uso de la tecnología de invasión de sueños.",
                    category: "prueba",
                    image: "https://fakestoreapi.com/img/61IBBVJvSDL._AC_SY879_.jpg"
                    
                )
                
                
                // ViewModels simulados
                let itemViewModel = ItemViewModel()
                
                // Mostrar la CardView en la previsualización
                CardView(
                    item: itemSimulado,
                    itemViewModel: itemViewModel)
                    
            }
        }
        
    }


