import Foundation
import Alamofire

class AFManager {
    
    static let shared = AFManager()
    
    func getCrypto(_ completion: @escaping ((CryptoModel?) -> ())) {
        let url = URL(string:"https://api.coincap.io/v2/assets")!
        AF.request(url).response { response in
            let decoder = JSONDecoder()
            
            guard let data = response.data else {
                completion(nil)
                return
            }
            
            let crypto = try! decoder.decode(CryptoModel.self, from: data)
            completion(crypto)
        }
    }
}
