//
//  Player.m
//  SnakesAndLadders
//
//  Created by Chris Jones on 2017-01-14.
//  Copyright © 2017 Jonescr. All rights reserved.
//

#import "Player.h"
#import "Manager.h"

@implementation Player

- (instancetype)init
{
    self = [super init];
    if (self) {
        _currentSquare = 0;
    }
    return self;
}

- (instancetype)initWithName:(NSString *)name
{
    self = [super init];
    if (self) {
        _name = name;
    }
    return self;
}

@end
