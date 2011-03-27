//
//  Downloader.m
//  AsyncTable
//
//  Created by kenji kinukawa on 11/03/24.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "Downloader.h"


@implementation Downloader
@synthesize buffer;
@synthesize delegate;
@synthesize identifier;

- (void) dealloc {
	self.buffer = nil;
    self.delegate = nil;
    self.identifier = nil;
    [super dealloc];
}

//get
-(bool)get:(NSURL*)url{
	NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:url];
	
	[request setHTTPMethod:@"GET"];
	
	NSURLConnection *conn = [NSURLConnection connectionWithRequest:request delegate:self];
    if (conn) {
        self.buffer = [NSMutableData data];
		return YES;
	} else {
		return NO;		
	}	
}

//レスポンスデータ受信
- (void)connection:(NSURLConnection *)conn didReceiveData:(NSData *)receivedData {
	[self.buffer appendData:receivedData];
}


//エラー受信
-(void)connection:(NSURLConnection*)conn didFailWithError:(NSError*)error{
	NSLog(@"Connection failed! Error - %@ %d %@",
		  [error domain],
		  [error code],
		  [error localizedDescription]);
	//[UIApplication sharedApplication].networkActivityIndicatorVisible = NO;
	self.buffer = nil;
}

//受信終了
- (void)connectionDidFinishLoading:(NSURLConnection *)conn {
	NSLog(@"Succeed!! Received %d bytes of data", [buffer length]);
	if([delegate respondsToSelector:@selector(downloader:didLoad:identifier:)]){
        [delegate downloader:conn didLoad:buffer identifier:self.identifier];
    }
}

@end
