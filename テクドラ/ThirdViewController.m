//
//  ThirdViewController.m
//  テクドラ
//
//  Created by 所　紀彦 on 2015/03/27.
//  Copyright (c) 2015年 com.litech. All rights reserved.
//

#import "ThirdViewController.h"
#import "UIView+shake.h"
#import "UIImageView+effects.h"
#import "UIImage+fill.h"
#import <QuartzCore/QuartzCore.h>

@interface ThirdViewController ()

@end

@implementation ThirdViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    hp = 300;
    hplabel.text = [NSString stringWithFormat:@"%d",hp];
    
    next.hidden = YES ;
    nextlabel.hidden = YES ;
    count = 5.0 ;
    timerlabel.text = [NSString stringWithFormat:@"%.2f",count] ;
    
    timer = [NSTimer scheduledTimerWithTimeInterval:0.01
                                             target:self
                                           selector:@selector(down)
                                           userInfo:nil
                                            repeats:YES
             ] ;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

#pragma mark - きあいだめ
/*
 *
 * 問題1 画面上の「こうげきりょく」数字が3ずつ増えていくボタンを作ろう。
 * 問題2 数字が10以上30未満ならば文字の色が緑に、30以上50未満ならば青、50以上ならば赤になるコードを、if文を使って問題1の関数の中に加えてみよう。
 * 問題3 問題2の条件分岐コードをswitch文で書き換えてみよう。
 *
 */


-(IBAction)kiai{
    
    if(count > 0){
        
        power = power + 3 ;
        powerlabel.text = [NSString stringWithFormat:@"%d",power];
        
    }else{
        //何もしない
        
    }
    
    //if(power > 10 : power = < 30 ){
    //label.textColor = UIColor greenColor ;
}


#pragma mark - こうげき
/*
 *
 * 問題4 攻撃ボタンを作って、押すと相手にダメージを与えるボタンを作ってみよう。
 * 問題5 「damageAnimation」メソッドを呼び出すメッセージ式を書き加えてみよう。
 * 問題6 相手の体力が0以下になったときに「clear」メソッドを1秒後に呼び出すメッセージ式を書き加えてみよう。
 *
 */

-(IBAction)kougeki{
    
    if(count > 0){
        hp = hp - power ;
        hplabel.text = [NSString stringWithFormat:@"%d",hp];
        
        [self damageAnimation];
        
        
        if (hp <= 0){
            [self performSelector:@selector(clear) withObject:nil afterDelay:1.0];
            
            hp = 0 ;
            hplabel.text = [NSString stringWithFormat:@"%d",hp] ;
            
            next.hidden = NO ;
            nextlabel.hidden = NO ;
            
            kougeki.hidden = YES ;
            kougekiLabel.hidden = YES ;
            
            kiai.hidden = YES ;
            kiaiLabel.hidden = YES ;
        }else{
            next.hidden = YES ;
            nextlabel.hidden = YES ;
            
            kougeki.hidden = NO ;
            kougekiLabel.hidden = NO ;
            
            kiai.hidden = NO ;
            kiaiLabel.hidden = NO ;
        }
    }else{
        //何もしない
    }
    
}
-(IBAction)reset{
    hp = 300 ;
    hplabel.text = [NSString stringWithFormat:@"%d",hp];
    
    power = 0 ;
    powerlabel.text = [NSString stringWithFormat:@"%d",power];
    
    self.charaImgView.alpha = 1.0 ;
    
    next.hidden = YES ;
    nextlabel.hidden = YES ;
    
    kougeki.hidden = NO ;
    kougekiLabel.hidden = NO ;
    
    kiai.hidden = NO ;
    kiaiLabel.hidden = NO ;
    
    count = 5 ;
    timerlabel.text = [NSString stringWithFormat:@"%.2f",count] ;
    
}

-(void)down{
    
    if(count > 0){
        count -= 0.01 ;
        //↑count = count - 0.01 と同じ意味
        timerlabel.text = [NSString stringWithFormat:@"%.2f",count] ;
    }else{
        count = 0 ;
        timerlabel.text = [NSString stringWithFormat:@"%.2f",count] ;
    }
    
}





















#pragma mark - はじめから
/*
 *
 *問題7 はじめからやり直す「リトライボタン」を作って、最初の状態に戻してみよう。
 *
 */











#pragma mark - 初期設定

/* ----- 攻撃アニメーション ----- */

- (void)damageAnimation{
    DamageAnimationType type;
    type = DamageAnimationType3;
    if (power > 0) {
        self.damageLabel.text = [NSString stringWithFormat:@"%d",power];
    }else{
        self.damageLabel.text = @"miss";
    }
    
    self.damageLabel.textColor = [UIColor whiteColor];
    
    [self.charaImgView shakeWithCount:10 interval:0.03];
    [self.charaImgView whiteFadeInWithDuration:0.3
                                         delay:0.0
                                         block:^(void) {
                                             [self.damageLabel startAnimationWithAnimationType:type];
                                         }];
}




/* ----- フェードアウトアニメーション ----- */

- (void)clear{
    [UIView animateWithDuration:2.0
                     animations:^{
                         self.charaImgView.alpha = 0.0;
                     }
                     completion:^(BOOL finished){
                         //[self.charaImgView removeFromSuperview];
                         //self.charaImgView.image = nil;
                     }];
}








@end
