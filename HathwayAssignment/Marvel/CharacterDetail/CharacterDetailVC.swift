//
//  CharacterDetailVC.swift
//  HathwayAssignment
//
//  Created by Vidya Sravani on 7/15/21.
//

import UIKit

protocol CharacterDetailDisplayLogic: AnyObject {
    func showMarvelCharacter(viewModel: CharacterDetail.FetchMarvelCharacter.ViewModel)
    func showComic(viewModel: CharacterDetail.FetchMostExpensiveMaganize.ViewModel.Success)
    func showError(viewModel: CharacterDetail.FetchMostExpensiveMaganize.ViewModel.Failure)
}

final class CharacterDetailVC: UIViewController {

    private let customView: CharacterDetailViewProtocol & UIView
    private let interactor: CharacterDetailBusinessLogic
    private let router: CharacterDetailRoutingLogic

    init(
        interactor: CharacterDetailBusinessLogic,
        router: CharacterDetailRoutingLogic,
        customView: CharacterDetailViewProtocol & UIView
    ) {
        self.interactor = interactor
        self.router = router
        self.customView = customView
        super.init(nibName: nil, bundle: nil)
        self.customView.set(delegate: self)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func loadView() {
        view = customView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        interactor.fetchMarvelCharacter(request: .init())
    }
}

extension CharacterDetailVC: CharacterDetailDisplayLogic {
    func showMarvelCharacter(viewModel: CharacterDetail.FetchMarvelCharacter.ViewModel) {
        title = viewModel.marvelCharacter.name
        customView.set(marvelCharacter: viewModel.marvelCharacter)
    }

    func showComic(viewModel: CharacterDetail.FetchMostExpensiveMaganize.ViewModel.Success) {
        customView.stopLoading()
        router.goToComicDetail(with: viewModel.marvelComic)
    }

    func showError(viewModel: CharacterDetail.FetchMostExpensiveMaganize.ViewModel.Failure) {
        let alertController = UIAlertController(title: viewModel.title, message: viewModel.description, preferredStyle: .alert)
        let okAction = UIAlertAction(title: viewModel.okButton, style: .default, handler: nil)
        alertController.addAction(okAction)
        present(alertController, animated: true, completion: nil)
    }
}

extension CharacterDetailVC: CharacterDetailViewDelegate {
    func didTapMostExpensiveMaganize() {
        interactor.fetchMostExpensiveMagazine(request: .init())
    }
}

