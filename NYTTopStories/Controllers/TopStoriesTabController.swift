//
//  TopStoriesTabController.swift
//  NYTTopStories
//
//  Created by Alex Paul on 2/6/20.
//  Copyright © 2020 Alex Paul. All rights reserved.
//

import UIKit
import DataPersistence

class TopStoriesTabController: UITabBarController {
  
  // step 1: setting up data persistence and its delegate
  private var dataPersistence = DataPersistence<Article>(filename: "savedArticles.plist")
  
  private lazy var newsFeedVC: NewsFeedViewController = {
    let viewController = NewsFeedViewController()
    viewController.tabBarItem = UITabBarItem(title: "News Feed", image: UIImage(systemName: "eyeglasses"), tag: 0)
    viewController.dataPersistence = dataPersistence
    return viewController
  }()
  
  private lazy var savedArticlesVC: SavedArticleViewController = {
    let viewController = SavedArticleViewController()
    viewController.dataPersistence = dataPersistence
    
    // step 6: setting up data persistence and its delegate
    viewController.dataPersistence.delegate = viewController
    viewController.tabBarItem = UITabBarItem(title: "Saved Articles", image: UIImage(systemName: "folder"), tag: 1)
    return viewController
  }()
  
  private lazy var settingsVC: SettingsViewController = {
    let viewController = SettingsViewController()
    viewController.tabBarItem = UITabBarItem(title: "Settings", image: UIImage(systemName: "gear"), tag: 2)
    return viewController
  }()
  
  override func viewDidLoad() {
    super.viewDidLoad()
    viewControllers = [UINavigationController(rootViewController: newsFeedVC),
                       UINavigationController(rootViewController: savedArticlesVC),
                       UINavigationController(rootViewController: settingsVC)]
  }  
}
