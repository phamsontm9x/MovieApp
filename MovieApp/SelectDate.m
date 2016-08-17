//
//  SelectDate.m
//  MovieApp
//
//  Created by ThanhSon on 1/14/16.
//  Copyright © 2016 ThanhSon. All rights reserved.
//

#import "SelectDate.h"
#import "PhimSqlite.h"
#import "TicketViewController.h"

@implementation SelectDate

-(void)viewDidLoad{
    
    [self SetUp];
}

- (IBAction)btnTime_1:(id)sender {
    [self.btnTime1 setBackgroundColor:[UIColor greenColor]];
    [self.btnTime2 setBackgroundColor:[UIColor whiteColor]];
    [self.btnTime3 setBackgroundColor:[UIColor whiteColor]];
    NSArray * time1 =[self.txt_btn1 componentsSeparatedByString:@"\n"];
    self.time = time1[0];
    self.current_btn = (self.index_btn)*3+1;

}

- (IBAction)btnTime_2:(id)sender {
    [self.btnTime2 setBackgroundColor:[UIColor greenColor]];
    [self.btnTime1 setBackgroundColor:[UIColor whiteColor]];
    [self.btnTime3 setBackgroundColor:[UIColor whiteColor]];
    NSArray * time1 =[self.txt_btn1 componentsSeparatedByString:@"\n"];
    self.time = time1[0];
    self.current_btn = (self.index_btn)*3+2;
}

- (IBAction)btnTime_3:(id)sender {
    [self.btnTime3 setBackgroundColor:[UIColor greenColor]];
    [self.btnTime2 setBackgroundColor:[UIColor whiteColor]];
    [self.btnTime1 setBackgroundColor:[UIColor whiteColor]];
    NSArray * time1 =[self.txt_btn1 componentsSeparatedByString:@"\n"];
    self.time = time1[0];
    self.current_btn = (self.index_btn)*3+3;
}
-(void) SetUp{
    
    NSDateComponents *components = [[NSCalendar currentCalendar] components:NSCalendarUnitDay | NSCalendarUnitMonth | NSCalendarUnitYear fromDate:[NSDate date]];
    NSInteger day = [components day];
    NSInteger month = [components month];
    NSInteger year = [components year];
    
    [self.segmentedDate setTitle:[NSString stringWithFormat:@"%ld/%ld/%ld",(long)day,(long)month,(long)year] forSegmentAtIndex:0];
    [self.segmentedDate setTitle:[NSString stringWithFormat:@"%ld/%ld/%ld",(long)day+1,(long)month,(long)year] forSegmentAtIndex:1];
    [self.segmentedDate setTitle:[NSString stringWithFormat:@"%ld/%ld/%ld",(long)day+2,(long)month,(long)year] forSegmentAtIndex:2];
    // lay gia tri cua button duoc kick cuoi cung
    self.index_btn = self.segmentedDate.selectedSegmentIndex;
    // getdata
    self.txt_btn1 = [PhimSqlite laySoGheDaDatTheoId:self.myPhimId withTime:@"SOGHEDADAT1"];
    self.txt_btn2 = [PhimSqlite laySoGheDaDatTheoId:self.myPhimId withTime:@"SOGHEDADAT2"];
    self.txt_btn3 = [PhimSqlite laySoGheDaDatTheoId:self.myPhimId withTime:@"SOGHEDADAT3"];
    NSArray * time1 =[self.txt_btn1 componentsSeparatedByString:@"\n"];
    NSArray * time2 =[self.txt_btn2 componentsSeparatedByString:@"\n"];
    NSArray * time3 =[self.txt_btn3 componentsSeparatedByString:@"\n"];
   // NSLog(@"%@",self.txt_btn1);
    [self.btnTime1 setTitle:time1[0] forState:UIControlStateNormal];
    [self.btnTime2 setTitle:time2[0] forState:UIControlStateNormal];
    [self.btnTime3 setTitle:time3[0] forState:UIControlStateNormal];
    ///

    self.title=@"ĐẶT VÉ";
    // mac dinh button 1
    self.current_btn = 1;
    [self.btnTime1 setBackgroundColor:[UIColor greenColor]];
    self.time = time1[0];
//    if (time1[1]) {
//        self.Seat = [NSString stringWithFormat:@"%@",time1[1]];
//    } else {
//        self.Seat = @"";
//
//    }
    
}
- (IBAction)btnSegmented:(UISegmentedControl *)sender {
    self.index_btn = self.segmentedDate.selectedSegmentIndex;
    
    if (self.index_btn == 0) {
        self.txt_btn1 = [PhimSqlite laySoGheDaDatTheoId:self.myPhimId withTime:@"SOGHEDADAT1"];
        self.txt_btn2 = [PhimSqlite laySoGheDaDatTheoId:self.myPhimId withTime:@"SOGHEDADAT2"];
        self.txt_btn3 = [PhimSqlite laySoGheDaDatTheoId:self.myPhimId withTime:@"SOGHEDADAT3"];
        NSArray * time1 =[self.txt_btn1 componentsSeparatedByString:@"\n"];
        NSArray * time2 =[self.txt_btn2 componentsSeparatedByString:@"\n"];
        NSArray * time3 =[self.txt_btn3 componentsSeparatedByString:@"\n"];
       // NSLog(@"%@",self.txt_btn1);
        [self.btnTime1 setTitle:time1[0] forState:UIControlStateNormal];
        [self.btnTime2 setTitle:time2[0] forState:UIControlStateNormal];
        [self.btnTime3 setTitle:time3[0] forState:UIControlStateNormal];    }
    
    if (self.index_btn ==1) {
        self.txt_btn1 = [PhimSqlite laySoGheDaDatTheoId:self.myPhimId withTime:@"SOGHEDADAT4"];
        self.txt_btn2 = [PhimSqlite laySoGheDaDatTheoId:self.myPhimId withTime:@"SOGHEDADAT5"];
        self.txt_btn3 = [PhimSqlite laySoGheDaDatTheoId:self.myPhimId withTime:@"SOGHEDADAT6"];
        NSArray * time1 =[self.txt_btn1 componentsSeparatedByString:@"\n"];
        NSArray * time2 =[self.txt_btn2 componentsSeparatedByString:@"\n"];
        NSArray * time3 =[self.txt_btn3 componentsSeparatedByString:@"\n"];
       // NSLog(@"%@",self.txt_btn1);
        [self.btnTime1 setTitle:time1[0] forState:UIControlStateNormal];
        [self.btnTime2 setTitle:time2[0] forState:UIControlStateNormal];
        [self.btnTime3 setTitle:time3[0] forState:UIControlStateNormal];
    }
    
    if (self.index_btn==2) {
        self.txt_btn1 = [PhimSqlite laySoGheDaDatTheoId:self.myPhimId withTime:@"SOGHEDADAT7"];
        self.txt_btn2 = [PhimSqlite laySoGheDaDatTheoId:self.myPhimId withTime:@"SOGHEDADAT8"];
        self.txt_btn3 = [PhimSqlite laySoGheDaDatTheoId:self.myPhimId withTime:@"SOGHEDADAT9"];
        NSArray * time1 =[self.txt_btn1 componentsSeparatedByString:@"\n"];
        NSArray * time2 =[self.txt_btn2 componentsSeparatedByString:@"\n"];
        NSArray * time3 =[self.txt_btn3 componentsSeparatedByString:@"\n"];
        //NSLog(@"%@",self.txt_btn1);
        [self.btnTime1 setTitle:time1[0] forState:UIControlStateNormal];
        [self.btnTime2 setTitle:time2[0] forState:UIControlStateNormal];
        [self.btnTime3 setTitle:time3[0] forState:UIControlStateNormal];
    }

    
}

-(void) prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    
        if([segue.identifier isEqualToString:@"view3"]){
    
            TicketViewController*ticket =segue.destinationViewController;
            ticket.myPhimId = self.myPhimId;
            ticket.current_btn = self.current_btn;
            ticket.time = self.time;
            [ticket laySoGheDaDat ];
            ticket.datePicker = self.datePicker;
           // NSLog(@"%@",self.datePicker.date);
        }
}

@end
