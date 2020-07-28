//
//  SearchResultViewController.swift
//  LastFM
//
//  Created by Prathap on 28/07/20.
//  Copyright © 2020 Satya Swaroop. All rights reserved.
//

import UIKit
import WebKit

class SearchResultViewController: UIViewController , WKNavigationDelegate {
    
    // MARK: - Property Declarations

    var selectedAlbum : Album?
    
    // MARK: - UI Declarations

    @IBOutlet weak var webView : WKWebView!

    
    // MARK: - ViewController Lifecycle

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let urlString = selectedAlbum?.url {
            if let url = URL(string: urlString) {
                webView.load(URLRequest(url: url))
            }
        }
    }
    

}
