//
//  ViewController.swift
//  LastFM
//
//  Created by Prathap on 27/07/20.
//  Copyright © 2020 Satya Swaroop. All rights reserved.
//

import UIKit

class SearchViewController: UIViewController
{
    // MARK: - UI Declarations
    
    @IBOutlet weak var searchBar : UISearchBar!
    @IBOutlet weak var resultTableView : UITableView!
   
    // MARK: - Property Declarations

    var albumList : Albums?
    
    var album : [Album]?
    {
        return albumList?.results?.albummatches?.album
    }

    
    // MARK: - ViewController Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        searchBar.becomeFirstResponder()
    }

    
    // MARK: - Other functions
    
    func getSearchResultByString(searchString : String)  {
        SearchAlbumsUtility().getAllAlbums(searchString : searchString, success: {(albumsData) in
            DispatchQueue.main.async {
                self.albumList = albumsData
                self.resultTableView.reloadData()
            }
        } )
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if let indexPath = resultTableView.indexPathForSelectedRow {
            (segue.destination as! SearchResultViewController).selectedAlbum = album?[indexPath.row]
        }
    }

}

// MARK: - UISearchBar Extenstion

extension SearchViewController : UISearchBarDelegate {
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        if searchText.count > 2 {
            getSearchResultByString(searchString: searchText)
        }
    }

    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        searchBar.resignFirstResponder()
    }
}

// MARK: - UITableView Extenstion


extension SearchViewController : UITableViewDelegate , UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return album?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier:SearchAlbumResultCell.identifier , for: indexPath) as! SearchAlbumResultCell

        cell.name?.text = album?[indexPath.row].name ?? ""
        cell.artist?.text = album?[indexPath.row].artist ?? ""
        
        if let url = URL(string: album?[indexPath.row].image?[0].text ?? "") {
            DispatchQueue.global().async {
                if let data = try? Data(contentsOf: url) {
                    DispatchQueue.main.async {
                        cell.imageview.image = UIImage(data: data)
                    }
                }
            }
        }
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print(indexPath)
        
        performSegue(withIdentifier: "ShowSearchResultViewController", sender: self)
    }
    
    
}

