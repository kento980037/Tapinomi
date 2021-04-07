//
//  GameScene.swift
//  tapioka
//
//  Created by kento_0037 on 2019/07/27.
//  Copyright © 2019 Kento Fujino. All rights reserved.
//

import SpriteKit
import AudioToolbox

class GameScene: SKScene {
    var tapiN=0//表示しているタピオカの数
    var tapiIn=0 //吸ったタピオカの数
    var myTimer = Timer()
    var tapiArray:[SKSpriteNode] = []
    let taPLabel = SKLabelNode(fontNamed: "Thonburi-Bold")//taPを表示するラベル
    let taPimage = SKSpriteNode(imageNamed: "Tap.png")//taPの画像
    let tapioka = SKSpriteNode(imageNamed: "tapioka.png")//タピオカの画像
    let tapiokaLabel = SKLabelNode(fontNamed: "Thonburi-Bold")//タピオカの数を表示するラベル
    let timeLabel = SKLabelNode(fontNamed: "Thonburi-Bold")//タピオカの生産時間を表示するラベル
    
    let defaults = UserDefaults.standard //キーは、taP
    lazy var P = defaults.integer(forKey: "taP")
    
    let gameLabel = SKSpriteNode(imageNamed: "tapiokabottom2.png")//タピオカを飲むゲーム画面に移動するラベル
    let gachaLabel = SKSpriteNode(imageNamed: "gachabottom2.png")//ガチャ画面に移動するラベル
    let atackLabel = SKSpriteNode(imageNamed: "hanma-bottom2.png")//タピオカ叩きゲーム画面に移動するラベル
    let factoryLabel = SKSpriteNode(imageNamed: "factorybottom2.png")//タピオカ工場に移動するラベル
    let collectLabel = SKSpriteNode(imageNamed: "collectbottom2.png")//タピオカコレクション画面に移動するラベル
 
    
    override func didMove(to view: SKView) {
        self.backgroundColor = SKColor(red: 0.96, green: 0.89, blue: 0.70, alpha: 1.0)
        self.physicsBody = SKPhysicsBody(edgeLoopFrom: CGRect(x: 0, y: 150, width:750, height:1334))
        
        myTimer = Timer.scheduledTimer(withTimeInterval: 0.001, repeats: true, block: {(myTimer) in self.timerUpdate()})
        
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
        
        tapioka.size = CGSize(width: tapioka.size.width*0.5, height: tapioka.size.height*0.5)
        tapioka.position = CGPoint(x: 250, y:1155)
        self.addChild(tapioka)
        
        let tapiokaMax = defaults.integer(forKey: "tapiokaMax")
        let tapiokaMaxMax = defaults.integer(forKey: "tapiokaMaxMax")
        tapiokaLabel.text = ":\(tapiokaMax) / \(tapiokaMaxMax)"
        tapiokaLabel.fontSize = 20
        tapiokaLabel.fontColor = SKColor.black
        tapiokaLabel.position = CGPoint(x: 310, y:1150)
        self.addChild(tapiokaLabel)
        
        timeLabel.fontSize = 20
        timeLabel.fontColor = SKColor.black
        timeLabel.position = CGPoint(x: 550, y:1150)
        timeLabel.text = " "
        addChild(timeLabel)
        }
    
    
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        for touch: AnyObject in touches {
            let location = touch.location(in:self)
            let touchNode = self.atPoint(location)
            var tapiRemoveArray:[Int] = []
            var tapiMax=defaults.integer(forKey: "tapiokaMax")//最大に表示できるタピオカ
            let taPget=defaults.integer(forKey: "taPget")
            if tapiN > 0 {
                for i in 0...tapiN-1 {
                    if touchNode == tapiArray[i] {
                        let upAction = SKAction.moveTo(y:1334, duration: 0.4)
                        let removeAction = SKAction.removeFromParent()
                        let actionS = SKAction.sequence([upAction, removeAction])
                        touchNode.run(actionS)
                        tapiRemoveArray.append(i)
                        tapiMax = tapiMax-1
                        tapiIn = tapiIn + 1
                        tapiN = tapiN - 1
                        P = P + taPget
                        defaults.set(P, forKey: "taP")
                        defaults.set(tapiMax, forKey: "tapiokaMax")
                        defaults.synchronize()
                        vibrate()
                    }
                }
                for i in tapiRemoveArray {
                    tapiArray.remove(at: i)
                }
            }

        }
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        for touch: AnyObject in touches {
            let location = touch.location(in:self)
            let touchNode = self.atPoint(location)
            
            if touchNode == gameLabel {

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
    
    
    func timerUpdate() {
        let tapiMax=defaults.integer(forKey: "tapiokaMax")//最大に表示できるタピオカ
        if tapiMax > tapiN {
            let tapi = SKSpriteNode(imageNamed: "tapioka.png")
            tapi.physicsBody = SKPhysicsBody(circleOfRadius: 25)
            tapi.physicsBody?.restitution = 0.4//はんぱつけいすう
            tapi.position = CGPoint(x:Int(arc4random_uniform(750)), y:1330)
            tapi.physicsBody?.linearDamping = 0.8
            tapi.physicsBody?.velocity = CGVector(dx:Int(arc4random_uniform(800))-400, dy:300)
            self.addChild(tapi)
            tapiArray.append(tapi)
            tapiN = tapiN + 1
        }
        taPLabel.text = ":\(P)"
        
        let tapiokaMax = defaults.integer(forKey: "tapiokaMax")
        let tapiokaMaxMax = defaults.integer(forKey: "tapiokaMaxMax")
        tapiokaLabel.text = ":\(tapiokaMax) / \(tapiokaMaxMax)"
        
        let timeMoved = Date()
        let timeFixed = defaults.object(forKey: "time") as! Date
        let calendar = Calendar.current
        let diff:DateComponents = calendar.dateComponents([.second], from: timeFixed, to: timeMoved)
        let tapimaketime = defaults.integer(forKey: "tapiokamaketime")
        if tapiokaMax == tapiokaMaxMax {
            timeLabel.text = "タピオカができるまで : 0 秒"
        }
        else {
            timeLabel.text = "タピオカができるまで : \(tapimaketime - diff.second!) 秒"
            
        }
    
    }
    
    func vibrate() {
        AudioServicesPlaySystemSound(SystemSoundID(1519))
    }
    
}

