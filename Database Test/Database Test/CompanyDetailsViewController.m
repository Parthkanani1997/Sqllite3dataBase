//
//  CompanyDetailsViewController.m
//  Database Test
//
//  Created by om technology on 06/04/19.
//  Copyright © 2019 Panini Academy. All rights reserved.
//

#import "CompanyDetailsViewController.h"
#import "databaseOpretion.h"

@interface CompanyDetailsViewController ()
{
    databaseOpretion *dbo;
    
}

@end

@implementation CompanyDetailsViewController
@synthesize dateString;
- (void)viewDidLoad {
    [super viewDidLoad];
    dbo=[[databaseOpretion alloc]init];
    NSDate *date= [NSDate date];
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc]init];
    [dateFormatter setDateFormat:@"dd/MM/yyyy"];
    
    dateString = [dateFormatter stringFromDate:date];
    NSLog(@"Current date is %@",dateString);
    
}



- (IBAction)btnBack:(id)sender {
    
    [self dismissViewControllerAnimated:YES completion:nil];
}
- (IBAction)btnApply:(UIButton *)sender
{
    NSString *queary=[NSString stringWithFormat:@"insert into company_details values ('%@','%ld','%@','%@')",_txtCompanyName.text,[_txtLoanAmt.text integerValue],_txtAdress.text,dateString];
    if ([dbo getCompanyDataFromQuery:queary])
    {
        UIAlertController* alert = [UIAlertController alertControllerWithTitle:@"Aplly"message:@"Your loan request is accepted"preferredStyle:UIAlertControllerStyleAlert];
        UIAlertAction *Ok=[UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleCancel handler:nil];
        [alert addAction:Ok];
        [self presentViewController:alert animated:YES completion:nil];
        _txtCompanyName.text=_txtLoanAmt.text=_txtAdress.text=@"";
    }else
    {
        NSLog(@"data not insert");
    }
}
@end
