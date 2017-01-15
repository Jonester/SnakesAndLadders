//
//  Manager.h
//  SnakesAndLadders
//
//  Created by Chris Jones on 2017-01-14.
//  Copyright © 2017 Jonescr. All rights reserved.
//

#import <Foundation/Foundation.h>
@class Player;

@interface Manager : NSObject

@property (nonatomic, strong) NSMutableArray *playerArray;
@property (nonatomic, assign) BOOL gameOver;
@property (nonatomic, assign) NSInteger currentIndex;

- (Player *)currentPlayer;
- (void)createPlayers: (NSInteger)numberOfPlayers;
- (void)roll;

@end
