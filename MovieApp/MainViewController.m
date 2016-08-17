//
//  MainViewController.m
//  MovieApp
//
//  Created by ThanhSon on 12/28/15.
//  Copyright © 2015 ThanhSon. All rights reserved.
//

#import "MainViewController.h"
#import "DetailViewController.h"
#import "CustomTableViewCell.h"
#import "PhimSqlite.h"

@interface MainViewController ()

@end

@implementation MainViewController
float oWidth,oHeight;
int h;

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.

    oWidth = self.view.frame.size.width;
    oHeight = oWidth / (2.2);
    self.phimArray = [PhimSqlite dsPhim];
    h=0;
    self.title=@"MOVIE";
    
    // Timer dùng để auto scroll
    [NSTimer scheduledTimerWithTimeInterval:3 target:self selector:@selector(onTimer)   userInfo:nil repeats:YES];
}
-(void)viewWillAppear:(BOOL)animated
{
    [self.tblPhim reloadData];
    [self setupScrollView];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(void)setupScrollView
{
    NSMutableArray *imgName = [[NSMutableArray alloc]init];
    imgName = [PhimSqlite dsHinhBanner];
    for(int i=0;i<imgName.count;i++)
    {
        UIImageView *image = [[UIImageView alloc]initWithFrame:CGRectMake(oWidth*i, 0, oWidth, oHeight)];
        NSString *name = imgName[i];
        image.image = [UIImage imageNamed:name];
        [self.scrPhim addSubview:image];
    }
    self.scrPhim.contentSize = CGSizeMake(oWidth*(imgName.count), oHeight);
}

// Disable vertical scroll
- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    if (scrollView != self.tblPhim)
    {
        [scrollView setContentOffset: CGPointMake(scrollView.contentOffset.x,0)];
        h=self.scrPhim.contentOffset.x;
    }
}

-(void) onTimer
{
    // Updates the variable h, adding 100 (put your own value here!)
    h += oWidth;
    if (h>(oWidth*self.phimArray.count))
    {
        h=0;
    }
    
    //This makes the scrollView scroll to the desired position
    [self.scrPhim setContentOffset:CGPointMake(h,self.scrPhim.contentOffset.x) animated:YES];
}

#pragma marks UITableViewCell

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.phimArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    CustomTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell" forIndexPath:indexPath];
    cell.lblName.font = [UIFont fontWithName:@"Helvetica" size:15];
    [cell.lblName sizeToFit];
    
    // Configure the cell...
    NSString *tenPhim = [self.phimArray[indexPath.row] tenPhim];
    NSString *imgName = [self.phimArray[indexPath.row] hinhTableThumbnail];
    NSString *theloai = [self.phimArray[indexPath.row] theLoai];
    cell.lblName.text = tenPhim;
    cell.imgThumbnail.image = [UIImage imageNamed:imgName];
    cell.lblTheloai.text = theloai;
    
    
    int star = round([[self.phimArray[indexPath.row] diemDanhGia] doubleValue]/2.0f);
    int x=0;
    for (int i = 0; i < star; i++) {
        UIImageView *imvStar = [[UIImageView alloc]initWithFrame:CGRectMake(x, 0, 20, 20)];
        [cell.lblStar addSubview:imvStar];
        imvStar.image = [UIImage imageNamed:@"star.png"];
        x+=20;
    }
    //NSLog(@"%i",star);

    return cell;
}
//// parse data for segue

#pragma parse Data

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([segue.identifier isEqualToString:@"view1"]) {
        NSIndexPath *indexPath = [self.tblPhim indexPathForSelectedRow];
        DetailViewController *detailView = segue.destinationViewController;
         [detailView setPhimData:self.phimArray[indexPath.row]];
    }
}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)segPhimCategory:(UISegmentedControl *)sender
{
    if (sender.selectedSegmentIndex==0)
    {
        self.phimArray = [PhimSqlite dsPhim];
        [self.tblPhim reloadData];
    }
    else
    {
        self.phimArray = [PhimSqlite dsPhimSapChieu];
        [self.tblPhim reloadData];
    }
}
@end
