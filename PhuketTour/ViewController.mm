//
//  ViewController.m
//  PhuketTour
//
//  Created by apple on 2016/12/31.
//  Copyright © 2016年 xiaokai.zhan. All rights reserved.
//

#import "ViewController.h"
#import "CommonUtil.h"
#import "mp3_encoder.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}
- (IBAction)startEncode:(id)sender {
    NSLog(@"Start Encode...");
    Mp3Encoder* encoder = new Mp3Encoder();
    const char* pcmFilePath = [[CommonUtil bundlePath:@"vocal.pcm"] cStringUsingEncoding:NSUTF8StringEncoding];
    const char *mp3FilePath = [[CommonUtil documentsPath:@"vocal.mp3"] cStringUsingEncoding:NSUTF8StringEncoding];
    int sampleRate = 44100;
    int channels = 2;
    int bitRate = 128 * 1024;
    encoder->Init(pcmFilePath, mp3FilePath, sampleRate, channels, bitRate);
    encoder->Encode();
    encoder->Destory();
    delete encoder;
    NSLog(@"Encode Success");
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
