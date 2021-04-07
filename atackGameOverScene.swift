//
//  atackGameOverScene.swift
//  tapioka
//
//  Created by kento_0037 on 2019/07/27.
//  Copyright © 2019 Kento Fujino. All rights reserved.
//


import SpriteKit

class atackGameOverScene: SKScene {
    let defaults = UserDefaults.standard
    let endLabel = SKLabelNode(fontNamed: "Thonburi-Bold")
    let replayLabel = SKLabelNode(fontNamed: "Thonburi-Bold")
    
    let gameLabel = SKSpriteNode(imageNamed: "tapiokabottom2.png")//タピオカを飲むゲーム画面に移動するラベル
    let gachaLabel = SKSpriteNode(imageNamed: "gachabottom2.png")//ガチャ画面に移動するラベル
    let atackLabel = SKSpriteNode(imageNamed: "hanma-bottom2.png")//タピオカ叩きゲーム画面に移動するラベル
    let factoryLabel = SKSpriteNode(imageNamed: "factorybottom2.png")//タピオカ工場に移動するラベル
    let collectLabel = SKSpriteNode(imageNamed: "collectbottom2.png")//タピオカコレクション画面に移動するラベル
    
    let taPLabel = SKLabelNode(fontNamed: "Thonburi-Bold")//taPを表示するラベル
    let taPimage = SKSpriteNode(imageNamed: "Tap.png")//taPの画像
    let commentLabel = SKLabelNode(fontNamed: "Thonburi-Bold")//コメントするラベル
    
    override func didMove(to view: SKView) {
        self.backgroundColor = SKColor(red: 0.96, green: 0.89, blue: 0.70, alpha: 1.0)
        
        endLabel.text = "タイムアップ"
        endLabel.fontSize = 100
        endLabel.fontColor = UIColor.brown
        endLabel.position = CGPoint(x:375, y:900)
        self.addChild(endLabel)
        
        replayLabel.text = "もどる"
        replayLabel.fontSize = 60
        replayLabel.position = CGPoint(x:375, y:300)
        replayLabel.fontColor = UIColor.black
        self.addChild(replayLabel)
        
        commentLabel.text = ""
        commentLabel.fontSize = 30
        commentLabel.position = CGPoint(x:375, y:600)
        commentLabel.fontColor = UIColor.black
        self.addChild(commentLabel)
        
        let scoreLabel = SKLabelNode(fontNamed: "Thonburi-Bold")
        let gameSKView = self.view as! TapiSKView
        scoreLabel.text = "つぶした数:\(gameSKView.score)"
        scoreLabel.fontSize = 40
        scoreLabel.position = CGPoint(x:375, y:700)
        scoreLabel.fontColor = UIColor.black
        self.addChild(scoreLabel)
        var P = defaults.integer(forKey: "taP")
        let attackrate = defaults.integer(forKey: "attackrate")
        P = P + gameSKView.score*10*attackrate
        defaults.set(P, forKey: "taP")
        defaults.synchronize()
        if gameSKView.score > 10 {
            commentLabel.text = "おめでとうございます。タPが増えました！"
        }
        else if gameSKView.score == 10 {
            commentLabel.text = ""
        }
        else {
            commentLabel.text = "残念！タPが減りました。。。"
        }
        
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
        
        taPLabel.text = ":\(P)"
        taPLabel.fontSize = 20
        taPLabel.fontColor = SKColor.black
        taPLabel.position = CGPoint(x:110, y:1140)
        self.addChild(taPLabel)
        taPimage.position = CGPoint(x:50, y:1150)
        self.addChild(taPimage)
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        for touch: AnyObject in touches {
            let location = touch.location(in: self)
            let touchNode = self.atPoint(location)
            if touchNode == replayLabel {
                let scene = AtackScene(size: self.size)
                let skView = self.view as SKView?
                skView?.presentScene(scene)
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
            else {
            }
        }
    }
}


