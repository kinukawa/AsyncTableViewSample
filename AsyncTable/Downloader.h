//
//  Downloader.h
//  AsyncTable
//
//  Created by kenji kinukawa on 11/03/24.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol DownloaderDelegate;

@interface Downloader : NSObject {
    NSMutableData * buffer;
	id <DownloaderDelegate> delegate;
	id identifier;
}

-(bool)get:(NSURL*)url;

@property (nonatomic,assign) id delegate;
@property (nonatomic,retain) NSMutableData * buffer;
@property (nonatomic,retain) id identifier;
@end

@protocol DownloaderDelegate<NSObject>
-(void)downloader:(NSURLConnection *)conn didLoad:(NSMutableData *)data identifier:(id)identifier;
@end

