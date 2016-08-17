//
//  SelectDate.h
//  MovieApp
//
//  Created by ThanhSon on 1/14/16.
//  Copyright © 2016 ThanhSon. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SelectDate : UIViewController
@property (strong, nonatomic) IBOutlet UISegmentedControl *segmentedDate;
@property (strong, nonatomic) IBOutlet UIButton *btnTime1;
@property (strong, nonatomic) IBOutlet UIButton *btnTime2;
@property (strong, nonatomic) IBOutlet UIButton *btnTime3;
- (IBAction)btnTime_1:(id)sender;
- (IBAction)btnTime_2:(id)sender;
- (IBAction)btnTime_3:(id)sender;
@property (strong, nonatomic) IBOutlet UIDatePicker *picker_Date;
@property (nonatomic) NSInteger index_btn;
@property (strong,nonatomic) NSString * txt_btn1;
@property (strong,nonatomic) NSString * txt_btn2;
@property (strong,nonatomic) NSString * txt_btn3;
- (IBAction)btnSegmented:(UISegmentedControl *)sender;
@property (assign, nonatomic) int myPhimId;
@property (nonatomic,strong) NSString *Seat;
@property (nonatomic) NSInteger current_btn;
@property (strong,nonatomic) NSString * time;
@property (strong, nonatomic) IBOutlet UIDatePicker *datePicker;

@end
