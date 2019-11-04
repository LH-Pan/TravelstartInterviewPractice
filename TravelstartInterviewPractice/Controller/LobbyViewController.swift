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
    
    var attractionsImageURLArray: [[String]] = []
    
    var networkIsConnected: Bool = false
    
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
    
    private func setupCollectionView(collectionView: UICollectionView) {

        collectionView.delegate = self
        
        collectionView.dataSource = self
        
        collectionView.custom_registerCellWithNib(
            identifier: LobbyCollectionViewCell.identifier,
            bundle: nil
        )
        
        guard
            let collectionViewLayout = collectionView.collectionViewLayout as? UICollectionViewFlowLayout
        else {
            return
        }
        
        let inset: CGFloat = 16 / 375 * UIScreen.width
        
        let interItemSpacing = collectionViewLayout.minimumInteritemSpacing
        
        collectionViewLayout.itemSize = CGSize(width: (UIScreen.width - inset - interItemSpacing) / 2,
                                               height: collectionView.bounds.size.height - inset * 2)
    }
    
    func monitorConnection() {
        
        monitor.pathUpdateHandler = { [weak self] path in
            
            if path.status == .satisfied {
                
                self?.networkIsConnected = true
                
                if self?.attractionsInfoArray.count == 0 {
                    
                    self?.fetchData(offset: 0)
                }
                
            } else {
                
                self?.networkIsConnected = false
                
                TIPJonAlert.showError(message: "沒有網路，請檢查網路連線")
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
                            
                        TIPJonAlert.showError(message: "讀取資料失敗")
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
        
        let urlStringArray = attractionsInfoArray[indexPath.row].file.components(separatedBy: "http")
        
        var filteredStringArray: [String] = []
        
        for urlString in urlStringArray {
            
            if urlString.hasSuffix(".jpg") || urlString.hasSuffix(".JPG") {
                
                filteredStringArray.append("https" + urlString)
            }
        }
        
        attractionsImageURLArray.append(filteredStringArray)
        
        cell.imageCollectionView.tag = indexPath.row
        
        setupCollectionView(collectionView: cell.imageCollectionView)
        
        cell.imageCollectionView.reloadData()
        
        return cell
    }
}

extension LobbyViewController: UICollectionViewDelegate,
                               UICollectionViewDataSource {

    func collectionView(
        _ collectionView: UICollectionView,
        numberOfItemsInSection section: Int
    ) -> Int {

        return attractionsImageURLArray[collectionView.tag].count
    }

    func collectionView(
        _ collectionView: UICollectionView,
        cellForItemAt indexPath: IndexPath
    ) -> UICollectionViewCell {

        guard
            let cell = collectionView.dequeueReusableCell(
                withReuseIdentifier: LobbyCollectionViewCell.identifier,
                for: indexPath
            ) as? LobbyCollectionViewCell
        else {

        return UICollectionViewCell()
        }
        
        cell.attractionImageView.loadImage(attractionsImageURLArray[collectionView.tag][indexPath.row])
        
        return cell
    }
}
