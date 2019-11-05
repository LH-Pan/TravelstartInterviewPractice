//
//  DetailScreenViewController.swift
//  TravelstartInterviewPractice
//
//  Created by 潘立祥 on 2019/11/5.
//  Copyright © 2019 PanLiHsiang. All rights reserved.
//

import UIKit

class DetailScreenViewController: UIViewController {
    
    @IBOutlet weak var detailTableView: UITableView!
    
    var detailInfoArray: [Results] = []
    
    var index: Int = 0
    
    lazy var detailInfo: [DetailInfo] = {
        
        let detailInfo = [
            DetailInfo(title: "景點名稱", description: detailInfoArray[index].stitle),
            DetailInfo(title: "景點介紹", description: detailInfoArray[index].xbody),
            DetailInfo(title: "景點地址", description: detailInfoArray[index].address),
            DetailInfo(title: "交通資訊", description: detailInfoArray[index].info ?? "無")
        ]
        
        return detailInfo
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupTableView()
    }
    
    private func setupTableView() {
        
        detailTableView.delegate = self
        
        detailTableView.dataSource = self
        
        detailTableView.custom_registerCellWithNib(
            identifier: DetailScreenTableViewCell.identifier,
            bundle: nil
        )
    }
}

extension DetailScreenViewController: UITableViewDelegate,
                                      UITableViewDataSource {
    
    func tableView(
        _ tableView: UITableView,
        numberOfRowsInSection section: Int
    ) -> Int {
        
        return detailInfo.count
    }
    
    func tableView(
        _ tableView: UITableView,
        cellForRowAt indexPath: IndexPath
    ) -> UITableViewCell {
        
        guard
            let cell = detailTableView.dequeueReusableCell(
                withIdentifier: DetailScreenTableViewCell.identifier,
                for: indexPath
            ) as? DetailScreenTableViewCell
        else {
            return UITableViewCell()
        }
        
        cell.titleLabel.text = detailInfo[indexPath.row].title
        
        cell.descriptionLabel.text = detailInfo[indexPath.row].description
        
        return cell
    }
}
