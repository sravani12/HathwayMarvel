//
//  CharacterDetailConfigurator.swift
//  HathwayAssignment
//
//  Created by Vidya Sravani on 7/15/21.
//

import UIKit

final class CharacterDetailConfigurator {
    func instantiateView(marvelCharacter: MarvelCharacter) -> UIViewController {
        let dataStore = CharacterDetailDataStore(marvelCharacter: marvelCharacter)
        let presenter = CharacterDetailPresenter()
        let router = CharacterDetailRouter()
        let view = CharacterDetailView()
        let interactor = CharacterDetailInteractor(dataStore: dataStore, presenter: presenter)
        let viewController = CharacterDetailVC(interactor: interactor, router: router, customView: view)

        router.viewController = viewController
        presenter.view = viewController

        return viewController
    }
}

