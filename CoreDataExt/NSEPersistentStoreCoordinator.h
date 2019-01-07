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

@optional
- (void)nsePersistentStoreCoordinatorStoresDidChange:(NSPersistentStoreCoordinator *)coordinator;
- (void)nsePersistentStoreCoordinatorStoresWillChange:(NSPersistentStoreCoordinator *)coordinator;
- (void)nsePersistentStoreCoordinatorWillRemoveStore:(NSPersistentStoreCoordinator *)coordinator;

@end



@interface NSEPersistentStoreCoordinatorOperation : NSEObjectOperation <NSEPersistentStoreCoordinatorDelegate>

@property (readonly) HLPArray<NSEPersistentStoreCoordinatorDelegate> *delegates;

@property (weak, readonly) NSPersistentStoreCoordinator *object;

@end
