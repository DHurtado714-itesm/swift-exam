//
//  MoviesViewModel.swift
//  swfit-examen
//
//  Created by Daniel Hurtado on 10/10/23.
//

import Foundation
import Combine

class MoviesViewModel: ObservableObject{
    @Published var movies: [Movie] = []
    @Published var isLoading: Bool = false
    @Published var error: Error?
    
    private var moviesRequirement: MoviesRequirementProtocol

    init(moviesRequirement: MoviesRequirementProtocol = MovieRequirement.shared) {
        self.moviesRequirement = moviesRequirement
        fetchMovies()
    }
    
    func fetchMovies(){
        isLoading = true
        print("Movies: \(movies)")
        
        Task{
            do {
                if let movieResponse = await moviesRequirement.getMovies() {
                    self.movies = movieResponse.results
                    print(movieResponse)
                }
            }
            catch{
                self.error = error
            }
            
            isLoading = false
        }
    }
}
