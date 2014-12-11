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
@property (nonatomic, strong) NSMutableArray *views;
@end

@implementation ViewController
@synthesize views;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    //
    views = [[NSMutableArray alloc] init];
    
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
}

- (NSArray *)divideImage:(UIImage *)image
{
    // イメージをバラバラに分割する
    NSMutableArray *result = [[NSMutableArray alloc] init];
    //ひとつひとつ分かれた画像の大きさ
    int size = 50;
    
    for (int y=0; y<300; y+=size) {
        for (int x=0; x<260; x+=size) {
            CGRect rect = CGRectMake(x, y, size, size);
            UIImage *croppedImage = [self imageByCropping:image toRect:rect];
            UIButton *b = [[UIButton alloc] initWithFrame:CGRectMake(x+60, y+100, size, size)];  // ボタンのサイズを指定する
            [b setBackgroundImage:croppedImage forState:UIControlStateNormal];
        //    b.layer.zPosition = - (y * 100 + x); // 重なったとき上に来るように
            [result addObject:b];
        }
    }
    return result;
}


- (UIImage *)imageByCropping:(UIImage *)crop toRect:(CGRect)rect
{
    // 指定した四角でイメージを切り抜き
    CGImageRef imageRef = CGImageCreateWithImageInRect([crop CGImage], rect);
    UIImage *cropped = [UIImage imageWithCGImage:imageRef];
    CGImageRelease(imageRef);
    return cropped;
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
