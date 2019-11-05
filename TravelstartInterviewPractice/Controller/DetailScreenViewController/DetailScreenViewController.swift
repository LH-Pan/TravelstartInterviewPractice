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
    
    let scrollView = UIScrollView()
    
    var stringIndex: CGFloat = 0
    
    var detailInfoArray: [Results] = []
    
    var scrollViewIsSet: Bool = false
    
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
    
    // MARK: - View Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupTableView()
        
        setupNavigationItem()
    }
    
    // MARK: - Private Method
    private func setupNavigationItem() {
        
        navigationItem.title = detailInfoArray[index].stitle
        
        navigationItem.leftBarButtonItem = UIBarButtonItem(
            image: UIImage.asset(.Icons_24px_Back02),
            style: .plain,
            target: self,
            action: #selector(backView)
        )
    }
    
    @objc func backView() {
           self.navigationController?.popViewController(animated: true)
    }
    
    private func setupTableView() {
        
        detailTableView.delegate = self
        
        detailTableView.dataSource = self
        
        detailTableView.custom_registerCellWithNib(
            identifier: DetailScreenTableViewCell.identifier,
            bundle: nil
        )
        
        detailTableView.custom_registerHeaderWithNib(
            identifier: DetailScreenHeaderView.identifier,
            bundle: nil
        )
    }
    
    private func setupScrollView(scrollView: UIScrollView) {
        
        scrollView.isPagingEnabled = true
        
        scrollView.showsHorizontalScrollIndicator = false
        
        for imageString in detailInfoArray[index].filteredStringArray {
            
            let imageView = UIImageView()
            
            imageView.frame = CGRect(x: scrollView.frame.width * stringIndex,
                                     y: scrollView.frame.origin.y,
                                     width: scrollView.frame.width,
                                     height: scrollView.frame.height)
            
            stringIndex += 1
            
            imageView.loadImage(imageString)
            
            scrollView.addSubview(imageView)
        }
    }
}

    // MARK: - Table View Delegate & DataSource
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
            let cell = tableView.dequeueReusableCell(
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
    
    func tableView(
        _ tableView: UITableView,
        heightForHeaderInSection section: Int
    ) -> CGFloat {
           
        return 303.0 / 375 * UIScreen.width
    }
    
    func tableView(
        _ tableView: UITableView,
        viewForHeaderInSection section: Int
    ) -> UIView? {
        
        guard
            let headerView = tableView.dequeueReusableHeaderFooterView(
                withIdentifier: DetailScreenHeaderView.identifier
            ) as? DetailScreenHeaderView
        else {
            return nil
        }
        
        scrollView.frame = CGRect(x: headerView.frame.origin.x,
                                  y: headerView.frame.origin.y,
                                  width: headerView.frame.width / 375 * UIScreen.width,
                                  height: headerView.frame.height / 375 * UIScreen.width)
        
        scrollView.contentSize = CGSize(
            width: UIScreen.width * CGFloat(detailInfoArray[index].filteredStringArray.count),
            height: headerView.frame.height / 375 * UIScreen.width
        )
        
        if !scrollViewIsSet {
        
        setupScrollView(scrollView: scrollView)
            
        }
        
        scrollViewIsSet = true
        
        headerView.addSubview(scrollView)
    
        return headerView
    }
}
