//
//  ForthViewController.h
//  テクドラ
//
//  Created by 所　紀彦 on 2015/03/27.
//  Copyright (c) 2015年 com.litech. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DamageValueLabel.h"


@interface ForthViewController : UIViewController


{
    int power ;
    IBOutlet UILabel *powerlabel ;
    
    int hp;
    IBOutlet UILabel *hplabel ;
    
    
    IBOutlet UILabel *nextlabel ;
    IBOutlet UIButton *next ;
    
    IBOutlet UILabel *kiaiLabel ;
    IBOutlet UIButton *kiai ;
    
    IBOutlet UILabel *kougekiLabel ;
    IBOutlet UIButton * kougeki ;
    
    NSTimer *timer ;
    float count ;
    IBOutlet UILabel *timerlabel ;
    
    
    
}

-(IBAction)kiai ;
-(IBAction)kougeki ;
-(void)down ;





/* ----- ここから下は変更しない ----- */
@property (nonatomic, retain) IBOutlet UIImageView *charaImgView;
@property (nonatomic, retain) IBOutlet DamageValueLabel *damageLabel;
- (void)clear;
- (void)damageAnimation;


@end
