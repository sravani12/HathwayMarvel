//
//  CharacterDetailRouter.swift
//  HathwayAssignment
//
//  Created by Vidya Sravani on 7/15/21.
//

import UIKit

protocol CharacterDetailRoutingLogic {
    var viewController: UIViewController? { get set }

    func goToComicDetail(with comic: MarvelComic)
}

final class CharacterDetailRouter: CharacterDetailRoutingLogic {
    weak var viewController: UIViewController?

    func goToComicDetail(with comic: MarvelComic) {
        let comicDetail = ComicDetailConfigurator().instantiateView(comic: comic)
//        viewController?.navigationController?.pushViewController(comicDetail, animated: true)
        viewController?.present(comicDetail, animated: true, completion: nil)
    }
}

