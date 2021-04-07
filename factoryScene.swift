//
//  factoryScene.swift
//  tapioka
//
//  Created by kento_0037 on 2019/07/27.
//  Copyright © 2019 Kento Fujino. All rights reserved.
//

import SpriteKit

class FactoryScene: SKScene {
    let defaults = UserDefaults.standard 
    
    let factoryTapitimeLabel = SKLabelNode(fontNamed: "Thonburi-Bold")//タピオカ生産時間短縮
    let factoryTapitimeBottom = SKSpriteNode(imageNamed: "lvupbottom.png")
    let factoryTaPgetLabel = SKLabelNode(fontNamed: "Thonburi-Bold")//タピオカから得られるタPをアップ
    let factoryTaPgetBottom = SKSpriteNode(imageNamed: "lvupbottom.png")//
    let factoryTapicupLabel = SKLabelNode(fontNamed: "Thonburi-Bold")//タピオカが最大入る個数アップ
    let factoryTapicupBottom = SKSpriteNode(imageNamed: "lvupbottom.png")//
    let factoryattackrateLabel = SKLabelNode(fontNamed: "Thonburi-Bold")//タピオカ潰しレーとアップ
    let factoryattackrateBottom = SKSpriteNode(imageNamed: "lvupbottom.png")//
    
    let factoryTapitime = SKSpriteNode(imageNamed: "factorytapitime.png")
    let factoryTaPget = SKSpriteNode(imageNamed: "factorytaPget.png")
    let factoryTapicup = SKSpriteNode(imageNamed: "factorytapicup.png")
    let factoryattackrate = SKSpriteNode(imageNamed: "factoryattackrate.png")
    
    let taPLabel = SKLabelNode(fontNamed: "Thonburi-Bold")//taPを表示するラベル
    let taPimage = SKSpriteNode(imageNamed: "Tap.png")//taPの画像
    let taPimage1 = SKSpriteNode(imageNamed: "Tap.png")//taPの画像
    let taPimage2 = SKSpriteNode(imageNamed: "Tap.png")//taPの画像
    let taPimage3 = SKSpriteNode(imageNamed: "Tap.png")//taPの画像
    let taPimage4 = SKSpriteNode(imageNamed: "Tap.png")//taPの画像
    
    let gameLabel = SKSpriteNode(imageNamed: "tapiokabottom2.png")//タピオカを飲むゲーム画面に移動するラベル
    let gachaLabel = SKSpriteNode(imageNamed: "gachabottom2.png")//ガチャ画面に移動するラベル
    let atackLabel = SKSpriteNode(imageNamed: "hanma-bottom2.png")//タピオカ叩きゲーム画面に移動するラベル
    let factoryLabel = SKSpriteNode(imageNamed: "factorybottom2.png")//タピオカ工場に移動するラベル
    let collectLabel = SKSpriteNode(imageNamed: "collectbottom2.png")//タピオカコレクション画面に移動するラベル
    
    override func didMove(to view: SKView) {
        self.backgroundColor = SKColor(red: 0.96, green: 0.89, blue: 0.70, alpha: 1.0)
        let tapitime = defaults.integer(forKey: "factorytapitime")
        let taPget = defaults.integer(forKey: "factorytaPget")
        let tapicup = defaults.integer(forKey: "factorytapicup")
        let attackrate = defaults.integer(forKey: "attackrate")
       
        //tapitime
        factoryTapitime.position = CGPoint(x:375, y:990)
        factoryTapitime.size = CGSize(width: factoryTapitime.size.width*1.2, height: factoryTapitime.size.height*0.9)
        self.addChild(factoryTapitime)

        factoryTapitimeBottom.position = CGPoint(x:590, y:990)
        factoryTapitimeBottom.size = CGSize(width: factoryTapitimeBottom.size.width*0.7, height: factoryTapitimeBottom.size.height*0.7)
        self.addChild(factoryTapitimeBottom)
        
        factoryTapitimeLabel.text = "Lv:\(tapitime)         :\(Int(48+pow(2.0,Double(tapitime))))"
        factoryTapitimeLabel.fontSize = 20
        factoryTapitimeLabel.fontColor = SKColor.brown
        factoryTapitimeLabel.position = CGPoint(x:375, y:910)
        self.addChild(factoryTapitimeLabel)
        
        taPimage1.position = CGPoint(x:375, y:920)
        taPimage1.size = CGSize(width: taPimage1.size.width*0.5, height: taPimage1.size.height*0.5)
        self.addChild(taPimage1)
        
        
        //taPget
        factoryTaPget.position = CGPoint(x:375, y:750)
        factoryTaPget.size = CGSize(width: factoryTaPget.size.width*1.2, height: factoryTaPget.size.height*0.9)
        self.addChild(factoryTaPget)

        factoryTaPgetBottom.position = CGPoint(x:590, y:750)
        factoryTaPgetBottom.size = CGSize(width: factoryTaPgetBottom.size.width*0.7, height: factoryTaPgetBottom.size.height*0.7)
        self.addChild(factoryTaPgetBottom)
        
        factoryTaPgetLabel.text = "Lv:\(taPget)           :\(Int(48+pow(2.0,Double(taPget))))"
        factoryTaPgetLabel.fontSize = 20
        factoryTaPgetLabel.fontColor = SKColor.brown
        factoryTaPgetLabel.position = CGPoint(x:375, y:670)
        self.addChild(factoryTaPgetLabel)
        
        taPimage2.position = CGPoint(x:375, y:680)
        taPimage2.size = CGSize(width: taPimage2.size.width*0.5, height: taPimage2.size.height*0.5)
        self.addChild(taPimage2)
        
        
        //tapicup
        factoryTapicup.position = CGPoint(x:375, y:510)
        factoryTapicup.size = CGSize(width: factoryTapicup.size.width*1.2, height: factoryTapicup.size.height*0.9)
        self.addChild(factoryTapicup)
        
        factoryTapicupBottom.position = CGPoint(x:590, y:510)
        factoryTapicupBottom.size = CGSize(width: factoryTapicupBottom.size.width*0.7, height: factoryTapicupBottom.size.height*0.7)
        self.addChild(factoryTapicupBottom)
        
        factoryTapicupLabel.text = "Lv:\(tapicup)         :\(Int(48+pow(2.0,Double(tapicup))))"
        factoryTapicupLabel.fontSize = 20
        factoryTapicupLabel.fontColor = SKColor.brown
        factoryTapicupLabel.position = CGPoint(x:375, y:430)
        self.addChild(factoryTapicupLabel)
        
        taPimage3.position = CGPoint(x:375, y:440)
        taPimage3.size = CGSize(width: taPimage3.size.width*0.5, height: taPimage3.size.height*0.5)
        self.addChild(taPimage3)
        
        
        //attackrate
        factoryattackrate.position = CGPoint(x:375, y:270)
        factoryattackrate.size = CGSize(width: factoryattackrate.size.width*1.2, height: factoryattackrate.size.height*0.9)
        self.addChild(factoryattackrate)
        
        factoryattackrateBottom.position = CGPoint(x:590, y:270)
        factoryattackrateBottom.size = CGSize(width: factoryattackrateBottom.size.width*0.7, height: factoryattackrateBottom.size.height*0.7)
        self.addChild(factoryattackrateBottom)
        
        factoryattackrateLabel.text = "Lv:\(attackrate)         :\(Int(48+pow(2.0,Double(attackrate))))"
        factoryattackrateLabel.fontSize = 20
        factoryattackrateLabel.fontColor = SKColor.brown
        factoryattackrateLabel.position = CGPoint(x:375, y:190)
        self.addChild(factoryattackrateLabel)
        
        taPimage4.position = CGPoint(x:375, y:200)
        taPimage4.size = CGSize(width: taPimage4.size.width*0.5, height: taPimage4.size.height*0.5)
        self.addChild(taPimage4)
        
        
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
    }
    
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        var tapitime = defaults.integer(forKey: "factorytapitime")
        var taPget = defaults.integer(forKey: "factorytaPget")
        var tapicup = defaults.integer(forKey: "factorytapicup")
        var attackrate = defaults.integer(forKey: "attackrate")
        var taP = defaults.integer(forKey: "taP")
        for touch: AnyObject in touches {
            let location = touch.location(in:self)
            let touchNode = self.atPoint(location)
            let action1 = SKAction.hide()
            let action2 = SKAction.unhide()
    
             if touchNode == factoryTapitimeBottom {
                if 48+pow(2.0,Double(tapitime)) <= Double(taP) {
                    taP = taP - Int(48+pow(2.0,Double(tapitime)))
                    tapitime = tapitime + 1
                    var time = defaults.integer(forKey: "tapiokamaketime")
                    time = max(time - 10, Int(Double(time)/1.1))
                    defaults.set(time, forKey: "tapiokamaketime")
                    defaults.set(taP, forKey: "taP")
                    defaults.set(tapitime, forKey: "factorytapitime")
                    defaults.synchronize()
                    factoryTapitimeLabel.text = "Lv:\(tapitime)       :\(Int(48+pow(2.0,Double(tapitime))))"
                    taPLabel.text = ":\(taP)"
                    let starEffect = SKEmitterNode(fileNamed: "sparkparticle.sks")
                    starEffect?.position = touchNode.position
                    addChild(starEffect!)
                } else {
                    //買えません
                    factoryTapitimeLabel.text = "タPが足りないです！"
                    taPimage1.run(action1)
                    DispatchQueue.main.asyncAfter(deadline: .now() + 3.0) {
                        self.factoryTapitimeLabel.text = "Lv:\(tapitime)      :\(Int(48+pow(2.0,Double(tapitime))))"
                        self.taPimage1.run(action2)
                    }
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
            
            else if touchNode == factoryTaPgetBottom {
                if 48+pow(2.0,Double(taPget)) <= Double(taP) {
                    taP = taP - Int(48+pow(2.0,Double(taPget)))
                    taPget = taPget + 1
                    var get = defaults.integer(forKey: "taPget")
                    get = get + 1
                    defaults.set(get, forKey: "taPget")
                    defaults.set(taP, forKey: "taP")
                    defaults.set(taPget, forKey: "factorytaPget")
                    defaults.synchronize()
                    factoryTaPgetLabel.text = "Lv:\(taPget)      :\(Int(48+pow(2.0,Double(taPget))))"
                    taPLabel.text = ":\(taP)"
                    let starEffect = SKEmitterNode(fileNamed: "sparkparticle.sks")
                    starEffect?.position = touchNode.position
                    addChild(starEffect!)
                } else {
                    //買えません
                    factoryTaPgetLabel.text = "タPが足りないです！"
                    taPimage2.run(action1)
                    DispatchQueue.main.asyncAfter(deadline: .now() + 3.0) {
                        self.factoryTaPgetLabel.text = "Lv:\(taPget)      :\(Int(48+pow(2.0,Double(taPget))))"
                        self.taPimage2.run(action2)
                    }
                }
            }
            
            else if touchNode == factoryTapicupBottom {
                if 48+pow(2.0,Double(tapicup)) <= Double(taP) {
                    taP = taP - Int(48+pow(2.0,Double(tapicup)))
                    tapicup = tapicup + 1
                    var tapiokaMaxMax = defaults.integer(forKey: "tapiokaMaxMax")
                    tapiokaMaxMax = tapiokaMaxMax + 10
                    defaults.set(tapiokaMaxMax, forKey: "tapiokaMaxMax")
                    defaults.set(taP, forKey: "taP")
                    defaults.set(tapicup, forKey: "factorytapicup")
                    defaults.synchronize()
                    factoryTapicupLabel.text = "Lv:\(tapicup)   :\(Int(48+pow(2.0,Double(tapicup))))"
                    taPLabel.text = ":\(taP)"
                    let starEffect = SKEmitterNode(fileNamed: "sparkparticle.sks")
                    starEffect?.position = touchNode.position
                    addChild(starEffect!)
                } else {
                    //買えません
                    factoryTapicupLabel.text = "タPが足りないです！"
                    taPimage3.run(action1)
                    DispatchQueue.main.asyncAfter(deadline: .now() + 3.0) {
                        self.factoryTapicupLabel.text = "Lv:\(tapicup)    :\(Int(48+pow(2.0,Double(tapicup))))"
                        self.taPimage3.run(action2)
                    }
                }
            }
            
             else if touchNode == factoryattackrateBottom {
                if 48+pow(2.0,Double(attackrate)) <= Double(taP) {
                    taP = taP - Int(48+pow(2.0,Double(attackrate)))
                    attackrate = attackrate + 1
                    defaults.set(taP, forKey: "taP")
                    defaults.set(attackrate, forKey: "attackrate")
                    defaults.synchronize()
                    factoryattackrateLabel.text = "Lv:\(attackrate)   :\(Int(48+pow(2.0,Double(attackrate))))"
                    taPLabel.text = ":\(taP)"
                    let starEffect = SKEmitterNode(fileNamed: "sparkparticle.sks")
                    starEffect?.position = touchNode.position
                    addChild(starEffect!)
                } else {
                    //買えません
                    factoryattackrateLabel.text = "タPが足りないです！"
                    taPimage4.run(action1)
                    DispatchQueue.main.asyncAfter(deadline: .now() + 3.0) {
                        self.factoryattackrateLabel.text = "Lv:\(attackrate)    :\(Int(48+pow(2.0,Double(attackrate))))"
                        self.taPimage4.run(action2)
                    }
                }
            }
            
            
        }
        
    }
    
}

