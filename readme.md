Indexing Alphabet Slider iOS
============================

![Demo](https://github.com/antoninlanglade/IndexingAlphabetSlider-iOS/blob/master/demo.gif)

### Overview

This class allows to add an alphabet slider to your TableView or CollectionView controllers for better movement through the list. (Like the iOS contact list)

### Initialization

1.
```objective-c
	NSMutableArray *anArrayOfItems = [NSMutableArray array];
	AlphabetView *alphabetView = [[AlphabetView alloc] initWithFrame:CGRectMake(x , y, width, height) letters:anArrayOfItems heightLetter:20.0];
    alphabetView.delegate = self;
    [aView addSubview:alphabetView];
```

2. anArrayOfItems is an array that contains the items list sort by the first character ( Ex : [@"Alice Ung",@"Bob Lint",@"John Doe"])
3. aView is the parent which we attach this view.

### Delegation & Movement

1.
```objective-c
@interface AViewController : UITableViewController<AlphabetDelegate>
```
2.
```objective-c
-(void)alphabetDelegate:(NSInteger)index{
    [self.tableView scrollToRowAtIndexPath:[NSIndexPath indexPathForRow:index inSection:0]
                          atScrollPosition:UITableViewScrollPositionTop
                                  animated:NO];
}
```
