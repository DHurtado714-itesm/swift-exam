//
//  MoviesRequirement.swift
//  swfit-examen
//
//  Created by Daniel Hurtado on 10/10/23.
//

import Foundation

protocol MoviesRequirementProtocol{
    func getMovies() async -> MovieResponse?
}

class MovieRequirement: MoviesRequirementProtocol {
    let dataRepository: MovieRepository
    static let shared = MovieRequirement()
    
    init (dataRepository: MovieRepository = MovieRepository.shared){
        self.dataRepository = dataRepository
    }
    
    func getMovies() async -> MovieResponse? {
        return await dataRepository.getMovieList()
    }
}
