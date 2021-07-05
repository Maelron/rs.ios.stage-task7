//
//  AuthorizeButton.m
//  rs.ios.stage-task7
//
//  Created by alex on 4.07.21.
//

#import "AuthorizeButton.h"


@implementation AuthorizeButton

- (void)customize {
    self.layer.borderWidth = 1.5;
    self.layer.borderColor = [UIColor colorNamed:@"blue"].CGColor;
    self.layer.cornerRadius = 10.0;
    
    [self setImage:[UIImage imageNamed:@"troll"] forState:UIControlStateNormal];
    [self setImage:[UIImage imageNamed:@"troll fill"] forState:UIControlStateHighlighted];
    [self setImageEdgeInsets:UIEdgeInsetsMake(10.0, 20.0, 10.0, 5.0)];
    [self setTitleEdgeInsets:UIEdgeInsetsMake(10.0, 30.0, 10.0, 20.0)];
    self.titleLabel.minimumScaleFactor = 0.5;
    self.titleLabel.adjustsFontSizeToFitWidth = YES;
}

- (void)setHighlighted:(BOOL)highlighted {
    [super setHighlighted:highlighted];
    
    if (highlighted) {
        self.backgroundColor = [[UIColor colorNamed:@"blue"] colorWithAlphaComponent:0.2];
        self.titleLabel.alpha = 0.4;
        
    } else {
        self.backgroundColor = [UIColor whiteColor];
        self.titleLabel.alpha = 1.0;
        
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
