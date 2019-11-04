//
//  ViewController.swift
//  TravelstartInterviewPractice
//
//  Created by 潘立祥 on 2019/11/1.
//  Copyright © 2019 PanLiHsiang. All rights reserved.
//

import UIKit
import Network

class LobbyViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    var attractionsInfoArray: [Results] = [] {
        
        didSet {
            
            tableView.reloadData()
        }
    }
    
    var networkIsConnected: Bool = true
    
    let informationProvider = InformationProvider()
    
    let monitor = NWPathMonitor()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupTableView()
        
        monitorConnection()
        
        fetchData(offset: attractionsInfoArray.count)
    }
    
    private func setupTableView() {
        
        tableView.delegate = self
        
        tableView.dataSource = self
        
        tableView.custom_registerCellWithNib(
            identifier: LobbyTableViewCell.identifier,
            bundle: nil
        )
    }
    
    func monitorConnection() {
        
        monitor.pathUpdateHandler = { [weak self] path in
            
            if path.status == .satisfied {
                
                self?.networkIsConnected = true
                
            } else {
                
                self?.networkIsConnected = false
                
                TIPJonAlert.showError(message: "網路失效，請檢查網路連線")
            }
        }
        
        monitor.start(queue: DispatchQueue.global())
    }
    
    func fetchData(offset: Int) {
        
        if networkIsConnected {
            
            informationProvider.fetchInformation(
                offset: offset,
                completion: { [weak self] result in
                    
                    switch result {
                        
                    case .success(let attractionsInfoArray):
                        
                        self?.attractionsInfoArray += attractionsInfoArray.results
                        
                    case .failure:
                        
                        DispatchQueue.main.async {
                            
                            TIPJonAlert.showError(message: "讀取資料失敗")
                        }
                    }
            })
        }
    }
}

extension LobbyViewController: UITableViewDelegate,
                               UITableViewDataSource {
    
    func tableView(
        _ tableView: UITableView,
        numberOfRowsInSection section: Int
    ) -> Int {

        return attractionsInfoArray.count
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
        
        cell.titleLabel.text = attractionsInfoArray[indexPath.row].stitle
        
        cell.descriptionLabel.text = attractionsInfoArray[indexPath.row].xbody
        
        return cell
    }
}
