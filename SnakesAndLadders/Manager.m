//
//  Manager.m
//  SnakesAndLadders
//
//  Created by Chris Jones on 2017-01-14.
//  Copyright © 2017 Jonescr. All rights reserved.
//

#import "Manager.h"
#import "Player.h"

@implementation Manager

- (instancetype)init
{
    self = [super init];
    if (self) {
        _playerArray = [NSMutableArray new];
        _currentIndex = 0;
    }
    return self;
}

- (void)createPlayers: (NSInteger)numberOfPlayers {
    for (NSInteger i = 1; i <= numberOfPlayers; i++) {
        Player *player = [[Player alloc]initWithName:[NSString stringWithFormat:@"Player: %ld", i]];
        [self.playerArray addObject:player];
    }
}

- (void)roll {
    [self currentPlayer];
    self.currentIndex++;
}

- (Player *)currentPlayer {
    return self.playerArray[self.currentIndex % (self.currentIndex + 1)];
}

@end
