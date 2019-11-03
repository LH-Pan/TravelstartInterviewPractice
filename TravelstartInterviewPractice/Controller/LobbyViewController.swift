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
    
    var attractionsInfoArray: [Results] = []
    
    let informationProvider = InformationProvider()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupTableView()
        
        fetchData()
    }
    
    private func setupTableView() {
        
        tableView.delegate = self
        
        tableView.dataSource = self
        
        tableView.custom_registerCellWithNib(
            identifier: LobbyTableViewCell.identifier,
            bundle: nil
        )
    }
    
    func fetchData() {
        
        informationProvider.fetchInformation(
            completion: { [weak self] result in
            
                switch result {
                    
                case .success(let attractionsInfoArray):
                    
                    self?.attractionsInfoArray = attractionsInfoArray.results
                    
                    print(self?.attractionsInfoArray as Any)
                    
                case .failure:
                    
                    print("讀取資料失敗")
                }
        })
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
