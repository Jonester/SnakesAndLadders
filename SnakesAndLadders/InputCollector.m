//
//  InputCollector.m
//  SnakesAndLadders
//
//  Created by Chris Jones on 2017-01-14.
//  Copyright © 2017 Jonescr. All rights reserved.
//

#import "InputCollector.h"

@implementation InputCollector

+(NSString *)collectInput {
    char input [255];
    fgets(input, 255, stdin);
    return [[NSString stringWithCString:input encoding:NSUTF8StringEncoding]stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
}

@end
