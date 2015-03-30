//
//  GameScene.swift
//  Breakout
//
//  Created by Peter Regard on 3/17/15.
//  Copyright (c) 2015 Eggs Enterprises. All rights reserved.
//

import SpriteKit
var brick = SKSpriteNode()
var brick2 = SKSpriteNode()
var brick3 = SKSpriteNode()
var brick4 = SKSpriteNode()
var brick5 = SKSpriteNode()
var brickTexture = SKTexture(imageNamed: "Brick.png")
var brokenBrickTexture = SKTexture(imageNamed: "Brick2.png")
var ballTexture = SKTexture(imageNamed: "Ball2.png")
var ball = SKSpriteNode()
var paddleTexture = SKTexture(imageNamed: "paddle.png")
var paddle = SKSpriteNode()
var roof = SKSpriteNode()
var RoofTexture = SKTexture(imageNamed: "roof.png")
var wall = SKSpriteNode()
var wall2 = SKSpriteNode()
var wallTexture = SKTexture(imageNamed: "wall.png")
var wall3 = SKSpriteNode()
var wall4 = SKSpriteNode()
var ground = SKSpriteNode()
var groundTexture = SKTexture(imageNamed: "ground.png")

var score = SKLabelNode()
var scoreNum = 0

var begin = 0

let ballGroup:UInt32 = 1
let wallGroup:UInt32 = 2
let groundGroup:UInt32 = 3
let brickGroup:UInt32 = 4
let brickGroup2:UInt32 = 5
let brickGroup3:UInt32 = 6
let brickGroup4:UInt32 = 7
let brickGroup5:UInt32 = 8
let roofGroup:UInt32 = 9
let paddleGroup:UInt32 = 10




class GameScene: SKScene, SKPhysicsContactDelegate {
    override func didMoveToView(view: SKView) {
        self.physicsWorld.gravity = CGVectorMake(0, 0)
        self.physicsWorld.contactDelegate = self
        
        
//        ___________________________________________________________
//        MARK: lable
        
        
        score.text = "\(scoreNum)"
        score.position = CGPoint(x: CGRectGetMidX(self.frame), y: CGRectGetMaxY(self.frame)-50)
        score.color = SKColor.whiteColor()
        score.fontSize = 70
        score.fontName = "Baskerville"
        self.addChild(score)
        
//          _________________________________________________________
//        MARK: Ball
        ball = SKSpriteNode(texture: ballTexture)
        ball.physicsBody = SKPhysicsBody(rectangleOfSize: CGSizeMake(5, 5))
        ball.position = CGPoint(x: CGRectGetMidX(self.frame), y: CGRectGetMinY(self.frame)+100)
        ball.physicsBody!.dynamic = true
        ball.physicsBody?.categoryBitMask = ballGroup
        ball.physicsBody?.contactTestBitMask = brickGroup
        ball.physicsBody?.collisionBitMask = ballGroup
        ball.physicsBody?.friction = 0
        ball.physicsBody?.linearDamping = 0
        ball.physicsBody?.restitution = 1
        ball.physicsBody?.mass = 5
        ball.physicsBody?.velocity = CGVectorMake(0, 0)
        ball.zPosition = 11
        ball.physicsBody?.allowsRotation = false
        
        self.addChild(ball)
//  ______________________________________________________
//        MARK:Bricks
        
        brick = SKSpriteNode(texture: brickTexture)
            brick.position = CGPoint(x: CGRectGetMidX(self.frame)-160, y: CGRectGetMaxY(self.frame)-100)
            brick.physicsBody = SKPhysicsBody(rectangleOfSize: CGSizeMake(42, 16))
            brick.physicsBody?.dynamic = false
            brick.physicsBody?.categoryBitMask = brickGroup
            brick.physicsBody?.collisionBitMask = brickGroup
            brick.physicsBody?.contactTestBitMask = ballGroup
        

        
        brick2 = SKSpriteNode(texture: brickTexture)
            brick2.position = CGPoint(x: CGRectGetMidX(self.frame)-80, y: CGRectGetMaxY(self.frame)-100)
            brick2.physicsBody = SKPhysicsBody(rectangleOfSize: CGSizeMake(42, 16))
            brick2.physicsBody?.dynamic = false
            brick2.physicsBody?.categoryBitMask = brickGroup2
            brick2.physicsBody?.collisionBitMask = brickGroup2
            brick2.physicsBody?.contactTestBitMask = ballGroup

        
        brick3 = SKSpriteNode(texture: brickTexture)
            brick3.position = CGPoint(x: CGRectGetMidX(self.frame), y: CGRectGetMaxY(self.frame)-100)
            brick3.physicsBody = SKPhysicsBody(rectangleOfSize: CGSizeMake(42, 16))
            brick3.physicsBody?.dynamic = false
            brick3.zPosition = 10
            brick3.physicsBody?.categoryBitMask = brickGroup3
            brick3.physicsBody?.collisionBitMask = brickGroup3
            brick3.physicsBody?.contactTestBitMask = ballGroup
        

        
        brick4 = SKSpriteNode(texture: brickTexture)
            brick4.position = CGPoint(x: CGRectGetMidX(self.frame)+80, y: CGRectGetMaxY(self.frame)-100)
            brick4.physicsBody = SKPhysicsBody(rectangleOfSize: CGSizeMake(42, 16))
            brick4.physicsBody?.dynamic = false
            brick4.physicsBody?.categoryBitMask = brickGroup4
            brick4.physicsBody?.collisionBitMask = brickGroup4
            brick4.physicsBody?.contactTestBitMask = ballGroup
        
        brick5 = SKSpriteNode(texture: brickTexture)
            brick5.position = CGPoint(x: CGRectGetMidX(self.frame)+160, y: CGRectGetMaxY(self.frame)-100)
            brick5.physicsBody = SKPhysicsBody(rectangleOfSize: CGSizeMake(42, 16))
            brick5.physicsBody?.dynamic = false
            brick5.physicsBody?.categoryBitMask = brickGroup5
            brick5.physicsBody?.collisionBitMask = brickGroup5
            brick5.physicsBody?.contactTestBitMask = ballGroup
        self.addChild(brick)
        self.addChild(brick2)
        self.addChild(brick3)
        self.addChild(brick4)
        self.addChild(brick5)

//    _____________________________________________________________________
//        MARK: Paddle
        
        
        paddle = SKSpriteNode(texture: paddleTexture)
        paddle.position = CGPoint(x: CGRectGetMidX(self.frame) , y: CGRectGetMinY(self.frame)+50)
        paddle.physicsBody = SKPhysicsBody(rectangleOfSize: CGSizeMake(84, 5))
        paddle.physicsBody?.dynamic = false
        paddle.physicsBody?.categoryBitMask = wallGroup
        paddle.physicsBody?.contactTestBitMask = ballGroup
        paddle.physicsBody?.collisionBitMask = paddleGroup
        self.addChild(paddle)
        
//        ___________________________________________________________________
//        MARK: Roof
        
        roof = SKSpriteNode(texture: RoofTexture)
        roof.position = CGPoint(x: CGRectGetMidX(self.frame), y: CGRectGetMaxY(self.frame)+50)
        roof.physicsBody = SKPhysicsBody (rectangleOfSize: CGSizeMake(640, 111))
        roof.physicsBody?.dynamic = false
        roof.physicsBody?.categoryBitMask = roofGroup
        roof.physicsBody?.collisionBitMask = wallGroup
        roof.physicsBody?.contactTestBitMask = ballGroup
        roof.physicsBody?.friction = 0
        
        self.addChild(roof)
//        ______________________________________________________________________
//        MARK:   Walls
        
        wall = SKSpriteNode(texture: wallTexture)
        wall.position = CGPoint(x: CGRectGetMinX(self.frame)+250, y: CGRectGetMaxY(self.frame)-65)
        wall.physicsBody = SKPhysicsBody (rectangleOfSize: CGSizeMake(111, 638))
        wall.physicsBody?.dynamic = false
        wall.physicsBody?.categoryBitMask = wallGroup
        wall.physicsBody?.contactTestBitMask = ballGroup
        wall.physicsBody?.collisionBitMask = wallGroup

        
        wall2 = SKSpriteNode(texture: wallTexture)
        wall2.position = CGPoint(x: CGRectGetMaxX(self.frame)-250, y: CGRectGetMaxY(self.frame)-65)
        wall2.physicsBody = SKPhysicsBody (rectangleOfSize: CGSizeMake(111, 638))
        wall2.physicsBody?.dynamic = false
        wall2.physicsBody?.categoryBitMask = wallGroup
        wall2.physicsBody?.contactTestBitMask = ballGroup
        wall2.physicsBody?.collisionBitMask = wallGroup
        wall2.physicsBody?.friction = 0
        
        wall3 = SKSpriteNode(texture: wallTexture)
        wall3.position = CGPoint(x: CGRectGetMinX(self.frame)+250, y: CGRectGetMinY(self.frame)+65)
        wall3.physicsBody = SKPhysicsBody (rectangleOfSize: CGSizeMake(111, 638))
        wall3.physicsBody?.dynamic = false
        wall3.physicsBody?.categoryBitMask = wallGroup
        wall3.physicsBody?.contactTestBitMask = ballGroup
        wall3.physicsBody?.collisionBitMask = wallGroup
        
        wall4 = SKSpriteNode(texture: wallTexture)
        wall4.position = CGPoint(x: CGRectGetMaxX(self.frame)-250, y: CGRectGetMinY(self.frame)+65)
        wall4.physicsBody = SKPhysicsBody (rectangleOfSize: CGSizeMake(111, 638))
        wall4.physicsBody?.dynamic = false
        wall4.physicsBody?.categoryBitMask = wallGroup
        wall4.physicsBody?.contactTestBitMask = ballGroup
        wall4.physicsBody?.collisionBitMask = wallGroup
        
        ground = SKSpriteNode(texture: groundTexture)
        ground.position = CGPoint(x: CGRectGetMidX(self.frame), y: CGRectGetMinY(self.frame))
        ground.physicsBody = SKPhysicsBody (rectangleOfSize: CGSizeMake(516, 50))
        ground.physicsBody?.dynamic = false
        ground.physicsBody?.categoryBitMask = groundGroup
        ground.physicsBody?.contactTestBitMask = ballGroup
        ground.physicsBody?.collisionBitMask = ballGroup
        ground.physicsBody?.friction = 0
        
        self.addChild(wall)
        self.addChild(wall2)
        self.addChild(wall3)
        self.addChild(wall4)
        self.addChild(ground)
        

         }
    
    
    
    func didBeginContact(contact: SKPhysicsContact) {
    println(contact.bodyA.categoryBitMask)
    println(contact.bodyB.categoryBitMask)
    
        if contact.bodyA.categoryBitMask == 1 && contact.bodyB.categoryBitMask == 6{
            if brick3.texture == brickTexture {
            brick3.texture = brokenBrickTexture}
            else {brick3.removeFromParent()}
            scoreNum++}
        if contact.bodyA.categoryBitMask == 1 && contact.bodyB.categoryBitMask == 5{
            if brick2.texture == brickTexture {
                brick2.texture = brokenBrickTexture}
            else {brick2.removeFromParent()}
            scoreNum++}
        if contact.bodyA.categoryBitMask == 1 && contact.bodyB.categoryBitMask == 4{
            if brick.texture == brickTexture {
                brick.texture = brokenBrickTexture}
            else {brick.removeFromParent()}
            scoreNum++}
        if contact.bodyA.categoryBitMask == 1 && contact.bodyB.categoryBitMask == 7{
            if brick4.texture == brickTexture {
                brick4.texture = brokenBrickTexture}
            else {brick4.removeFromParent()}
            scoreNum++}
        if contact.bodyA.categoryBitMask == 1 && contact.bodyB.categoryBitMask == 8{
            if brick5.texture == brickTexture {
                brick5.texture = brokenBrickTexture}
            else {brick5.removeFromParent()}
            scoreNum++}
    
    }
    
    override func touchesBegan(touches: NSSet, withEvent event: UIEvent) {
        /* Called when a touch begins */
        if begin == 0
        { ball.physicsBody!.applyImpulse(CGVectorMake(1000, 2500))
            begin++}
        
        
        for touch: AnyObject in touches {
            var location = touch.locationInNode(self)
            println(location)
            paddle.position = CGPoint(x: location.x, y: CGRectGetMinY(self.frame)+50)
            
        
                }
    }
    
    
    override func touchesMoved(touches: NSSet, withEvent event: UIEvent) {
        for touch: AnyObject in touches {
            var location = touch.locationInNode(self)
            paddle.position = CGPoint(x: location.x, y: CGRectGetMinY(self.frame)+50)
            
            println(location)
            
            
            
        }

    }
    
    
    override func touchesEnded (touches: NSSet, withEvent event: UIEvent) {
        /* Called when a touch begins */
        
        
        for touch: AnyObject in touches {
            var location = touch.locationInNode(self)
            paddle.position = CGPoint(x: location.x, y: CGRectGetMinY(self.frame)+50)

            println(location)
            
            
                        
        }
    }

    
    
    
   
    override func update(currentTime: CFTimeInterval) {
        /* Called before each frame is rendered */
    }
}
