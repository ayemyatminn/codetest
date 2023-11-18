//
//  MovieListViewModel.swift
//  CodeTest
//
//  Created by Aye Myat Minn on 18/11/2023.
//

import Foundation
import Combine

class MovieListViewModel: BaseViewModel {
    @Published var popularMovies: [MovieVO] = []
    @Published var upcomingMovies: [MovieVO] = []

    var cancellables: Set<AnyCancellable> = []

    private let movieModel = MovieModel()

    func fetchMovies() {
        movieModel.fetchPopularMovies()
            .sink(receiveCompletion: { _ in }) { movies in
                self.popularMovies = movies
                print(movies.count)
            }
            .store(in: &cancellables)

        movieModel.fetchUpcomingMovies()
            .sink(receiveCompletion: { _ in }) { movies in
                self.upcomingMovies = movies
                print(movies.count)
            }
            .store(in: &cancellables)
    }
}
