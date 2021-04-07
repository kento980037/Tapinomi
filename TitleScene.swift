//
//  TitleScene.swift
//  tapioka
//
//  Created by kento_0037 on 2019/07/27.
//  Copyright © 2019 Kento Fujino. All rights reserved.
//

import SpriteKit

class TitleScene :SKScene {//タイトル画面
    let defaults = UserDefaults.standard
    
    let titleLabel = SKLabelNode(fontNamed: "MarkerFelt-Thin")//タイトルラベル
    let gameLabel = SKSpriteNode(imageNamed: "tapiokabottom2.png")//タピオカを飲むゲーム画面に移動するラベル
    let gachaLabel = SKSpriteNode(imageNamed: "gachabottom2.png")//ガチャ画面に移動するラベル
    let atackLabel = SKSpriteNode(imageNamed: "hanma-bottom2.png")//タピオカ叩きゲーム画面に移動するラベル
    let factoryLabel = SKSpriteNode(imageNamed: "factorybottom2.png")//タピオカ工場に移動するラベル
    let collectLabel = SKSpriteNode(imageNamed: "collectbottom2.png")//タピオカコレクション画面に移動するラベル
    let taPLabel = SKLabelNode(fontNamed: "berdana-bold")//taPを表示するラベル
    
    let tapioka = SKSpriteNode(imageNamed: "tapioka.png")
    
    let background = SKSpriteNode(imageNamed: "title.png")
    
    
    override func didMove(to view: SKView) {
        self.backgroundColor = SKColor(red: 0.96, green: 0.89, blue: 0.70, alpha: 1.0)
        
        background.position = CGPoint(x:375, y:667)
        self.addChild(background)
        
        titleLabel.text = "タピのみ"
        titleLabel.fontSize = 70
        titleLabel.fontColor = SKColor.black
        titleLabel.position = CGPoint(x:375, y:1000)
        
        gameLabel.size = CGSize(width: gameLabel.size.width*0.9, height: gameLabel.size.height*0.9)
        gameLabel.position = CGPoint(x:112, y:75)
        
        gachaLabel.size = CGSize(width: gachaLabel.size.width*0.9, height: gachaLabel.size.height*0.9)
        gachaLabel.position = CGPoint(x:247, y:75)
        
        atackLabel.size = CGSize(width: atackLabel.size.width*0.9, height: atackLabel.size.height*0.9)
        atackLabel.position = CGPoint(x:382, y:75)
        
        factoryLabel.size = CGSize(width: factoryLabel.size.width*0.9, height: factoryLabel.size.height*0.9)
        factoryLabel.position = CGPoint(x:517, y:75)
        
        collectLabel.size = CGSize(width: collectLabel.size.width*0.9, height: collectLabel.size.height*0.9)
        collectLabel.position = CGPoint(x:652, y:75)
        
        tapioka.position = CGPoint(x:375, y:1300)
        
        let P = defaults.integer(forKey: "taP")
        taPLabel.text = "タP:\(P)"
        taPLabel.fontSize = 20
        taPLabel.fontColor = SKColor.black
        taPLabel.position = CGPoint(x:100, y:1100)
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
                let scene = GameScene(size: self.size)
                skView?.presentScene(scene)
            }
        }
    }
    
}
