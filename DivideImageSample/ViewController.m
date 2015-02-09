//
//  ViewController.m
//  DivideImageSample
//
//  Created by nagata on 11/14/14.
//  Copyright (c) 2014 nagata. All rights reserved.
//

#import "ViewController.h"
#import <QuartzCore/QuartzCore.h>

@interface ViewController ()

@end

@implementation ViewController{
    int size;
    NSMutableArray *croppedImages;
    NSMutableArray *imgNumAry;
    BOOL isClear;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    clearLabel.hidden = YES;
    
    size = 50; // パズルピースの画像の大きさ
    UIImage *image_mae = [UIImage imageNamed:@"cat.png"]; // サンプル画像を読み込む
    UIImage *image;  // リサイズ後UIImage
    CGFloat width = 200;  // リサイズ後幅のサイズ
    CGFloat height = 200;  // リサイズ後高さのサイズ
    
    /* リサイズする */
    UIGraphicsBeginImageContext(CGSizeMake(width, height));
    [image_mae drawInRect:CGRectMake(0, 0, width, height)];
    image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    //画像分割
    [self imageByCropping:image];
    
    //ボタンに画像をセットする
    [bt0 setBackgroundImage:croppedImages[[imgNumAry[0] intValue]] forState:UIControlStateNormal];
    [bt1 setBackgroundImage:croppedImages[[imgNumAry[1] intValue]] forState:UIControlStateNormal];
    [bt2 setBackgroundImage:croppedImages[[imgNumAry[2] intValue]] forState:UIControlStateNormal];
    [bt3 setBackgroundImage:croppedImages[[imgNumAry[3] intValue]] forState:UIControlStateNormal];
    [bt4 setBackgroundImage:croppedImages[[imgNumAry[4] intValue]] forState:UIControlStateNormal];
    [bt5 setBackgroundImage:croppedImages[[imgNumAry[5] intValue]] forState:UIControlStateNormal];
    [bt6 setBackgroundImage:croppedImages[[imgNumAry[6] intValue]] forState:UIControlStateNormal];
    [bt7 setBackgroundImage:croppedImages[[imgNumAry[7] intValue]] forState:UIControlStateNormal];
    [bt8 setBackgroundImage:croppedImages[[imgNumAry[8] intValue]] forState:UIControlStateNormal];
    [bt9 setBackgroundImage:croppedImages[[imgNumAry[9] intValue]] forState:UIControlStateNormal];
    [bt10 setBackgroundImage:croppedImages[[imgNumAry[10] intValue]] forState:UIControlStateNormal];
    [bt11 setBackgroundImage:croppedImages[[imgNumAry[11] intValue]] forState:UIControlStateNormal];
    [bt12 setBackgroundImage:croppedImages[[imgNumAry[12] intValue]] forState:UIControlStateNormal];
    [bt13 setBackgroundImage:croppedImages[[imgNumAry[13] intValue]] forState:UIControlStateNormal];
    [bt14 setBackgroundImage:croppedImages[[imgNumAry[14] intValue]] forState:UIControlStateNormal];
    [bt15 setBackgroundImage:croppedImages[[imgNumAry[15] intValue]] forState:UIControlStateNormal];

    /* ピースの最後は表示させない */
    bt15.hidden = YES;
    
}



/* 画像を分割する */
- (void)imageByCropping:(UIImage *)crop
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
    
    //0~15の数字の配列をつくる
    imgNumAry = [[NSMutableArray alloc] init];
    for (int i = 0; i < 16; i++) {
        [imgNumAry addObject:[NSNumber numberWithInt:i]];
    }
    
    /* 画像の順番をランダムにするための数字の配列 */
    for (int i = 15; i > 8; i--) {
        int randomNum = arc4random() % i;
        [imgNumAry exchangeObjectAtIndex:i withObjectAtIndex:randomNum];
    }
}

//bt0が押された時
-(IBAction)bt0Pushed{
    if(bt1.hidden == YES){
        bt1.hidden = NO;
        [bt1 setBackgroundImage:bt0.currentBackgroundImage forState:UIControlStateNormal];
        [imgNumAry exchangeObjectAtIndex:0 withObjectAtIndex:1];
        bt0.hidden = YES;
    }else if(bt4.hidden == YES){
        bt4.hidden = NO;
        [bt4 setBackgroundImage:bt0.currentBackgroundImage forState:UIControlStateNormal];
        [imgNumAry exchangeObjectAtIndex:0 withObjectAtIndex:4];
        bt0.hidden = YES;
    }
    [self check];
}
//bt1が押された時
-(IBAction)bt1Pushed{
    if(bt0.hidden == YES){
        bt0.hidden = NO;
        [bt0 setBackgroundImage:bt1.currentBackgroundImage forState:UIControlStateNormal];
        [imgNumAry exchangeObjectAtIndex:1 withObjectAtIndex:0];
        bt1.hidden = YES;
    }else if(bt5.hidden == YES){
        bt5.hidden = NO;
        [bt5 setBackgroundImage:bt1.currentBackgroundImage forState:UIControlStateNormal];
        [imgNumAry exchangeObjectAtIndex:1 withObjectAtIndex:5];
        bt1.hidden = YES;
    }else if(bt2.hidden == YES){
        bt2.hidden = NO;
        [bt2 setBackgroundImage:bt1.currentBackgroundImage forState:UIControlStateNormal];
        [imgNumAry exchangeObjectAtIndex:1 withObjectAtIndex:2];
        bt1.hidden = YES;
    }
    [self check];
}
//bt2が押された時
-(IBAction)bt2Pushed{
    if(bt1.hidden == YES){
        bt1.hidden = NO;
        [bt1 setBackgroundImage:bt2.currentBackgroundImage forState:UIControlStateNormal];
        [imgNumAry exchangeObjectAtIndex:2 withObjectAtIndex:1];
        bt2.hidden = YES;
    }else if(bt3.hidden == YES){
        bt3.hidden = NO;
        [bt3 setBackgroundImage:bt2.currentBackgroundImage forState:UIControlStateNormal];
        [imgNumAry exchangeObjectAtIndex:2 withObjectAtIndex:3];
        bt2.hidden = YES;
    }else if(bt6.hidden == YES){
        bt6.hidden = NO;
        [bt6 setBackgroundImage:bt2.currentBackgroundImage forState:UIControlStateNormal];
        [imgNumAry exchangeObjectAtIndex:2 withObjectAtIndex:6];
        bt2.hidden = YES;
    }
    [self check];
}
//bt3が押された時
-(IBAction)bt3Pushed{
    if(bt2.hidden == YES){
        bt2.hidden = NO;
        [bt2 setBackgroundImage:bt4.currentBackgroundImage forState:UIControlStateNormal];
        [imgNumAry exchangeObjectAtIndex:3 withObjectAtIndex:2];
        bt3.hidden = YES;
    }else if(bt7.hidden == YES){
        bt7.hidden = NO;
        [bt7 setBackgroundImage:bt3.currentBackgroundImage forState:UIControlStateNormal];
        [imgNumAry exchangeObjectAtIndex:3 withObjectAtIndex:7];
        bt3.hidden = YES;
    }
    [self check];
}
//bt4が押された時
-(IBAction)bt4Pushed{
    if(bt0.hidden == YES){
        bt0.hidden = NO;
        [bt0 setBackgroundImage:bt4.currentBackgroundImage forState:UIControlStateNormal];
        [imgNumAry exchangeObjectAtIndex:4 withObjectAtIndex:0];
        bt4.hidden = YES;
    }else if(bt5.hidden == YES){
        bt5.hidden = NO;
        [bt5 setBackgroundImage:bt4.currentBackgroundImage forState:UIControlStateNormal];
        [imgNumAry exchangeObjectAtIndex:4 withObjectAtIndex:5];
        bt4.hidden = YES;
    }else if(bt8.hidden == YES){
        bt8.hidden = NO;
        [bt8 setBackgroundImage:bt4.currentBackgroundImage forState:UIControlStateNormal];
        [imgNumAry exchangeObjectAtIndex:4 withObjectAtIndex:8];
        bt4.hidden = YES;
    }
    [self check];
}
//bt5が押された時
-(IBAction)bt5Pushed{
    if(bt1.hidden == YES){
        bt1.hidden = NO;
        [bt1 setBackgroundImage:bt5.currentBackgroundImage forState:UIControlStateNormal];
        [imgNumAry exchangeObjectAtIndex:5 withObjectAtIndex:1];
        bt5.hidden = YES;
    }else if(bt4.hidden == YES){
        bt4.hidden = NO;
        [bt4 setBackgroundImage:bt5.currentBackgroundImage forState:UIControlStateNormal];
        [imgNumAry exchangeObjectAtIndex:5 withObjectAtIndex:4];
        bt5.hidden = YES;
    }else if(bt6.hidden == YES){
        bt6.hidden = NO;
        [bt6 setBackgroundImage:bt5.currentBackgroundImage forState:UIControlStateNormal];
        [imgNumAry exchangeObjectAtIndex:5 withObjectAtIndex:6];
        bt5.hidden = YES;
    }else if(bt9.hidden == YES){
        bt9.hidden = NO;
        [bt9 setBackgroundImage:bt5.currentBackgroundImage forState:UIControlStateNormal];
        [imgNumAry exchangeObjectAtIndex:5 withObjectAtIndex:9];
        bt5.hidden = YES;
    }
    [self check];
}
//bt6が押された時
-(IBAction)bt6Pushed{
    if(bt2.hidden == YES){
        bt2.hidden = NO;
        [bt2 setBackgroundImage:bt6.currentBackgroundImage forState:UIControlStateNormal];
        [imgNumAry exchangeObjectAtIndex:6 withObjectAtIndex:2];
        bt6.hidden = YES;
    }else if(bt5.hidden == YES){
        bt5.hidden = NO;
        [bt5 setBackgroundImage:bt6.currentBackgroundImage forState:UIControlStateNormal];
        [imgNumAry exchangeObjectAtIndex:6 withObjectAtIndex:5];
        bt6.hidden = YES;
    }else if(bt7.hidden == YES){
        bt7.hidden = NO;
        [bt7 setBackgroundImage:bt6.currentBackgroundImage forState:UIControlStateNormal];
        [imgNumAry exchangeObjectAtIndex:6 withObjectAtIndex:7];
        bt6.hidden = YES;
    }else if(bt10.hidden == YES){
        bt10.hidden = NO;
        [bt10 setBackgroundImage:bt6.currentBackgroundImage forState:UIControlStateNormal];
        [imgNumAry exchangeObjectAtIndex:6 withObjectAtIndex:10];
        bt6.hidden = YES;
    }
    [self check];
}
//bt7が押された時
-(IBAction)bt7Pushed{
    if(bt3.hidden == YES){
        bt3.hidden = NO;
        [bt3 setBackgroundImage:bt7.currentBackgroundImage forState:UIControlStateNormal];
        [imgNumAry exchangeObjectAtIndex:7 withObjectAtIndex:3];
        bt7.hidden = YES;
    }else if(bt6.hidden == YES){
        bt6.hidden = NO;
        [bt6 setBackgroundImage:bt7.currentBackgroundImage forState:UIControlStateNormal];
        [imgNumAry exchangeObjectAtIndex:7 withObjectAtIndex:6];
        bt7.hidden = YES;
    }else if(bt11.hidden == YES){
        bt11.hidden = NO;
        [bt11 setBackgroundImage:bt7.currentBackgroundImage forState:UIControlStateNormal];
        [imgNumAry exchangeObjectAtIndex:7 withObjectAtIndex:11];
        bt7.hidden = YES;
    }
    [self check];
}
//bt8が押された時
-(IBAction)bt8Pushed{
    if(bt4.hidden == YES){
        bt4.hidden = NO;
        [bt4 setBackgroundImage:bt8.currentBackgroundImage forState:UIControlStateNormal];
        [imgNumAry exchangeObjectAtIndex:8 withObjectAtIndex:4];
        bt8.hidden = YES;
    }else if(bt9.hidden == YES){
        bt9.hidden = NO;
        [bt9 setBackgroundImage:bt8.currentBackgroundImage forState:UIControlStateNormal];
        [imgNumAry exchangeObjectAtIndex:8 withObjectAtIndex:9];
        bt8.hidden = YES;
    }else if(bt12.hidden == YES){
        bt12.hidden = NO;
        [bt12 setBackgroundImage:bt8.currentBackgroundImage forState:UIControlStateNormal];
        [imgNumAry exchangeObjectAtIndex:8 withObjectAtIndex:12];
        bt8.hidden = YES;
    }
    [self check];
}
//bt9が押された時
-(IBAction)bt9Pushed{
    if(bt5.hidden == YES){
        bt5.hidden = NO;
        [bt5 setBackgroundImage:bt9.currentBackgroundImage forState:UIControlStateNormal];
        [imgNumAry exchangeObjectAtIndex:9 withObjectAtIndex:5];
        bt9.hidden = YES;
    }else if(bt8.hidden == YES){
        bt8.hidden = NO;
        [bt8 setBackgroundImage:bt9.currentBackgroundImage forState:UIControlStateNormal];
        [imgNumAry exchangeObjectAtIndex:9 withObjectAtIndex:8];
        bt9.hidden = YES;
    }else if(bt10.hidden == YES){
        bt10.hidden = NO;
        [bt10 setBackgroundImage:bt9.currentBackgroundImage forState:UIControlStateNormal];
        [imgNumAry exchangeObjectAtIndex:9 withObjectAtIndex:10];
        bt9.hidden = YES;
    }else if(bt13.hidden == YES){
        bt13.hidden = NO;
        [bt13 setBackgroundImage:bt9.currentBackgroundImage forState:UIControlStateNormal];
        [imgNumAry exchangeObjectAtIndex:9 withObjectAtIndex:13];
        bt9.hidden = YES;
    }
    [self check];
}
//bt10が押された時
-(IBAction)bt10Pushed{
    if(bt6.hidden == YES){
        bt6.hidden = NO;
        [bt6 setBackgroundImage:bt10.currentBackgroundImage forState:UIControlStateNormal];
        [imgNumAry exchangeObjectAtIndex:10 withObjectAtIndex:6];
        bt10.hidden = YES;
    }else if(bt9.hidden == YES){
        bt9.hidden = NO;
        [bt9 setBackgroundImage:bt10.currentBackgroundImage forState:UIControlStateNormal];
        [imgNumAry exchangeObjectAtIndex:10 withObjectAtIndex:9];
        bt10.hidden = YES;
    }else if(bt11.hidden == YES){
        bt11.hidden = NO;
        [bt11 setBackgroundImage:bt10.currentBackgroundImage forState:UIControlStateNormal];
        [imgNumAry exchangeObjectAtIndex:10 withObjectAtIndex:11];
        bt10.hidden = YES;
    }else if(bt14.hidden == YES){
        bt14.hidden = NO;
        [bt14 setBackgroundImage:bt10.currentBackgroundImage forState:UIControlStateNormal];
        [imgNumAry exchangeObjectAtIndex:10 withObjectAtIndex:14];
        bt10.hidden = YES;
    }
    [self check];
}
//bt11が押された時
-(IBAction)bt11Pushed{
    if(bt7.hidden == YES){
        bt7.hidden = NO;
        [bt7 setBackgroundImage:bt11.currentBackgroundImage forState:UIControlStateNormal];
        [imgNumAry exchangeObjectAtIndex:11 withObjectAtIndex:7];
        bt11.hidden = YES;
    }else if(bt10.hidden == YES){
        bt10.hidden = NO;
        [bt10 setBackgroundImage:bt11.currentBackgroundImage forState:UIControlStateNormal];
        [imgNumAry exchangeObjectAtIndex:11 withObjectAtIndex:10];
        bt11.hidden = YES;
    }else if(bt15.hidden == YES){
        bt15.hidden = NO;
        [bt15 setBackgroundImage:bt11.currentBackgroundImage forState:UIControlStateNormal];
        [imgNumAry exchangeObjectAtIndex:11 withObjectAtIndex:15];
        bt11.hidden = YES;
    }
    [self check];
}
//bt12が押された時
-(IBAction)bt12Pushed{
    if(bt8.hidden == YES){
        bt8.hidden = NO;
        [bt8 setBackgroundImage:bt12.currentBackgroundImage forState:UIControlStateNormal];
        [imgNumAry exchangeObjectAtIndex:12 withObjectAtIndex:8];
        bt12.hidden = YES;
    }else if(bt13.hidden == YES){
        bt13.hidden = NO;
        [bt13 setBackgroundImage:bt12.currentBackgroundImage forState:UIControlStateNormal];
        [imgNumAry exchangeObjectAtIndex:12 withObjectAtIndex:13];
        bt12.hidden = YES;
    }
    [self check];
}
//bt13が押された時
-(IBAction)bt13Pushed{
    if(bt9.hidden == YES){
        bt9.hidden = NO;
        [bt9 setBackgroundImage:bt13.currentBackgroundImage forState:UIControlStateNormal];
        [imgNumAry exchangeObjectAtIndex:13 withObjectAtIndex:9];
        bt13.hidden = YES;
    }else if(bt12.hidden == YES){
        bt12.hidden = NO;
        [bt12 setBackgroundImage:bt13.currentBackgroundImage forState:UIControlStateNormal];
        [imgNumAry exchangeObjectAtIndex:13 withObjectAtIndex:12];
        bt13.hidden = YES;
    }else if(bt14.hidden == YES){
        bt14.hidden = NO;
        [bt14 setBackgroundImage:bt13.currentBackgroundImage forState:UIControlStateNormal];
        [imgNumAry exchangeObjectAtIndex:13 withObjectAtIndex:14];
        bt13.hidden = YES;
    }
    [self check];
}
//bt14が押された時
-(IBAction)bt14Pushed{
    if(bt10.hidden == YES){
        bt10.hidden = NO;
        [bt10 setBackgroundImage:bt14.currentBackgroundImage forState:UIControlStateNormal];
        [imgNumAry exchangeObjectAtIndex:14 withObjectAtIndex:10];
        bt14.hidden = YES;
    }else if(bt13.hidden == YES){
        bt13.hidden = NO;
        [bt13 setBackgroundImage:bt14.currentBackgroundImage forState:UIControlStateNormal];
        [imgNumAry exchangeObjectAtIndex:14 withObjectAtIndex:13];
        bt14.hidden = YES;
    }else if(bt15.hidden == YES){
        bt15.hidden = NO;
        [bt15 setBackgroundImage:bt14.currentBackgroundImage forState:UIControlStateNormal];
        [imgNumAry exchangeObjectAtIndex:14 withObjectAtIndex:15];
        bt14.hidden = YES;
    }
    [self check];
}
//bt15が押された時
-(IBAction)bt15Pushed{
    if(bt11.hidden == YES){
        bt11.hidden = NO;
        [bt11 setBackgroundImage:bt15.currentBackgroundImage forState:UIControlStateNormal];
        [imgNumAry exchangeObjectAtIndex:15 withObjectAtIndex:11];
        bt15.hidden = YES;
    }else if(bt14.hidden == YES){
        bt14.hidden = NO;
        [bt14 setBackgroundImage:bt15.currentBackgroundImage forState:UIControlStateNormal];
        [imgNumAry exchangeObjectAtIndex:15 withObjectAtIndex:14];
        bt15.hidden = YES;
    }
    [self check];
}

/* 完成かどうか判定する */
-(void)check{
    for (int i = 0; i < 16; i++) {
        if ([imgNumAry[i] intValue] == i){
            isClear = YES;
        }else{
            isClear = NO;
            //クリアでないのでループから抜ける
            break;
        }
    }
    if (isClear == YES) {
        //ここにclearした時の処理を書く
        NSLog(@"Clear");
        clearLabel.hidden = NO;
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
