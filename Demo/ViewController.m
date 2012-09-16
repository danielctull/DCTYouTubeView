//
//  ViewController.m
//  DCTYouTubeView
//
//  Created by Daniel Tull on 16/09/2012.
//  Copyright (c) 2012 Daniel Tull. All rights reserved.
//

#import "ViewController.h"
#import <DCTYouTubeView/DCTYouTubeView.h>

@interface ViewController ()
@property (nonatomic, weak) IBOutlet DCTYouTubeView *youtubeView;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
	self.youtubeView.videoID = @"FwcyxA406og";
}

@end
