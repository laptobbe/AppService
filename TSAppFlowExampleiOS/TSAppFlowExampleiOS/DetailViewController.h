//
//  DetailViewController.h
//  TSAppFlowExampleiOS
//
//  Created by Tobias Sundstrand on 2013-10-18.
//  Copyright (c) 2013 Computertalk. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DetailViewController : UIViewController

@property (strong, nonatomic) id detailItem;

@property (weak, nonatomic) IBOutlet UILabel *detailDescriptionLabel;
@end
