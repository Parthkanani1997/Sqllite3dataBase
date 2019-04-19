//
//  PersonalLoanViewController.h
//  Database Test
//
//  Created by om technology on 06/04/19.
//  Copyright © 2019 Panini Academy. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PersonalLoanViewController : UIViewController<UITableViewDelegate,UITableViewDataSource,UISearchDisplayDelegate>
- (IBAction)btnBack:(UIButton *)sender;
@property (weak, nonatomic) IBOutlet UISearchBar *searchBar;


@property (weak, nonatomic) IBOutlet UITableView *tableView;



@property NSMutableArray *tableViewArry;
@property NSMutableArray *searchArry;
@end
