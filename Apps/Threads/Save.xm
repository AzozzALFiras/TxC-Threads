#import "Threads.h"



%group HookThreads
%hook HolaThreads_
- (void)setIsPresented:(BOOL)arg1{
NSLog(@"TxCShowView %@",TxCShowView());
}
%end 

%hook IGVideoView
- (void)layoutSubviews{
%orig;

UIView* contentView = self;


UIImage *Save = [TxCManagerHelper TxCImage:@"square.and.arrow.down"];
UIImage *View = [TxCManagerHelper TxCImage:@"eye.fill"];

if([TxCManagerHelper TxCGetSettings:@"SAVE_VIDEO_THREADS"]){
[TxCManagerHelper TxCButtonBarPost:Save  Width:2.3 InView:contentView Target:self Action:@selector(SavePost)];
}
if([TxCManagerHelper TxCGetSettings:@"PIP_VIDEO_THREADS"]){
[TxCManagerHelper TxCButtonBarPost:View  Width:3.3 InView:contentView Target:self Action:@selector(ViewPost)];
}

}
%new
-(void)SavePost{
   
IGVideo *video;
NSArray *videoURLArray;

@try {
video = [self video];
videoURLArray = MSHookIvar<NSArray*>(video,"_videoVersionDictionaries");
}@catch(NSException*e){
}
if(videoURLArray !=nil){
[TxCManagerHelper SaveVideoPost:videoURLArray];
}
}
%new 
-(void)ViewPost{
       
IGVideo *video;
NSArray *videoURLArray;

@try {
video = [self video];
videoURLArray = MSHookIvar<NSArray*>(video,"_videoVersionDictionaries");
}@catch(NSException*e){
}
if(videoURLArray !=nil){
[TxCManagerHelper ViewVideoPost:videoURLArray];
}
}
%end 



// Copy Caption & Comment's & Bio
%hook IGCoreTextView
- (void)_handleLongTap{
if([TxCManagerHelper TxCGetSettings:@"COPY_TEXT_THREADS"]){
NSString *text = [self text];
if(text !=nil){
[TxCManagerHelper CopyTextItem:@"AFSocial 2" Item:text Point:@"2"];
}
}
}
%end 

// Confrim Like 
%hook IGUFIButtonBarView
- (void)_onLikeButtonPressed:(id)arg1{
if([TxCManagerHelper TxCGetSettings:@"CONFRIM_LIKE_THREADS"]){
[TxCManagerHelper ConfrimLikeButton:(^(void) { %orig; })];
} else{
%orig;
}
}
%end 


// Copying profile information
%hook IGProfilePictureImageView
- (void)_tapped:(id)arg1{

%orig;

if([TxCManagerHelper TxCGetSettings:@"COPYING_PROFILE_INFO_THREADS"]){
NSString *Username = nil;
NSString *BioUser = nil;
NSURL *profilePicURL = nil;
NSURL *biourl = nil;
NSString *fullName = nil;
NSString *BioURLString = nil;
NSString *NickNameIGUser;
IGAPIUserBioLinkDict *BioLinkDict;
@try {
Username            = self.user.username;
BioUser             = self.user.biography;
profilePicURL       = [self.user HDProfilePicURL];
BioLinkDict         = self.user.bioLinks.firstObject;
biourl              = BioLinkDict.url;
fullName            = self.user.fullName;
BioURLString        = [NSString stringWithFormat:@"%@",biourl];


}@catch(NSException*e){
}

@try{
[TxCManagerHelper TxCDataProfile:@"Threads" Username:Username FullName:fullName Bio:BioUser BioLink:BioURLString ProfileImage:[NSString stringWithFormat:@"%@",profilePicURL]];

}@catch(NSException*e){
}
}
}
%end
%end 
%ctor{
if(BUNDLEIDEQUALS(@"com.burbn.barcelona")){
%init(HookThreads);
}
}