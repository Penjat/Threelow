//
//  Dice.m
//  Threelow
//
//  Created by Spencer Symington on 2019-01-09.
//  Copyright © 2019 Penjat. All rights reserved.
//

#import "Dice.h"

@implementation Dice
-(void)roll{
    self.rollValue = @(arc4random_uniform(6)+1);
}
@end
