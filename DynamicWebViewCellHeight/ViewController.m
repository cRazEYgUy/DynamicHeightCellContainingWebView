//
//  ViewController.m
//  DynamicWebViewCellHeight
//
//  Created by TashiroYusuke on 2015/04/19.
//  Copyright (c) 2015年 TashiroYusuke. All rights reserved.
//

#import "ViewController.h"

#import "DynamicWebCell.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UITableView *tableView;

@property (nonatomic) DynamicWebCell *webCell;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    _tableView.delegate = self;
    _tableView.dataSource = self;

    _webCell = [[[UINib nibWithNibName:@"DynamicWebCell" bundle:nil] instantiateWithOwner:self options:nil] firstObject];

    _tableView.tableFooterView = [[UIView alloc] init];
    //iOS8only
//    _tableView.rowHeight = UITableViewAutomaticDimension;
//    _tableView.estimatedRowHeight = 44.0;
    _tableView.scrollEnabled = NO;
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewDidDisappear:animated];

    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(updateWebCell:) name:@"a" object:nil];
}

- (void)viewDidDisappear:(BOOL)animated
{
    [super viewDidDisappear:animated];

    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

#pragma mark - Notification
- (void)updateWebCell:(NSNotification *)notification
{
    [_tableView reloadData];
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    // Return the number of rows in the section.
    return 1;
}

 - (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {

     DynamicWebCell *cell = _webCell;
     [cell setTitle:@"タイトル"
            withUrl:@"http://www.yahoo.co.jp/"];



 return cell;
 }

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    CGFloat height = [_webCell systemLayoutSizeFittingSize:UILayoutFittingCompressedSize].height;
    return height;
}

/*
 // Override to support conditional editing of the table view.
 - (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
 // Return NO if you do not want the specified item to be editable.
 return YES;
 }
 */

/*
 // Override to support editing the table view.
 - (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
 if (editingStyle == UITableViewCellEditingStyleDelete) {
 // Delete the row from the data source
 [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
 } else if (editingStyle == UITableViewCellEditingStyleInsert) {
 // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
 }
 }
 */

/*
 // Override to support rearranging the table view.
 - (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
 }
 */

/*
 // Override to support conditional rearranging of the table view.
 - (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
 // Return NO if you do not want the item to be re-orderable.
 return YES;
 }
 */

/*
 #pragma mark - Navigation

 // In a storyboard-based application, you will often want to do a little preparation before navigation
 - (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
 // Get the new view controller using [segue destinationViewController].
 // Pass the selected object to the new view controller.
 }
 */


@end
