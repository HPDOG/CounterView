//
//  CountUpView.h
//  CounterView
//
//  Created by HPDOG on 2022/8/23.
//

#import <UIKit/UIKit.h>
#import <Masonry.h>

typedef NS_ENUM(NSInteger, CountUpViewType) {
    CountUpViewType_Normal              = 1,
    CountUpViewType_AddComma               ,
};

@interface CountUpView : UIView

@property (nonatomic,strong) UILabel *countUpLab;
@property (nonatomic,strong) NSString *countUpStr;
@property (nonatomic,assign) CountUpViewType countUpViewType;

- (void)setUI;
- (void)closeTimer;
- (void)startTimer;

@end
