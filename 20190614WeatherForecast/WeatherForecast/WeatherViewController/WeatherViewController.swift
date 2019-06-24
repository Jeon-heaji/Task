//
//  ViewController.swift
//  WeatherForecast
//
//  Created by giftbot on 11/06/2019.
//  Copyright © 2019 giftbot. All rights reserved.
//

import UIKit
import CoreLocation

class WeatherViewController: UIViewController, CLLocationManagerDelegate {
   
    private var weatherDatas: Weather?
    
    private var locationManager = CLLocationManager()
    private var today = ""
    private var currentTiem = ""
    
    var forecastArr = [ShortRangeForecast]()
    
    let tableView: UITableView = {
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        return tableView
    }()
    
    var imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
  
    let topView: CustomView = {
        let topView = CustomView(frame: .zero)
        topView.translatesAutoresizingMaskIntoConstraints = false
        return topView
    }()
    
    let blurView = UIVisualEffectView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //현재위치
        tableViewSet()
        locationSet()
        assignbackground()
//        view.addSubview(imageView)
//        self.view.sendSubviewToBack(imageView)
        autoLayout()
        registerTableViewCell()
        
        // configure ui visual effect
        
        blurView.effect = UIBlurEffect(style: .dark)
        blurView.alpha = 0
        blurView.frame = UIScreen.main.bounds
        imageView.addSubview(blurView)

    }
    
    private func tableViewSet() {
        tableView.backgroundColor = UIColor.clear
        tableView.dataSource = self
        tableView.delegate = self
        tableView.separatorInset = UIEdgeInsets.zero
    }

    private func assignbackground(){
        let ran = String(Int.random(in: 1...4))
        let background = UIImage(named: "weather\(ran)")
        
        imageView.frame = view.bounds
        imageView.contentMode =  UIView.ContentMode.scaleAspectFill
        imageView.clipsToBounds = true
        imageView.image = background
        imageView.center = view.center
        
//        print("weather\(ran)")
        
    }
    
    private func locationSet() {
        topView.delegate = self
        locationManager = CLLocationManager()
        locationManager.delegate = self
        locationManager.requestWhenInUseAuthorization()
        // 위치 업데이트
        locationManager.startUpdatingLocation()
        
        guard let coor = locationManager.location?.coordinate else {return}
        let latitude = coor.latitude
        let longitude = coor.longitude
        
        WeatherDataManager.shared.setCurrentWeather(lati: Float(latitude), longi: Float(longitude)){ (arg) in
            
            DispatchQueue.main.async {
                self.topView.currentTime.text = Date().toString()
                self.topView.cityLabel.text = arg.addr
                self.tableView.reloadData()
                
            }
        }
        WeatherDataManager.shared.setShortRangeForecast(lati: Float(latitude), longi: Float(longitude)) { (dataArr) in
            self.forecastArr = dataArr
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
    }
    
    private func registerTableViewCell() {
        
        tableView.register(UINib(nibName: "TitleWeatherCell", bundle: nil), forCellReuseIdentifier: "TitleWeatherCell")
        
        tableView.register(UINib(nibName: "SubTitleWeatherCell", bundle: nil), forCellReuseIdentifier: "SubTitleWeatherCell")
        
        tableView.register(CustomHeaderView.self, forHeaderFooterViewReuseIdentifier: "HeaderView")
    }
    private func addSubViews() {
        let views = [imageView, tableView, topView]
        views.forEach{ view.addSubview($0)}
    }

    private func autoLayout() {
        addSubViews()
        
        let guide = view!
        NSLayoutConstraint.activate([
            imageView.topAnchor.constraint(equalTo: guide.topAnchor),
            imageView.leadingAnchor.constraint(equalTo: guide.leadingAnchor),
            imageView.trailingAnchor.constraint(equalTo: guide.trailingAnchor),
            imageView.bottomAnchor.constraint(equalTo: guide.bottomAnchor),
            
            topView.topAnchor.constraint(equalTo: imageView.topAnchor, constant: 10),
            topView.leadingAnchor.constraint(equalTo: imageView.leadingAnchor),
            topView.trailingAnchor.constraint(equalTo: imageView.trailingAnchor),
            topView.heightAnchor.constraint(equalToConstant: 50),
            
            tableView.topAnchor.constraint(equalTo: topView.bottomAnchor, constant: -5),
            tableView.leadingAnchor.constraint(equalTo: imageView.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: imageView.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: imageView.bottomAnchor),
         
            ])
    }
}
extension WeatherViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1 + forecastArr.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        
        switch indexPath.row {
            case 0:
            let cell = tableView.dequeueReusableCell(withIdentifier: "TitleWeatherCell", for: indexPath) as! TitleWeatherCell
            cell.selectionStyle = .none
            // singleton 방법
            guard let tc = (WeatherDataManager.shared.hourlyDatas["tc"] as? String),
                let tmax = (WeatherDataManager.shared.hourlyDatas["tmax"] as? String),
                let tmin = (WeatherDataManager.shared.hourlyDatas["tmin"] as? String),
                let skyName = (WeatherDataManager.shared.hourlyDatas["name"] as? String),
                let skyImage = (WeatherDataManager.shared.hourlyDatas["code"] as? String)
                else { return cell }
            // data
                cell.weatherLabel.text = skyName
                cell.tcLabel.text = tc.dropLast(1) + "º"
                cell.tMaxLabel.text = "⤒ " + tmax.dropLast(3) + "º"
                cell.tMinLabel.text = "⤓ " + tmin.dropLast(3) + "º"
                cell.titleImage.image = UIImage(named: "SKY_" + skyImage.dropFirst(5))
            return cell
 
        default:
            // complition 방법
            let cell = tableView.dequeueReusableCell(withIdentifier: "SubTitleWeatherCell", for: indexPath) as! SubTitleWeatherCell
            cell.selectionStyle = .none
            cell.todayLabel.text = "\(forecastArr[indexPath.row - 1].date.toDate())"
            cell.currentLabel.text = "\(forecastArr[indexPath.row - 1].date.time())"
            cell.titleImage.image = UIImage(named: "SKY_" + "\(forecastArr[indexPath.row - 1].skyCode.dropFirst(5))")
            cell.tcLabel.text = "\(forecastArr[indexPath.row - 1].temperature)"
            
            return cell
        }
        
        return cell
        
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let customHeaderView = tableView.dequeueReusableHeaderFooterView(withIdentifier: "HeaderView") as! CustomHeaderView
        return customHeaderView
    }
    
}
extension WeatherViewController: UITableViewDelegate {

    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return view.frame.height * 0.6
    }
    // background -> alpha
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let alpha = scrollView.contentOffset.y / 180
//        print(alpha)
        if alpha < 0.5 {
            blurView.alpha = alpha
        }
        
    }
}
extension WeatherViewController: CustomViewDelegate {
    func backgroundChange(reloadButton button: UIButton) {
        
        print("111111")
        locationSet()
        assignbackground()
//
    }
}
