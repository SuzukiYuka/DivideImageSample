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

@implementation ViewController

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

    NSArray *buttons = [self divideImage:image]; // 画像を分割->buttonへ
    
    /* パズルピース(button)を画面に追加 */
    for (UIButton *bt in buttons) {
        [self.view addSubview:bt];
    }
    
    /* ピースの最後は表示させない */
    UIButton *lastbtn = [buttons lastObject];
    lastbtn.hidden = YES;
    
}

/* ピース（分割した画像が背景のボタン）をつくる */
- (NSArray *)divideImage:(UIImage *)image
{
    NSMutableArray *result = [[NSMutableArray alloc] init];
    
    int i = 0;
    for (int y=0; y<200; y+=size) {
        for (int x=0; x<200; x+=size) {
            // 各ピース(button)をつくる
            UIButton *b = [[UIButton alloc] initWithFrame:CGRectMake(x+60, y+100, size, size)];
            // 背景を分割したピースの画像にする
            [b setBackgroundImage:[self imageByCropping:image][i] forState:UIControlStateNormal];
            //ボタンを押したときのアクションを追加
            [b addTarget:self action:@selector(pushed:) forControlEvents:UIControlEventTouchUpInside];
            i++;
            [result addObject:b];
        }
    }
    return result;
}

/* 画像を分割する */
- (NSArray *)imageByCropping:(UIImage *)crop
{
    NSMutableArray *croppedImages = [[NSMutableArray alloc] init];
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
    int count = [croppedImages count];
    for (int i = count - 1; i > 0; i--) {
        int randomNum = arc4random() % i;
        [croppedImages exchangeObjectAtIndex:i withObjectAtIndex:randomNum];
        NSLog(@"croppedImages == %@",croppedImages);
    }
    return croppedImages;
}


/* ピースが押されたときの動き */
-(void)pushed:(UIButton*)button{
    //まわりにボタンの空きスペースがあるか
    
    //画像が元の画像と一致しているか
}
/* まわりの空きスペースを確認 */
-(void)checkHiddenBtn{
    
}
/* 完成かどうか判定する */
-(BOOL)check{
    return NO;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
