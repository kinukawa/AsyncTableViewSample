//
//  RootViewController.h
//  AsyncTable
//
//  Created by kenji kinukawa on 11/03/24.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Downloader.h"
@interface RootViewController : UITableViewController {
    NSMutableDictionary * imageCache;
    NSMutableDictionary * downloaderManager;
    
}
@property (nonatomic,retain) NSMutableDictionary * imageCache; 
@property (nonatomic,retain) NSMutableDictionary * downloaderManager; 
@end
