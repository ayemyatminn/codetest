//
//  MovieDetailViewModel.swift
//  CodeTest
//
//  Created by Aye Myat Minn on 18/11/2023.
//

import Foundation

class MovieDetailViewModel {
    
    var movie: MovieVO

    init(movie: MovieVO) {
        self.movie = movie
    }

    var title: String {
        return movie.title
    }

    var overview: String {
        return movie.overview
    }
}
