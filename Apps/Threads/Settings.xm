#import "../../AFSocialRootViewController.h"
#import "Threads.h"

%group HooksThreadsSettings

// Class: 
// method: - (void)​viewDidLoad


@interface _TtC17IGTextFeedProfile31IGTextFeedProfileViewController : UIViewController
@property (strong) UIButton *TxCSettingButton;
@end 

%hook _TtC17IGTextFeedProfile31IGTextFeedProfileViewController
%property (strong) UIButton *TxCSettingButton;
- (void)viewDidLoad{
    %orig;


self.TxCSettingButton = [UIButton buttonWithType:UIButtonTypeContactAdd];
self.TxCSettingButton.tag = 482;
[self.TxCSettingButton addTarget:self action:@selector(TxCOpenSettings) forControlEvents:UIControlEventTouchUpInside];
[self.TxCSettingButton setImage:[TxCManagerHelper TxCImage:@"gear"] forState:UIControlStateNormal];
@try {
[self.TxCSettingButton setTintColor:[UIColor labelColor]];
}@catch(NSException*e){
}
self.TxCSettingButton.frame = CGRectMake(self.view.frame.size.width - 35 - 10, 350.0, 30.0, 30.0);
[self.view addSubview:self.TxCSettingButton];

}
%new
-(void)TxCOpenSettings{
    UINavigationController *TikTokTxCSettings = [[UINavigationController alloc] initWithRootViewController:[[AFSocialRootViewController alloc] init]];
[TxCShowView() presentViewController:TikTokTxCSettings animated:true completion:nil];
}
%end 
%end 
%ctor{
if(BUNDLEIDEQUALS(@"com.burbn.barcelona")){
%init(HooksThreadsSettings);
}
}