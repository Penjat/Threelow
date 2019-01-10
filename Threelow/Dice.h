//
//  Dice.h
//  Threelow
//
//  Created by Spencer Symington on 2019-01-09.
//  Copyright © 2019 Penjat. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface Dice : NSObject
@property (nonatomic,strong) NSNumber * rollValue;
@property  BOOL isHeld;
-(void)roll;

@end

NS_ASSUME_NONNULL_END
