//
//  ListViewController.m
//  Kitchen Sink
//
//  Created by Peyton Randolph on 8/3/15.
//  Copyright © 2015 metalcv. All rights reserved.
//

#import "ListViewController.h"

static NSString * const kCellReuseID = @"CellReuseID";

@interface ListViewController ()

@property (nonatomic, copy) NSArray<ViewControllerSpecificationBlock> *vcSpecs;

@end

@implementation ListViewController

- (instancetype)initWithVCSpecs:(NSArray<ViewControllerSpecificationBlock> *)vcSpecs;
{
    if (!(self = [self initWithStyle:UITableViewStylePlain]))
        return nil;
    
    self.vcSpecs = vcSpecs;
    
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:kCellReuseID];
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [self.vcSpecs count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:kCellReuseID forIndexPath:indexPath];
    
    ViewControllerSpecificationBlock specBlock = self.vcSpecs[indexPath.row];
    specBlock(^(ViewControllerCreationBlock creationBlock, NSString *title) {
        cell.textLabel.text = title;
    });
    
    return cell;
}

#pragma mark - Table view delegate

- (void)tableView:(nonnull UITableView *)tableView didSelectRowAtIndexPath:(nonnull NSIndexPath *)indexPath;
{
    assert(self.navigationController);
    
    ViewControllerSpecificationBlock specBlock = self.vcSpecs[indexPath.row];
    specBlock(^(ViewControllerCreationBlock creationBlock, NSString *title) {
        [self.navigationController pushViewController:creationBlock() animated:YES];
    });
}

@end
