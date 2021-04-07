//
//  GameViewController.swift
//  tapioka
//
//  Created by kento_0037 on 2019/07/27.
//  Copyright © 2019 Kento Fujino. All rights reserved.
//

import UIKit
import SpriteKit
import GoogleMobileAds



class GameViewController: UIViewController {

    
    let defaults = UserDefaults.standard

    override func viewDidLoad() {
       GADMobileAds.sharedInstance().start(completionHandler: nil)
       let bannerView = GADBannerView(adSize: kGADAdSizeBanner)
        addBannerViewToView(bannerView)
        bannerView.adUnitID = "ca-app-pub-6728109686065287/6402536910"
        //bannerView.adUnitID = "ca-app-pub-3940256099942544/6300978111"//テスト用
        bannerView.rootViewController = self
        bannerView.load(GADRequest())
        
        if let skView = self.view as! SKView? {
            let scene = TitleScene(size: CGSize(width:750, height:1334))
                // Set the scale mode to scale to fit the window
                scene.scaleMode = .aspectFit
                // Present the scene
                skView.presentScene(scene)
        }
       
        defaults.register(defaults: [
            "taP": 300,
            "first": 0,
            "tapiokaMax":30,
            "tapiokaMaxMax":30,
            "time":Date(),//最後に記録した日時
            "taPget":1,//１つのタピオカから得られるタP
            "tapiokamaketime":300, //タピオカ１個を作る時間
            "factorytapitime":1,//タピオカを生産する時間のや短縮
            "factorytaPget":1,//１個のタピオカから得られるタPを増やす
            "factorytapicup":1,//タピオカのカップを増量
            "collect1":0,//ミルクティー
            "collect2":0,//チョコミルク
            "collect3":0,//抹茶オレ
            "collect4":0,//ジャスミンティー
            "collect5":0,//アイスティー
            "collect6":0,//カルピス
            "collect7":0,//オレンジ
            "collect8":0,//タイティー
            "collect9":0,//タピオカがえる
            "collect10":0,//キャビア
            "attackrate":1//タピオカ叩きのレート
            ])
        timerUpdate()
        Timer.scheduledTimer(withTimeInterval: 1, repeats: true, block: {(myTimer) in self.timerUpdate()})

    }
    
   func addBannerViewToView(_ bannerView: GADBannerView) {
        bannerView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(bannerView)
    if #available(iOS 11.0, *) {
        positionBannerAtBottomOfSafeArea(bannerView)
    }
    else {
        positionBannerAtBottomOfView(bannerView)
    }

    }
    
    @available (iOS 11, *)
    func positionBannerAtBottomOfSafeArea(_ bannerView: UIView) {
        // Position the banner. Stick it to the bottom of the Safe Area.
        // Centered horizontally.
        let guide: UILayoutGuide = view.safeAreaLayoutGuide
        
        NSLayoutConstraint.activate(
            [bannerView.centerXAnchor.constraint(equalTo: guide.centerXAnchor),//x座標軸お中心
             bannerView.topAnchor.constraint(equalTo: guide.topAnchor)]//上端
        )
    }
    
    func positionBannerAtBottomOfView(_ bannerView: UIView) {
        // Center the banner horizontally.
        view.addConstraint(NSLayoutConstraint(item: bannerView,
                                              attribute: .centerX,
                                              relatedBy: .equal,
                                              toItem: view,
                                              attribute: .centerX,
                                              multiplier: 1,
                                              constant: 0))
        // Lock the banner to the top of the bottom layout guide.
        view.addConstraint(NSLayoutConstraint(item: bannerView,
                                              attribute: .bottom,
                                              relatedBy: .equal,
                                              toItem: self.topLayoutGuide,
                                              attribute: .top,
                                              multiplier: 1,
                                              constant: 0))
    }

    
    func timerUpdate() {
        let timeMoved = Date()
        var timeFixed = defaults.object(forKey: "time") as! Date
        let calendar = Calendar.current
        var diff:DateComponents = calendar.dateComponents([.second], from: timeFixed, to: timeMoved)
        let tapimaketime = defaults.integer(forKey: "tapiokamaketime")
        let tapiMaxMax = defaults.integer(forKey: "tapiokaMaxMax")
        var tapiMax = defaults.integer(forKey: "tapiokaMax")
        if diff.second! >= tapimaketime && tapiMax <= tapiMaxMax {
            tapiMax = tapiMax + diff.second! / tapimaketime
            if tapiMax > tapiMaxMax {
                tapiMax = tapiMaxMax
            }
            timeFixed = Date()
            defaults.set(tapiMax, forKey: "tapiokaMax")
            defaults.set(timeFixed, forKey: "time")
            defaults.synchronize()
        }
    }

}

