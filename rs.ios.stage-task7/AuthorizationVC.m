//
//  AuthorizationVC.m
//  rs.ios.stage-task7
//
//  Created by alex on 3.07.21.
//

#import "AuthorizationVC.h"
#import "AuthorizeButton.h"
#import "SecureButton.h"

@interface AuthorizationVC () <UITextFieldDelegate>

@property (weak, nonatomic) IBOutlet UITextField *loginTF;
@property (weak, nonatomic) IBOutlet UITextField *passwordTF;
@property (weak, nonatomic) IBOutlet AuthorizeButton *authorizeButton;

@property (weak, nonatomic) IBOutlet UIView *secureView;
@property (weak, nonatomic) IBOutlet UILabel *secureLabel;
@property (strong, nonatomic) IBOutletCollection(UIButton) NSArray *secureButtons;


@end

@implementation AuthorizationVC

- (void)viewDidLoad {
    [super viewDidLoad];
   
    self.secureView.hidden = YES;
    
    for (SecureButton *button in self.secureButtons) {
        [button customize];
    }
    
    [self initialTextFieldCustomization:self.loginTF];
    [self initialTextFieldCustomization:self.passwordTF];
    [self.authorizeButton customize];
    
//    keyboard dissmissing
    UITapGestureRecognizer *gestureRecognizer = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(dissmissKeyboad)];
    [self.view addGestureRecognizer:gestureRecognizer];
}


//MARK: IBActions

- (IBAction)authorizeClicked:(UIButton *)sender {
//    login: username       pass: password
    [self.passwordTF resignFirstResponder];
    [self.loginTF resignFirstResponder];

    if ([self.loginTF.text isEqualToString:@"username"] && [self.passwordTF.text isEqualToString:@"password"]) {
        self.loginTF.layer.borderColor = [UIColor colorNamed:@"green"].CGColor;
        self.passwordTF.layer.borderColor = [UIColor colorNamed:@"green"].CGColor;
        
        [self disableComponents:YES];
        return;
    }
    
    if (![self.loginTF.text isEqualToString:@"username"]) {
        self.loginTF.layer.borderColor = [UIColor colorNamed:@"red"].CGColor;
    }
    
    if (![self.passwordTF.text isEqualToString:@"password"]) {
        self.passwordTF.layer.borderColor = [UIColor colorNamed:@"red"].CGColor;
    }
       
    if ([self.loginTF.text isEqualToString:@"username"] && ![self.passwordTF.text isEqualToString:@"password"]) {
        [self textFieldDidBeginEditing:self.passwordTF];
        self.passwordTF.layer.borderColor = [UIColor colorNamed:@"red"].CGColor;
    }
    
    if (![self.loginTF.text isEqualToString:@"username"] && [self.passwordTF.text isEqualToString:@"password"]) {
        [self textFieldDidBeginEditing:self.loginTF];
        self.loginTF.layer.borderColor = [UIColor colorNamed:@"red"].CGColor;
    }
}

- (IBAction)secureButtonClicked:(UIButton *)sender {
    NSString *tmpString = [[NSString alloc] initWithString:sender.titleLabel.text];
    if ([self.secureLabel.text isEqualToString:@"-"]) {
        self.secureView.layer.borderColor = [UIColor whiteColor].CGColor;
        self.secureLabel.text = sender.titleLabel.text;
        return;
    }
    
    if (self.secureLabel.text.length < 3) {
        self.secureLabel.text = [self.secureLabel.text stringByAppendingString:tmpString];
    }
    
    if ([self.secureLabel.text isEqualToString:@"132"]) {
        self.secureView.layer.borderWidth = 2.0;
        self.secureView.layer.cornerRadius = 10.0;
        self.secureView.layer.borderColor = [UIColor colorNamed:@"green"].CGColor;
        
        UIWindow* window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
        window.rootViewController = [UIViewController new];
        window.windowLevel = UIWindowLevelAlert + 1;
        
        UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"Welcome" message:@"You are successfuly authorized!" preferredStyle:UIAlertControllerStyleAlert];
        
        [alertController addAction: [UIAlertAction actionWithTitle:@"Refresh" style:UIAlertActionStyleDestructive handler:^(UIAlertAction * _Nonnull action) {
            
            [self disableComponents:NO];

            self.secureLabel.text = @"-";
            self.loginTF.text = nil;
            self.passwordTF.text = nil;
            self.loginTF.layer.borderColor = [UIColor colorNamed:@"coral"].CGColor;
            self.passwordTF.layer.borderColor = [UIColor colorNamed:@"coral"].CGColor;
            self.secureView.layer.borderColor = [UIColor whiteColor].CGColor;
            window.hidden = YES;
        }]];
        
        [window makeKeyAndVisible];
        [window.rootViewController presentViewController:alertController animated:YES completion:nil];
        
    } else if (self.secureLabel.text.length == 3) {
        self.secureView.layer.borderWidth = 2.0;
        self.secureView.layer.cornerRadius = 10.0;
        self.secureView.layer.borderColor = [UIColor colorNamed:@"red"].CGColor;
        self.secureLabel.text = @"-";
        
    }
}


//MARK: supporting methods

- (void)disableComponents:(BOOL)disableState {
    
    if (disableState) {
        self.loginTF.enabled = NO;
        self.passwordTF.enabled = NO;
        self.authorizeButton.userInteractionEnabled = NO;
        
        self.loginTF.alpha = 0.5;
        self.passwordTF.alpha = 0.5;
        self.authorizeButton.alpha = 0.5;
        
        self.secureView.hidden = NO;
    } else {
        self.loginTF.enabled = YES;
        self.passwordTF.enabled = YES;
        self.authorizeButton.userInteractionEnabled = YES;

        
        self.loginTF.alpha = 1.0;
        self.passwordTF.alpha = 1.0;
        self.authorizeButton.alpha = 1.0;
        
        self.secureView.hidden = YES;
    }
}

- (void)initialTextFieldCustomization:(UITextField *)textField {
    textField.layer.borderWidth = 1.5;
    textField.layer.cornerRadius = 5.0;
    textField.layer.borderColor = [UIColor colorNamed:@"coral"].CGColor;
}


// MARK: textField methods

- (void)textFieldDidBeginEditing:(UITextField *)textField {
    textField.layer.borderColor = [UIColor colorNamed:@"coral"].CGColor;
    textField.text = nil;
}


- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    [textField resignFirstResponder];
    
    return YES;
}

- (void)dissmissKeyboad {
    NSLog(@"end editing");
    [self.view endEditing:YES];
}



@end
