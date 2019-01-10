//
//  DiceManager.m
//  Threelow
//
//  Created by Spencer Symington on 2019-01-09.
//  Copyright © 2019 Penjat. All rights reserved.
//

#import "DiceManager.h"
#import "Dice.h"

@implementation DiceManager
- (instancetype)init
{
    self = [super init];
    if (self) {
        self.diceArray = [[NSArray alloc] init];
        self.diceInPlay = [[NSMutableArray alloc] init];
        
        for(int i=0;i<5;i++){
            Dice * dice = [[Dice alloc] init];
            
            self.diceArray = [self.diceArray arrayByAddingObject:dice];
            
            self.diceImages = @{@1:@"1⚀" ,@2:@"2⚁" ,@3:@"3⚂" ,@4:@"4⚃" ,@5:@"5⚄" ,@6:@"6⚅" };
        }
    }
    return self;
}
-(void)newGame{
    //resets the dice and adds them to diceInPlay
    self.diceInPlay = [self.diceArray mutableCopy];
    for (Dice * dice in _diceInPlay) {
        [dice setIsHeld:false];
        [dice roll];
    }
}
-(NSString*)getStatus{
    NSString * rollOutput = [[NSString alloc] init];
    
    for (Dice * dice in self.diceInPlay) {
        
        NSNumber * rollValue = [dice rollValue];
        NSString * diceImage = [self.diceImages objectForKey:rollValue];
        if([dice isHeld]){
            rollOutput = [rollOutput stringByAppendingString:@"["];
            rollOutput = [rollOutput stringByAppendingString:diceImage];
            rollOutput = [rollOutput stringByAppendingString:@"] "];
        }else{
            rollOutput = [rollOutput stringByAppendingString:diceImage];
            rollOutput = [rollOutput stringByAppendingString:@" "];
        }
    }
    return rollOutput;
}
-(NSString*)rollAvailableDice{
    NSString * rollOutput = [[NSString alloc] init];
    
    for (Dice * dice in self.diceInPlay) {
        [dice roll];
        NSNumber * rollValue = [dice rollValue];
        NSString * diceImage = [self.diceImages objectForKey:rollValue];
        if([dice isHeld]){
            rollOutput = [rollOutput stringByAppendingString:@"["];
            rollOutput = [rollOutput stringByAppendingString:diceImage];
            rollOutput = [rollOutput stringByAppendingString:@"] "];
        }else{
            rollOutput = [rollOutput stringByAppendingString:diceImage];
            rollOutput = [rollOutput stringByAppendingString:@" "];
        }
    }
    return rollOutput;
}
-(BOOL)diceAt:(NSNumber *)index hold:(BOOL)hold{
    //TODO could return a bool
    if(([index integerValue] > _diceInPlay.count) || [index integerValue] < 1){
        return NO;//was not sucsessful
    }
    Dice * dice = [_diceInPlay objectAtIndex:([index integerValue]-1) ];
    [dice setIsHeld:hold];
    return YES;//sucsessful
}
-(BOOL)removeHeld{
    BOOL heldAtLeastOne = NO;
    for (Dice * dice in _diceArray) {
        if([dice isHeld]){
            [self.diceInPlay removeObject:dice];
            heldAtLeastOne = YES;
        }
    }
    return heldAtLeastOne;
}
-(BOOL)checkGameOver{
    if(_diceInPlay.count == 0){
        return YES;
    }
    return NO;
}
-(NSNumber*)calculateScore{
    NSNumber * score = @0;
    for (Dice * dice in _diceArray) {
        if([[dice rollValue] integerValue] != 3){
            //add nothing if the roll is 3
            score = @( [[dice rollValue] integerValue] + [score integerValue]);
        }
    }
    return score;
}
@end
