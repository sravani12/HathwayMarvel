//
//  CharacterListRouter.swift
//  HathwayAssignment
//
//  Created by Vidya Sravani on 7/15/21.
//

import UIKit

protocol CharacterListRoutingLogic {
    var viewController: UIViewController? { get set }

    func goToCharacterDetail(with marvelCharacter: MarvelCharacter)
    func showErrorAlert(title: String, message: String, okAction: String)
}

final class CharacterListRouter: CharacterListRoutingLogic {
    weak var viewController: UIViewController?

    func goToCharacterDetail(with marvelCharacter: MarvelCharacter) {
        let characterDetail = CharacterDetailConfigurator().instantiateView(marvelCharacter: marvelCharacter)
//        viewController?.navigationController?.pushViewController(characterDetail, animated: true)
        viewController?.present(characterDetail, animated: true, completion: nil)
    }

    func showErrorAlert(title: String, message: String, okAction: String) {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: okAction, style: .default, handler: nil)
        alertController.addAction(okAction)
        viewController?.present(alertController, animated: true, completion: nil)
    }
}

