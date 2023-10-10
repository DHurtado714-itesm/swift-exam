//
//  NetworkAPIService.swift
//  swfit-examen
//
//  Created by Daniel Hurtado on 10/10/23.
//

import Foundation
import Alamofire

class NetworkAPIService{
    static let shared = NetworkAPIService()
    let apiKey = "eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiJmZjhkZDc1NmUzMmI4YWNlZjYyZmQ2YzMwZmQwY2NmOSIsInN1YiI6IjY0ZWI5MzhiZTg5NGE2MDEzYmIxNjNjZiIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.6cGDTI8wql15qnVZErrd_6QRNaiRAi74pRD0LfOzVZM"
    
    
    func getMovies(url: URL) async -> MovieResponse? {
            var request = URLRequest(url: url)
            request.headers.add(.authorization(bearerToken: apiKey))
            let taskRequest = AF.request(request).validate()
            let response = await taskRequest.serializingData().response
            switch response.result {
            case .success(let data):
                do {
                    let decoder = JSONDecoder()
                    decoder.keyDecodingStrategy = .convertFromSnakeCase

                    return try decoder.decode(MovieResponse.self, from: data)

                } catch {
                    debugPrint("Decoding Error: \(error)")
                    return nil
                }
            case .failure(let error):
                debugPrint("API Request Error: \(error.localizedDescription)")
                return nil
            }
        }
}
