//
//  EntryListTableViewController.m
//  Journal-C
//
//  Created by Nicholas Towery on 11/30/20.
//

#import "EntryListTableViewController.h"
#import "EntryController.h"
#import "EntryTableViewCell.h"
#import "DetailViewController.h"

@interface EntryListTableViewController ()

@end

@implementation EntryListTableViewController

- (void)viewWillAppear:(BOOL)animated;
{
    [self.tableView reloadData];
}

- (void)viewDidLoad {
    [super viewDidLoad];

}

//- (void)viewWillAppear {
//    [super viewWillAppear];
//}

#pragma mark - Table view data source


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return EntryController.sharedInstance.entries.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"entryCell" forIndexPath:indexPath];
    
    Entry * entry = EntryController.sharedInstance.entries[indexPath.row];

    cell.textLabel.text = entry.title;
    
    return cell;
}

// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        
        Entry * entry = EntryController.sharedInstance.entries[indexPath.row];
        [EntryController.sharedInstance removeEntry:entry];
       
        
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    }
}

#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([[segue identifier]  isEqual: @"toDetailVC"])
    {
        DetailViewController * destinationVC = [segue destinationViewController];
        NSIndexPath * indexPath = [self.tableView indexPathForSelectedRow];
        Entry * entryToPass = EntryController.sharedInstance.entries[indexPath.row];
        destinationVC.entry = entryToPass;
    }
}


@end
