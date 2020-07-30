//
//  ViewController.m
//  SpriteKit
//
//  Created by dengbin on 2020/7/30.
//  Copyright © 2020 dengbin. All rights reserved.
//

#import "ViewController.h"
#import <SpriteKit/SpriteKit.h>
#import <SpriteKit/SKNode.h>
#import <SpriteKit/SKShader.h>
#import <SpriteKit/SpriteKitBase.h>

#import <GameKit/GameKit.h>
@interface ViewController ()
{
    SKScene *sc;
}
@end

@implementation ViewController
- (void)loadView{
    SKView *view = [[SKView alloc] init];
    view.frame = CGRectMake(0, 0, 320, 568);
    self.view = view;
}

- (void)addStaticShapeNode {
    SKShapeNode *shapeNode = [[SKShapeNode alloc] init];
    shapeNode.position = CGPointMake(100,100);

    UIBezierPath *path = [[UIBezierPath alloc] init];
    CGPoint point_1 = CGPointMake(CGRectGetMinX(self.view.frame)- 59, 0);
    CGPoint point_2 = CGPointMake( point_1.x + 59, point_1.y + 59);
    CGPoint point_3 = CGPointMake(point_1.x + 100, point_1.y );
    CGPoint point_4 = CGPointMake(point_1.x + 59,  point_1.y - 59);
                                   CGPoint point_5 = point_1;
    [path moveToPoint:point_1];
    [path addLineToPoint:point_2];
       [path addLineToPoint:point_3];
       [path addLineToPoint:point_4];
       [path addLineToPoint:point_5];
    shapeNode.path = path.CGPath;
    shapeNode.strokeColor = [UIColor whiteColor];       //填充颜色
    shapeNode.fillColor = [UIColor redColor];           //线颜色
    shapeNode.lineWidth = 1 ;                    //线宽
    shapeNode.glowWidth = 4;                     //光晕
    shapeNode.lineJoin = kCGLineJoinRound;                 //线连接方式
    shapeNode.physicsBody =   [SKPhysicsBody bodyWithPolygonFromPath:path.CGPath] ;//设置物理引擎
    shapeNode.physicsBody.dynamic = NO;  //设置为静态物体
    [sc addChild:shapeNode];
   }

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    
    SKSpriteNode *node=[[SKSpriteNode alloc] initWithImageNamed:@"1"];
    node.position = [touches.anyObject locationInView:self.view];
    node.size = CGSizeMake(40,40);
    node.color = [UIColor redColor];
    node.physicsBody = [SKPhysicsBody bodyWithRectangleOfSize:node.frame.size];
    
    [sc addChild:node];
}
- (void)viewDidLoad {
    [super viewDidLoad];
  SKScene *scene =  [[SKScene alloc] initWithSize:self.view.bounds.size];
    scene.physicsBody=  [SKPhysicsBody bodyWithEdgeLoopFromRect:self.view.bounds];
    [(SKView *)self.view presentScene:scene];
    sc =scene;
    SKSpriteNode *node=[[SKSpriteNode alloc] initWithImageNamed:@"1"];
    node.position = CGPointMake(100,100);
    [scene addChild:node];
    
    [self addStaticShapeNode];
    // Do any additional setup after loading the view.
}


@end
