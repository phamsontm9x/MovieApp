//
//  TicketViewController.h
//  MovieApp
//
//  Created by ThanhSon on 12/28/15.
//  Copyright © 2015 ThanhSon. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PhimSqlite.h"

@interface TicketViewController : UIViewController<UICollectionViewDataSource,UICollectionViewDelegate,UIAlertViewDelegate>
{
    sqlite3 *contactDB;
    NSString *dataPath;
}
//@property (strong, nonatomic) PhimSqlite *myPhim;
@property (assign, nonatomic) int myPhimId;
@property (nonatomic) NSInteger current_btn;
@property (nonatomic,strong) NSString * time;
//-(void)setPhimId:(int)PhimId;
-(void)laySoGheDaDat;

// Ghe

- (IBAction)btnDone:(id)sender;

@property (strong, nonatomic) NSMutableArray *gheArray;
@property (strong, nonatomic) NSMutableArray *gheChoseArray;
@property (strong, nonatomic) UIDatePicker *datePicker;

@property (strong, nonatomic) IBOutlet UICollectionView *colGhe;

/////////////////////////////////////

@end
