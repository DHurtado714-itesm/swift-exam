//
//  MovieRepository.swift
//  swfit-examen
//
//  Created by Daniel Hurtado on 10/10/23.
//

import Foundation

class Api {
  static let base = "https://api.themoviedb.org/3/movie/popular"
  struct Routes {
  }
}

protocol NetworkAPIProtocol {
    func getMovieList() async -> MovieResponse?
}

class MovieRepository: NetworkAPIProtocol{
    let nService: NetworkAPIService
    static let shared = MovieRepository()
    
    init(nService: NetworkAPIService = NetworkAPIService.shared) {
      self.nService = nService
    }
    
    func getMovieList() async -> MovieResponse? {
        return await nService.getMovies(url: URL(string: "\(Api.base)")!)
    }
}
