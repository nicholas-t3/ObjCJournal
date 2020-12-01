//
//  EntryTableViewCell.m
//  Journal-C
//
//  Created by Nicholas Towery on 11/30/20.
//

#import "EntryTableViewCell.h"
#import "EntryController.h"

@implementation EntryTableViewCell

- (void) updateWithEntry:(Entry *)entry
{
    if (entry) {
        _titleLabel.text = [entry title];
    }
}

@end
