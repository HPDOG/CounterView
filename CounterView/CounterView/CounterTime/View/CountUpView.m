//
//  CountUpView.m
//  CounterView
//
//  Created by HPDOG on 2022/8/23.
//

#import "CountUpView.h"
#import "Timer.h"


@interface CountUpView()<TimeDelegate>

@property (nonatomic,strong) Timer * countUpNew;

@end

@implementation CountUpView

-(void)setUI{
    self.countUpLab = [[UILabel alloc] init];
    [self addSubview:self.countUpLab];
    [self.countUpLab mas_makeConstraints:^(MASConstraintMaker *make) {
        [make edges];
    }];
    [self.countUpLab layoutIfNeeded];
}

- (void)closeTimer
{
    [self.countUpNew closeTimer];
}

- (void)startTimer {
    self.countUpNew = [[Timer alloc]init];
    self.countUpNew.delegate = self;
    self.countUpNew.countUpStr = self.countUpStr;
    [self.countUpNew countUp];
}

- (void)countUpDidFinish:(NSString*)number{
    NSString *format = [[NSString alloc] init];
    switch (self.countUpViewType) {
        case CountUpViewType_Normal:
            format = @"###";
            break;
        case CountUpViewType_AddComma:
            format = @"#,###";
            break;
            
        default:
            break;
    }
    NSNumberFormatter *numberFormatter = [[NSNumberFormatter alloc] init];
    [numberFormatter setPositiveFormat:format];
    self.countUpLab.text = [numberFormatter stringFromNumber:[NSNumber numberWithDouble:[number doubleValue]]];
}
@end



