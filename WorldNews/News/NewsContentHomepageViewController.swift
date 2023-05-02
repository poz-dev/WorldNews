//
//  NewsContentHomepageViewController.swift
//  News
//
//  Created by Kresimir Ivanjko on 17.04.2023..
//

import UIKit

class NewsContentHomepageViewController: UIViewController {
    
    @IBOutlet var headlineTitle: UILabel!
    @IBOutlet var newsImage: UIImageView!
    @IBOutlet var newsContent: UILabel!
    
    var mynewsContent: ArticleData = ArticleData(author: "", title: "", urlToImage: "", publishedAt: "", content: "")
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        headlineTitle.text = mynewsContent.title
        
        if mynewsContent.urlToImage != nil {
            
            let url = URL(string: mynewsContent.urlToImage!)
            newsImage.downloadImage(from: url!)
            newsImage.contentMode = .scaleToFill
        } else {
            newsImage.image = UIImage(named: "no.image")
        }
        newsContent.text = mynewsContent.content
        
    }

}
