//
//  databaseOpretion.m
//  Database Test
//
//  Created by om technology on 04/04/19.
//  Copyright © 2019 Panini Academy. All rights reserved.
//

#import "databaseOpretion.h"

@implementation databaseOpretion
@synthesize strpath;
-(id)init
{
    apdel=(AppDelegate *)[[UIApplication sharedApplication] delegate];
    strpath=apdel.strpath;
    return self;
}
-(NSMutableArray *)getLoanDataFromQuery:(NSString *)query
{
  
    NSMutableArray *arryloanDetails=[[NSMutableArray alloc]init];
    
    
    
    if (sqlite3_open([strpath UTF8String], &database)==SQLITE_OK)
    {
        sqlite3_stmt *stmt;
        if (sqlite3_prepare_v2(database, [query UTF8String], -1, &stmt, nil)==SQLITE_OK)
        {
            while (sqlite3_step(stmt)==SQLITE_ROW) {
           
            NSMutableDictionary *dicLoanDetails =[[NSMutableDictionary alloc]init];
            
                   //Loan Details
            
            NSString *strLoanId=[[NSString alloc]initWithUTF8String:(char *)sqlite3_column_text(stmt ,0)];
            NSString *strFullname =[[NSString alloc]initWithUTF8String:(char *)sqlite3_column_text(stmt, 1)];
             NSString *strAderss =[[NSString alloc]initWithUTF8String:(char *)sqlite3_column_text(stmt, 2)];
            NSString *strPanNo =[[NSString alloc]initWithUTF8String:(char *)sqlite3_column_text(stmt, 3)];
            NSString *strCvvNo =[[NSString alloc]initWithUTF8String:(char *)sqlite3_column_text(stmt, 4)];
            
            [dicLoanDetails setValue:strLoanId forKey:@"loan_id"];
            [dicLoanDetails setValue:strFullname forKey:@"full_name"];
            [dicLoanDetails setValue:strAderss forKey:@"address"];
            [dicLoanDetails setValue:strPanNo forKey:@"pan_no"];
            [dicLoanDetails setValue:strCvvNo forKey:@"cvv_no"];
            
            [arryloanDetails addObject:dicLoanDetails];
            
            }
            
        }sqlite3_finalize(stmt);
    }
    sqlite3_close(database);
    
    
    return arryloanDetails;
    
    
}
-(NSMutableArray *)getTestDataFromQuery:(NSString *)query
{
    NSMutableArray *arryTblTest =[[NSMutableArray alloc]init];
   
    
    if (sqlite3_open([strpath UTF8String], &database)==SQLITE_OK)
    {
        sqlite3_stmt *stmt;
        if (sqlite3_prepare_v2(database, [query UTF8String], -1, &stmt, nil)==SQLITE_OK)
        {
              while (sqlite3_step(stmt)==SQLITE_ROW) {
            NSMutableDictionary *dicTest=[[NSMutableDictionary alloc]init];
       
            //table test
            
            NSString *strfirstname=[[NSString alloc]initWithUTF8String:(char*)sqlite3_column_text(stmt, 0)];      //fristname
            NSString *strLastName=[[NSString alloc]initWithUTF8String:(char *)sqlite3_column_text(stmt, 1)];          //lastname
            NSString *strCompanyName=[[NSString alloc]initWithUTF8String:(char *)sqlite3_column_text(stmt, 2)];           //companyName
            NSString *strAddress=[[NSString alloc]initWithUTF8String:(char *)sqlite3_column_text(stmt, 3)];           //address
            NSString *strCity=[[NSString alloc]initWithUTF8String:(char *)sqlite3_column_text(stmt, 4)];         //city
            NSString *strCountry=[[NSString alloc]initWithUTF8String:(char *)sqlite3_column_text(stmt, 5)];          // country
            NSString *strState=[[NSString alloc]initWithUTF8String:(char *)sqlite3_column_text(stmt, 6)];           //state
            NSString *strZip=[[NSString alloc]initWithUTF8String:(char*)sqlite3_column_text(stmt, 7)];      //zip
            NSString *strPhone1=[[NSString alloc]initWithUTF8String:(char *)sqlite3_column_text(stmt,8)];            //phone1
            NSString *strlPhone2=[[NSString alloc]initWithUTF8String:(char *)sqlite3_column_text(stmt, 9)];           //phone2
            NSString *strEmail=[[NSString alloc]initWithUTF8String:(char *)sqlite3_column_text(stmt, 10)];           //Email
            NSString *strWeb=[[NSString alloc]initWithUTF8String:(char *)sqlite3_column_text(stmt, 11)];         //web
            
            
            [dicTest setValue:strfirstname forKey:@"first_name"];
            [dicTest setValue:strLastName forKey:@"last_name"];
            [dicTest setValue:strCompanyName forKey:@"company_name"];
            [dicTest setValue:strAddress forKey:@"address"];
            [dicTest setValue:strCity forKey:@"city"];
            [dicTest setValue:strCountry forKey:@"county"];
            [dicTest setValue:strState forKey:@"state"];
            [dicTest setValue:strZip forKey:@"zip"];
            [dicTest setValue:strPhone1 forKey:@"phone1"];
            [dicTest setValue:strlPhone2 forKey:@"phone2"];
            [dicTest setValue:strEmail forKey:@"email"];
            [dicTest setValue:strWeb forKey:@"web"];
            
            [arryTblTest addObject:dicTest];
            
              }
            
        }sqlite3_finalize(stmt);
    }
    sqlite3_close(database);
    
    
    return arryTblTest;
}
-(NSMutableArray *)getCompanyDataFromQuery:(NSString *)query
{
    NSMutableArray *arrycompanyDetails =[[NSMutableArray alloc]init];
  
    if (sqlite3_open([strpath UTF8String], &database)==SQLITE_OK)
    {
        sqlite3_stmt *stmt;
        if (sqlite3_prepare_v2(database, [query UTF8String], -1, &stmt, nil)==SQLITE_OK)
        {  while (sqlite3_step(stmt)==SQLITE_ROW) {
            
            NSMutableDictionary *dicCompanyDetails=[[NSMutableDictionary alloc]init];
            
            
            // company details
            
            NSString *strCmpName=[[NSString alloc]initWithUTF8String:(char*)sqlite3_column_text(stmt, 0)];      //Company name
            NSString *strLoanamt=[[NSString alloc]initWithUTF8String:(char *)sqlite3_column_text(stmt, 1)];          //loan amount
            NSString *strCmpAddress=[[NSString alloc]initWithUTF8String:(char*)sqlite3_column_text(stmt, 2)];  //company Address
            NSString *strDate=[[NSString alloc]initWithUTF8String:(char *)sqlite3_column_text(stmt, 3)];       //date
            
            [dicCompanyDetails setValue:strCmpName forKey:@"cmpny_name"];
            [dicCompanyDetails setValue:strLoanamt forKey:@"loan_amt"];
            [dicCompanyDetails setValue:strCmpAddress forKey:@"cmpny_address"];
            [dicCompanyDetails setValue:strDate forKey:@"date"];
            
            [arrycompanyDetails addObject:dicCompanyDetails];
            
            
         
          
        }
        }sqlite3_finalize(stmt);
    }
    sqlite3_close(database);
    
    
    return arrycompanyDetails;
}
@end
