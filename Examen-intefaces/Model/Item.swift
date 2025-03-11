
import Foundation

struct Item: Identifiable, Decodable {
    let id: Int
    let title: String
    let price: Int
    let description: String
    let category: String
    let image: String
    
}

