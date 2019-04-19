//
//  ViewController.m
//  Database Test
//
//  Created by om technology on 04/04/19.
//  Copyright © 2019 Panini Academy. All rights reserved.
//

#import "ViewController.h"
#import "CompanyDetailsViewController.h"
#import "PersonalLoanViewController.h"
#import "databaseOpretion.h"
@interface ViewController ()
{
    databaseOpretion *dbo;
}
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    _txtLoanId.delegate=self;
    dbo =[[databaseOpretion alloc]init];
   // _viewdetails.hidden=YES;
}
-(BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string
{
    if(range.length + range.location > _txtLoanId.text.length)
    {
        return NO;
    }
    
    NSUInteger newLength = [_txtLoanId.text length] + [string length] - range.length;
    return newLength <=6;
}



- (IBAction)btnFindDetails:(UIButton *)sender
{
    NSString *query =[NSString stringWithFormat:@"SELECT * FROM loan_details WHERE loan_id = '%@'",_txtLoanId.text];
    if ([dbo getLoanDataFromQuery:query])
    {
        NSLog(@"data find");
        NSString *alldata=[NSString stringWithFormat:@"select * from loan_details"];
        loandata=[[NSMutableArray alloc]init];
        loandata=[dbo getLoanDataFromQuery:alldata];
        [self fatchdata];
        
    }else {
  //        _viewdetails.hidden=YES;
        UIAlertController* alert = [UIAlertController alertControllerWithTitle:@"Sorry!"message:@"Data not found"preferredStyle:UIAlertControllerStyleAlert];
        UIAlertAction *Ok=[UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleCancel handler:nil];
        [alert addAction:Ok];
        [self presentViewController:alert animated:YES completion:nil];

       
    }
}
-(void)fatchdata
{
    for (int i=0; i<loandata.count; i++)
    {
        NSString *loan_id=_txtLoanId.text;
        if ([loan_id isEqualToString:[[loandata objectAtIndex:i] valueForKey:@"loan_id"]] )
        {
            _lbloanId.text=_txtLoanId.text;
            _lblName.text=[NSString stringWithFormat:@"Name: %@",[[loandata objectAtIndex:i]valueForKey:@"full_name"]];
            _lblAdress.text=[NSString stringWithFormat:@"Adders:%@",[[loandata objectAtIndex:i]valueForKey:@"address"]];
            _lblPanNo.text=[NSString stringWithFormat:@"Pan No.:%@",[[loandata objectAtIndex:i]valueForKey:@"pan_no"] ];
            _lblCvvNo.text=[NSString stringWithFormat:@"Cvv No.:%@",[[loandata objectAtIndex:i]valueForKey:@"cvv_no"]];
           // _viewdetails.hidden=NO;
            
           
        }
        
    }

}
- (IBAction)btnCompanyDetails:(UIButton *)sender {
    
    CompanyDetailsViewController *compnyDetails =[self.storyboard instantiateViewControllerWithIdentifier:@"CompanyDetailsViewController"];
    [self.navigationController presentViewController:compnyDetails animated:YES completion:nil];
}

- (IBAction)btngotoPersonalLoan:(id)sender {
    
    PersonalLoanViewController *personalLoan=[self.storyboard instantiateViewControllerWithIdentifier:@"PersonalLoanViewController"];
    [self.navigationController presentViewController:personalLoan animated:YES completion:nil];
}
@end
