//
//  CharacterListConfigurator.swift
//  HathwayAssignment
//
//  Created by Vidya Sravani on 7/15/21.
//

import UIKit
import XLPagerTabStrip

public final class CharacterListConfigurator {

    public init() {}

    public func instantiateView() -> UIViewController {
        let router = CharacterListRouter()
        let presenter = CharacterListPresenter()
        let interactor = CharacterListInteractor(presenter: presenter)
        let view = CharacterListView()
        let viewController = CharacterListViewController(interactor: interactor, router: router, customView: view, itemInfo: IndicatorInfo(title: "Character"))

        router.viewController = viewController
        presenter.view = viewController

        return viewController
    }
}

