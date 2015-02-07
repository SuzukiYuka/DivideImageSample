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
    bt16.hidden = YES;
    
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
}
-(IBAction)bt2Pushed{
    if(bt1.hidden == YES){
        bt1.hidden = NO;
        [bt1 setBackgroundImage:bt2.currentBackgroundImage forState:UIControlStateNormal];
        bt2.hidden = YES;
    }else if(bt6.hidden == YES){
        bt6.hidden = NO;
        [bt6 setBackgroundImage:bt2.currentBackgroundImage forState:UIControlStateNormal];
        bt2.hidden = YES;
    }else if(bt3.hidden == YES){
        bt3.hidden = NO;
        [bt3 setBackgroundImage:bt2.currentBackgroundImage forState:UIControlStateNormal];
        bt2.hidden = YES;
    }
}
-(IBAction)bt3Pushed{
    if(bt2.hidden == YES){
        bt2.hidden = NO;
        [bt2 setBackgroundImage:bt3.currentBackgroundImage forState:UIControlStateNormal];
        bt3.hidden = YES;
    }else if(bt4.hidden == YES){
        bt4.hidden = NO;
        [bt4 setBackgroundImage:bt3.currentBackgroundImage forState:UIControlStateNormal];
        bt3.hidden = YES;
    }else if(bt7.hidden == YES){
        bt7.hidden = NO;
        [bt7 setBackgroundImage:bt3.currentBackgroundImage forState:UIControlStateNormal];
        bt3.hidden = YES;
    }
}
-(IBAction)bt4Pushed{
    if(bt3.hidden == YES){
        bt3.hidden = NO;
        [bt3 setBackgroundImage:bt4.currentBackgroundImage forState:UIControlStateNormal];
        bt4.hidden = YES;
    }else if(bt8.hidden == YES){
        bt8.hidden = NO;
        [bt8 setBackgroundImage:bt4.currentBackgroundImage forState:UIControlStateNormal];
        bt4.hidden = YES;
    }
}
-(IBAction)bt5Pushed{
    if(bt1.hidden == YES){
        bt1.hidden = NO;
        [bt1 setBackgroundImage:bt5.currentBackgroundImage forState:UIControlStateNormal];
        bt5.hidden = YES;
    }else if(bt6.hidden == YES){
        bt6.hidden = NO;
        [bt6 setBackgroundImage:bt5.currentBackgroundImage forState:UIControlStateNormal];
        bt5.hidden = YES;
    }else if(bt9.hidden == YES){
        bt9.hidden = NO;
        [bt9 setBackgroundImage:bt5.currentBackgroundImage forState:UIControlStateNormal];
        bt5.hidden = YES;
    }
}
-(IBAction)bt6Pushed{
    if(bt2.hidden == YES){
        bt2.hidden = NO;
        [bt2 setBackgroundImage:bt6.currentBackgroundImage forState:UIControlStateNormal];
        bt6.hidden = YES;
    }else if(bt5.hidden == YES){
        bt5.hidden = NO;
        [bt5 setBackgroundImage:bt6.currentBackgroundImage forState:UIControlStateNormal];
        bt6.hidden = YES;
    }else if(bt7.hidden == YES){
        bt7.hidden = NO;
        [bt7 setBackgroundImage:bt6.currentBackgroundImage forState:UIControlStateNormal];
        bt6.hidden = YES;
    }else if(bt10.hidden == YES){
        bt10.hidden = NO;
        [bt10 setBackgroundImage:bt6.currentBackgroundImage forState:UIControlStateNormal];
        bt6.hidden = YES;
    }
}
-(IBAction)bt7Pushed{
    if(bt3.hidden == YES){
        bt3.hidden = NO;
        [bt3 setBackgroundImage:bt7.currentBackgroundImage forState:UIControlStateNormal];
        bt7.hidden = YES;
    }else if(bt6.hidden == YES){
        bt6.hidden = NO;
        [bt6 setBackgroundImage:bt7.currentBackgroundImage forState:UIControlStateNormal];
        bt7.hidden = YES;
    }else if(bt8.hidden == YES){
        bt8.hidden = NO;
        [bt8 setBackgroundImage:bt7.currentBackgroundImage forState:UIControlStateNormal];
        bt7.hidden = YES;
    }else if(bt11.hidden == YES){
        bt11.hidden = NO;
        [bt11 setBackgroundImage:bt7.currentBackgroundImage forState:UIControlStateNormal];
        bt7.hidden = YES;
    }
}
-(IBAction)bt8Pushed{
    if(bt4.hidden == YES){
        bt4.hidden = NO;
        [bt4 setBackgroundImage:bt8.currentBackgroundImage forState:UIControlStateNormal];
        bt8.hidden = YES;
    }else if(bt7.hidden == YES){
        bt7.hidden = NO;
        [bt7 setBackgroundImage:bt8.currentBackgroundImage forState:UIControlStateNormal];
        bt8.hidden = YES;
    }else if(bt12.hidden == YES){
        bt12.hidden = NO;
        [bt12 setBackgroundImage:bt8.currentBackgroundImage forState:UIControlStateNormal];
        bt8.hidden = YES;
    }
}
-(IBAction)bt9Pushed{
    if(bt5.hidden == YES){
        bt5.hidden = NO;
        [bt5 setBackgroundImage:bt9.currentBackgroundImage forState:UIControlStateNormal];
        bt9.hidden = YES;
    }else if(bt10.hidden == YES){
        bt10.hidden = NO;
        [bt10 setBackgroundImage:bt9.currentBackgroundImage forState:UIControlStateNormal];
        bt9.hidden = YES;
    }else if(bt13.hidden == YES){
        bt13.hidden = NO;
        [bt13 setBackgroundImage:bt9.currentBackgroundImage forState:UIControlStateNormal];
        bt9.hidden = YES;
    }
}
-(IBAction)bt10Pushed{
    if(bt6.hidden == YES){
        bt6.hidden = NO;
        [bt6 setBackgroundImage:bt10.currentBackgroundImage forState:UIControlStateNormal];
        bt10.hidden = YES;
    }else if(bt9.hidden == YES){
        bt9.hidden = NO;
        [bt9 setBackgroundImage:bt10.currentBackgroundImage forState:UIControlStateNormal];
        bt10.hidden = YES;
    }else if(bt11.hidden == YES){
        bt11.hidden = NO;
        [bt11 setBackgroundImage:bt10.currentBackgroundImage forState:UIControlStateNormal];
        bt10.hidden = YES;
    }else if(bt14.hidden == YES){
        bt14.hidden = NO;
        [bt14 setBackgroundImage:bt10.currentBackgroundImage forState:UIControlStateNormal];
        bt10.hidden = YES;
    }
}
-(IBAction)bt11Pushed{
    if(bt7.hidden == YES){
        bt7.hidden = NO;
        [bt7 setBackgroundImage:bt11.currentBackgroundImage forState:UIControlStateNormal];
        bt11.hidden = YES;
    }else if(bt10.hidden == YES){
        bt10.hidden = NO;
        [bt10 setBackgroundImage:bt11.currentBackgroundImage forState:UIControlStateNormal];
        bt11.hidden = YES;
    }else if(bt12.hidden == YES){
        bt12.hidden = NO;
        [bt12 setBackgroundImage:bt11.currentBackgroundImage forState:UIControlStateNormal];
        bt11.hidden = YES;
    }else if(bt15.hidden == YES){
        bt15.hidden = NO;
        [bt15 setBackgroundImage:bt11.currentBackgroundImage forState:UIControlStateNormal];
        bt11.hidden = YES;
    }
}
-(IBAction)bt12Pushed{
    if(bt8.hidden == YES){
        bt8.hidden = NO;
        [bt8 setBackgroundImage:bt12.currentBackgroundImage forState:UIControlStateNormal];
        bt12.hidden = YES;
    }else if(bt11.hidden == YES){
        bt11.hidden = NO;
        [bt11 setBackgroundImage:bt12.currentBackgroundImage forState:UIControlStateNormal];
        bt12.hidden = YES;
    }else if(bt16.hidden == YES){
        bt16.hidden = NO;
        [bt16 setBackgroundImage:bt12.currentBackgroundImage forState:UIControlStateNormal];
        bt12.hidden = YES;
    }
}
-(IBAction)bt13Pushed{
    if(bt9.hidden == YES){
        bt9.hidden = NO;
        [bt9 setBackgroundImage:bt13.currentBackgroundImage forState:UIControlStateNormal];
        bt13.hidden = YES;
    }else if(bt14.hidden == YES){
        bt14.hidden = NO;
        [bt14 setBackgroundImage:bt13.currentBackgroundImage forState:UIControlStateNormal];
        bt13.hidden = YES;
    }
}
-(IBAction)bt14Pushed{
    if(bt10.hidden == YES){
        bt10.hidden = NO;
        [bt10 setBackgroundImage:bt14.currentBackgroundImage forState:UIControlStateNormal];
        bt14.hidden = YES;
    }else if(bt13.hidden == YES){
        bt13.hidden = NO;
        [bt13 setBackgroundImage:bt14.currentBackgroundImage forState:UIControlStateNormal];
        bt14.hidden = YES;
    }else if(bt15.hidden == YES){
        bt15.hidden = NO;
        [bt15 setBackgroundImage:bt14.currentBackgroundImage forState:UIControlStateNormal];
        bt14.hidden = YES;
    }
}
-(IBAction)bt15Pushed{
    if(bt11.hidden == YES){
        bt11.hidden = NO;
        [bt11 setBackgroundImage:bt15.currentBackgroundImage forState:UIControlStateNormal];
        bt15.hidden = YES;
    }else if(bt14.hidden == YES){
        bt14.hidden = NO;
        [bt14 setBackgroundImage:bt15.currentBackgroundImage forState:UIControlStateNormal];
        bt15.hidden = YES;
    }else if(bt16.hidden == YES){
        bt16.hidden = NO;
        [bt16 setBackgroundImage:bt15.currentBackgroundImage forState:UIControlStateNormal];
        bt15.hidden = YES;
    }
}
-(IBAction)bt16Pushed{
    if(bt12.hidden == YES){
        bt12.hidden = NO;
        [bt12 setBackgroundImage:bt16.currentBackgroundImage forState:UIControlStateNormal];
        bt16.hidden = YES;
    }else if(bt15.hidden == YES){
        bt15.hidden = NO;
        [bt15 setBackgroundImage:bt16.currentBackgroundImage forState:UIControlStateNormal];
        bt16.hidden = YES;
    }
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
