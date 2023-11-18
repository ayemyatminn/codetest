//
//  MovieModel.swift
//  CodeTest
//
//  Created by Aye Myat Minn on 18/11/2023.
//

import Foundation
import Combine

class MovieModel {
    
    private let apiKey = "6ea219b5298188f1d70fed47c291d9a0"
    private let baseURL = "https://api.themoviedb.org/3"
    
    func fetchPopularMovies() -> AnyPublisher<[MovieVO], Error> {
        let url = URL(string: "\(baseURL)/movie/popular?api_key=\(apiKey)")!
        return URLSession.shared.dataTaskPublisher(for: url)
            .map(\.data)
            .decode(type: MovieResponse.self, decoder: JSONDecoder())
            .map(\.results)
            .print("fetchPopularMovies")
            .mapError { $0 as Error }
            .eraseToAnyPublisher()
    }

    func fetchUpcomingMovies() -> AnyPublisher<[MovieVO], Error> {
        let url = URL(string: "\(baseURL)/movie/upcoming?api_key=\(apiKey)")!
        return URLSession.shared.dataTaskPublisher(for: url)
            .map(\.data)
            .decode(type: MovieResponse.self, decoder: JSONDecoder())
            .map(\.results)
            .eraseToAnyPublisher()
    }
    
}
