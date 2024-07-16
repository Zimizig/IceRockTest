//
//  RepositoriesListViewController.swift
//  JuniorGitHubProject
//
//  Created by Роман on 03.11.2023.
//

import Foundation
import SwiftUI


class RepositoriesListViewController: UIViewController {
    
    let tableView = UITableView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        view.backgroundColor = .systemPink
        
        
    }
}

// MARK: Обязательно удалить /
struct ViewControllerProviderRepo: PreviewProvider {
    static var previews: some View {
        RepositoriesListViewController().showPreview()
    }
}
// MARK: Обязательно удалить /
