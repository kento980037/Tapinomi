//
//  collectScene.swift
//  tapioka
//
//  Created by kento_0037 on 2019/07/27.
//  Copyright © 2019 Kento Fujino. All rights reserved.
//

import SpriteKit

class CollectScene: SKScene {
    let defaults = UserDefaults.standard
    let gameLabel = SKSpriteNode(imageNamed: "tapiokabottom2.png")//タピオカを飲むゲーム画面に移動するラベル
    let gachaLabel = SKSpriteNode(imageNamed: "gachabottom2.png")//ガチャ画面に移動するラベル
    let atackLabel = SKSpriteNode(imageNamed: "hanma-bottom2.png")//タピオカ叩きゲーム画面に移動するラベル
    let factoryLabel = SKSpriteNode(imageNamed: "factorybottom2.png")//タピオカ工場に移動するラベル
    let collectLabel = SKSpriteNode(imageNamed: "collectbottom2.png")//タピオカコレクション画面に移動するラベル
    let taPLabel = SKLabelNode(fontNamed: "Thonburi-Bold")//taPを表示するラベル
    let taPimage = SKSpriteNode(imageNamed: "Tap.png")//taPの画像
    
    let chokomilk = SKSpriteNode(imageNamed: "chokomilk.png")//チョコミルク
    let icetea = SKSpriteNode(imageNamed: "icetea.png")
    let jyasumintea = SKSpriteNode(imageNamed: "jyasumintea.png")
    let karupisu = SKSpriteNode(imageNamed: "karupisu.png")
    let kyabia = SKSpriteNode(imageNamed: "kyabia.png")
    let machaore = SKSpriteNode(imageNamed: "machaore.phg")
    let milktea = SKSpriteNode(imageNamed: "milktea.png")
    let orenge = SKSpriteNode(imageNamed: "orenge.png")
    let taitapi = SKSpriteNode(imageNamed: "taitapi.png")
    let tapiokafrog = SKSpriteNode(imageNamed: "tapiokafrog.png")
    let stage = SKSpriteNode(imageNamed: "collectstage.png")
    
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
        
        for i in 0...1 {
            for j in 0...2 {
                let stage = SKSpriteNode(imageNamed: "collectstage.png")
                stage.position = CGPoint(x:125 + j*250, y: 410 + i*400)
                addChild(stage)
            }
            for j in 0...1 {
                let stage = SKSpriteNode(imageNamed: "collectstage.png")
                stage.position = CGPoint(x:188 + j*374, y: 210 + i*400)
                addChild(stage)
            }
        }
        
        let P = defaults.integer(forKey: "taP")
        taPLabel.text = ":\(P)"
        taPLabel.fontSize = 20
        taPLabel.fontColor = SKColor.black
        taPLabel.position = CGPoint(x:110, y:1140)
        self.addChild(taPLabel)
        taPimage.position = CGPoint(x:50, y:1150)
        self.addChild(taPimage)
        
        chokomilk.position = CGPoint(x:375, y:900)
        let collect2 = defaults.integer(forKey: "collect2")
        if collect2 == 1{
            self.addChild(chokomilk)
        }
        
        icetea.position = CGPoint(x:562, y:700)
        let collect5 = defaults.integer(forKey: "collect5")
        if collect5 == 1{
            self.addChild(icetea)
        }
        
        jyasumintea.position = CGPoint(x:188, y:700)
        let collect4 = defaults.integer(forKey: "collect4")
        if collect4 == 1{
        self.addChild(jyasumintea)
        }
        
        karupisu.position = CGPoint(x:125, y:500)
        let collect6 = defaults.integer(forKey: "collect6")
        if collect6 == 1{
        self.addChild(karupisu)
        }
        
        kyabia.position = CGPoint(x:188, y:300)
        let collect10 = defaults.integer(forKey: "collect10")
        if collect10 == 1{
            self.addChild(kyabia)
            kyabia.size = CGSize(width: kyabia.size.width*1.4, height: kyabia.size.height*1.4)
        }
        
        machaore.position = CGPoint(x:625, y:900)
        let collect3 = defaults.integer(forKey: "collect3")
        if collect3 == 1{
            self.addChild(machaore)
        }
        
        milktea.position = CGPoint(x:125, y:900)
        let collect1 = defaults.integer(forKey: "collect1")
        if collect1 == 1{
            self.addChild(milktea)
        }
        orenge.position = CGPoint(x:375, y:500)
        let collect7 = defaults.integer(forKey: "collect7")
        if collect7 == 1{
            self.addChild(orenge)
        }
        
        taitapi.position = CGPoint(x:625, y:500)
        let collect8 = defaults.integer(forKey: "collect8")
        if collect8 == 1{
        self.addChild(taitapi)
        }
        
        tapiokafrog.position = CGPoint(x:562, y:300)
        let collect9 = defaults.integer(forKey: "collect9")
        if collect9 == 1{
        self.addChild(tapiokafrog)
        }
        
        
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
            
            
            else if touchNode == milktea {
                let scene = collecttell(size: self.size)
                let skView = self.view as! TapiSKView?
                skView?.score = 1
                skView?.presentScene(scene)
            }
            
            else if touchNode == chokomilk {
                let scene = collecttell(size: self.size)
                let skView = self.view as! TapiSKView?
                skView?.score = 2
                skView?.presentScene(scene)
            }
            
            else if touchNode == machaore {
                let scene = collecttell(size: self.size)
                let skView = self.view as! TapiSKView?
                skView?.score = 3
                skView?.presentScene(scene)
            }
            
            else if touchNode == jyasumintea {
                let scene = collecttell(size: self.size)
                let skView = self.view as! TapiSKView?
                skView?.score = 4
                skView?.presentScene(scene)
            }
            
            else if touchNode == icetea {
                let scene = collecttell(size: self.size)
                let skView = self.view as! TapiSKView?
                skView?.score = 5
                skView?.presentScene(scene)
            }
            
            else if touchNode == karupisu {
                let scene = collecttell(size: self.size)
                let skView = self.view as! TapiSKView?
                skView?.score = 6
                skView?.presentScene(scene)
            }
            
            else if touchNode == orenge {
                let scene = collecttell(size: self.size)
                let skView = self.view as! TapiSKView?
                skView?.score = 7
                skView?.presentScene(scene)
            }
            
            else if touchNode == taitapi {
                let scene = collecttell(size: self.size)
                let skView = self.view as! TapiSKView?
                skView?.score = 8
                skView?.presentScene(scene)
            }
            
            else if touchNode == tapiokafrog {
                let scene = collecttell(size: self.size)
                let skView = self.view as! TapiSKView?
                skView?.score = 9
                skView?.presentScene(scene)
            }
            
            else if touchNode == kyabia {
                let scene = collecttell(size: self.size)
                let skView = self.view as! TapiSKView?
                skView?.score = 10
                skView?.presentScene(scene)
            }
        }
    }
}

