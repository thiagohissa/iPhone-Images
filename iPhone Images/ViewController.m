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

//    NSURL *url = [NSURL URLWithString:[self randomImage]];
//    NSURLSessionConfiguration *configuration = [NSURLSessionConfiguration defaultSessionConfiguration];
//    NSURLSession *session = [NSURLSession sessionWithConfiguration:configuration];
//    NSURLSessionDownloadTask *downloadTask = [session downloadTaskWithURL:url completionHandler:^(NSURL * _Nullable location, NSURLResponse * _Nullable response, NSError * _Nullable error) {
//        
//        
//        if(error){
//            NSLog(@"Error...");
//            return;
//        }
//        
//        NSData *data = [NSData dataWithContentsOfURL:location];
//        UIImage *image = [UIImage imageWithData:data];
//        
//        [[NSOperationQueue mainQueue] addOperationWithBlock:^{
//            self.myImage.image = image;
//        }];
//        
//    }];
//    
//    [downloadTask resume];
    [self loadData];
    
}



- (IBAction)randomButton:(id)sender {
    
    [self loadData];
    
}



-(NSString*)randomImage{
    int random = arc4random_uniform(3);
    
    if(random == 0){
        self.urlString = @"https://i.imgur.com/CoQ8aNl.png";
    }
    else if(random == 1){
        self.urlString = @"https://i.imgur.com/zdwdenZ.png";
    }
    else if(random == 2){
        self.urlString = @"https://i.imgur.com/2vQtZBb.png";
    }
    else if(random == 3){
        self.urlString = @"https://i.imgur.com/y9MIaCS.png";
    }
    NSLog(@"Random: %d", random);
    
    return self.urlString;
}






-(void)loadData{
    
    
    NSURL *url = [NSURL URLWithString:[self randomImage]];
    NSURLSessionConfiguration *configuration = [NSURLSessionConfiguration defaultSessionConfiguration];
    NSURLSession *session = [NSURLSession sessionWithConfiguration:configuration];
    NSURLSessionDownloadTask *downloadTask = [session downloadTaskWithURL:url completionHandler:^(NSURL * _Nullable location, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        
        
        if(error){
            NSLog(@"Error...");
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





@end
