//
//  databaseOpretion.h
//  Database Test
//
//  Created by om technology on 04/04/19.
//  Copyright © 2019 Panini Academy. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AppDelegate.h"
#import <sqlite3.h>

@interface databaseOpretion : NSObject
{
    AppDelegate *apdel;
    sqlite3 *database;
}
@property NSString *strpath;
-(NSMutableArray *)getLoanDataFromQuery:(NSString *)query;
-(NSMutableArray *)getTestDataFromQuery:(NSString *)query;
-(NSMutableArray *)getCompanyDataFromQuery:(NSString *)query;
@end
