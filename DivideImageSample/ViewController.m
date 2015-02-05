//
//  ViewController.m
//  DivideImageSample
//
//  Created by nagata on 11/14/14.
//  Copyright (c) 2014 nagata. All rights reserved.
//

#import "ViewController.h"
#import <QuartzCore/QuartzCore.h>

@interface ViewController (){
    int size;
}

@end

@implementation ViewController{
    NSMutableArray *croppedImages;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    size = 50; // パズルピースの画像の大きさ
    UIImage *image_mae = [UIImage imageNamed:@"mizubuu.png"]; // サンプル画像を読み込む
    UIImage *image;  // リサイズ後UIImage
    CGFloat width = 200;  // リサイズ後幅のサイズ
    CGFloat height = 200;  // リサイズ後高さのサイズ
    
    /* リサイズする */
    UIGraphicsBeginImageContext(CGSizeMake(width, height));
    [image_mae drawInRect:CGRectMake(0, 0, width, height)];
    image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();

    [bt1 setBackgroundImage:[self imageByCropping:image][0] forState:UIControlStateNormal];
    [bt2 setBackgroundImage:croppedImages[1] forState:UIControlStateNormal];
    [bt3 setBackgroundImage:[self imageByCropping:image][2] forState:UIControlStateNormal];
    [bt4 setBackgroundImage:[self imageByCropping:image][3] forState:UIControlStateNormal];
    [bt5 setBackgroundImage:[self imageByCropping:image][4] forState:UIControlStateNormal];
    [bt6 setBackgroundImage:[self imageByCropping:image][5] forState:UIControlStateNormal];
    [bt7 setBackgroundImage:[self imageByCropping:image][6] forState:UIControlStateNormal];
    [bt8 setBackgroundImage:[self imageByCropping:image][7] forState:UIControlStateNormal];
    [bt9 setBackgroundImage:[self imageByCropping:image][8] forState:UIControlStateNormal];
    [bt10 setBackgroundImage:[self imageByCropping:image][9] forState:UIControlStateNormal];
    [bt11 setBackgroundImage:[self imageByCropping:image][10] forState:UIControlStateNormal];
    [bt12 setBackgroundImage:[self imageByCropping:image][11] forState:UIControlStateNormal];
    [bt13 setBackgroundImage:[self imageByCropping:image][12] forState:UIControlStateNormal];
    [bt14 setBackgroundImage:[self imageByCropping:image][13] forState:UIControlStateNormal];
    [bt15 setBackgroundImage:[self imageByCropping:image][14] forState:UIControlStateNormal];
    [bt16 setBackgroundImage:[self imageByCropping:image][15] forState:UIControlStateNormal];

    
    /* パズルピース(button)を画面に追加 */
    /* ピースの最後は表示させない */
    bt5.hidden = YES;
    
}



/* 画像を分割する */
- (NSArray *)imageByCropping:(UIImage *)crop
{
    croppedImages = [[NSMutableArray alloc] init];
    for (int y=0; y<200; y+=size) {
        for (int x=0; x<200; x+=size) {
            // 指定した四角でイメージをトリミング
            CGRect rect = CGRectMake(x, y, size, size);
            CGImageRef imageRef = CGImageCreateWithImageInRect([crop CGImage], rect);
            UIImage *cropped = [UIImage imageWithCGImage:imageRef];
            CGImageRelease(imageRef);
            [croppedImages addObject:cropped];
        }
    }
    /* 画像の順番をランダムにする */
//    int count = [croppedImages count];
//    for (int i = count - 1; i > count/2; i--) {
//        int randomNum = arc4random() % i;
//        [croppedImages exchangeObjectAtIndex:i withObjectAtIndex:randomNum];
//        NSLog(@"croppedImages == %@",croppedImages);
//    }
    return croppedImages;
}

-(IBAction)bt1Pushed{
    if(bt2.hidden == YES){
        bt2.hidden = NO;
        [bt2 setBackgroundImage:bt1.currentBackgroundImage forState:UIControlStateNormal];
        bt1.hidden = YES;
    }else if(bt5.hidden == YES){
        bt5.hidden = NO;
        [bt5 setBackgroundImage:bt1.currentBackgroundImage forState:UIControlStateNormal];
        bt1.hidden = YES;
    }
    [self check];
}
-(IBAction)bt2Pushed{
    
}
-(IBAction)bt3Pushed{
    
}
-(IBAction)bt4Pushed{
    
}
-(IBAction)bt5Pushed{
    
}
-(IBAction)bt6Pushed{
    
}
-(IBAction)bt7Pushed{
    
}
-(IBAction)bt8Pushed{
    
}
-(IBAction)bt9Pushed{
    
}
-(IBAction)bt10Pushed{
    
}
-(IBAction)bt11Pushed{
    
}
-(IBAction)bt12Pushed{
    
}
-(IBAction)bt13Pushed{
    
}
-(IBAction)bt14Pushed{
    
}
-(IBAction)bt15Pushed{
    
}
-(IBAction)bt16Pushed{
    
}

/* 完成かどうか判定する */
-(BOOL)check{
    if(bt2.currentBackgroundImage == croppedImages[1]){
        NSLog(@"一致");
    }
    return NO;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
