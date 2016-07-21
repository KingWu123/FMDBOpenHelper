//
//  ViewController.m
//  FMDBFrameWork
//
//  Created by king.wu on 7/21/16.
//  Copyright © 2016 king.wu. All rights reserved.
//

#import "ViewController.h"
#import "BookDAO.h"
#import "ReaderDBOpenHelper.h"

@interface ViewController ()

@property (nonatomic, strong) BookDAO *bookDao;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    self.bookDao  = [[BookDAO alloc]initWithOpenHelper:[ReaderDBOpenHelper sharedInstance]];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)insertData:(id)sender{
    NSString *sql = [NSString stringWithFormat:
                     @"create table %@ ("
                     "_id integer primary key autoincrement, "
                     "%@  text, "
                     "%@  text, "
                     "%@  integer "
                     ");",
                     BOOK_TABLE_NAME, BOOK_ID_COLUMN, BOOK_NAME_COLUMN, BOOK_PAGECOUNT_COLUMN];
    
    NSString *docsPath = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES)[0];
    docsPath = [docsPath stringByAppendingPathComponent:@"sqlite"];
    if (![[NSFileManager defaultManager] fileExistsAtPath:docsPath]){
        [[NSFileManager defaultManager] createDirectoryAtPath:docsPath withIntermediateDirectories:YES attributes:nil error:nil];
    }
    NSString * dbPath = [docsPath stringByAppendingPathComponent:@"aaa.db"];
    
    FMDatabaseQueue *queue = [FMDatabaseQueue databaseQueueWithPath:dbPath];
    
    [queue inDatabase:^(FMDatabase *db) {
        BOOL result = [db executeUpdate:sql];
        NSLog(@"result %d", result);
    }];
}

- (IBAction)deleteData:(id)sender{
    
}

- (IBAction)updateData:(id)sender{
    
}

- (IBAction)selectData:(id)sender{
    
}

@end
