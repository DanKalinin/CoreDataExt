//
//  NSEPersistentContainer.m
//  CoreDataExt
//
//  Created by Dan Kalinin on 1/6/19.
//

#import "NSEPersistentContainer.h"










@implementation NSPersistentContainer (NSE)

@dynamic nseOperation;

- (Class)nseOperationClass {
    return NSEPersistentContainerOperation.class;
}

@end










@interface NSEPersistentContainer ()

@end



@implementation NSEPersistentContainer

@end










@interface NSEPersistentContainerDidLoadPersistentStore ()

@property NSPersistentStoreDescription *store;
@property NSError *error;

@end



@implementation NSEPersistentContainerDidLoadPersistentStore

- (instancetype)initWithStore:(NSPersistentStoreDescription *)store error:(NSError *)error {
    self = super.init;
    
    self.store = store;
    self.error = error;
    
    return self;
}

@end










@interface NSEPersistentContainerOperation ()

@property (weak) NSEPersistentContainerDidLoadPersistentStore *didLoadPersistentStore;

@end



@implementation NSEPersistentContainerOperation

@dynamic delegates;
@dynamic object;

- (instancetype)initWithObject:(NSPersistentContainer *)object {
    self = [super initWithObject:object];
    
    [self loadPersistentStores];
    
    [object.viewContext.nseOperation.delegates addObject:self.delegates];
    
    return self;
}

- (void)loadPersistentStores {
    [self.object loadPersistentStoresWithCompletionHandler:^(NSPersistentStoreDescription *store, NSError *error) {
        self.didLoadPersistentStore = [NSEPersistentContainerDidLoadPersistentStore.alloc initWithStore:store error:error].nseAutorelease;
        [self.delegates nsePersistentContainerDidLoadPersistentStore:self.object];
    }];
}

@end
