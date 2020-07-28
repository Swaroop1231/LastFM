//
//  SearchAlbumsUtility.swift
//  LastFM
//
//  Created by Prathap on 27/07/20.
//  Copyright © 2020 Satya Swaroop. All rights reserved.
//

import Foundation


class SearchAlbumsUtility
{
    
    // MARK: - Get all albums from API

    func getAllAlbums(searchString: String , success : @escaping (_ albums : Albums) -> Void )  {
        NetworkClient().searchAlbumsGetRequest(searchString: searchString , success: { data
            in
            do {
                let albums = try JSONDecoder().decode(Albums.self, from: data)
                success(albums)
            }
            catch let error {
                print(error)
            }
        })
    }
    
    
}
