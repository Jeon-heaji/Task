//
//  CodeSpotInfoViewController.swift
//  VacationSpots
//
//  Created by Jeon-heaji on 29/05/2019.
//  Copyright © 2019 Jawwad Ahmad. All rights reserved.
//

import UIKit
import SafariServices

class CodeSpotInfoViewController: UIViewController {
    var vacationSpot: VacationSpot!

    let scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        return scrollView
    }()
    
    let whyVist: UILabel = {
        let label = UILabel()
        label.text = "WHY VISIT"
        label.font = UIFont.systemFont(ofSize: 18, weight: .semibold)
        label.textColor = .gray
        return label
    }()
    
    let whyVistLabel: UILabel = {
        let label = UILabel()
        label.text = "Why Vist Label"
        label.textColor = .gray
        return label
    }()
    
    let whatToSee: UILabel = {
        let label = UILabel()
        label.text = "WHAT TO SEE"
        label.font = UIFont.systemFont(ofSize: 18, weight: .semibold)
        label.textColor = .gray
        return label
    }()
    let whatToSeeLabel: UILabel = {
        let label = UILabel()
        label.text = "What To See Label"
        label.textColor = .gray
        return label
    }()
    
    let weather: UILabel = {
        let label = UILabel()
        label.text = "WEATHER"
        label.textColor = .gray
        label.font = UIFont.systemFont(ofSize: 18, weight: .semibold)
        return label
    }()
    
    let weatherInfo: UILabel = {
        let label = UILabel()
        label.text = "Weather Info"
        label.textColor = .gray
        return label
    }()
    let hideButton: UIButton = {
        let hideButton = UIButton(type: .system)
        hideButton.translatesAutoresizingMaskIntoConstraints = false
        hideButton.setTitle("Hide", for: .normal)
        hideButton.addTarget(self, action: #selector(hideButtonDidTap(_:)), for: .touchUpInside)
        return hideButton
    }()
    let ratingLabel: UILabel = {
        let label = UILabel()
        label.text = "RATING"
        label.textColor = .gray
        label.font = UIFont.systemFont(ofSize: 18, weight: .semibold)
        return label
    }()
    let userRatingLabel: UILabel = {
        let label = UILabel()
        label.text = "★★★✩✩"
        label.textColor = .gray
        return label
    }()
    
    // button
    let submitRatingButton: UIButton = {
        let button = UIButton(type: .system)
        button.addTarget(self, action: #selector(submitRatingBtnDidTap(_:)), for: .touchUpInside)
        button.setTitle("Submit Rating", for: .normal)
        return button
    }()
    
    let viewMapButton: UIButton = {
        let button = UIButton(type: .system)
        button.addTarget(self, action: #selector(viewMapBtnDidTap(_:)) , for: .touchUpInside)
        button.setTitle("View Map", for: .normal)
        return button
    }()
    let wikipediaButton: UIButton = {
        let button = UIButton(type: .system)
        button.addTarget(self, action: #selector(wikipediaBtnDidTap(_:)) , for: .touchUpInside)
        button.setTitle("Wikipedia", for: .normal)
        return button
    }()
    var buttonState = false {
        willSet {
            //newValue -> 바뀐 값
            if newValue {
                hideButton.setTitle("Show", for: .normal)
                weatherInfo.text = ""
                
            } else {
                hideButton.setTitle("Hide", for: .normal)
                weatherInfo.text = vacationSpot.weatherInfo
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(scrollView)
        view.addSubview(hideButton)
        stackViewConfigure()
        // text
        whyVistLabel.text = vacationSpot.whyVisit
        whyVistLabel.numberOfLines = 0
        whatToSeeLabel.text = vacationSpot.whatToSee
        whatToSeeLabel.numberOfLines = 0
        weatherInfo.text = vacationSpot.weatherInfo
        weatherInfo.numberOfLines = 0

    }
    
    func stackViewConfigure() {
        
        let visitStackView = UIStackView(arrangedSubviews: [whyVist, whyVistLabel])
        // stackView의 중요한 속성
        visitStackView.axis = .vertical
        visitStackView.alignment = .fill
        visitStackView.distribution = .fill
        visitStackView.spacing = 20

        let seeStackView = UIStackView(arrangedSubviews: [whatToSee, whatToSeeLabel])
        seeStackView.axis = .vertical
        seeStackView.alignment = .fill
        seeStackView.distribution = .fill
        seeStackView.spacing = 20
        
        let weatherStackView = UIStackView(arrangedSubviews: [weather, weatherInfo])
        weatherStackView.axis = .vertical
        weatherStackView.alignment = .leading
        weatherStackView.distribution = .fill
        weatherStackView.spacing = 0
        
        let ratingStackView = UIStackView(arrangedSubviews: [ratingLabel, userRatingLabel])
        ratingStackView.axis = .horizontal
        ratingStackView.alignment = .fill
        ratingStackView.distribution = .fillEqually
        ratingStackView.spacing = 8
        
        let buttonStackView = UIStackView(arrangedSubviews: [submitRatingButton, viewMapButton, wikipediaButton])
        buttonStackView.axis = .horizontal
        buttonStackView.alignment = .fill
        buttonStackView.distribution = .equalSpacing
        buttonStackView.spacing = 0
        
        let containerStackView = UIStackView(arrangedSubviews: [visitStackView, seeStackView, weatherStackView, ratingStackView, buttonStackView])
        containerStackView.translatesAutoresizingMaskIntoConstraints = false
        containerStackView.axis = .vertical
        containerStackView.alignment = .fill
        containerStackView.distribution = .fill
        containerStackView.spacing = 20
        
        scrollView.addSubview(containerStackView)
        
        let guide = view.safeAreaLayoutGuide
        NSLayoutConstraint.activate([
            scrollView.topAnchor.constraint(equalTo: guide.topAnchor),
            scrollView.leadingAnchor.constraint(equalTo: guide.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: guide.trailingAnchor),
            scrollView.bottomAnchor.constraint(equalTo: guide.bottomAnchor),
            
            containerStackView.topAnchor.constraint(equalTo: scrollView.topAnchor),
            containerStackView.leadingAnchor.constraint(equalTo: guide.leadingAnchor),
            containerStackView.trailingAnchor.constraint(equalTo: guide.trailingAnchor),
            containerStackView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
            
            hideButton.leadingAnchor.constraint(equalTo:weather.trailingAnchor, constant: 8),
            hideButton.firstBaselineAnchor.constraint(equalTo: weather.firstBaselineAnchor),
            
            ])
        
    }
    
    @objc func hideButtonDidTap(_ sender: UIButton) {
        buttonState.toggle()
        
    }
    @objc func submitRatingBtnDidTap(_ sender: UIButton) {//전해지 바보
    
    }
    @objc func viewMapBtnDidTap(_ sender: UIButton) {
        
    }
    @objc func wikipediaBtnDidTap(_ sender: UIButton) {
        let safariVC = SFSafariViewController(url: vacationSpot.wikipediaURL as URL)
        safariVC.delegate = self
        present(safariVC, animated: true, completion: nil)
    }
    
}

// MARK: - SFSafariViewControllerDelegate

extension CodeSpotInfoViewController: SFSafariViewControllerDelegate {
    func safariViewControllerDidFinish(_ controller: SFSafariViewController) {
        controller.dismiss(animated: true, completion: nil)
    }
}
