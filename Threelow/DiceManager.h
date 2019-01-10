//
//  DiceManager.h
//  Threelow
//
//  Created by Spencer Symington on 2019-01-09.
//  Copyright © 2019 Penjat. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Dice.h"

NS_ASSUME_NONNULL_BEGIN

@interface DiceManager : NSObject

//0 can not held
//1 held this turn
//2 held previous turn

@property (nonatomic,strong) NSArray<Dice*> * diceArray;//all the dice
@property (nonatomic,strong) NSMutableArray<Dice*> * diceInPlay;//the dice the player may hold or not
@property (nonatomic,strong) NSDictionary<NSNumber*,NSString*> * diceImages;

-(instancetype)init;
-(NSString*)rollAvailableDice;
-(void)newGame;
-(NSString*)getStatus;
-(BOOL)diceAt:(NSNumber*)index hold:(BOOL)hold;
-(BOOL)removeHeld;
-(BOOL)checkGameOver;
-(NSNumber*)calculateScore;

@end

NS_ASSUME_NONNULL_END
