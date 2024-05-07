import Foundation

struct CryptoModel: Codable {
    let data: [CryptoDetail]
}

struct CryptoDetail: Codable {
    let id: String
    let rank: String
    let symbol: String
    let changePercent24Hr: String
}
