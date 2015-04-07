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
var angle = arc4random_uniform(6)
var start: CGVector = CGVector(dx: 2000, dy: 1500)
var start2: CGVector = CGVector(dx: 1500, dy: 1500)
var start3: CGVector = CGVector(dx: 1500, dy: 1200)
var start4: CGVector = CGVector(dx: -2000, dy: 1500)
var start5: CGVector = CGVector(dx: -1500, dy: 1500)
var start6: CGVector = CGVector(dx: -1500, dy: 1200)



let wallGroup:UInt32 = 1
let ballGroup:UInt32 = 3
let groundGroup:UInt32 = 4
let brickGroup:UInt32 = 7
let brickGroup2:UInt32 = 9
let brickGroup3:UInt32 = 11
let brickGroup4:UInt32 = 13
let brickGroup5:UInt32 = 15
let roofGroup:UInt32 = 17
let paddleGroup:UInt32 = 19




class GameScene: SKScene, SKPhysicsContactDelegate {
    override func didMoveToView(view: SKView) {
        self.physicsWorld.gravity = CGVectorMake(0, 0)
        self.physicsWorld.contactDelegate = self
        
        
        
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
        ball.physicsBody?.mass = 0
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
            brick.physicsBody?.collisionBitMask = ballGroup
            brick.physicsBody?.contactTestBitMask = brickGroup
        

        
        brick2 = SKSpriteNode(texture: brickTexture)
            brick2.position = CGPoint(x: CGRectGetMidX(self.frame)-80, y: CGRectGetMaxY(self.frame)-100)
            brick2.physicsBody = SKPhysicsBody(rectangleOfSize: CGSizeMake(42, 16))
            brick2.physicsBody?.dynamic = false
            brick2.physicsBody?.categoryBitMask = brickGroup2
            brick2.physicsBody?.collisionBitMask = ballGroup
            brick2.physicsBody?.contactTestBitMask = brickGroup2

        
        brick3 = SKSpriteNode(texture: brickTexture)
            brick3.position = CGPoint(x: CGRectGetMidX(self.frame), y: CGRectGetMaxY(self.frame)-100)
            brick3.physicsBody = SKPhysicsBody(rectangleOfSize: CGSizeMake(42, 16))
            brick3.physicsBody?.dynamic = false
            brick3.physicsBody?.categoryBitMask = brickGroup3
            brick3.physicsBody?.collisionBitMask = ballGroup
            brick3.physicsBody?.contactTestBitMask = brickGroup3
        

        
        brick4 = SKSpriteNode(texture: brickTexture)
            brick4.position = CGPoint(x: CGRectGetMidX(self.frame)+80, y: CGRectGetMaxY(self.frame)-100)
            brick4.physicsBody = SKPhysicsBody(rectangleOfSize: CGSizeMake(42, 16))
            brick4.physicsBody?.dynamic = false
            brick4.physicsBody?.categoryBitMask = brickGroup4
            brick4.physicsBody?.collisionBitMask = ballGroup
            brick4.physicsBody?.contactTestBitMask = brickGroup4
        
        brick5 = SKSpriteNode(texture: brickTexture)
            brick5.position = CGPoint(x: CGRectGetMidX(self.frame)+160, y: CGRectGetMaxY(self.frame)-100)
            brick5.physicsBody = SKPhysicsBody(rectangleOfSize: CGSizeMake(42, 16))
            brick5.physicsBody?.dynamic = false
            brick5.physicsBody?.categoryBitMask = brickGroup5
            brick5.physicsBody?.collisionBitMask = ballGroup
            brick5.physicsBody?.contactTestBitMask = brickGroup5
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
        wall.physicsBody?.collisionBitMask = ballGroup

        
        wall2 = SKSpriteNode(texture: wallTexture)
        wall2.position = CGPoint(x: CGRectGetMaxX(self.frame)-250, y: CGRectGetMaxY(self.frame)-65)
        wall2.physicsBody = SKPhysicsBody (rectangleOfSize: CGSizeMake(111, 638))
        wall2.physicsBody?.dynamic = false
        wall2.physicsBody?.categoryBitMask = wallGroup
        wall2.physicsBody?.contactTestBitMask = ballGroup
        wall2.physicsBody?.collisionBitMask = ballGroup
        wall2.physicsBody?.friction = 0
        
        wall3 = SKSpriteNode(texture: wallTexture)
        wall3.position = CGPoint(x: CGRectGetMinX(self.frame)+250, y: CGRectGetMinY(self.frame)+65)
        wall3.physicsBody = SKPhysicsBody (rectangleOfSize: CGSizeMake(111, 638))
        wall3.physicsBody?.dynamic = false
        wall3.physicsBody?.categoryBitMask = wallGroup
        wall3.physicsBody?.contactTestBitMask = ballGroup
        wall3.physicsBody?.collisionBitMask = ballGroup
        
        wall4 = SKSpriteNode(texture: wallTexture)
        wall4.position = CGPoint(x: CGRectGetMaxX(self.frame)-250, y: CGRectGetMinY(self.frame)+65)
        wall4.physicsBody = SKPhysicsBody (rectangleOfSize: CGSizeMake(111, 638))
        wall4.physicsBody?.dynamic = false
        wall4.physicsBody?.categoryBitMask = wallGroup
        wall4.physicsBody?.contactTestBitMask = ballGroup
        wall4.physicsBody?.collisionBitMask = ballGroup
        
        ground = SKSpriteNode(texture: groundTexture)
        ground.position = CGPoint(x: CGRectGetMidX(self.frame), y: CGRectGetMinY(self.frame))
        ground.physicsBody = SKPhysicsBody (rectangleOfSize: CGSizeMake(516, 50))
        ground.physicsBody?.dynamic = false
        ground.physicsBody?.categoryBitMask = groundGroup
        ground.physicsBody?.contactTestBitMask = ballGroup
        ground.physicsBody?.collisionBitMask = groundGroup
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
    
        if contact.bodyA.categoryBitMask == ballGroup && contact.bodyB.categoryBitMask == brickGroup{
            if brick.texture == brickTexture {
            brick.texture = brokenBrickTexture
                scoreNum++
                scoreLabel()}
            else {brick.removeFromParent()
                scoreNum++
                scoreLabel()}}
        if contact.bodyA.categoryBitMask == ballGroup && contact.bodyB.categoryBitMask == brickGroup2{
            if brick2.texture == brickTexture {
                brick2.texture = brokenBrickTexture
                scoreNum++
                scoreLabel()}
            else {brick2.removeFromParent()
                scoreNum++
                scoreLabel()}}
        if contact.bodyA.categoryBitMask == ballGroup && contact.bodyB.categoryBitMask == brickGroup3{
            if brick3.texture == brickTexture {
                brick3.texture = brokenBrickTexture
                scoreNum++
                scoreLabel()
                }
            else {brick3.removeFromParent()
                scoreNum++
                scoreLabel()}}
        if contact.bodyA.categoryBitMask == ballGroup && contact.bodyB.categoryBitMask == brickGroup4{
            if brick4.texture == brickTexture {
                brick4.texture = brokenBrickTexture
                scoreNum++
                scoreLabel()}
            else {brick4.removeFromParent()
                scoreNum++
                scoreLabel()}}
        if contact.bodyA.categoryBitMask == ballGroup && contact.bodyB.categoryBitMask == brickGroup5{
            if brick5.texture == brickTexture {
                brick5.texture = brokenBrickTexture
                scoreNum++
                scoreLabel()}
            else {brick5.removeFromParent()
                scoreNum++
                scoreLabel()}}
        if  contact.bodyA.categoryBitMask == ballGroup && contact.bodyB.categoryBitMask == groundGroup{
        
            score.removeFromParent()
            score.text = "You Don Died, Nice Going, your score was \(scoreNum)"
            score.fontSize = 20
            self.addChild(score)
        
        }
        

    
    }
    
    override func touchesBegan(touches: NSSet, withEvent event: UIEvent) {
        /* Called when a touch begins */
        
        

        
        
        for touch: AnyObject in touches {
            var location = touch.locationInNode(self)
            
            if begin == 0
                {var Xcord = (location.x - ball.position.x)
                    var Ycord = (location.y - ball.position.y)
            
            
                    ball.physicsBody?.applyImpulse(CGVector(dx: Xcord, dy: Ycord))
                    begin++}
            
            else{
            
            println(location)
                paddle.position = CGPoint(x: location.x, y: CGRectGetMinY(self.frame)+50)}
            
        
                }
    }
    
    
    override func touchesMoved(touches: NSSet, withEvent event: UIEvent) {
        for touch: AnyObject in touches {
            var location = touch.locationInNode(self)
            if begin >= 2{
                paddle.position = CGPoint(x: location.x, y: CGRectGetMinY(self.frame)+50)}
            if scoreNum == 10{
                
                ball.physicsBody?.velocity = CGVector(dx: 0, dy: 0)
                
                score.removeFromParent()
                score.fontSize = 15
                score.text = "You Don Broke out of prison, Good Job, Your score is \(scoreNum)"
                score.physicsBody = SKPhysicsBody(rectangleOfSize: CGSizeMake(10, 10))
                var rotate = SKAction.rotateByAngle(2*3.141592653589793, duration: 0.5)
                score.runAction(rotate)
                self.addChild(score)
                scoreNum++
               
                
                
                
                
            }
         
            

            
            println(location)
            
            
            
        }

    }
    
    
    override func touchesEnded (touches: NSSet, withEvent event: UIEvent) {
        /* Called when a touch begins */
        
        
        for touch: AnyObject in touches {
            var location = touch.locationInNode(self)
            if begin >= 2{
                paddle.position = CGPoint(x: location.x, y: CGRectGetMinY(self.frame)+50)}
            begin++

            println(location)
            
            
                        
        }
    }
    func scoreLabel(){
    
        //        ___________________________________________________________
        //        MARK: lable
        
        score.removeFromParent()
        score.text = "\(scoreNum)"
        score.position = CGPoint(x: CGRectGetMidX(self.frame), y: CGRectGetMaxY(self.frame)-50)
        score.color = SKColor.whiteColor()
        score.fontSize = 70
        score.fontName = "Baskerville"
        self.addChild(score)

    }
    
    
    
   
    override func update(currentTime: CFTimeInterval) {
        /* Called before each frame is rendered */
    }
}
