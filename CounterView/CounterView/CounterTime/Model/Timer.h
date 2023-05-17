//
//  Timer.h
//  CounterView
//
//  Created by HPDOG on 2022/8/23.
//

#import <UIKit/UIKit.h>
#import <Foundation/Foundation.h>

@protocol TimeDelegate <NSObject>

- (void)timerDidUpdateToHour: (NSInteger)hours minutes: (NSInteger)minutes seconds: (NSInteger)seconds millisecond:(NSInteger)millisecond;
- (void)timerDidFinishCounting:(NSString*)resMag;
- (void)countUpDidFinish:(NSString*)number;

@end

@interface Timer : NSObject

@property (strong, nonatomic) NSDate *date;
@property (strong, nonatomic) NSTimer *timer;
@property (nonatomic,strong) NSString *countUpStr;
@property id <TimeDelegate> delegate;

- (void)updateTimer;
- (void)closeTimer;
- (void)countUp;
@end
