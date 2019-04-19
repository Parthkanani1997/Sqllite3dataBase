//
//  ViewController.h
//  Database Test
//
//  Created by om technology on 04/04/19.
//  Copyright © 2019 Panini Academy. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController<UITextFieldDelegate>
{
    NSMutableArray *loandata;
}
-(IBAction)btnCompanyDetails:(UIButton *)sender;

- (IBAction)btngotoPersonalLoan:(id)sender;

@property (weak, nonatomic) IBOutlet UITextField *txtLoanId;
- (IBAction)btnFindDetails:(UIButton *)sender;
@property (weak, nonatomic) IBOutlet UIView *viewdetails;
@property (weak, nonatomic) IBOutlet UILabel *lbloanId;
@property (weak, nonatomic) IBOutlet UILabel *lblName;
@property (weak, nonatomic) IBOutlet UILabel *lblAdress;
@property (weak, nonatomic) IBOutlet UILabel *lblPanNo;
@property (weak, nonatomic) IBOutlet UILabel *lblCvvNo;



@end

