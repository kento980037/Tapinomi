//
//  gacharesult.swift
//  tapioka
//
//  Created by kento_0037 on 2019/07/31.
//  Copyright © 2019 Kento Fujino. All rights reserved.
//

import SpriteKit

class Gacharesult: SKScene {
    let defaults = UserDefaults.standard
    let gameLabel = SKSpriteNode(imageNamed: "tapiokabottom2.png")//タピオカを飲むゲーム画面に移動するラベル
    let gachaLabel = SKSpriteNode(imageNamed: "gachabottom2.png")//ガチャ画面に移動するラベル
    let atackLabel = SKSpriteNode(imageNamed: "hanma-bottom2.png")//タピオカ叩きゲーム画面に移動するラベル
    let factoryLabel = SKSpriteNode(imageNamed: "factorybottom2.png")//タピオカ工場に移動するラベル
    let collectLabel = SKSpriteNode(imageNamed: "collectbottom2.png")//タピオカコレクション画面に移動するラベル
    let taPLabel = SKLabelNode(fontNamed: "Thonburi-Bold")//taPを表示するラベル
    let taPimage = SKSpriteNode(imageNamed: "Tap.png")//taPの画像
    
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
        
        let gameSKView = self.view as! TapiSKView
        let number = gameSKView.score // 得られたコレクションナンバー
        if number == 1 {
            //ミルクティーの説明
            let node = SKSpriteNode(imageNamed: "milktea.png")
            node.size = CGSize(width: node.size.width*2.0, height: node.size.height*2.0)
            node.position = CGPoint(x:375, y:900)
            addChild(node)
            let nodetell = SKSpriteNode(imageNamed: "milkteatell.png")
            nodetell.size = CGSize(width: nodetell.size.width*1.4, height: nodetell.size.height*1.4)
            nodetell.position = CGPoint(x:375, y:500)
            addChild(nodetell)
        }
        else if number == 2 {
            //チョコミルクの説明
            let node = SKSpriteNode(imageNamed: "chokomilk.png")
            node.size = CGSize(width: node.size.width*2.0, height: node.size.height*2.0)
            node.position = CGPoint(x:375, y:900)
            addChild(node)
            let nodetell = SKSpriteNode(imageNamed: "cyokomilktell.png")
            nodetell.size = CGSize(width: nodetell.size.width*1.4, height: nodetell.size.height*1.4)
            nodetell.position = CGPoint(x:375, y:500)
            addChild(nodetell)
            
        }
        else if number == 3 {
            //抹茶オレの説明
            let node = SKSpriteNode(imageNamed: "machaore.png")
            node.size = CGSize(width: node.size.width*2.0, height: node.size.height*2.0)
            node.position = CGPoint(x:375, y:900)
            addChild(node)
            let nodetell = SKSpriteNode(imageNamed: "machaoretell.png")
            nodetell.size = CGSize(width: nodetell.size.width*1.4, height: nodetell.size.height*1.4)
            nodetell.position = CGPoint(x:375, y:500)
            addChild(nodetell)
            
        }
        else if number == 4 {
            //ジャスmんティーの説明
            let node = SKSpriteNode(imageNamed: "jyasumintea.png")
            node.size = CGSize(width: node.size.width*2.0, height: node.size.height*2.0)
            node.position = CGPoint(x:375, y:900)
            addChild(node)
            let nodetell = SKSpriteNode(imageNamed: "jyasuminteatell.png")
            nodetell.size = CGSize(width: nodetell.size.width*1.4, height: nodetell.size.height*1.4)
            nodetell.position = CGPoint(x:375, y:500)
            addChild(nodetell)
            
        }
        else if number == 5 {
            //アイスティーの説明
            let node = SKSpriteNode(imageNamed: "icetea.png")
            node.size = CGSize(width: node.size.width*2.0, height: node.size.height*2.0)
            node.position = CGPoint(x:375, y:900)
            addChild(node)
            let nodetell = SKSpriteNode(imageNamed: "iceteatell.png")
            nodetell.size = CGSize(width: nodetell.size.width*1.4, height: nodetell.size.height*1.4)
            nodetell.position = CGPoint(x:375, y:500)
            addChild(nodetell)
            
        }
        else if number == 6 {
            //カルピスの説明
            let node = SKSpriteNode(imageNamed: "karupisu.png")
            node.size = CGSize(width: node.size.width*2.0, height: node.size.height*2.0)
            node.position = CGPoint(x:375, y:900)
            addChild(node)
            let nodetell = SKSpriteNode(imageNamed: "karupisutell.png")
            nodetell.size = CGSize(width: nodetell.size.width*1.4, height: nodetell.size.height*1.4)
            nodetell.position = CGPoint(x:375, y:500)
            addChild(nodetell)
            
        }
        else if number == 7 {
            //オレンjの説明
            let node = SKSpriteNode(imageNamed: "orenge.png")
            node.size = CGSize(width: node.size.width*2.0, height: node.size.height*2.0)
            node.position = CGPoint(x:375, y:900)
            addChild(node)
            let nodetell = SKSpriteNode(imageNamed: "orengetell.png")
            nodetell.size = CGSize(width: nodetell.size.width*1.4, height: nodetell.size.height*1.4)
            nodetell.position = CGPoint(x:375, y:500)
            addChild(nodetell)
            
        }
        else if number == 8 {
            //隊のタピオカの説明
            let node = SKSpriteNode(imageNamed: "taitapi.png")
            node.size = CGSize(width: node.size.width*2.0, height: node.size.height*2.0)
            node.position = CGPoint(x:375, y:900)
            addChild(node)
            let nodetell = SKSpriteNode(imageNamed: "taitapitell.png")
            nodetell.size = CGSize(width: nodetell.size.width*1.4, height: nodetell.size.height*1.4)
            nodetell.position = CGPoint(x:375, y:500)
            addChild(nodetell)
            
        }
        else if number == 9 {
            //タピオカがえるの説明
            let node = SKSpriteNode(imageNamed: "tapiokafrog.png")
            node.size = CGSize(width: node.size.width*2.0, height: node.size.height*2.0)
            node.position = CGPoint(x:375, y:900)
            addChild(node)
            let nodetell = SKSpriteNode(imageNamed: "tapiokafrogtell.png")
            nodetell.size = CGSize(width: nodetell.size.width*1.4, height: nodetell.size.height*1.4)
            nodetell.position = CGPoint(x:375, y:500)
            addChild(nodetell)
            
        }
        else if number == 10 {
            //キャビアの説明
            let node = SKSpriteNode(imageNamed: "kyabia.png")
            node.size = CGSize(width: node.size.width*2.0, height: node.size.height*2.0)
            node.position = CGPoint(x:375, y:900)
            addChild(node)
            let nodetell = SKSpriteNode(imageNamed: "kyabiatell.png")
            nodetell.size = CGSize(width: nodetell.size.width*1.4, height: nodetell.size.height*1.4)
            nodetell.position = CGPoint(x:375, y:500)
            addChild(nodetell)
            
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
            else {
                let skView = self.view as SKView?
                let scene = GachaScene(size: self.size)
                skView?.presentScene(scene)
            }
        }
    }
}

