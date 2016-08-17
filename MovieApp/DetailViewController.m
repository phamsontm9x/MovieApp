//
//  DetailViewController.m
//  MovieApp
//
//  Created by ThanhSon on 12/28/15.
//  Copyright © 2015 ThanhSon. All rights reserved.
//

#import "DetailViewController.h"
#import "TicketViewController.h"
#import <FBSDKCoreKit/FBSDKCoreKit.h>
#import <FBSDKLoginKit/FBSDKLoginKit.h>
#import <FBSDKShareKit/FBSDKShareKit.h>
#import "SelectDate.h"

@interface DetailViewController ()

@end

@implementation DetailViewController
NSString *videoUrl;
- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.title = @"Chi tiết phim";
    
    
    ///////////////////////////////
    self.imgDetail.image = [UIImage imageNamed:self.myPhim.hinhDetailThumbnail];
    self.imgBanner.image = [UIImage imageNamed:self.myPhim.hinhBanner];
    self.lblTenPhim.text = self.myPhim.tenPhim;
    self.lblDaoDien.text = self.myPhim.daoDien;
    self.lblThoiLuong.text = [[NSString alloc]initWithFormat:@"%@ phút",self.myPhim.thoiLuong];
    self.lblNgayChieu.text = self.myPhim.ngayChieu;
    self.txtTomTat.text = self.myPhim.tomTat;
    videoUrl = self.myPhim.videoUrl;
    //NSString *ii;
    ////////
    FBSDKShareLinkContent *content = [[FBSDKShareLinkContent alloc] init];
    NSURL *videoURL =
    [NSURL URLWithString:[NSString stringWithFormat:@"http://www.youtube.com/watch?v=%@", videoUrl]];
    content.contentURL=videoURL;
    content.contentTitle=[NSString stringWithFormat:@"Phim %@",self.myPhim.tenPhim];
    FBSDKShareButton *shareButton = [[FBSDKShareButton alloc] init];
    shareButton.shareContent = content;
    shareButton.center = self.viewShare.center;
    [self.view addSubview:shareButton];

    
}
//pop action for navagation bar button
//-(IBAction)OnClick_btnBack:(id)sender
//{
//    [self.navigationController popViewControllerAnimated:YES];
//    
//}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (IBAction)btnMuaVe:(UIButton *)sender
{

}

-(void) prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    
    if([segue.identifier isEqualToString:@"view2"]){
        SelectDate * dateView = segue.destinationViewController;
        dateView.myPhimId = self.myPhim.sid;
    }
    
}




- (IBAction)btnTrailerPlay:(UIButton *)sender
{
    //NSString *videoName = @"yISKeT6sDOg";
    NSString *string = [NSString stringWithFormat:@"http://www.youtube.com/watch?v=%@", videoUrl];
    NSURL *url = [NSURL URLWithString:string];
    UIApplication *app = [UIApplication sharedApplication];
    [app openURL:url];
}

-(void)setPhimData:(PhimSqlite *)phim
{
    self.myPhim = phim;
}



@end
