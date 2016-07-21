//
//  ReaderDBOpenHelper.m
//  FMDBFrameWork
//
//  Created by king.wu on 7/21/16.
//  Copyright © 2016 king.wu. All rights reserved.
//

#import "ReaderDBOpenHelper.h"
#import "BookDAO.h"



@implementation ReaderDBOpenHelper

//db的名称
static NSString * const READER_DB_NAME = @"reader.db";

//db版本号，如果db有变化，版本号需要 +1
static int const VERSION = 1;


+ (instancetype)sharedInstance
{
    static ReaderDBOpenHelper *instance = nil;
    
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        if (!instance) {
            instance = [[ReaderDBOpenHelper alloc] initOpenHelper:READER_DB_NAME  version:VERSION];
        }
    });
    return  instance;
}

- (instancetype)initOpenHelper:(NSString *)dbName version:(int)version{
    self = [super initOpenHelper:dbName version:version];
    if (self){
    }
    return self;
}



//- (void)onCreate:(FMDatabase *)db{
//    NSString *sql = [NSString stringWithFormat:
//                     @"create table %@ ("
//                     "_id integer primary key autoincrement, "
//                     "%@  text, "
//                     "%@  text, "
//                     "%@  integer "
//                     ");",
//                     BOOK_TABLE_NAME, BOOK_ID_COLUMN, BOOK_NAME_COLUMN, BOOK_PAGECOUNT_COLUMN];
//    
//    [db executeUpdate:sql];
//}

- (void)onUpgrade:(FMDatabase*)db  oldVersion:(int)oldVersion newVersion:(int)newVersion{
  
    if (oldVersion == 1 && newVersion == 2){
        
    }
}


@end
