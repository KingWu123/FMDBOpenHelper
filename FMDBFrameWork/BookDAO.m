//
//  BookDAO.m
//  FMDBFrameWork
//
//  Created by king.wu on 7/21/16.
//  Copyright © 2016 king.wu. All rights reserved.
//

#import "BookDAO.h"
#import "FMDBOpenHelper.h"
#import <FMDB.h>




@interface BookDAO()

@property (nonatomic, strong)FMDatabase *database;

@end

@implementation BookDAO

- (instancetype)initWithOpenHelper:(FMDBOpenHelper *)helper{
    self = [super init];
    if (self){
        self.database = [helper getFMDatabase];
    }
    return self;
}



@end
