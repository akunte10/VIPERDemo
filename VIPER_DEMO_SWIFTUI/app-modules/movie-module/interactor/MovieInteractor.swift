//
//  MovieInteractor.swift
//  VIPER_DEMO
//
//  Created by Ajay Kunte on 19/01/24.
//

import Foundation
import Alamofire
import ObjectMapper
import AlamofireImage

class MovieInteractor:PresenterToInteractorMovieProtocol{    
    
    var presenter: InteractorToPresenterMovieProtocol?
    
    func fetchMovie() {
        
        AF.request(API_MOVIE_LIST).responseJSON(completionHandler: { response in
            if(response.response?.statusCode == 200){
                if let json = response.result as AnyObject? {
                    let arrayResponse = json["movie_list"] as! NSArray
                    let arrayObject = Mapper<MovieModel>().mapArray(JSONArray: arrayResponse as! [[String : Any]]);
                    self.presenter?.movieFetchSuccess(movieList: arrayObject)
                }
            }else {
                self.presenter?.movieFetchFailed()
            }
        })
        
    }
    
    
    
    
}
