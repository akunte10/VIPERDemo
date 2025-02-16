//
//  MoviePresenter.swift
//  VIPER_DEMO
//
//  Created by Ajay Kunte on 19/01/24.
//

import Foundation

class MoviePresenter:ViewToPresenterMovieProtocol{
    
    var view: PresenterToViewMovieProtocol?
    
    var interactor: PresenterToInteractorMovieProtocol?
    
    var router: PresenterToRouterMovieProtocol?
    
    func startFetchingMovie() {
        interactor?.fetchMovie()
    }
    
}

extension MoviePresenter:InteractorToPresenterMovieProtocol{
    
    func movieFetchSuccess(movieList: Array<MovieModel>) {
        view?.onMovieResponseSuccess(movieModelArrayList: movieList)
    }
    
    func movieFetchFailed() {
        view?.onMovieResponseFailed(error: "Some Error message from api response")
    }
    
    
}
