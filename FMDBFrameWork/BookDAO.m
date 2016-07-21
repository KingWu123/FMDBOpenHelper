//
//  BookDAO.m
//  FMDBFrameWork
//
//  Created by king.wu on 7/21/16.
//  Copyright © 2016 king.wu. All rights reserved.
//

#import "BookDAO.h"
#import "FMDBOpenHelper.h"
#import "BookData.h"




@interface BookDAO()

@property (nonatomic, strong)FMDatabaseQueue *databaseQueue;

@end

@implementation BookDAO

- (instancetype)initWithOpenHelper:(FMDBOpenHelper *)helper{
    self = [super init];
    if (self){
        self.databaseQueue = [helper getFMDatabaseQueue];
    }
    return self;
}






- (void)insertBookData:(BookData *)bookData{
    [self.databaseQueue inDatabase:^(FMDatabase *db) {
       
        NSString *sql = @"insert into bookTable (bookId, bookName) values (?, ?)";
        
        [db executeUpdate:sql, bookData.bookId, bookData.bookName];
    }];
}

- (void)insertBookDataArr:(NSArray<BookData *> *)bookDataArr{
    
    [self.databaseQueue inTransaction:^(FMDatabase *db, BOOL *rollback) {
        
        BOOL whoopsSomethingWrongHappened = NO;
        for (BookData *bookData in bookDataArr) {
            NSString *sql = @"insert into bookTable (bookId, bookName) values (?, ?)";
            whoopsSomethingWrongHappened = ![db executeUpdate:sql, bookData.bookId, bookData.bookName];
            
            if (whoopsSomethingWrongHappened){
                break;
            }
        }
        
        if (whoopsSomethingWrongHappened) {
            *rollback = YES;
            return;
        }
    }];
}

- (BookData *)selectBookDataById:(NSString *)bookId{
    
    __block BookData *bookData = nil;
    
    [self.databaseQueue inDatabase:^(FMDatabase *db) {
        NSString *sql = @"select * from bookTable where bookId = ?";
        FMResultSet *set = [db executeQuery:sql, bookId];
        
        while ([set next]) {
             bookData  =[self convertFMResultSetToBookData:set];
        }
    }];
    
    return bookData;
    
}



- (BookData *)convertFMResultSetToBookData:(FMResultSet *)resultSet{
    BookData *bookData = [[BookData alloc]init];
    
    bookData.bookId = [resultSet stringForColumn:BOOK_ID_COLUMN];
    bookData.bookName = [resultSet stringForColumn:BOOK_NAME_COLUMN];
    bookData.pageCount = [resultSet intForColumn:BOOK_PAGECOUNT_COLUMN];
    bookData.bookDescription = [resultSet stringForColumn:BOOK_DESCRIPTION_COLUMN];
    
    return bookData;
}

@end
