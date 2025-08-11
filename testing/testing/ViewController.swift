//
//  ViewController.swift
//  testing
//
//  Created by vinay kamra on 08/08/25.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupNavigationBar()
        // Do any additional setup after loading the view.
    }
    
    private func setupNavigationBar() {
        // First bar button
        let firstButton = UIBarButtonItem(
            title: "One",
            style: .plain,
            target: self,
            action: #selector(firstButtonTapped)
        )

        // Second bar button
        let secondButton = UIBarButtonItem(
            title: "Two",
            style: .plain,
            target: self,
            action: #selector(secondButtonTapped)
        )

        // Set both right bar button items
        navigationItem.rightBarButtonItems = [secondButton, firstButton] // rightmost is last
    }

    @objc private func firstButtonTapped() {
        let secondVC = SecondViewController()
        secondVC.title = "Pushed from One"
        navigationController?.pushViewController(secondVC, animated: true)
    }

    @objc private func secondButtonTapped() {
        let secondVC = SecondViewController()
        secondVC.title = "Pushed from Two"
        navigationController?.pushViewController(secondVC, animated: true)
    }


}

