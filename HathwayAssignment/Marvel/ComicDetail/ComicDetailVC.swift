//
//  ComicDetailVC.swift
//  HathwayAssignment
//
//  Created by Vidya Sravani on 7/15/21.
//

import UIKit

protocol ComicDetailDisplayLogic: AnyObject {
    func showComic(viewModel: ComicDetail.FetchComic.ViewModel)
}

final class ComicDetailVC: UIViewController {
    private let customView: ComicDetailViewProtocol & UIView
    private let interactor: ComicDetailBusinessLogic

    init(
        interactor: ComicDetailBusinessLogic,
        customView: ComicDetailViewProtocol & UIView
    ) {
        self.interactor = interactor
        self.customView = customView
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func loadView() {
        view = customView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        interactor.fetchComic(request: .init())
    }
}

extension ComicDetailVC: ComicDetailDisplayLogic {
    func showComic(viewModel: ComicDetail.FetchComic.ViewModel) {
        title = "#\(viewModel.comic.issueNumber)"
        customView.set(comic: viewModel.comic)
    }
}


