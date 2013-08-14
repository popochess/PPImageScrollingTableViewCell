PPImageScrollingTableViewCell
=============================
`PPImageScrollingTableViewCell` is a `UITableViewCell` subclass that make images can scroll 
horizontally in TableView.

`PPImageScrollingTableViewCell` allows to customize the cell to match your needs and uses delegate callbacks to handle actions in your `UITableViewController`

![DemoAnimation](https://raw.github.com/popochess/PPImageScrollingTableViewCell/master/PPImageScrollingTableViewControllerDemo/DemoAnimation.gif)

##`PPImageScrollingTableViewCell` Delegate Methods
// Notifies the delegate when user click image
```Objective-C
// Notifies the delegate when user click image
- (void)scrollingTableViewCell:(PPScrollingTableViewCell *)scrollingTableViewCell didSelectImageAtIndexPath:(NSIndexPath*)indexPathOfImage atCategoryRowIndex:(NSInteger)categoryRowIndex;
```
