//
//  FetchNoticeModel.swift
//  VIPER_DEMO
//
//  Created by Ajay Kunte on 19/01/24.
//

import Foundation
import Alamofire
import ObjectMapper

class NoticeInteractor: PresenterToInteractorProtocol{
    var presenter: InteractorToPresenterProtocol?
    
    func fetchNotice() {
        AF.request(API_NOTICE_LIST).responseJSON { response in
            
            if(response.response?.statusCode == 200){
                if let json = response.result as AnyObject? {
                    let arrayResponse = json["notice_list"] as! NSArray
                    let arrayObject = Mapper<NoticeModel>().mapArray(JSONArray: arrayResponse as! [[String : Any]]);
                    self.presenter?.noticeFetchedSuccess(noticeModelArray: arrayObject)
                }
            }else {
                self.presenter?.noticeFetchFailed()
            }
        }
    }
    
    
    
    
}
