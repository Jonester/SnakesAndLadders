//
//  Player.h
//  SnakesAndLadders
//
//  Created by Chris Jones on 2017-01-14.
//  Copyright © 2017 Jonescr. All rights reserved.
//

#import <Foundation/Foundation.h>
@class Manager;

@interface Player : NSObject


@property (nonatomic, strong) NSString *name;
@property (nonatomic, assign) NSInteger currentSquare;

- (instancetype)initWithName:(NSString *)name;


@end
