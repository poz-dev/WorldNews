//
//  ViewController.swift
//  News
//
//  Created by Kresimir Ivanjko on 17.04.2023..
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var myTableView: UITableView!
    
    
    
    var articlesList = [ArticleData]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        fetchData()
    
        
    }
    func fetchData() {
     
        // MARK: - Create URL
        
        let url = URL(string: "https://newsapi.org/v2/top-headlines?country=us&category=business&apiKey=6b954d0842f1479c8f72c096a9ee6c6d")
        
        // MARK: - Create DataTask
        
        let dataTask = URLSession.shared.dataTask(with: url!, completionHandler:  { (data, response, error) in
            guard let data = data, error == nil else
            {
                print("Error while accesing data from URL!")
                return
            }
            var newsFullList: NewsData?
            do
            {
                
                newsFullList = try JSONDecoder().decode(NewsData.self, from: data)
                
            } catch {
                print("Error while decoding JSON")
                return
            }
            self.articlesList = newsFullList!.articles
            DispatchQueue.main.async {
                self.myTableView.reloadData()
            }
        })
        dataTask.resume()
        
    }
}






extension UIImageView {
    
    func downloadImage(from url: URL) {
    
        contentMode = .scaleAspectFit
        let dataTask = URLSession.shared.dataTask(with: url, completionHandler: { (data, response, error) in
            guard let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 200,
                  let mimeType = response?.mimeType, mimeType.hasPrefix("image"),
                  let data = data, error == nil,
                  let image = UIImage(data: data)
            else
            {
                return
            }
            DispatchQueue.main.async {
                self.image = image
            }
        })
        dataTask.resume()
    }
}


extension ViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return articlesList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = myTableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! MyTableViewCell
        if articlesList[indexPath.row].author != nil {
            cell.myAuthor.text = "Author: \(articlesList[indexPath.row].author!)"
        } else {
            cell.myAuthor.text = "No Author avaliable"
        }
        cell.myNewsTitle.text = articlesList[indexPath.row].title
        if articlesList[indexPath.row].urlToImage != nil {
            let url = URL(string: articlesList[indexPath.row].urlToImage!)
            cell.myImageView.downloadImage(from: url!)
            cell.myImageView.contentMode = .scaleAspectFit
        } else {
            cell.myImageView.image = UIImage(named: "no.image")
        }
        cell.myDate.text = articlesList[indexPath.row].publishedAt
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = storyboard?.instantiateViewController(withIdentifier: "NewsContentHome") as?
        NewsContentHomepageViewController
        vc?.mynewsContent = articlesList[indexPath.row]
        navigationController?.pushViewController(vc!, animated: true)
    }
    
    
}
