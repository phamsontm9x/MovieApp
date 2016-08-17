//
//  AddViewController.m
//  MovieApp
//
//  Created by ThanhSon on 12/28/15.
//  Copyright © 2015 ThanhSon. All rights reserved.
//

#import "AddViewController.h"

@interface AddViewController ()

@end

@implementation AddViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    //Set navigation back button
    UIBarButtonItem *btnBack = [[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemReply target:self action:@selector(OnClick_btnBack:)];
    self.navigationItem.leftBarButtonItem = btnBack;
    
    UIBarButtonItem *btnDone = [[UIBarButtonItem alloc]initWithTitle:@"Xong" style:UIBarButtonItemStyleDone target:self action:@selector(OnClick_btnDone:)];
    self.navigationItem.rightBarButtonItem = btnDone;
}

//pop action for navagation bar button
-(IBAction)OnClick_btnBack:(id)sender
{
    [self.navigationController popViewControllerAnimated:YES];
    //[self.navigationController pushViewController:self.navigationController.parentViewController animated:YES];
}

-(IBAction)OnClick_btnDone:(id)sender
{
    UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"Title" message:@"Message" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
    [alert show];
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

@end
