//
//  DCTYouTubeView.m
//  DCTYouTubeView
//
//  Created by Daniel Tull on 16/09/2012.
//  Copyright (c) 2012 Daniel Tull. All rights reserved.
//

#import "DCTYouTubeView.h"

@implementation DCTYouTubeView {
	__strong UIWebView *_webview;
}

- (id)initWithFrame:(CGRect)frame {
	self = [super initWithFrame:frame];
	if (!self) return nil;
	[self _sharedInit];
	return self;
}

- (id)initWithCoder:(NSCoder *)coder {
	self = [super initWithCoder:coder];
	if (!self) return nil;
	[self _sharedInit];
	return self;
}

- (void)_sharedInit {
	_webview = [[UIWebView alloc] initWithFrame:self.bounds];
	_webview.autoresizingMask = (UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight);
	_webview.scrollView.scrollEnabled = NO;
}

- (void)setVideoID:(NSString *)videoID {
	_videoID = [videoID copy];
	[_webview loadHTMLString:[self _HTMLstring] baseURL:nil];
}

- (void)layoutSubviews {
	[super layoutSubviews];
	_webview.frame = self.bounds;
	[self addSubview:_webview];
	[_webview loadHTMLString:[self _HTMLstring] baseURL:nil];
}

- (NSString *)_HTMLstring {
	NSString *embedHTML = @"\
	<html><head>\
	<style type=\"text/css\">\
	body {\
	background-color: transparent;\
	color: transparent;\
	}\
	</style>\
	</head><body style=\"margin:0\">\
	<iframe class=\"youtube-player\" type=\"text/html\" width=\"%0.0f\" height=\"%0.0f\" src=\"http://www.youtube.com/embed/%@\" frameborder=\"0\">\
	</iframe>\
	</body></html>";

	CGSize size = self.bounds.size;
	NSString *html = [NSString stringWithFormat:embedHTML, size.width, size.height, self.videoID];
	return html;
}

@end
