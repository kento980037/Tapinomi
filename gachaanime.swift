//
//  gachaanime.swift
//  tapioka
//
//  Created by kento_0037 on 2019/07/31.
//  Copyright © 2019 Kento Fujino. All rights reserved.
//

import SpriteKit

class Gachaanime: SKScene {
    let defaults = UserDefaults.standard
    var n = 0
    
    override func didMove(to view: SKView) {
        self.backgroundColor = SKColor(red: 0.96, green: 0.89, blue: 0.70, alpha: 1.0)
         self.physicsBody = SKPhysicsBody(edgeLoopFrom: self.frame)
       
        while n < 200 {
            let tapi = SKSpriteNode(imageNamed: "tapioka.png")
            tapi.physicsBody = SKPhysicsBody(circleOfRadius: 25)
            tapi.physicsBody?.restitution = 0.4//はんぱつけいすう
            tapi.position = CGPoint(x:Int(arc4random_uniform(750)), y:Int(arc4random_uniform(100))+1200)
            tapi.physicsBody?.linearDamping = 0.8
            tapi.physicsBody?.velocity = CGVector(dx:Int(arc4random_uniform(1000))-500, dy:200)
            self.addChild(tapi)
            let action1 = SKAction.wait(forDuration: 2.0, withRange: 0.5)
            let action2 = SKAction.moveTo(y:1334, duration: 0.4)
            let action3 = SKAction.removeFromParent()
            let actionS = SKAction.sequence([action1, action2, action3])
            tapi.run(actionS)
            n = n + 1
            }
        n = 0

        DispatchQueue.main.asyncAfter(deadline: .now() + 2.5) {
            self.backgroundColor = SKColor(red: 0.1, green: 0.05, blue: 0.05, alpha: 0.5)
            while self.n < 10 {
                let tapiEffect = SKEmitterNode(fileNamed: "gachaanime.sks")
                tapiEffect?.position = CGPoint(x:Int(arc4random_uniform(750)), y:Int(arc4random_uniform(1334)))
                self.addChild(tapiEffect!)
                self.n = self.n + 1
            }
                
                let gameSKView = self.view as! TapiSKView
                let number = gameSKView.score // 得られたコレクションナンバー
                if number == 1 {
                    //ミルクティーの説明
                    let node = SKSpriteNode(imageNamed: "milktea.png")
                    node.size = CGSize(width: node.size.width*2.0, height: node.size.height*2.0)
                    node.position = CGPoint(x:375, y:900)
                    self.addChild(node)
                }
                else if number == 2 {
                    //チョコミルクの説明
                    let node = SKSpriteNode(imageNamed: "chokomilk.png")
                    node.size = CGSize(width: node.size.width*2.0, height: node.size.height*2.0)
                    node.position = CGPoint(x:375, y:900)
                    self.addChild(node)
                    
                }
                else if number == 3 {
                    //抹茶オレの説明
                    let node = SKSpriteNode(imageNamed: "machaore.png")
                    node.size = CGSize(width: node.size.width*2.0, height: node.size.height*2.0)
                    node.position = CGPoint(x:375, y:900)
                    self.addChild(node)

                    
                }
                else if number == 4 {
                    //ジャスmんティーの説明
                    let node = SKSpriteNode(imageNamed: "jyasumintea.png")
                    node.size = CGSize(width: node.size.width*2.0, height: node.size.height*2.0)
                    node.position = CGPoint(x:375, y:900)
                    self.addChild(node)
                    
                }
                else if number == 5 {
                    //アイスティーの説明
                    let node = SKSpriteNode(imageNamed: "icetea.png")
                    node.size = CGSize(width: node.size.width*2.0, height: node.size.height*2.0)
                    node.position = CGPoint(x:375, y:900)
                    self.addChild(node)
                    
                }
                else if number == 6 {
                    //カルピスの説明
                    let node = SKSpriteNode(imageNamed: "karupisu.png")
                    node.size = CGSize(width: node.size.width*2.0, height: node.size.height*2.0)
                    node.position = CGPoint(x:375, y:900)
                    self.addChild(node)
                    
                }
                else if number == 7 {
                    //オレンjの説明
                    let node = SKSpriteNode(imageNamed: "orenge.png")
                    node.size = CGSize(width: node.size.width*2.0, height: node.size.height*2.0)
                    node.position = CGPoint(x:375, y:900)
                    self.addChild(node)
                    
                }
                else if number == 8 {
                    //隊のタピオカの説明
                    let node = SKSpriteNode(imageNamed: "taitapi.png")
                    node.size = CGSize(width: node.size.width*2.0, height: node.size.height*2.0)
                    node.position = CGPoint(x:375, y:900)
                    self.addChild(node)
                    
                }
                else if number == 9 {
                    //タピオカがえるの説明
                    let node = SKSpriteNode(imageNamed: "tapiokafrog.png")
                    node.size = CGSize(width: node.size.width*2.0, height: node.size.height*2.0)
                    node.position = CGPoint(x:375, y:900)
                    self.addChild(node)
                    
                }
                else if number == 10 {
                    //キャビアの説明
                    let node = SKSpriteNode(imageNamed: "kyabia.png")
                    node.size = CGSize(width: node.size.width*2.0, height: node.size.height*2.0)
                    node.position = CGPoint(x:375, y:900)
                    self.addChild(node)
                }

            DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {
                let skView = self.view as SKView?
                let scene = Gacharesult(size: self.size)
                skView?.presentScene(scene)
                }
        }
    }
}
