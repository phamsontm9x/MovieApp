//
//  MainViewController.h
//  MovieApp
//
//  Created by ThanhSon on 12/28/15.
//  Copyright © 2015 ThanhSon. All rights reserved.
//
#import <UIKit/UIKit.h>

@interface MainViewController : UIViewController<UITableViewDataSource,UITableViewDelegate,UIScrollViewDelegate>
@property (nonatomic,strong) NSMutableArray *phimArray;
@property (strong, nonatomic) IBOutlet UITableView *tblPhim;


- (IBAction)segPhimCategory:(UISegmentedControl *)sender;

@property (strong, nonatomic) IBOutlet UIScrollView *scrPhim;
//@property (strong, nonatomic) IBOutlet UIImageView *imageBanner;

@end
