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
    //
//    views = [[NSMutableArray alloc] init];
    size = 50;
    // サンプル画像を読み込む
    UIImage *image_mae = [UIImage imageNamed:@"mizubuu.png"];
    UIImage *image;  // リサイズ後UIImage
    CGFloat width = 200;  // リサイズ後幅のサイズ
    CGFloat height = 200;  // リサイズ後高さのサイズ
    
    UIGraphicsBeginImageContext(CGSizeMake(width, height));
    [image_mae drawInRect:CGRectMake(0, 0, width, height)];
    image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();

 
    //画像を分割->buttonへ
    NSArray *buttons = [self divideImage:image];
    
    for (UIButton *bt in buttons) {
        [self.view addSubview:bt];
       // [views addObject:bt];
    }
    
    UIButton *lastbtn = [buttons lastObject];
   // lastbtn.hidden = YES;
    
    
}

- (NSArray *)divideImage:(UIImage *)image
{
    // イメージをバラバラに分割する
    NSMutableArray *result = [[NSMutableArray alloc] init];
    //ひとつひとつ分かれた画像の大きさ
    int i = 0;
    for (int y=0; y<200; y+=size) {
        for (int x=0; x<200; x+=size) {
//            UIImage *croppedImage = [self imageByCropping:image toRect:CGRectMake(x, y, size, size)];
            UIButton *b = [[UIButton alloc] initWithFrame:CGRectMake(x+60, y+100, size, size)];  // ボタンのサイズを指定する
            [b setBackgroundImage:[self imageByCropping:image][i] forState:UIControlStateNormal];
            i++;
        //    b.layer.zPosition = - (y * 100 + x); // 重なったとき上に来るように
            [b addTarget:self action:@selector(pushed:) forControlEvents:UIControlEventTouchUpInside];

            [result addObject:b];
        }
    }

    return result;
}

- (NSArray *)imageByCropping:(UIImage *)crop
{
    NSMutableArray *croppedImages = [[NSMutableArray alloc] init];
    for (int y=0; y<200; y+=size) {
        for (int x=0; x<200; x+=size) {
            // 指定した四角でイメージを切り抜き
            CGRect rect = CGRectMake(x, y, size, size);
            CGImageRef imageRef = CGImageCreateWithImageInRect([crop CGImage], rect);
            UIImage *cropped = [UIImage imageWithCGImage:imageRef];
            CGImageRelease(imageRef);
            [croppedImages addObject:cropped];
        }
    }
    //画像の順番をランダムにする
    int count = [croppedImages count];
    for (int i = count - 1; i > 0; i--) {
        int randomNum = arc4random() % i;
        [croppedImages exchangeObjectAtIndex:i withObjectAtIndex:randomNum];
    }
    return croppedImages;
}


//puzzleの動き
-(void)pushed:(UIButton*)button{
    //まわりにボタンの空きスペースがあるか
    
    //画像が元の画像と一致しているか
}
//まわりの空きスペースを確認
-(void)checkHiddenBtn{
    
}
//完成かどうかの判定
-(void)check{
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
