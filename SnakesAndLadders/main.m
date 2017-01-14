//
//  main.m
//  SnakesAndLadders
//
//  Created by Chris Jones on 2017-01-14.
//  Copyright © 2017 Jonescr. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "InputCollector.h"
#import "Player.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        
        NSLog(@"Welcome to Snakes or Ladders. You know the rules.\n\nEnter 'r' or 'roll' to roll the dice. Good luck!");
        
        Player *player = [Player new];
        
        while (!player.gameOver) {
            NSString *userInput = [InputCollector collectInput];
            if([userInput isEqualToString:@"r"] || [userInput isEqualToString:@"roll"]){
                [player rollDie];
            }
        
        
        }
    }
    return 0;
}
