//
//  DetailViewController.m
//  Journal-C
//
//  Created by Nicholas Towery on 11/30/20.
//

#import "DetailViewController.h"
#import "EntryController.h"

@interface DetailViewController ()

@property (weak, nonatomic) IBOutlet UITextField *titleField;
@property (weak, nonatomic) IBOutlet UITextView *bodyTextView;

@end

@implementation DetailViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    //NSLog(@"%@", EntryController.sharedInstance.entries);
    [self updateView];
}

- (IBAction)saveButtonTapped:(UIButton *)sender
{
    if (_entry)
    {
        [EntryController.sharedInstance updateEntry:_entry title:_titleField.text bodyText:_bodyTextView.text];
    } else
    {
        [EntryController.sharedInstance addEntryWithTitle:_titleField.text bodyText:_bodyTextView.text];
    }
    [self.navigationController popViewControllerAnimated:YES];
    
}

- (IBAction)clearButtonTapped:(UIButton *)sender
{
    _titleField.text = @"";
    _bodyTextView.text = @"";
}

- (void)updateView
{
    if (!self.entry) return;
    self.titleField.text = self.entry.title;
    self.bodyTextView.text = self.entry.bodyText;
}

@end
