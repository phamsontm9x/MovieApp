//
//  TicketViewController.m
//  MovieApp
//
//  Created by ThanhSon on 12/28/15.
//  Copyright © 2015 ThanhSon. All rights reserved.
//

#import "TicketViewController.h"
#import "PhimSqlite.h"

@interface TicketViewController ()

@end

@implementation TicketViewController
int tongTien,giaveThuong,giaveVip;
NSString *gheStr=@"";

static NSString * const reuseIdentifier = @"Cell";
- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.title = @"Chọn ghế";
    
    
    
    //NSLog(@"%d",myPhimId );
    self.colGhe.allowsMultipleSelection = YES;
    self.gheArray = [[NSMutableArray alloc]init];
    self.gheChoseArray = [[NSMutableArray alloc]init];
    giaveThuong = [PhimSqlite layGiaveThuongTheoId:self.myPhimId];
    giaveVip = [PhimSqlite layGiaveVipTheoId:self.myPhimId];
    
}

-(void)CreateNotification{
    NSDate *pickerDate = [self.datePicker date];
    
    //Tao va lap lich cho Local Notification
    UILocalNotification *localNotification = [[UILocalNotification alloc] init];
    localNotification.fireDate = pickerDate;
    localNotification.alertBody = @"Phim sap chieu";
    localNotification.alertAction = @"Show me the item";
    localNotification.timeZone  = [NSTimeZone defaultTimeZone];
    //localNotification.soundName = @"sound.mp3";
    localNotification.applicationIconBadgeNumber  = [[UIApplication sharedApplication] applicationIconBadgeNumber]+ 1;
    
    //Dang ky local notification
    [[UIApplication sharedApplication] scheduleLocalNotification:localNotification];
    //Thuc hien tai lai table View o man hinh danh sach cong viec
    [[NSNotificationCenter defaultCenter] postNotificationName:@"reloadData" object:nil];

}

-(int) tinhTongTienVe
{
    tongTien = 0;
    
    for(int i=0;i<self.gheArray.count;i++)
    {
        int soGhe = [self.gheArray[i] intValue];
        
        if ((soGhe>26) && (soGhe <54))
        {
            tongTien+=giaveVip;
        }
        else
        {
            tongTien+=giaveThuong;
        }
    }
    return tongTien;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



// lay so ghe
-(void)laySoGheDaDat
{
    //NSLog(@"%@",seat);
    NSString * link =[NSString stringWithFormat:@"SOGHEDADAT%ld",(long)self.current_btn];
    NSString *gheTam = [PhimSqlite laySoGheDaDatTheoId:self.myPhimId withTime:link];
    NSArray * gheArray =[gheTam componentsSeparatedByString:@"\n"];
    
    NSString * ghe = [NSString stringWithFormat:@"%@",gheArray[1]];
    
    if(ghe.length>0)
    {
        
        NSArray *gheArr = [ghe componentsSeparatedByString:@"-"];
        self.gheChoseArray = [[NSMutableArray alloc]initWithArray:gheArr];
        
    }
    else
    {
        self.gheChoseArray = [[NSMutableArray alloc]init];
    }
   // NSLog(@"%@",gheChoseArray);
    
}

#pragma marks UIColectionView

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return 1;
}


- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return 72;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:reuseIdentifier forIndexPath:indexPath];
    
    [self laySoGheDaDat];
    
    int index = (int)indexPath.row;
    
    NSString *soGhe = [NSString stringWithFormat:@"%ld",(long)indexPath.row];
    [soGhe UTF8String];
    if ([self.gheChoseArray containsObject:soGhe])
    {
        cell.backgroundColor = [UIColor blueColor];
    }
    else
    {
        if ((index>26) && (index <54))
        {
            cell.backgroundColor = [UIColor redColor];
        }
        else
        {
            cell.backgroundColor = [UIColor yellowColor];
        }
    }
    
    
    return cell;
}

-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    UICollectionViewCell *cell = [collectionView cellForItemAtIndexPath:indexPath];
    UIColor *cellColor = cell.backgroundColor;
    NSString *soGhe = [NSString stringWithFormat:@"%ld",(long)indexPath.row];
    
    if ([cellColor isEqual:[UIColor greenColor]])
    {
        
        int index = (int)indexPath.row;
        if ((index>26) && (index <54))
        {
            cell.backgroundColor = [UIColor redColor];
        }
        else
        {
            cell.backgroundColor = [UIColor yellowColor];
        }
        
        [self.gheArray removeObject:soGhe];
        
    }
    else if ([cellColor isEqual:[UIColor blueColor]])
    {
        
        
    }
    else
    {
        // cell (Ghế) chưa được chọn
        cell.backgroundColor = [UIColor greenColor];
        [self.gheArray addObject:soGhe];
    }
}

-(void) collectionView:(UICollectionView *)collectionView didDeselectItemAtIndexPath:(NSIndexPath *)indexPath
{
    UICollectionViewCell *cell = [collectionView cellForItemAtIndexPath:indexPath];
    UIColor *cellColor = cell.backgroundColor;
    NSString *soGhe = [NSString stringWithFormat:@"%ld",(long)indexPath.row];
    if ([cellColor isEqual:[UIColor greenColor]])
    {
        
        int index = (int)indexPath.row;
        if ((index>26) && (index <54))
        {
            cell.backgroundColor = [UIColor redColor];
        }
        else
        {
            cell.backgroundColor = [UIColor yellowColor];
        }
        
        [self.gheArray removeObject:soGhe];
        
    }
    else if ([cellColor isEqual:[UIColor blueColor]])
    {
        
        
    }
    else
    {
        // cell (Ghế) chưa được chọn
        cell.backgroundColor = [UIColor greenColor];
        [self.gheArray addObject:soGhe];
    }
    
}

- (IBAction)btnDone:(id)sender {
    
    int slVeThuong,slVeVip;
    slVeThuong=0;
    slVeVip=0;
    for(int i=0;i<self.gheArray.count;i++)
    {
        int soGhe = [self.gheArray[i] intValue];
        
        if ((soGhe>26) && (soGhe <54))
        {
            slVeVip++;
        }
        else
        {
            slVeThuong++;
        }
    }
    
    NSString *message1 = @"Bạn đã đặt vé bao gồm :";
    NSString *message2 = [NSString stringWithFormat:@"\n%d ve Thuong %d/ve",slVeThuong,giaveThuong];
    NSString *message3 = [NSString stringWithFormat:@"\n%d ve Vip %d/ve",slVeVip,giaveVip];
    NSString *message4 = [NSString stringWithFormat:@"\nTổng tiền = %d",[self tinhTongTienVe]];
    NSString *message5 = [[NSString alloc]init];
    message5 = [[[message1 stringByAppendingString:message2] stringByAppendingString:message3]stringByAppendingString:message4];
    
    
    // create AlertController
    UIAlertController * alert =[UIAlertController alertControllerWithTitle:@"Xac Nhan" message:message5 preferredStyle:UIAlertControllerStyleAlert];
    // create action cancel
    UIAlertAction *cancelAction =[UIAlertAction actionWithTitle:@"Cancel" style:UIAlertActionStyleDefault handler:^(UIAlertAction *  action) {
        
    }];
    // create action ok
    UIAlertAction *okAction =[UIAlertAction actionWithTitle:@"Ok" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        
        gheStr = [self.gheArray componentsJoinedByString:@"-"];
        if (self.gheChoseArray.count>0)
        {
            NSString *gheChoseStr = [self.gheChoseArray componentsJoinedByString:@"-"];
            gheStr = [gheStr stringByAppendingString:@"-"];
            gheStr = [gheStr stringByAppendingString:gheChoseStr];
        }
        NSString * data = [NSString stringWithFormat:@"%@\n%@",self.time, gheStr];
        NSLog(@"%@",gheStr);
        [PhimSqlite capNhatGheDaDat:self.myPhimId soGheDat:data withTime:[NSString stringWithFormat:@"%ld",(long)self.current_btn]];
        
        [self.colGhe reloadData];
    }];
    // add action
    [alert addAction:cancelAction];
    [alert addAction:okAction];
    //show alert
    [self presentViewController:alert animated:YES completion:nil];
    [self CreateNotification];

    
}
@end
