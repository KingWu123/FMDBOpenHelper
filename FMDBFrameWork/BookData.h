//
//  BookData.h
//  FMDBFrameWork
//
//  Created by king.wu on 7/21/16.
//  Copyright © 2016 king.wu. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface BookData : NSObject

@property (nonatomic, strong) NSString *bookId;
@property (nonatomic, strong) NSString *bookName;
@property (nonatomic, assign) int pageCount;
@property (nonatomic, strong) NSString *bookDescription;

@end
