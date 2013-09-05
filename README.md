PPImageScrollingTableViewCell
=============================
`PPImageScrollingTableViewCell` is a `UITableViewCell` subclass that can make images scrollable
horizontally in TableView.

`PPImageScrollingTableViewCell` allows to customize the cell to match your needs and uses delegate callbacks to handle actions in your `UITableViewController`

![DemoAnimation](https://raw.github.com/popochess/PPImageScrollingTableViewCell/gh-pages/images/animation.gif)

##Installing 
Add all files under `PPImageScrollingTableViewCell` folder to your project. Import the class header and register the cell class in your UITableView.

##Usage
Set sample data first. use `@"category"` and `@"images"` for key of Dictionary
```Objective-C
@property (strong, nonatomic) NSArray *images;
```
```Objective-C
self.images = @[
                  @{ @"category": @"Category A",
                     @"images":
                         @[
                             @{ @"name":@"sample_1", @"title":@"A-0"},
                             @{ @"name":@"sample_2", @"title":@"A-1"},
                             @{ @"name":@"sample_3", @"title":@"A-2"},
                             @{ @"name":@"sample_4", @"title":@"A-3"},
                             @{ @"name":@"sample_5", @"title":@"A-4"},
                             @{ @"name":@"sample_6", @"title":@"A-5"}
                          ]
                      },
                  @{ @"category": @"Category B",
                     @"images":
                         @[
                             @{ @"name":@"sample_3", @"title":@"B-0"},
                             @{ @"name":@"sample_1", @"title":@"B-1"},
                             @{ @"name":@"sample_2", @"title":@"B-2"},
                             @{ @"name":@"sample_5", @"title":@"B-3"},
                             @{ @"name":@"sample_6", @"title":@"B-4"},
                             @{ @"name":@"sample_4", @"title":@"B-5"}
                          ]
                    }
                ];
```
Add `PPImageScrollingTableViewCellDelegate` in your header file if you want to receive delegate callbacks on cell interactions
```Objective-C

#import "PPImageScrollingTableViewCell.h"

-(void)viewDidLoad 
{
    [super viewDidLoad];
    [self.tableView registerClass:[PPImageScrollingTableViewCell class] forCellReuseIdentifier:CellIdentifier];
}
```
Subclass PPImageScrollingTableViewCell in tableview delegate
```Objective-C
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath 
{
    static NSString *CellIdentifier = @"Cell";
    NSDictionary *cellData = [self.images objectAtIndex:[indexPath section]];
    PPImageScrollingTableViewCell *customCell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    [customCell setDelegate:self];
    [customCell setImageData:cellData];
    [customCell setCategoryLabelText:[cellData objectForKey:@"category"] withColor:[UIColor whiteColor]];
    [customCell setTag:[indexPath section]];
    [customCell setImageTitleTextColor:[UIColor whiteColor] withBackgroundColor:[UIColor colorWithRed:0 green:0 blue:0 alpha:0.7]];
    [customCell setImageTitleLabelWitdh:90 withHeight:45];
    [customCell setCollectionViewBackgroundColor:[UIColor darkGrayColor]];
    
    return customCell;
}
```

##`PPImageScrollingTableViewCell` Delegate Methods
```Objective-C
// Notifies the delegate when user click image
- (void)scrollingTableViewCell:(PPImageScrollingTableViewCell *)scrollingTableViewCell didSelectImageAtIndexPath:(NSIndexPath*)indexPathOfImage atCategoryRowIndex:(NSInteger)categoryRowIndex;
```

##License

`PPImageScrollingTableViewCell` is released under the MIT license.


