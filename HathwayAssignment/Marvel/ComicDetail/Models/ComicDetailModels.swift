//
//  ComicDetailModels.swift
//  HathwayAssignment
//
//  Created by Vidya Sravani on 7/15/21.
//

import Foundation

enum ComicDetail {
    enum FetchComic {
        struct Request {}
        struct Response {
            let comic: MarvelComic
        }
        struct ViewModel {
            let comic: MarvelComic
        }
    }
}

