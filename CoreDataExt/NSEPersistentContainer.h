//
//  NSEPersistentContainer.h
//  CoreDataExt
//
//  Created by Dan Kalinin on 1/6/19.
//

#import <CoreData/CoreData.h>
#import <Helpers/Helpers.h>

@class NSEPersistentContainer;
@class NSEPersistentContainerDidLoadPersistentStore;
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










@protocol NSEPersistentContainerDelegate <NSEObjectDelegate>

@optional
- (void)nsePersistentContainerDidLoadPersistentStore:(NSPersistentContainer *)container;

@end



@interface NSEPersistentContainerOperation : NSEObjectOperation <NSEPersistentContainerDelegate>

@property (readonly) HLPArray<NSEPersistentContainerDelegate> *delegates;

@property (weak, readonly) NSPersistentContainer *object;
@property (weak, readonly) NSEPersistentContainerDidLoadPersistentStore *didLoadPersistentStore;

- (void)loadPersistentStores;

@end
