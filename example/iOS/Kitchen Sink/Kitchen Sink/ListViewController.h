//
//  ListViewController.h
//  Kitchen Sink
//
//  Created by Peyton Randolph on 8/3/15.
//  Copyright © 2015 metalcv. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef UIViewController *(^ViewControllerCreationBlock)(void);
typedef void (^ViewControllerSpecificationContinuation)(ViewControllerCreationBlock, NSString *);
typedef void (^ViewControllerSpecificationBlock)(ViewControllerSpecificationContinuation);

@interface ListViewController : UITableViewController

- (instancetype)initWithVCSpecs:(NSArray<ViewControllerSpecificationBlock> *)vcSpecs;

@end
