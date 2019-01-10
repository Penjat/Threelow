//
//  main.m
//  Threelow
//
//  Created by Spencer Symington on 2019-01-09.
//  Copyright © 2019 Penjat. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Dice.h"
#import "DiceManager.h"
#import "InputManager.h"





int main(int argc, const char * argv[]) {
    @autoreleasepool {
        
        
        
        
        DiceManager * diceManager = [[DiceManager alloc] init];
        
        NSNumber * scoreToBeat = @30;//max value for five dice
        
        NSLog(@"Welcome to Threelow");
        
        
        [diceManager newGame];
        
            
        
        while(true){
            //check if game over
            if([diceManager checkGameOver]){
                //TODO calculate score
                NSNumber * score = [diceManager calculateScore];
                if([score integerValue] < [scoreToBeat integerValue]){
                    NSLog(@"GAME OVER. New Best Score: %@!!!",score);
                    scoreToBeat = score;
                }else{
                    NSLog(@"GAME OVER. Your score was %@ and the best score so far is %@",score , scoreToBeat);
                }
                
                NSLog(@"Play again? (y/n)");
                NSString * playAgain = [InputManager getUserInput];
                if([playAgain isEqualToString:@"y"]){
                    NSLog(@"starting new game...");
                    [diceManager newGame];
                }else{
                    NSLog(@"goodbye");
                    return 0;
                }
            }
            
            NSLog(@"%@" , [diceManager getStatus]);
            NSString * userInput = [InputManager getUserInput];
            
            if ([userInput isEqualToString:@"roll"]){
                //TODO check if player has selected a dice yet
                if(![diceManager removeHeld]){
                    NSLog(@"must hold at least one die before rolling");
                    continue;
                }
                [diceManager rollAvailableDice];
                
            }else if ([userInput rangeOfString:@"hold"].location == 0){
                NSArray * userInputs = [userInput componentsSeparatedByString:@" "];
                if(userInputs.count < 2){
                    NSLog(@"please select which die you would like to hold");
                    continue;
                    
                }
                NSNumber * dieNumber = @([userInputs[1] integerValue]);
                if(![diceManager diceAt:dieNumber hold:YES]){
                    NSLog(@"invalid entry");
                }
                //hold the die, check if in range
            }else if ([userInput rangeOfString:@"unhold"].location == 0){
                NSArray * userInputs = [userInput componentsSeparatedByString:@" "];
                if(userInputs.count < 2){
                    NSLog(@"please select which die you would like to hold");
                    continue;
                    
                }
                NSNumber * dieNumber = @([userInputs[1] integerValue]);
                if(![diceManager diceAt:dieNumber hold:NO]){
                    NSLog(@"invalid entry");
                }
                //hold the die, check if in range
            }else if([userInput isEqualToString:@"new"]){
                [diceManager newGame];
                NSLog(@"%@",[diceManager rollAvailableDice]);
                NSLog(@"choose a die to hold");
                //check if valid
                
            }
            else if ([userInput isEqualToString:@"cheat code"]){
                for (Dice * dice in [diceManager diceArray]) {
                    [dice setRollValue:@3];
                    [dice setIsHeld:YES];
                    [diceManager removeHeld];
                }
            }
            
            
        }
        
    }
    return 0;
}
