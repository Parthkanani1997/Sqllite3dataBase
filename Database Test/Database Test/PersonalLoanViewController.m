//
//  PersonalLoanViewController.m
//  Database Test
//
//  Created by om technology on 06/04/19.
//  Copyright © 2019 Panini Academy. All rights reserved.
//

#import "PersonalLoanViewController.h"
#import "databaseOpretion.h"
@interface PersonalLoanViewController ()
{
    databaseOpretion *dbo;
}

@end

@implementation PersonalLoanViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    _tableView.delegate=self;
    _tableView.dataSource=self;
    _searchBar.delegate=self;
   
    dbo=[[databaseOpretion alloc]init];
    _tableViewArry =[[NSMutableArray alloc]init];
    _searchArry=[[NSMutableArray alloc]init];
    NSString *query = [NSString stringWithFormat:@"select * from test"];
    _tableViewArry=[dbo getTestDataFromQuery:query];
    
}


- (IBAction)btnBack:(UIButton *)sender {
    [self.navigationController dismissViewControllerAnimated:YES completion:nil];
}
- (IBAction)BtnSerch:(id)sender {
   // NSString *query=[NSString stringWithFormat:@"select * from test WHERE first_name LIKE '%@ %' ",_txtSearch.text];
   }

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (tableView == self.searchDisplayController.searchResultsTableView) {
        return _tableViewArry.count;
        
    } else {
        return _searchArry.count;
        
    }
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell =[tableView dequeueReusableCellWithIdentifier:@"cell"];
    UIImageView *imgProfile = [cell viewWithTag:201];
    
    
    
   
    imgProfile.layer.borderColor=[UIColor brownColor].CGColor;
    imgProfile.layer.cornerRadius=150.0f;
     imgProfile.layer.borderWidth=2.0f;
    imgProfile.layer.cornerRadius = imgProfile.frame.size.width / 2;
    imgProfile.clipsToBounds = YES;
    
    
    UILabel *lblName=[cell viewWithTag:202];
    
    imgProfile.image=[UIImage imageNamed:@"user.png"];
    
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
    }
    
    if (tableView == self.searchDisplayController.searchResultsTableView) {
        lblName.text = [[_searchArry objectAtIndex:indexPath.row]valueForKey:@"first_name"];
    } else {
        lblName.text = [[_tableViewArry objectAtIndex:indexPath.row]valueForKey:@"first_name"];
    }
    
    
    lblName.text=[[_tableViewArry objectAtIndex:indexPath.row]valueForKey:@"first_name"];
    [cell.contentView addSubview:imgProfile];
    [cell.contentView addSubview:lblName];
    
    
    
    return cell;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
  {
      return 100;
  }

- (void)filterContentForSearchText:(NSString*)searchText scope:(NSString*)scope
{
    NSPredicate *resultPredicate = [NSPredicate predicateWithFormat:@"SELF contains[cd] %@",
                                    searchText];
    
    _searchArry = [_tableViewArry filteredArrayUsingPredicate:resultPredicate];
}


-(BOOL)searchDisplayController:(UISearchDisplayController *)controller
shouldReloadTableForSearchString:(NSString *)searchString
{
    [self filterContentForSearchText:searchString scope:[[self.searchDisplayController.searchBar scopeButtonTitles]objectAtIndex:[self.searchDisplayController.searchBar selectedScopeButtonIndex]]];
    
    return YES;
}
@end
