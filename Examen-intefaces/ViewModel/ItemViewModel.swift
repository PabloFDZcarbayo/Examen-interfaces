import Foundation

public class ItemViewModel: ObservableObject {
    @Published var items: [Item] = []
    
    
    public func GetItems() async {
        
        do{
            try await itemsFetch()
            
        }catch {
            print("❌ Error: \(error.localizedDescription)")
        }
    }
    
    
    public func itemsFetch() async  throws {
        
        
        let urlComponents = URLComponents(string: "https://fakestoreapi.com/products/category/electronics")!
        
        guard let url = urlComponents.url else {
                    print("URL inválida")
                    return
                }
        
        //Creamos la solicitud
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        
        //Realizamos la solicitud
        let (data,response) = try await URLSession.shared.data(for: request)
       
        
        //Verificamos la respuesta
        guard let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 200 else {
            print ("Error en la solicitud")
            return
        }
        
        //Decodificamos la respuesta
        let items = try JSONDecoder().decode([Item].self, from: data )
        
        DispatchQueue.main.async {
            self.items = items
            
        }
        
    }
    
    
   
    struct itemsResponse: Decodable {
        let results: [Item]
    }
    
    
}
