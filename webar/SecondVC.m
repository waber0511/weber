#import "SecondVC.h"

@interface SecondVC () <UITextFieldDelegate>


@property (retain, nonatomic)  UITextField *locationTextField;

@property(retain,nonatomic) UIButton *button;

@end

@implementation SecondVC

- (void)viewDidLoad {
    [super viewDidLoad];
    self.locationTextField.delegate = self;
    
    _locationTextField = [[UITextField alloc]initWithFrame:CGRectMake(0,0,200,200)];
    _button = [[UIButton alloc]initWithFrame:CGRectMake(200, 200, 200, 200)];
    [self.button addTarget:self action:@selector(btnClick) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:_locationTextField];
    [self.view addSubview:_button];
    
}


-(void)btnClick{
    [self.locationTextField resignFirstResponder];
    NSUInteger index = [self.locationTextField.text integerValue];
    
    [self.commonDelegate changeBROptionsButtonLocaitonTo:index animated:YES];
}


#pragma mark - UItextField
- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    [self.locationTextField resignFirstResponder];
    return YES;
}

@end
