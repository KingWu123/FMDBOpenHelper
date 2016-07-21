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
    
    
    [self.bookDao insertBookData:[self createBookData]];
    
    NSMutableArray *arr = [[NSMutableArray alloc]init];
    for ( int i = 0 ; i<100 ; i++) {
        [arr addObject:[self createBookData]];
    }
    [self.bookDao insertBookDataArr:arr];
}

- (IBAction)deleteData:(id)sender{
    
}

- (IBAction)updateData:(id)sender{
    
}

- (IBAction)selectData:(id)sender{
    BookData *bookData = [self.bookDao selectBookDataById:@"bookid_10"];
    
}

- (BookData *)createBookData{
    static int number = 0;
    number++;
    BookData *data = [[BookData alloc]init];
    data.bookId = [NSString stringWithFormat:@"bookid_%d", number];
    data.bookName = [NSString stringWithFormat:@"bookName_%d", number];
    
    return data;
}

@end
