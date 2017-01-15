//
//  main.m
//  SnakesAndLadders
//
//  Created by Chris Jones on 2017-01-14.
//  Copyright © 2017 Jonescr. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "InputCollector.h"
#import "Manager.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        
        Manager *gameManager = [Manager new];
        
        while (gameManager.playerArray.count == 0) {
            
        NSLog(@"Welcome to Snakes or Ladders. You know the rules.\n\nEnter 'r' or 'roll' to roll the dice. Good luck!\n\nEnter 'quit' at any time to quit the game. \n\nFirst of all, how many players will be playing? (Max: 8)");
        NSString *playersInput = [InputCollector collectInput];
            NSInteger numberInput = [playersInput integerValue];
        if (numberInput) {
            [gameManager createPlayers:numberInput];
            gameManager.gameOver = NO;
        }
}
    
        while (!gameManager.gameOver) {
            NSLog(@"It's Player %ld's turn. Please roll the dice.", gameManager.currentIndex + 1);
            NSString *userInput = [InputCollector collectInput];
            if([userInput isEqualToString:@"r"] || [userInput isEqualToString:@"roll"]){
                [gameManager roll];
            }
            if ([userInput isEqualToString:@"quit"]) {
                gameManager.gameOver = YES;
            }
    }
}
    return 0;
}
