//
//  NetworkClient.swift
//  LastFM
//
//  Created by Prathap on 27/07/20.
//  Copyright © 2020 Satya Swaroop. All rights reserved.
//

import Foundation


class NetworkClient
{

     let method = "album.search"
    
    func searchAlbumsGetRequest(searchString : String , success : @escaping (_ jsonData : Data) -> Void )
    {
        let urlString = "\(Constant.BASEURL)/\(Constant.APPVERSION)/?method=\(method)&album=\(searchString)&api_key=\(Constant.APPKEY)&format=\(Constant.FORMAT)"
        
        let request = URLRequest(url: URL(string: urlString)!)
        
        let task = URLSession.shared.dataTask(with: request) { (data, response, error) in
            if data?.count ?? 0 > 0 && error == nil {
                success(data!)
            }
        }
        task.resume()
    }
}
