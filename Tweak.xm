#import "NTContactsUtil.h"
#import "MaiMaiClient.h"
#import "NTGossipModel.h"
#import "NTGossipInfoViewController.h"
#import "NTGlobalData.h"
#import "RACSubscriber.h"
#import "RACDynamicSignal.h"
#import "RACSignal.h"


%hook   NTAppDelegate


-(BOOL)application:(id)application didFinishLaunchingWithOptions:(id)options {

	%log;

	%orig;

	NSLog(@" =========================   OK    ========================");


	id someobj = [%c(NTContactsUtil) getDist1Contacts];
	NSLog(@" obj :  %@",someobj);


	id om =  [%c(NTContactsUtil) getDist1ContactsByMMIDs:@[@"3180",@"u12372540734003",@"u144221354572539"]];
	NSLog(@" %@  ",om);


	return YES;
}


%end


%hook NTGossipInfoViewController


typedef void (^block)(id model);


-(void)reloadGossipTagButtons:(int)buttons {
	%log;
	%orig;

	NTGossipInfoViewController *vc = self;
	NTGossipModel* ginfo = vc.gossipinfo;
	NSLog(@"mmid : %@",ginfo.mmid);

	// Get ID: 
	MaiMaiClient *mclient = [%c(MaiMaiClient) sharedClient];

	id userinfo = [mclient rac_getUserProfileWithMMId:ginfo.mmid getMobile:YES];
	NSLog(@"info : %@",userinfo);

	RACDynamicSignal * m = (RACDynamicSignal * )[mclient rac_getContactDetailWithMMid:ginfo.mmid cacheMode:2 messageId:5582039];
        NSLog(@" Response : %@",m);
	[m invalidateGlobalRefIfNoNewSubscribersShowUp];
	
	NSLog(@"didSubscribe : %@",[m didSubscribe]);
	
	//id blocks = ^(id model){
	//	NSLog(@"model: %@", model);
	// };
	
	NSLog(@"bol: %d",[m hasSubscribers]);

	RACSubscriber *subscriber = [ %c(RACSubscriber) subscriberWithNext:^(id x) {
    		NSLog(@"next:%@", x);
			

       	} error:nil completed:^(id y){
          	NSLog(@"completed %@",y);
	    }];
	//[m subscribeNext:subscriber];
	[subscriber sendNext:[m didSubscribe]];
	
	NSLog(@"any %@",[m any]);
	[m doNext:^(id model){
		NSLog(@"m : %@",model);	
	}];

//	RACSubscriber *sb = (RACSubscriber *) [m didSubscribe];
	//[sb  sendNext:^(id model){
	//	NSLog(@"RACSubscriber : %@",model);
	//} ];
	

	id om =  [%c(NTContactsUtil) getDist1ContactsByMMIDs:@[ginfo.mmid]];
	NSLog(@"om: %@ ",om);

 	NTGlobalData *gldata = [%c(NTGlobalData) getInstance];
	id info = [gldata getUserByMMID:ginfo.mmid];	
	NSLog(@"info: %@", info);


}

%end
