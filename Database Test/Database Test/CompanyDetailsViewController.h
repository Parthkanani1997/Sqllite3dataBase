//
//  CompanyDetailsViewController.h
//  Database Test
//
//  Created by om technology on 06/04/19.
//  Copyright © 2019 Panini Academy. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CompanyDetailsViewController : UIViewController
- (IBAction)btnBack:(id)sender;
@property (weak, nonatomic) IBOutlet UITextField *txtCompanyName;
@property (weak, nonatomic) IBOutlet UITextField *txtLoanAmt;
@property (weak, nonatomic) IBOutlet UITextField *txtAdress;

- (IBAction)btnApply:(UIButton *)sender;
@property NSString *dateString;
@end
