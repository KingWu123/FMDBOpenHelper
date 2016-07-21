//
//  FMDBOpenHelper.h
//  FMDBFrameWork
//
//  Created by king.wu on 7/21/16.
//  Copyright © 2016 king.wu. All rights reserved.
//


#import <Foundation/Foundation.h>
#import <FMDB.h>


/**
 *  A class like android SQLiteOpenHelper.
 *
 *  A helper class to manage FMDBdatabase creation and version management.
  *
  * You create a subclass implementing {@link #onCreate}, {@link #onUpgrade} and
  * optionally {@link #onOpen}, and this class takes care of opening the database
  * if it exists, creating it if it does not, and upgrading it as necessary.
  * Transactions are used to make sure the database is always in a sensible state.
  *
  * This class makes it easy for  implementations to 
  * defer opening and upgrading the database until first use,
  * to avoid blocking application startup with long-running database upgrades.
  *
  * "Note" this class assumes  monotonically increasing version numbers
  */

@interface FMDBOpenHelper : NSObject


/**
 *  Create a openHelper object to create, open, and/or manage a database.
 *  the dataBase is not actually created or opened until  @{link #getFMDatabase} is called.
 *
 *
 *  @param dbName  databse name
 *  @param version  number of the database (starting at 1),
 *     if db first create, @{link #onCreate}  will be called;
 *     if new version > current Version, @{link #onUpgrade} will be used to upgrade the database;
 *     if new version < current version, @{link #onDowngrade} will be used to downgrade the database
 *
 *  @return the FMDBOpenHelper
 */
- (instancetype)initOpenHelper:(NSString *)dbName version:(int)version;




/**
 * Create and/or open a database that will be used for reading and writing.
 * The first time this is called, the database will be opened and
 * {@link #onCreate}, {@link #onUpgrade} and/or {@link #onOpen} will be
 * called.
 *
 * <p>Once opened successfully, the database is cached, so you can
 * call this method every time you need to write to the database.
 * (Make sure to call {@link #close} when you no longer need the database.)
  * Errors such as bad permissions or a full disk may cause this method
  * to fail, but future attempts may succeed if the problem is fixed.</p>
 *
 * Database upgrade may take a long time, you
 * should not call this method from the application main thread.
 *
 *  @return the FMDatabase
 */
-  (FMDatabase *)getFMDatabase;


/**
 *  Return the name of the FMDatabase being opened, as given to
 *  the constructor
 *
 *  @return database name
 */
- (NSString *)databaseName;



/**
 *  close the FMdatabse
 */
- (void)close;



@end
