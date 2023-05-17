//
//  Timer.m
//  CounterView
//
//  Created by HPDOG on 2022/8/23.
//

#import "Timer.h"

@interface Timer()

@property (nonatomic,assign) double countUpNum;
@property (nonatomic,assign) float counter;

@end

@implementation Timer

- (id)initToDate:(NSDate *)date
{
    if (date) {
        _date = date;
    }
    return self;
}

- (void)updateTimer
{
    NSTimeInterval remainingSeconds = [self.date timeIntervalSinceNow];
    
    [self createTimer:0.29 target:@selector(updateTimer)];
    
    if (remainingSeconds <= 0) {
        [self closeTimer];
        return;
    }
    NSString *strValue=[NSString stringWithFormat:@"%0.2f", remainingSeconds];
    NSArray *cutArr = [strValue componentsSeparatedByString:@"."];
    
    NSInteger hours = remainingSeconds / 3600;
    NSInteger remaining = ((NSInteger)remainingSeconds) % 3600;
    NSInteger minutes = remaining / 60;
    NSInteger seconds = remaining % 60;
    if ([self.delegate respondsToSelector:@selector(timerDidUpdateToHour:minutes:seconds:millisecond:)]) {
        [self.delegate timerDidUpdateToHour:hours minutes:minutes seconds:seconds  millisecond:[[cutArr objectAtIndex:1]integerValue]];
    }
}

- (void)closeTimer {
    if([self.timer isValid]){
        [self.timer invalidate];
    }
}

-(void)createTimer:(NSTimeInterval)timer target:(SEL)target{
    if (!self.timer) {
        self.timer = [NSTimer scheduledTimerWithTimeInterval:timer target:self selector:target userInfo:nil repeats:YES];
        [[NSRunLoop mainRunLoop] addTimer:self.timer forMode: NSRunLoopCommonModes];
    }
}

-(void)countUp{
    int x = 0;
    if (self.countUpNum == 0) {
        self.countUpNum = 1;
        self.counter = 2;
        
    }
    
    self.counter+=0.1;
    [self createTimer:0.01 target:@selector(countUp)];
    
    if ([self.countUpStr doubleValue] <= self.countUpNum) {
        [self closeTimer];
        if ([self.delegate respondsToSelector:@selector(countUpDidFinish:)]) {
            [self.delegate countUpDidFinish:self.countUpStr];
        }
        return;
    }
    
    if ([self.delegate respondsToSelector:@selector(countUpDidFinish:)]) {
        [self.delegate countUpDidFinish:[NSString stringWithFormat:@"%.2f",self.countUpNum]];
    }

    self.countUpNum += [self.countUpStr doubleValue] > 10000?pow(2,self.counter):pow(2,self.counter)/100;
}
@end
