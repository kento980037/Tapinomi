//
//  atackGameScene.swift
//  tapioka
//
//  Created by kento_0037 on 2019/07/27.
//  Copyright © 2019 Kento Fujino. All rights reserved.
//

import SpriteKit

class atackGameScene: SKScene {
    //ストローの位置を[x,y]のセットで５セット作る
    let storoPoint = [[Int(arc4random_uniform(500)+125),100],[Int(arc4random_uniform(500)+125),300],[Int(arc4random_uniform(500)+125),500],[Int(arc4random_uniform(500)+125),700],[Int(arc4random_uniform(500)+125),900]]
    //タピオカを入れる配列を作る（タッチしたか調べるため)
    var tapiArray:[SKSpriteNode] = []
    
    //スコア
    var score = 0
    var scoreLabel = SKLabelNode(fontNamed: "Thonburi-Bold")
    
    //残り時間
    var timeCount = 15
    let timeLabel = SKLabelNode(fontNamed: "Thonburi-Bold")
    var myTimer = Timer()
    
    override func didMove(to view: SKView) {
        
        self.backgroundColor = SKColor(red: 0.96, green: 0.89, blue: 0.70, alpha: 1)//alphaは透明度
        //スコアを表示する
        scoreLabel.text = "つぶした数:\(score)"
        scoreLabel.fontSize = 40
        scoreLabel.horizontalAlignmentMode = .left //文字を左寄せ
        scoreLabel.fontColor = SKColor.black
        scoreLabel.position = CGPoint(x:40, y:1150)
        self.addChild(scoreLabel)
        
        for i in 0...4 {
            let tapi = SKSpriteNode(imageNamed: "tapioka.png")
            tapi.position = CGPoint(x:storoPoint[i][0], y:storoPoint[i][1])
            self.addChild(tapi)
            tapiArray.append(tapi)
            let storo = SKSpriteNode(imageNamed: "sutoro-.png")
            storo.position = CGPoint(x:storoPoint[i][0], y:storoPoint[i][1])
            storo.alpha=0.5
            self.addChild(storo)
            
            let action1 = SKAction.moveTo(y:-1000, duration: 0.0)
            let action2 = SKAction.wait(forDuration: 2.0, withRange: 4.0)
            let action3_1 = SKAction.moveTo(y:storo.position.y-30, duration:0.0)
            let action3_2 = SKAction.moveTo(y:storo.position.y+80, duration:0.1)
            let action4 = SKAction.wait(forDuration: 1.1, withRange: 1.8)//0.2~2.0
            let actionS = SKAction.sequence([action1, action2, action3_1, action3_2, action4])
            let actionR = SKAction.repeatForever(actionS)
            tapi.run(actionR)
        }
        
        //残り時間を表示
        timeLabel.text = "残り時間:\(timeCount)"
        timeLabel.horizontalAlignmentMode = .left
        timeLabel.position = CGPoint(x:480, y:1150)
        timeLabel.fontSize = 40
        timeLabel.fontColor = SKColor.black
        self.addChild(timeLabel)
        myTimer = Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true, block: {(myTimer) in self.timerUpdate()})
    }
    
    //１秒ごとに実行される処理
    func timerUpdate() {
        timeCount -= 1
        timeLabel.text = "残り時間: \(timeCount)"
        if timeCount < 1 {
            //ゲームオーバー
            myTimer.invalidate()
            let scene = atackGameOverScene(size: self.size)
            let skView = self.view as! TapiSKView?
            skView?.score = score
            skView?.presentScene(scene)
        }
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        for touch: AnyObject in touches {
            let location = touch.location(in:self)
            let touchNode = self.atPoint(location)
            for i in 0...4 {
                if touchNode == tapiArray[i] {
                    score+=1
                    scoreLabel.text = "つぶした数:\(score)"
                    let tapiEffect = SKEmitterNode(fileNamed: "majicparticle.sks")
                    tapiEffect?.numParticlesToEmit = 20
                    tapiEffect?.position = touchNode.position
                    addChild(tapiEffect!)
                    touchNode.position.y = -1000
                }
            }
        }
    }
    
    
}

