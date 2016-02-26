
#import "MainTabBarController.h"
#import "BROptionsButton.h"
#import "FirstViewController.h"
#import "SecondVC.h"
#import "ThirdViewController.h"

@interface MainTabBarController ()<BROptionButtonDelegate, CommonDelegate>
@property (nonatomic, strong) BROptionsButton *brOptionsButton;
@end

@implementation MainTabBarController


- (void)viewDidLoad {
    [super viewDidLoad];
    
    //第一个界面
    FirstViewController *FVC  = [[FirstViewController  alloc]init];
    FVC.tabBarItem.title=@"12";
    UINavigationController *nav1 = [[UINavigationController alloc]initWithRootViewController:FVC];

    //第三个界面
    ThirdViewController *TVC = [[ThirdViewController alloc]init];
    TVC.tabBarItem.title=@"121";
    UINavigationController *nav3 = [[UINavigationController alloc]initWithRootViewController:TVC];
    
    //第二个特殊界面
    SecondVC *second = [[SecondVC alloc]init];
    self.viewControllers = @[nav1,second,nav3];
       
    second.commonDelegate = self;
	// Do any additional setup after loading the view.
    BROptionsButton *brOption = [[BROptionsButton alloc] initWithTabBar:self.tabBar forItemIndex:1 delegate:self];

    self.brOptionsButton = brOption;
    [brOption setImage:[UIImage imageNamed:@"Apple"] forBROptionsButtonState:BROptionsButtonStateNormal];
    [brOption setImage:[UIImage imageNamed:@"close"] forBROptionsButtonState:BROptionsButtonStateOpened];
     
    
    
}

#pragma mark - BROptionsButtonState

- (NSInteger)brOptionsButtonNumberOfItems:(BROptionsButton *)brOptionsButton {
    return 6;
}

- (UIImage*)brOptionsButton:(BROptionsButton *)brOptionsButton imageForItemAtIndex:(NSInteger)index {
    UIImage *image = [UIImage imageNamed:@"Apple"];
    return image;
}


- (void)brOptionsButton:(BROptionsButton *)brOptionsButton didSelectItem:(BROptionItem *)item {
    [self setSelectedIndex:brOptionsButton.locationIndexInTabBar];
}

#pragma mark - CommonDelegate 

- (void)changeBROptionsButtonLocaitonTo:(NSInteger)location animated:(BOOL)animated {
    if(location < self.tabBar.items.count) {
        [self.brOptionsButton setLocationIndexInTabBar:location animated:YES];
    } else {
        UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"" message:@"wrong index" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles: nil];
        [alert show];
    }
}

@end
