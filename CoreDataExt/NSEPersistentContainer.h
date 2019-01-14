//
//  NSEPersistentContainer.h
//  CoreDataExt
//
//  Created by Dan Kalinin on 1/6/19.
//

#import <CoreData/CoreData.h>
#import <FoundationExt/FoundationExt.h>
#import "NSEManagedObjectContext.h"
#import "NSEPersistentStoreCoordinator.h"

@class NSEPersistentContainer;
@class NSEPersistentContainerDidLoadPersistentStore;
@class NSEPersistentContainerDidPerformBackgroundTask;
@class NSEPersistentContainerOperation;

@protocol NSEPersistentContainerDelegate;










@interface NSPersistentContainer (NSE)

@property (readonly) NSEPersistentContainerOperation *nseOperation;

@end










@interface NSEPersistentContainer : NSPersistentContainer

@end










@interface NSEPersistentContainerDidLoadPersistentStore : NSEObject

@property (readonly) NSPersistentStoreDescription *store;
@property (readonly) NSError *error;

- (instancetype)initWithStore:(NSPersistentStoreDescription *)store error:(NSError *)error;

@end










@interface NSEPersistentContainerDidPerformBackgroundTask : NSEObject

@property (readonly) NSManagedObjectContext *context;

- (instancetype)initWithContext:(NSManagedObjectContext *)context;

@end










@protocol NSEPersistentContainerDelegate <NSEObjectDelegate, NSEManagedObjectContextDelegate, NSEPersistentStoreCoordinatorDelegate>

@optional
- (void)nsePersistentContainerDidLoadPersistentStore:(NSPersistentContainer *)container;
- (void)nsePersistentContainerDidPerformBackgroundTask:(NSPersistentContainer *)container;

@end



@interface NSEPersistentContainerOperation : NSEObjectOperation <NSEPersistentContainerDelegate>

@property (readonly) NSMutableOrderedSet<NSEPersistentContainerDelegate> *delegates;
@property (readonly) NSManagedObjectContext *newBackgroundContext;

@property (weak, readonly) NSPersistentContainer *object;
@property (weak, readonly) NSEPersistentContainerDidLoadPersistentStore *didLoadPersistentStore;
@property (weak, readonly) NSEPersistentContainerDidPerformBackgroundTask *didPerformBackgroundTask;

- (void)loadPersistentStores;
- (void)performBackgroundTask;

@end
