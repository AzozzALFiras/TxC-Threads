// Developer By : Azozz ALFiras
// Created At : Thu 6 Jul 2023


#import <objc/runtime.h>
#import <substrate.h>
#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#include "../../interface/TxCManagerHelper.h"
#import "../../TxCLibrary/azfencrpt.h"
#import "../../TxCLibrary/Base64.h"
#import "../../TxCLibrary/NSData+CommonCrypto.h"
#import "../../TxCLibrary/i7Miesho.h"


// Save Video 


@interface IGVideo : NSObject
@property (nonatomic, strong, readwrite) NSArray *videoVersionDictionaries;
@end 

@interface IGVideoView : UIView
@property (nonatomic, assign, readonly) IGVideo *video;
@end 


// Copy Any Text 
@interface IGCoreTextView : UIView
- (id)text;
@end 

// Copy Info Account
@interface IGBaseUser : NSObject
@property (nonatomic, assign, readonly) NSNumber *followerCount;
@property (nonatomic, assign, readonly) NSNumber *followingCount;
@property (nonatomic, strong, readwrite) NSNumber *mediaCount;
@property (nonatomic, strong, readwrite) NSArray *bioLinks;
@end

@interface IGUser : IGBaseUser
@property (strong) NSString* username;
@property (strong) NSString* biography;
@property (strong) NSString* fullName;
@property (strong) NSURL* externalURL;
@property (strong) NSURL* profilePicURL;
@property (strong) NSData* latestReelMediaDate;
- (NSURL *)HDProfilePicURL;
@property BOOL followsCurrentUser;
@end

@interface IGProfilePictureImageView : UIView
@property (nonatomic, assign, readonly) IGUser *user;
@end 
@interface IGAPIUserBioLinkDict : NSObject
- (id)url;
@end