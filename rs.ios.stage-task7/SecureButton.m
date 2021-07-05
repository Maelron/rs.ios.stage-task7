//
//  SecureButton.m
//  rs.ios.stage-task7
//
//  Created by alex on 4.07.21.
//

#import "SecureButton.h"

@implementation SecureButton

- (void)customize {
    self.clipsToBounds = YES;
    self.layer.cornerRadius = self.frame.size.height / 2.0;
    self.layer.borderWidth = 1.5;
    self.layer.borderColor = [UIColor colorNamed:@"blue"].CGColor;
    
}

- (UIView *)hitTest:(CGPoint)point withEvent:(UIEvent *)event {
    if (CGRectContainsPoint([self contentRectForBounds:self.bounds], point)) {
        return self;
    }
    return nil;
}

- (void)setHighlighted:(BOOL)highlighted {
    [super setHighlighted:highlighted];
    
    if (highlighted) {
        self.backgroundColor = [[UIColor colorNamed:@"blue"] colorWithAlphaComponent:0.2];
    } else {
        self.backgroundColor = [UIColor whiteColor];
    }
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
