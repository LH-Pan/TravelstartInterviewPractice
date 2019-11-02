//
//  ViewController.swift
//  TravelstartInterviewPractice
//
//  Created by 潘立祥 on 2019/11/1.
//  Copyright © 2019 PanLiHsiang. All rights reserved.
//

import UIKit

class LobbyViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupTableView()
    }
    
    private func setupTableView() {
        
        tableView.delegate = self
        
        tableView.dataSource = self
        
        tableView.custom_registerCellWithNib(
            identifier: LobbyTableViewCell.identifier,
            bundle: nil
        )
    }
}

extension LobbyViewController: UITableViewDelegate,
                               UITableViewDataSource {
    
    func tableView(
        _ tableView: UITableView,
        numberOfRowsInSection section: Int
    ) -> Int {
        
        return 1
    }
    
    func tableView(
        _ tableView: UITableView,
        cellForRowAt indexPath: IndexPath
    ) -> UITableViewCell {
        
        guard
            let cell = tableView.dequeueReusableCell(
                withIdentifier: LobbyTableViewCell.identifier,
                for: indexPath
            ) as? LobbyTableViewCell
        else {
            return UITableViewCell()
        }
        
        return cell
    }
}
