//
//  DetailViewController.h
//  MovieApp
//
//  Created by ThanhSon on 12/28/15.
//  Copyright © 2015 ThanhSon. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PhimSqlite.h"

@interface DetailViewController : UIViewController
{
    NSString *titleName;
    NSString *imageName;
}

@property (strong, nonatomic) IBOutlet UILabel *lblTenPhim;
@property (strong, nonatomic) IBOutlet UILabel *lblDaoDien;
@property (strong, nonatomic) IBOutlet UILabel *lblThoiLuong;
@property (strong, nonatomic) IBOutlet UILabel *lblNgayChieu;
@property (strong, nonatomic) IBOutlet UIImageView *imgDetail;

@property (strong, nonatomic) IBOutlet UITextView *txtTomTat;
@property (strong, nonatomic) IBOutlet UIImageView *imgBanner;
@property (strong, nonatomic) PhimSqlite *myPhim;
- (IBAction)btnMuaVe:(UIButton *)sender;

- (IBAction)btnTrailerPlay:(UIButton *)sender;
@property (weak, nonatomic) IBOutlet UIView *viewShare;

-(void)setPhimData:(PhimSqlite*) phim;

@end
