//
//  ViewController.swift
//  navbar-toggler
//
//  Created by dada on 2021/7/23.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var tableView: UITableView!
    var isLoaded:Bool = false
    var navBarBottomHeight: CGFloat = 120
    var navBarTopHeight: CGFloat = 250
    var limit: Int = 20
    var offset: Int = 0
    var totalCount: Int = 0
    var dataList: [DataTaipeiResultsModel] = []
    lazy var navbarBottomView: UIView = {
        let view = UIView()
        view.backgroundColor = .systemGreen
        view.frame = CGRect( x: 0,
                           y: 0,
                           width: self.view.frame.width,
                           height: self.navBarBottomHeight)
        let label = UILabel(frame: view.frame)
        label.text = "臺北市立動物園_植物資料"
        label.textColor = .white
        label.textAlignment = .center
        label.font = FontStyle.sharedInstance.getFontSize22Blod()
        view.addSubview(label)
        return view
    }()
    lazy var navbarTopView: UIView = {
        let view = UIView()
        view.backgroundColor = .systemBlue
        view.frame = CGRect( x: 0,
                           y: 0,
                           width: self.view.frame.width,
               height: self.navBarTopHeight)
        let label = UILabel(frame: view.frame)
        label.text = "臺北市立動物園_植物資料"
        label.textColor = .white
        label.textAlignment = .center
        label.font = FontStyle.sharedInstance.getFontSize22Blod()
        view.addSubview(label)
        return view
    }()
    var activityIndicator: UIActivityIndicatorView!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.activityIndicator = UIActivityIndicatorView(activityIndicatorStyle: .large, color: .gray,  placeInTheCenterOf: view)
        setupData(limit: self.limit, offset: self.offset)
        view.addSubview(navbarBottomView)
        view.addSubview(navbarTopView)
        let TableViewCellNib = UINib(nibName: "TableViewCell", bundle: nil)
        tableView.register(TableViewCellNib, forCellReuseIdentifier: "tableViewCell")
        let LoaderNib = UINib(nibName: "LoaderCell", bundle: nil)
        tableView.register(LoaderNib, forCellReuseIdentifier: "loaderCell")
        tableView.contentInset = UIEdgeInsets(top: self.navBarTopHeight, left: 0, bottom: 0, right: 0)
        tableView.dataSource = self
        tableView.delegate = self
        tableView.reloadData()
        self.navigationController?.navigationBar.isHidden = true
    }


}

extension ViewController:UITableViewDataSource, UITableViewDelegate{
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return 200
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0{
            return dataList.count
        }else if section == 1 && isLoaded{
            return 1
        }
        return 0
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.section == 0{
            let cell = tableView.dequeueReusableCell(withIdentifier: "tableViewCell", for: indexPath) as! TableViewCell
            cell.cellView.layer.borderWidth = 1
            cell.cellView.layer.borderColor = UIColor(red:222/255, green:225/255, blue:227/255, alpha: 1).cgColor
            let imgUrl = self.dataList[indexPath.row].F_Pic01_URL
            if imgUrl != ""{
                cell.imgView?.loadImageWithCache(withUrl: imgUrl)
            }else{
                cell.imageView?.image = UIImage(named: "no-pic")
            }
            cell.F_Name_Ch.textAlignment = .left
            cell.F_Name_Ch.text = self.dataList[indexPath.row].F_Name_Ch
            
            cell.F_Location.textAlignment = .left
            cell.F_Location.numberOfLines = 0
            cell.F_Location.sizeToFit()
            cell.F_Location.text = self.dataList[indexPath.row].F_Location
            
            cell.F_Feature.textAlignment = .left
            cell.F_Feature.numberOfLines = 0
            cell.F_Feature.sizeToFit()
            cell.F_Feature.text = self.dataList[indexPath.row].F_Feature
            return cell
        }else{
            let cell = tableView.dequeueReusableCell(withIdentifier: "loaderCell", for: indexPath) as! LoaderCell
            cell.loader.startAnimating()
            return cell
        }
        
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let y = self.navBarTopHeight - (scrollView.contentOffset.y + self.navBarTopHeight)
        let height = min(max(y, 120), 350)
        let alpha = height >= self.navBarTopHeight ? 1 : (y - 120)/self.navBarTopHeight
        navbarTopView.frame = CGRect(x: 0, y: 0, width: UIScreen.main.bounds.size.width, height: height)
        navbarTopView.alpha = alpha
        navbarBottomView.frame = CGRect(x: 0, y: 0, width: UIScreen.main.bounds.size.width, height: height)
        let OffsetY = scrollView.contentOffset.y
        let contentHeight = scrollView.contentSize.height
        if OffsetY > contentHeight - scrollView.frame.height{
            if !isLoaded{
                if self.totalCount/self.limit > self.offset {
                    LoadMore()
                }
            }
        }
    }
    
    func LoadMore() {
        isLoaded = true
        self.tableView.reloadSections(IndexSet(integer: 1), with: .none)
        DispatchQueue.main.asyncAfter(deadline: .now()+1.0, execute: {
            self.isLoaded = false
            self.offset += 1
            self.setupData(limit: self.limit, offset: self.offset)
        })
    }
    
    func setupData(limit: Int, offset: Int) {
        if offset == 0 {
            self.activityIndicator.start(parentView: self.view)
        }
        
        let url = "https://data.taipei/opendata/datalist/apiAccess?scope=resourceAquire&rid=f18de02f-b6c9-47c0-8cda-50efad621c14&limit=\(limit)&offset=\(offset)"
        self.request(urlString: url) { (result) in
             switch result {
             case .success(let data):
                 do {
                     let decodedData = try JSONDecoder().decode(DataTaipeiModel.self,
                                                             from: data)
                     DispatchQueue.main.async(execute: {
                        self.activityIndicator.stop(parentView: self.view)
                        self.totalCount = decodedData.result.count
                        for item in decodedData.result.results{
                            self.dataList.append(item)
                        }
                        self.tableView.reloadData()
                     })
                 } catch {
                     print("decode error")
                 }
             case .failure(let error):
                self.activityIndicator.stop(parentView: self.view)
                 print(error)
             }
         }
     }
    
}

