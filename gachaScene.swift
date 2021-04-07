//
//  gachaScene.swift
//  tapioka
//
//  Created by kento_0037 on 2019/07/27.
//  Copyright © 2019 Kento Fujino. All rights reserved.
//

import SpriteKit

class GachaScene: SKScene {
    let defaults = UserDefaults.standard
    
    let gacharuLabel = SKSpriteNode(imageNamed: "gacharu.png")//ガチャるボタン
    let gameLabel = SKSpriteNode(imageNamed: "tapiokabottom2.png")//タピオカを飲むゲーム画面に移動するラベル
    let gachaLabel = SKSpriteNode(imageNamed: "gachabottom2.png")//ガチャ画面に移動するラベル
    let atackLabel = SKSpriteNode(imageNamed: "hanma-bottom2.png")//タピオカ叩きゲーム画面に移動するラベル
    let factoryLabel = SKSpriteNode(imageNamed: "factorybottom2.png")//タピオカ工場に移動するラベル
    let collectLabel = SKSpriteNode(imageNamed: "collectbottom2.png")//タピオカコレクション画面に移動するラベル
    let taPLabel = SKLabelNode(fontNamed: "Thonburi-Bold")//taPを表示するラベル
    let taPimage = SKSpriteNode(imageNamed: "Tap.png")//taPの画像
    let error = SKLabelNode(fontNamed: "Thonburi-Bold")
    let tell = SKLabelNode(fontNamed: "Thonburi-Bold")

    
    override func didMove(to view: SKView) {
        self.backgroundColor = SKColor(red: 0.96, green: 0.89, blue: 0.70, alpha: 1.0)
        
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
        
        let P = defaults.integer(forKey: "taP")
        taPLabel.text = ":\(P)"
        taPLabel.fontSize = 20
        taPLabel.fontColor = SKColor.black
        taPLabel.position = CGPoint(x:110, y:1140)
        self.addChild(taPLabel)
        taPimage.position = CGPoint(x:50, y:1150)
        self.addChild(taPimage)
        
        gacharuLabel.position = CGPoint(x:375, y:650)
        gacharuLabel.size = CGSize(width: gacharuLabel.size.width*0.6, height: gacharuLabel.size.height*0.6)
        self.addChild(gacharuLabel)
        
        error.text = ""
        error.fontSize = 40
        error.fontColor = SKColor.brown
        error.position = CGPoint(x:375, y:300)
        addChild(error)
        
        tell.text = "ガチャをするには100タP必要です"
        tell.fontSize = 40
        tell.fontColor = SKColor.brown
        tell.position = CGPoint(x:375, y:400)
        addChild(tell)
    }
    
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        for touch: AnyObject in touches {
            let location = touch.location(in:self)
            let touchNode = self.atPoint(location)
            
            if touchNode == gameLabel {
                let skView = self.view as SKView?
                let scene = GameScene(size: self.size)
                skView?.presentScene(scene)
            }
            
            if touchNode == gachaLabel {
                let skView = self.view as SKView?
                let scene = GachaScene(size: self.size)
                skView?.presentScene(scene)
            }
            
            if touchNode == atackLabel {
                let skView = self.view as SKView?
                let scene = AtackScene(size: self.size)
                skView?.presentScene(scene)
            }
            
            if touchNode == factoryLabel {
                let skView = self.view as SKView?
                let scene = FactoryScene(size: self.size)
                skView?.presentScene(scene)
            }
            
            if touchNode == collectLabel {
                let skView = self.view as SKView?
                let scene = CollectScene(size: self.size)
                skView?.presentScene(scene)
            }
            
            var taP = defaults.integer(forKey: "taP")
            var score = 0
            if touchNode == gacharuLabel {
                if taP >= 100 {
                    taP = taP - 100
                    let random = Int(arc4random_uniform(100))+1
                    if random >= 1 && random <= 18 {//レア度１
                        defaults.set(1, forKey: "collect1")
                        score = 1
                    }
                    else if random >= 19 && random <= 36 {
                         defaults.set(1, forKey: "collect2")
                        score = 2
                    }
                    else if random >= 37 && random <= 53 {
                        defaults.set(1, forKey: "collect3")
                        score = 3
                    }
                    else if random >= 54 && random <= 63 {//レア度2
                        defaults.set(1, forKey: "collect4")
                        score = 4
                    }
                    else if random >= 64 && random <= 73 {
                        defaults.set(1, forKey: "collect5")
                        score = 5
                    }
                    else if random >= 74 && random <= 83 {
                        defaults.set(1, forKey: "collect6")
                        score = 6
                    }
                    else if random >= 84 && random <= 93 {
                        defaults.set(1, forKey: "collect7")
                        score = 7
                    }
                    else if random >= 94 && random <= 98 {//レア度３
                        defaults.set(1, forKey: "collect8")
                        score = 8
                    }
                    else if random >= 99 && random <= 99 {//レア度4
                        defaults.set(1, forKey: "collect9")
                        score = 9
                    }
                    else if random >= 100 && random <= 100 {
                        defaults.set(1, forKey: "collect10")
                        score = 10
                    }
                    defaults.set(taP, forKey: "taP")
                    defaults.synchronize()
                    let skView = self.view as! TapiSKView?
                    skView?.score = score
                    let scene = Gachaanime(size: self.size)
                    skView?.presentScene(scene)
                }
                else {
                    //買えないよ
                    error.text = "タPが足りません！"
                }
            }
        }
    }
}

