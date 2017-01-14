//
//  Player.m
//  SnakesAndLadders
//
//  Created by Chris Jones on 2017-01-14.
//  Copyright © 2017 Jonescr. All rights reserved.
//

#import "Player.h"


@implementation Player

- (instancetype)init
{
    self = [super init];
    if (self) {
        _currentSquare = 0;
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
        _gameOver = NO;
    }
    return self;
}

-(void)rollDie {
    NSInteger rollValue = arc4random_uniform(6) + 1;
    self.currentSquare += rollValue;
    NSNumber *specialSquare = [NSNumber numberWithInteger:self.currentSquare];
    
    if (self.currentSquare >= 100) {
        NSLog(@"You passed square 100. Congratulations!!! You are the champion of the world!!");
        self.gameOver = YES;
    } else {
    
    if ([[self.snakesLaddersDict objectForKey:specialSquare] integerValue]) {
        if ([[self.snakesLaddersDict objectForKey:specialSquare] integerValue] > self.currentSquare) {
            self.currentSquare = [[self.snakesLaddersDict objectForKey:specialSquare] integerValue];
            NSLog(@"You rolled a %ld, which landed on a ladder. You climbed to square %ld.", rollValue, self.currentSquare);
        } else {
            self.currentSquare = [[self.snakesLaddersDict objectForKey:specialSquare] integerValue];
            NSLog(@"You rolled a %ld, which landed on a snake. You slide down to square %ld", rollValue, self.currentSquare);
        }
    } else {
    NSLog(@"You rolled a %ld. You are now on square %ld", rollValue, self.currentSquare);
    }
}
}

@end
