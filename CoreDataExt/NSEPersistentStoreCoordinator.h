//
//  NSEPersistentStoreCoordinator.h
//  CoreDataExt
//
//  Created by Dan Kalinin on 1/7/19.
//

#import <CoreData/CoreData.h>
#import <Helpers/Helpers.h>

@class NSEPersistentStoreCoordinator;
@class NSEPersistentStoreCoordinatorOperation;

@protocol NSEPersistentStoreCoordinatorDelegate;










@interface NSPersistentStoreCoordinator (NSE)

@property (readonly) NSEPersistentStoreCoordinatorOperation *nseOperation;

@end










@interface NSEPersistentStoreCoordinator : NSPersistentStoreCoordinator

@end










@protocol NSEPersistentStoreCoordinatorDelegate <NSEObjectDelegate>

@end



@interface NSEPersistentStoreCoordinatorOperation : NSEObjectOperation <NSEPersistentStoreCoordinatorDelegate>

@property (weak, readonly) NSPersistentStoreCoordinator *object;

@end
