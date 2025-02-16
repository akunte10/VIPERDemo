//
//  NoticeRouter.swift
//  VIPER_DEMO
//
//  Created by Ajay Kunte on 19/01/24.
//

import Foundation
import UIKit

class NoticeRouter:PresenterToRouterProtocol{
    
    static func createModule() -> NoticeViewController {
        
        let view = mainstoryboard.instantiateViewController(withIdentifier: "MyViewController") as! NoticeViewController
        
        let presenter: ViewToPresenterProtocol & InteractorToPresenterProtocol = NoticePresenter()
        let interactor: PresenterToInteractorProtocol = NoticeInteractor()
        let router:PresenterToRouterProtocol = NoticeRouter()
        
        view.presentor = presenter
        presenter.view = view
        presenter.router = router
        presenter.interactor = interactor
        interactor.presenter = presenter
        
        return view
        
    }
    
    static var mainstoryboard: UIStoryboard{
        return UIStoryboard(name:"Main",bundle: Bundle.main)
    }
    
    func pushToMovieScreen(navigationConroller navigationController:UINavigationController) {
        
        let movieModue = MovieRouter.createMovieModule()
        navigationController.pushViewController(movieModue,animated: true)
        
    }
    
}
