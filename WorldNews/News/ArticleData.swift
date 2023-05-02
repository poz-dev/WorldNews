//
//  ArticleData.swift
//  News
//
//  Created by Kresimir Ivanjko on 17.04.2023..
//

import Foundation

struct ArticleData: Codable {
    let author: String?
    let title: String?
    let urlToImage: String?
    let publishedAt: String?
    let content: String?
}




/*
 "status": "ok",
   "totalResults": 68,
   "articles": [
     {
       "source": {
         "id": "business-insider",
         "name": "Business Insider"
       },
       "author": "Daniel Geiger",
       "title": "Landlords pumped billions into apartment buildings during the pandemic. That bet could now go horribly wrong. - Yahoo Finance",
       "description": "Investors who paid top dollar for apartment buildings and that depended on big rent increases and cheap funding are facing increasing stress.",
       "url": "https://www.businessinsider.com/apartment-buildings-look-financially-risky-as-rents-stagnate-2023-4",
       "urlToImage": "https://s.yimg.com/ny/api/res/1.2/zxyenO7Ym8WB3Y64h8qbyQ--/YXBwaWQ9aGlnaGxhbmRlcjt3PTEyMDA7aD05MDA-/https://media.zenfs.com/en/business_insider_articles_888/4a53303817aa9bdfb85e04d0e3c71c3d",
       "publishedAt": "2023-04-16T18:00:00Z",
       "content": "Apartments in downtown Phoenix.Getty\r\n<ul><li>Big money investors pumped billions into buying up apartment buildings in the pandemic era.\r\n</li><li>The deals were often based on the assumption that r… [+3319 chars]"
     },
 */
