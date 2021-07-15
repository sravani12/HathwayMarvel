//
//  ComicDetailDataStore.swift
//  HathwayAssignment
//
//  Created by Vidya Sravani on 7/15/21.
//

import Foundation

protocol ComicDetailDataStoreProtocol {
    var comic: MarvelComic { get }
}

final class ComicDetailDataStore: ComicDetailDataStoreProtocol {
    var comic: MarvelComic

    init(comic: MarvelComic) {
        self.comic = comic
    }
}

