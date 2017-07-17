//
//  ViewController.m
//  iPhone Images
//
//  Created by Thiago Hissa on 2017-07-17.
//  Copyright © 2017 Thiago Hissa. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UIImageView *myImage;
@property (nonatomic) NSString *urlString;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    NSURL *url = [NSURL URLWithString:[self randomImage]];
    NSURLSessionConfiguration *configuration = [NSURLSessionConfiguration defaultSessionConfiguration];
    NSURLSession *session = [NSURLSession sessionWithConfiguration:configuration];
    NSURLSessionDownloadTask *downloadTask = [session downloadTaskWithURL:url completionHandler:^(NSURL * _Nullable location, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        
        
        if(error){
            NSLog(@"Erro...");
            return;
        }
        
        NSData *data = [NSData dataWithContentsOfURL:location];
        UIImage *image = [UIImage imageWithData:data];
        
        [[NSOperationQueue mainQueue] addOperationWithBlock:^{
            self.myImage.image = image;
        }];
        
    }];
    
    [downloadTask resume];
    
    
}



- (IBAction)randomButton:(id)sender {
    [self randomImage];
}



-(NSString*)randomImage{
    int random = arc4random_uniform(2);
    
    if(random == 1){
        self.urlString = @"http://imgur.com/CoQ8aNl.png";
    }
    else if(random == 0){
        self.urlString = @"http://imgur.com/zdwdenZ.png";
    }
    NSLog(@"Random: %d", random);
    
    return self.urlString;
}





@end
