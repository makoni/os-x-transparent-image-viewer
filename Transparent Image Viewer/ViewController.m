//
//  ViewController.m
//  Transparent Image Viewer
//
//  Created by Sergey Armodin on 02/06/15.
//  Copyright (c) 2015 MobileUp. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak) IBOutlet NSImageView *imageView;
@property (weak) IBOutlet NSSlider *slider;
@property (weak) NSWindow *window;
@property (assign) float sliderValue;
@end

@implementation ViewController

- (void)viewDidLoad {
	[super viewDidLoad];
	
	self.title = @"123";
	
	
	// Do any additional setup after loading the view.
}

- (void)setRepresentedObject:(id)representedObject {
	[super setRepresentedObject:representedObject];
	
	
	

	// Update the view, if already loaded.
}

- (IBAction)onOffButtonPressed:(id)sender {
	if (self.sliderValue == 0) {
		self.sliderValue = self.slider.floatValue;
		self.slider.floatValue = 0;
	} else {
		self.slider.floatValue = self.sliderValue;
		self.sliderValue = 0;
	}
	
	[self opacityChanged:nil];
}

- (IBAction)opacityChanged:(id)sender {
	self.imageView.alphaValue = self.slider.floatValue / 100;
}

- (IBAction)openFile:(id)sender {
	NSArray *fileTypes = [NSArray arrayWithObjects:@"jpg", @"jpeg", @"png", nil];
	NSOpenPanel * panel = [NSOpenPanel openPanel];
	
	[panel setAllowsMultipleSelection:NO];
	[panel setCanChooseDirectories:NO];
	[panel setCanChooseFiles:YES];
	[panel setFloatingPanel:YES];
	[panel setAllowedFileTypes:fileTypes];
	
	
	[panel beginSheetModalForWindow:self.view.window completionHandler:^(NSInteger result) {
		if (result == NSModalResponseOK) {
			NSArray* files = [panel URLs];
			NSURL* fileUrl = [files objectAtIndex:0];
			NSLog(@"%@", fileUrl.absoluteString);
			
			NSImage *image = [[NSImage alloc] initWithContentsOfURL:fileUrl];
			[self.imageView setImage:image];
		}
	}];
	
	
}

- (void)viewDidAppear {
	NSColor *color = [NSColor colorWithDeviceRed:0 green:0 blue:0 alpha:0.1];
	self.window = self.view.window;
	[self.window setOpaque:NO];
	[self.window setBackgroundColor:color];
}

@end
