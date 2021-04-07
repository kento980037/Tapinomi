//
//  atackScene.swift
//  tapioka
//
//  Created by kento_0037 on 2019/07/27.
//  Copyright © 2019 Kento Fujino. All rights reserved.
//

import SpriteKit

class AtackScene: SKScene {
    let defaults = UserDefaults.standard
    
    let titleLabel = SKLabelNode(fontNamed: "Thonburi-Bold")//タイトルラベル
    let startLabel = SKSpriteNode(imageNamed: "srart.png")//スタートラベル
    let howtoLabel = SKSpriteNode(imageNamed: "tatakitell2.png")//遊べ方ラベル
    let errorLabel = SKLabelNode(fontNamed: "Thonburi-Bold")//taPが足りない時に表示するラベル
    
    let taPLabel = SKLabelNode(fontNamed: "Thonburi-Bold")//taPを表示するラベル
    let taPimage = SKSpriteNode(imageNamed: "Tap.png")//taPの画像
    
    let gameLabel = SKSpriteNode(imageNamed: "tapiokabottom2.png")//タピオカを飲むゲーム画面に移動するラベル
    let gachaLabel = SKSpriteNode(imageNamed: "gachabottom2.png")//ガチャ画面に移動するラベル
    let atackLabel = SKSpriteNode(imageNamed: "hanma-bottom2.png")//タピオカ叩きゲーム画面に移動するラベル
    let factoryLabel = SKSpriteNode(imageNamed: "factorybottom2.png")//タピオカ工場に移動するラベル
    let collectLabel = SKSpriteNode(imageNamed: "collectbottom2.png")//タピオカコレクション画面に移動するラベル
    
    let needLabel = SKLabelNode(fontNamed: "Thonburi-Bold")//必要なタPを表示するラベル
    let getLabel = SKLabelNode(fontNamed: "Thonburi-Bold")//１つのタピオカをつぶすとゲットできるタpを表示するラベル
    
    override func didMove(to view: SKView) {
        
        self.backgroundColor = SKColor(red: 0.96, green: 0.89, blue: 0.70, alpha: 1.0)
        
        titleLabel.text = "タピオカたたき"
        titleLabel.fontSize = 70
        titleLabel.fontColor = SKColor.black
        titleLabel.position = CGPoint(x:375, y:1000)
        
        startLabel.position = CGPoint(x:375, y:375)
        startLabel.size = CGSize(width: startLabel.size.width*0.5, height: startLabel.size.height*0.5)
        self.addChild(startLabel)
        
        howtoLabel.size = CGSize(width: howtoLabel.size.width*1.2, height: howtoLabel.size.height*1.2)
        howtoLabel.position = CGPoint(x:375, y:750)
        self.addChild(howtoLabel)
        
        errorLabel.text = ""
        errorLabel.fontSize = 40
        errorLabel.fontColor = SKColor.brown
        errorLabel.position = CGPoint(x:375, y:200)
        self.addChild(errorLabel)
        
        let P = defaults.integer(forKey: "taP")
        taPLabel.text = ":\(P)"
        taPLabel.fontSize = 20
        taPLabel.fontColor = SKColor.black
        taPLabel.position = CGPoint(x:110, y:1140)
        self.addChild(taPLabel)
        taPimage.position = CGPoint(x:50, y:1150)
        self.addChild(taPimage)
        
        gameLabel.size = CGSize(width: gameLabel.size.width*0.9, height: gameLabel.size.height*0.9)
        gameLabel.position = CGPoint(x:112, y:75)
        self.addChild(gameLabel)
        
        gachaLabel.size = CGSize(width: gachaLabel.size.width*0.9, height: gachaLabel.size.height*0.9)
        gachaLabel.position = CGPoint(x:247, y:75)
        self.addChild(gachaLabel)
        
        atackLabel.size = CGSize(width: atackLabel.size.width*0.9, height: atackLabel.size.height*0.9)
        atackLabel.position = CGPoint(x:382, y:75)
        self.addChild(atackLabel)
        
        factoryLabel.size = CGSize(width: factoryLabel.size.width*0.9, height: factoryLabel.size.height*0.9)
        factoryLabel.position = CGPoint(x:517, y:75)
        self.addChild(factoryLabel)
        
        collectLabel.size = CGSize(width: collectLabel.size.width*0.9, height: collectLabel.size.height*0.9)
        collectLabel.position = CGPoint(x:652, y:75)
        self.addChild(collectLabel)
        
        let attackrate = defaults.integer(forKey: "attackrate")
        
        needLabel.text = "\(attackrate*100)"
        needLabel.fontSize = 30
        needLabel.fontColor = SKColor.brown
        needLabel.position = CGPoint(x:520, y:730)
        self.addChild(needLabel)
        
        getLabel.text = "\(attackrate*10)"
        getLabel.fontSize = 30
        getLabel.fontColor = SKColor.brown
        getLabel.position = CGPoint(x:520, y:620)
        self.addChild(getLabel)
        
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        var P = defaults.integer(forKey: "taP")
        let attackrate = defaults.integer(forKey: "attackrate")
        for touch: AnyObject in touches {
            let location = touch.location(in:self)
            let touchNode = self.atPoint(location)
            
            if touchNode == startLabel {
                if P >= 100*attackrate {
                    P = P - 100*attackrate
                    defaults.set(P, forKey: "taP")
                    defaults.synchronize()
                    let skView = self.view as SKView?
                    let scene = atackGameScene(size: self.size)
                    skView?.presentScene(scene)
                } else {
                    errorLabel.text = "タPが足りません！"
                }
            }
                
            else if touchNode == gameLabel {
                let skView = self.view as SKView?
                let scene = GameScene(size: self.size)
                skView?.presentScene(scene)
            }
            
            else if touchNode == gachaLabel {
                let skView = self.view as SKView?
                let scene = GachaScene(size: self.size)
                skView?.presentScene(scene)
            }
            
            else if touchNode == atackLabel {
                let skView = self.view as SKView?
                let scene = AtackScene(size: self.size)
                skView?.presentScene(scene)
            }
            
            else if touchNode == factoryLabel {
                let skView = self.view as SKView?
                let scene = FactoryScene(size: self.size)
                skView?.presentScene(scene)
            }
            
            else if touchNode == collectLabel {
                let skView = self.view as SKView?
                let scene = CollectScene(size: self.size)
                skView?.presentScene(scene)
            }
            
        }
    }
}

