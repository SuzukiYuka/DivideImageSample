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
    views = [[NSMutableArray alloc] init];
    
    // サンプル画像を読み込む
    UIImage *image = [UIImage imageNamed:@"mizubuu.png"];
    NSArray *imageViews = [self divideImage:image];
    
    for (UIImageView *iv in imageViews) {
        [self.view addSubview:iv];
        [views addObject:iv];
    }
}

- (NSArray *)divideImage:(UIImage *)image
{
    // イメージをバラバラに分割する
    NSMutableArray *result = [[NSMutableArray alloc] init];
    //ひとつひとつ分かれた画像の大きさ
    int size = 50;
    
    for (int y=0; y<480; y+=size) {
        for (int x=0; x<320; x+=size) {
            CGRect rect = CGRectMake(x, y, size, size);
            UIImage *croppedImage = [self imageByCropping:image toRect:rect];
            UIImageView *v = [[UIImageView alloc] initWithFrame:rect];
            v.image = croppedImage;
            v.layer.cornerRadius = 2.0;
            v.layer.borderWidth = 1.0;
            v.layer.borderColor = [UIColor whiteColor].CGColor;
            v.layer.zPosition = - (y * 100 + x); // 重なったとき上に来るように
            [result addObject:v];
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

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    // タッチしたら、画像をバラバラにくずす
    for (int i=0; i<[views count]; i++) {
        [UIView animateWithDuration:0.8 delay:i * 0.05 options:UIViewAnimationOptionCurveEaseIn animations:^{
            UIView *v = [views objectAtIndex:i];
            v.center = CGPointMake(v.center.x, 600);
        } completion:^(BOOL finished) {}];
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
