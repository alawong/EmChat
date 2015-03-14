//
//  InterestSelectionTableViewController.m
//  EmChat
//
//  Created by Alan Wong on 14/3/15.
//  Copyright (c) 2015 Alan Wong. All rights reserved.
//

#import "InterestSelectionTableViewController.h"
#import "InterestTableViewCell.h"

@interface InterestSelectionTableViewController ()
@property (nonatomic, strong) NSMutableArray *selectedInterests, *otherInterests, *selectedSearchedInterests, *otherSearchedInterests;
@property (weak, nonatomic) IBOutlet UISearchBar *searchBar;
@end

@implementation InterestSelectionTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
    
    _selectedInterests = [NSMutableArray array];
    _selectedSearchedInterests = [_selectedInterests copy];
    _otherInterests = [@[@"Hiking", @"Skiing"] mutableCopy];
    _otherSearchedInterests = [_otherInterests copy];

//    [self.tableView registerClass:[InterestTableViewCell class] forCellReuseIdentifier:@"InterestTableViewCell"];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)searchBar:(UISearchBar *)searchBar
    textDidChange:(NSString *)searchText
{
    searchText = [searchText lowercaseString];
    if (searchText.length == 0) {
        _selectedSearchedInterests = [_selectedInterests copy];
        _otherSearchedInterests = [_otherInterests copy];
        [searchBar resignFirstResponder];
    }
    else {
        _selectedSearchedInterests = [NSMutableArray array];
        _otherSearchedInterests = [NSMutableArray array];
        for (NSString *strCase in _selectedInterests) {
            NSString *str = [strCase lowercaseString];
            if ([str containsString:searchText]) {
                [_selectedSearchedInterests addObject:strCase];
            }
        }
        for (NSString *strCase in _otherInterests) {
            NSString *str = [strCase lowercaseString];
            if ([str containsString:searchText]) {
                [_otherSearchedInterests addObject:strCase];
            }
        }
    }
    
    [self.tableView reloadData];
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 2;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    // Return the number of rows in the section.
    NSArray *arr = _otherSearchedInterests;
    if (section == 0) {
        arr = _selectedSearchedInterests;
    }

    return arr.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    InterestTableViewCell *cell = (InterestTableViewCell *)[tableView dequeueReusableCellWithIdentifier:@"InterestTableViewCell" forIndexPath:indexPath];
    
    // Configure the cell...
    
    NSArray *arr = _otherSearchedInterests;
    if (indexPath.section == 0) {
        arr = _selectedSearchedInterests;
    }
    
    NSString *str = arr[indexPath.row];
    
    cell.interestLabel.text = str;
    
    return cell;
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
