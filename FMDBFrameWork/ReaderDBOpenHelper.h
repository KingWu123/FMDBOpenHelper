//
//  ReaderDBOpenHelper.h
//  FMDBFrameWork
//
//  Created by king.wu on 7/21/16.
//  Copyright © 2016 king.wu. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "FMDBOpenHelper.h"

@interface ReaderDBOpenHelper : FMDBOpenHelper

+ (instancetype)sharedInstance;

@end
