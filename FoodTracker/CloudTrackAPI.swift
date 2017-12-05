//
//  CloudTrackAPI.swift
//  FoodTracker
//
//  Created by Javier Xing on 2017-12-04.
//  Copyright © 2017 Javier Xing. All rights reserved.
//

import UIKit


class CloudTrackAPI {
    
    class func signupCall(username:String, password: String){
        let sessionConfig = URLSessionConfiguration.default
        
        let session = URLSession(configuration: sessionConfig, delegate: nil, delegateQueue: nil)
        
        guard var URL = URL(string: "https://cloud-tracker.herokuapp.com/signup")else{return}
        let URLParams = ["username": username,
                         "password": password,]
        
        URL = URL.appendingQueryParameters(URLParams)
        var request = URLRequest(url: URL)
        request.httpMethod = "POST"
        
        let task = session.dataTask(with: request, completionHandler: { (data: Data?, response: URLResponse?, error: Error?) -> Void in
            if (error == nil) {
                // Success
                let statusCode = (response as! HTTPURLResponse).statusCode
                print("URL Session Task Succeeded: HTTP \(statusCode)")
            }
            else {
                // Failure
                print("URL Session Task Failed: %@", error!.localizedDescription);
            }
            
            var json: Any?
            do{
                json = try JSONSerialization.jsonObject(with: data!)
            }
            catch {
                print(#line, error.localizedDescription)
            }
            
            guard let userInfo = json as? [String : Any] else { return }
            
            let userDefaults = UserDefaults.standard
            
            //            let userName = username
            //            let password = password
            let token = userInfo["token"]
            
            userDefaults.set(username, forKey: "username")
            userDefaults.set(password, forKey: "password")
            userDefaults.set(token, forKey: "token")
            
            print(userInfo)
        })
        task.resume()
        session.finishTasksAndInvalidate()
    }



     class func loginCall(username:String, password:String) {
        
        let sessionConfig = URLSessionConfiguration.default
        
        /* Create session, and optionally set a URLSessionDelegate. */
        let session = URLSession(configuration: sessionConfig, delegate: nil, delegateQueue: nil)
        
        /* Create the Request:
         Request (POST https://cloud-tracker.herokuapp.com/login)
         */
        
        guard var URL = URL(string: "https://cloud-tracker.herokuapp.com/login") else {return}
        let URLParams = [
            "username": "javx123",
            "password": "javx112233",
            ]
        URL = URL.appendingQueryParameters(URLParams)
        var request = URLRequest(url: URL)
        request.httpMethod = "POST"
        
        /* Start a new Task */
        let task = session.dataTask(with: request, completionHandler: { (data: Data?, response: URLResponse?, error: Error?) -> Void in
            if (error == nil) {
                // Success
                let statusCode = (response as! HTTPURLResponse).statusCode
                print("URL Session Task Succeeded: HTTP \(statusCode)")
            }
            else {
                // Failure
                print("URL Session Task Failed: %@", error!.localizedDescription);
            }
            
            //        JSON parcsing
            var json: Any?
            do{
                json = try JSONSerialization.jsonObject(with: data!)
            }
            catch {
                print(#line, error.localizedDescription)
            }
            
            guard let userInfo = json as? [String : Any] else { return }
            
            let userDefaults = UserDefaults.standard
            
            //            let userName = username
            //            let password = password
            let token = userInfo["token"]
            
            userDefaults.set(username, forKey: "username")
            userDefaults.set(password, forKey: "password")
            userDefaults.set(token, forKey: "token")
            
            print(userInfo)
        })
        task.resume()
        session.finishTasksAndInvalidate()
    }

}

protocol URLQueryParameterStringConvertible {
    var queryParameters: String {get}
}

extension Dictionary : URLQueryParameterStringConvertible {
    /**
     This computed property returns a query parameters string from the given NSDictionary. For
     example, if the input is @{@"day":@"Tuesday", @"month":@"January"}, the output
     string will be @"day=Tuesday&month=January".
     @return The computed parameters string.
     */
    var queryParameters: String {
        var parts: [String] = []
        for (key, value) in self {
            let part = String(format: "%@=%@",
                              String(describing: key).addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)!,
                              String(describing: value).addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)!)
            parts.append(part as String)
        }
        return parts.joined(separator: "&")
    }
    
}


extension URL {
    /**
     Creates a new URL by adding the given query parameters.
     @param parametersDictionary The query parameter dictionary to add.
     @return A new URL.
     */
    func appendingQueryParameters(_ parametersDictionary : Dictionary<String, String>) -> URL {
        let URLString : String = String(format: "%@?%@", self.absoluteString, parametersDictionary.queryParameters)
        return URL(string: URLString)!
    }
}




