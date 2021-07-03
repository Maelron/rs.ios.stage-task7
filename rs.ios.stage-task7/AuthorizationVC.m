//
//  AuthorizationVC.m
//  rs.ios.stage-task7
//
//  Created by alex on 3.07.21.
//

#import "AuthorizationVC.h"

@interface AuthorizationVC ()

@property (weak, nonatomic) IBOutlet UITextField *loginTF;
@property (weak, nonatomic) IBOutlet UITextField *passwordTF;

@end

@implementation AuthorizationVC

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    self.loginTF.layer.borderColor = [UIColor colorNamed:@"Black Coral"].CGColor;
    self.loginTF.layer.borderWidth = 1.5;
    self.loginTF.layer.cornerRadius = 5.0;
    
    self.passwordTF.layer.borderColor = [UIColor colorNamed:@"Black Coral"].CGColor;
    self.passwordTF.layer.borderWidth = 1.5;
    self.passwordTF.layer.cornerRadius = 5.0;
    
}


@end
