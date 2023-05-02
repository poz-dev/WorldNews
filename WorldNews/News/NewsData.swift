//
//  NewsData.swift
//  News
//
//  Created by Kresimir Ivanjko on 17.04.2023..
//

import Foundation

struct NewsData: Codable {
    let status: String?
    let articles: [ArticleData]
}
