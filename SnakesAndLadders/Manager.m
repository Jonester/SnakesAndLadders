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
        _snakesLaddersDict = @{@(4):@(14),
                               @(9):@(31),
                               @(20): @(38),
                               @(28): @(84),
                               @(40): @(59),
                               @(51): @(67),
                               @(63): @(81),
                               @(17): @(7),
                               @(89): @(26),
                               @(64): @(60),
                               @(95): @(75),
                               @(99): @(78)};
        _currentIndex = 0;
        _playerArray = [NSMutableArray new];
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
    Player *currentPlayer = [self currentPlayer];
    NSInteger rollValue = arc4random_uniform(6) + 1;
    currentPlayer.currentSquare += rollValue;
    NSNumber *specialSquare = [NSNumber numberWithInteger:currentPlayer.currentSquare];
    
    if (currentPlayer.currentSquare >= 100) {
        NSLog(@"%@ passed square 100. Congratulations!!! You are the champion of the world!!", currentPlayer.name);
        self.gameOver = YES;
    } else {
        
        if ([[self.snakesLaddersDict objectForKey:specialSquare] integerValue]) {
            if ([[self.snakesLaddersDict objectForKey:specialSquare] integerValue] > currentPlayer.currentSquare) {
                currentPlayer.currentSquare = [[self.snakesLaddersDict objectForKey:specialSquare] integerValue];
                NSLog(@"%@ rolled a %ld, which landed on a ladder. You climbed to square %ld.",currentPlayer.name, rollValue, currentPlayer.currentSquare);
            } else {
                currentPlayer.currentSquare = [[self.snakesLaddersDict objectForKey:specialSquare] integerValue];
                NSLog(@"%@ rolled a %ld, which landed on a snake. You slide down to square %ld", currentPlayer.name, rollValue, currentPlayer.currentSquare);
            }
        } else {
            NSLog(@"%@ rolled a %ld and is now on square %ld", currentPlayer.name, rollValue, currentPlayer.currentSquare);
        }
    }

    [self currentPlayer];
    if (self.currentIndex == self.playerArray.count - 1) {
        self.currentIndex = 0;
    } else {
    self.currentIndex++;
    }
}

- (Player *)currentPlayer {
    return self.playerArray[self.currentIndex % (self.currentIndex + 1)];
}

@end
