//
//  PPViewController.m
//  PPImageScrollingTableViewControllerDemo
//
//  Created by popochess on 13/8/9.
//  Copyright (c) 2013年 popochess. All rights reserved.
//

#import "PPViewController.h"
#import "PPImageScrollingTableViewCell.h"

@interface PPViewController()<PPImageScrollingTableViewCellDelegate>

@property (strong, nonatomic) NSArray *images;

@end

@implementation PPViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    self.title = @"PPImageScrollingTableView";
    [self.tableView setBackgroundColor:[UIColor grayColor]];
    
    static NSString *CellIdentifier = @"Cell";
    [self.tableView registerClass:[PPImageScrollingTableViewCell class] forCellReuseIdentifier:CellIdentifier];
    self.images = @[
                    @{ @"category": @"Category A",
                       @"images":
                           @[
                               @{ @"name":@"sample_1.jpeg", @"title":@"A-0"},
                               @{ @"name":@"sample_2.jpeg", @"title":@"A-1"},
                               @{ @"name":@"sample_3.jpeg", @"title":@"A-2"},
                               @{ @"name":@"sample_4.jpeg", @"title":@"A-3"},
                               @{ @"name":@"sample_5.jpeg", @"title":@"A-4"},
                               @{ @"name":@"sample_6.jpeg", @"title":@"A-5"}

                            ]
                       },
                    @{ @"category": @"Category B",
                       @"images":
                           @[
                               @{ @"name":@"sample_3.jpeg", @"title":@"B-0"},
                               @{ @"name":@"sample_1.jpeg", @"title":@"B-1"},
                               @{ @"name":@"sample_2.jpeg", @"title":@"B-2"},
                               @{ @"name":@"sample_5.jpeg", @"title":@"B-3"},
                               @{ @"name":@"sample_6.jpeg", @"title":@"B-4"},
                               @{ @"name":@"sample_4.jpeg", @"title":@"B-5"}
                            ]
                       },
                    @{ @"category": @"Category C",
                       @"images":
                           @[
                               @{ @"name":@"sample_6.jpeg", @"title":@"C-0"},
                               @{ @"name":@"sample_2.jpeg", @"title":@"C-1"},
                               @{ @"name":@"sample_3.jpeg", @"title":@"C-2"},
                               @{ @"name":@"sample_1.jpeg", @"title":@"C-3"},
                               @{ @"name":@"sample_5.jpeg", @"title":@"C-4"},
                               @{ @"name":@"sample_4.jpeg", @"title":@"C-5"}
                            ]
                       },
                    @{ @"category": @"Category D",
                       @"images":
                           @[
                               @{ @"name":@"sample_3.jpeg", @"title":@"D-0"},
                               @{ @"name":@"sample_1.jpeg", @"title":@"D-1"},
                               @{ @"name":@"sample_2.jpeg", @"title":@"D-2"},
                               @{ @"name":@"sample_5.jpeg", @"title":@"D-3"},
                               @{ @"name":@"sample_6.jpeg", @"title":@"D-4"},
                               @{ @"name":@"sample_4.jpeg", @"title":@"D-5"}
                               ]
                       }         
                    ];
}

#pragma mark - UITableViewDataSource

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return [self.images count];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    NSDictionary *cellData = [self.images objectAtIndex:[indexPath section]];
    PPImageScrollingTableViewCell *customCell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    [customCell setBackgroundColor:[UIColor grayColor]];
    [customCell setDelegate:self];
    [customCell setImageData:cellData];
    [customCell setCategoryLabelText:[cellData objectForKey:@"category"] withColor:[UIColor whiteColor]];
    [customCell setTag:[indexPath section]];
    [customCell setImageTitleTextColor:[UIColor whiteColor] withBackgroundColor:[UIColor colorWithRed:0 green:0 blue:0 alpha:0.7]];
    [customCell setImageTitleLabelWitdh:90 withHeight:45];
    [customCell setCollectionViewBackgroundColor:[UIColor darkGrayColor]];
 
    return customCell;
}

#pragma mark - UITableViewDelegate

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 150;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - PPImageScrollingTableViewCellDelegate

- (void)scrollingTableViewCell:(PPImageScrollingTableViewCell *)scrollingTableViewCell didSelectImageAtIndexPath:(NSIndexPath*)indexPathOfImage atCategoryRowIndex:(NSInteger)categoryRowIndex
{

    NSDictionary *images = [self.images objectAtIndex:categoryRowIndex];
    NSArray *imageCollection = [images objectForKey:@"images"];
    NSString *imageTitle = [[imageCollection objectAtIndex:[indexPathOfImage row]]objectForKey:@"title"];
    NSString *categoryTitle = [[self.images objectAtIndex:categoryRowIndex] objectForKey:@"category"];
    
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:[NSString stringWithFormat: @"Image %@",imageTitle]
                                                    message:[NSString stringWithFormat: @"in %@",categoryTitle]
                                                   delegate:self
                                          cancelButtonTitle:@"OK"  
                                          otherButtonTitles: nil];
    [alert show];  
}

@end
