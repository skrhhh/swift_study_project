//
//  GameScene.swift
//  Project17
//
//  Created by admin on 2024/7/15.
//

import SpriteKit
import GameplayKit

class GameScene: SKScene, SKPhysicsContactDelegate {
    
    var starfield: SKEmitterNode!
    var player: SKSpriteNode!
    
    var scoreLabel: SKLabelNode!
    var score = 0 {
        didSet {
            scoreLabel.text = "Score: \(score)"
        }
    }
    
    let possibleEnemies = ["ball", "hammer", "tv"]
    var isGameOver = false
    var gameTimer: Timer?
    var obstacleShowTime: TimeInterval = 1
    var obstacleNum = 0
    
    override func didMove(to view: SKView) {
        backgroundColor = .black
                
        starfield = SKEmitterNode(fileNamed: "starfield")!
        starfield.position = CGPoint(x: 393, y: 852/2)
        starfield.advanceSimulationTime(10)
        addChild(starfield)
        starfield.zPosition = -1
        
        player = SKSpriteNode(imageNamed: "player")
        player.position = CGPoint(x: 50, y: 852/2)
        player.physicsBody = SKPhysicsBody(texture: player.texture!, size: player.size)
        player.physicsBody?.contactTestBitMask = 1
        player.size.height = 36
        player.size.width = 60
        addChild(player)
        
        scoreLabel = SKLabelNode(fontNamed: "Chalkduster")
        scoreLabel.position = CGPoint(x: 16, y: 16)
        scoreLabel.horizontalAlignmentMode = .left
        addChild(scoreLabel)
        
        score = 0
        
        physicsWorld.gravity = CGVector(dx: 0, dy: 0)
        physicsWorld.contactDelegate = self
        
        gameTimer = Timer.scheduledTimer(timeInterval: obstacleShowTime, target: self, selector: #selector(createEnemy), userInfo: nil, repeats: true)

    }
    
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        
    }
    
    @objc func createEnemy() {
        guard let enemy = possibleEnemies.randomElement() else { return }

        let sprite = SKSpriteNode(imageNamed: enemy)
        sprite.position = CGPoint(x: 1200, y: Int.random(in: 50...800))
        sprite.size.width = 55
        sprite.size.height = 55
        addChild(sprite)
        
        obstacleNum += 1
        if obstacleNum >= 2 {
            obstacleNum = 0
            if obstacleShowTime > 0.1 {
                obstacleShowTime -= 0.1
                gameTimer?.invalidate()
                gameTimer = nil
                gameTimer = Timer.scheduledTimer(timeInterval: obstacleShowTime, target: self, selector: #selector(createEnemy), userInfo: nil, repeats: true)
            }
        }

        sprite.physicsBody = SKPhysicsBody(texture: sprite.texture!, size: sprite.size)
        sprite.physicsBody?.categoryBitMask = 1
        sprite.physicsBody?.velocity = CGVector(dx: -500, dy: 0)
        sprite.physicsBody?.angularVelocity = 5
        sprite.physicsBody?.linearDamping = 0
        sprite.physicsBody?.angularDamping = 0
    }
    
    override func update(_ currentTime: TimeInterval) {
        for node in children {
            if node.position.x < -300 {
                node.removeFromParent()
            }
        }

        if !isGameOver {
            score += 1
        }
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        guard let touch = touches.first else { return }
        var location = touch.location(in: self)

        if location.y < 100 {
            location.y = 100
        } else if location.y > 752 {
            location.y = 752
        }

        player.position = location
    }
    
    func didBegin(_ contact: SKPhysicsContact) {
        let explosion = SKEmitterNode(fileNamed: "explosion")!
        explosion.position = player.position
        addChild(explosion)

        player.removeFromParent()

        isGameOver = true
        gameTimer?.invalidate()
        gameTimer = nil
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        
    }
}
