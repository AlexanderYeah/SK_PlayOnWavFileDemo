//
//  ViewController.m
//  SK_PlayWavFile
//
//  Created by TrimbleZhang on 2018/12/21.
//  Copyright © 2018 AlexanderYeah. All rights reserved.
//

#import "ViewController.h"
#import "AudioStreamer.h"

@interface ViewController ()

/** 播放器 */
@property (nonatomic,strong)AudioStreamer *streamer;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)createStreamer
{
    [self destroyStreamer];

    NSURL *url = [NSURL URLWithString:@"http://t.call123.net:10084/2018/12/21/out-11017602113363-11017602113363-11013917002012-20181221-160202-hz-1545379309.598073.wav"];
    self.streamer = [[AudioStreamer alloc] initWithURL:url];
}


// 播放
- (IBAction)play:(id)sender {
    
    if (!self.streamer) {
        [self createStreamer];
    }
    [self.streamer start];
    
}


// 暂停
- (IBAction)pause:(id)sender {
       [self.streamer pause];
    
}

- (void)destroyStreamer
{
    if (self.streamer)
    {
        [[NSNotificationCenter defaultCenter]
         removeObserver:self
         name:ASStatusChangedNotification
         object:self.streamer];        
        [self.streamer stop];
        self.streamer = nil;
    }
}

@end
