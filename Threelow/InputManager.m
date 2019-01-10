//
//  InputManager.m
//  Threelow
//
//  Created by Spencer Symington on 2019-01-09.
//  Copyright © 2019 Penjat. All rights reserved.
//

#import "InputManager.h"

@implementation InputManager
+(NSString*)getUserInput{
    
    
    
    
    //get their input
    char answerInput[50];
    fgets(answerInput,50,stdin);
    
    NSString * answerString = [NSString stringWithCString:answerInput encoding:NSUTF8StringEncoding];
    answerString = [answerString stringByTrimmingCharactersInSet: [NSCharacterSet whitespaceAndNewlineCharacterSet]];
    
    return answerString;
}
@end
