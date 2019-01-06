//
//  NSEManagedObjectContext.m
//  CoreDataExt
//
//  Created by Dan Kalinin on 1/6/19.
//

#import "NSEManagedObjectContext.h"










@implementation NSManagedObjectContext (NSE)

@dynamic nseOperation;

- (Class)nseOperationClass {
    return NSEManagedObjectContextOperation.class;
}

@end










@interface NSEManagedObjectContext ()

@end



@implementation NSEManagedObjectContext

@end










@interface NSEManagedObjectContextUserInfo ()

@property NSSet<NSManagedObject *> *inserted;
@property NSSet<NSManagedObject *> *updated;
@property NSSet<NSManagedObject *> *deleted;
@property NSSet<NSManagedObject *> *refreshed;
@property NSSet<NSManagedObject *> *invalidated;
@property NSArray<NSManagedObjectID *> *invalidatedAll;

@end



@implementation NSEManagedObjectContextUserInfo

- (instancetype)initWithDictionary:(NSDictionary *)dictionary {
    self = [super initWithDictionary:dictionary];
    
    self.inserted = dictionary[NSInsertedObjectsKey];
    self.updated = dictionary[NSUpdatedObjectsKey];
    self.deleted = dictionary[NSDeletedObjectsKey];
    self.refreshed = dictionary[NSRefreshedObjectsKey];
    self.invalidated = dictionary[NSInvalidatedObjectsKey];
    self.invalidatedAll = dictionary[NSInvalidatedAllObjectsKey];
    
    return self;
}

@end










@interface NSEManagedObjectContextOperation ()

@property (weak) NSEManagedObjectContextUserInfo *userInfo;

@end



@implementation NSEManagedObjectContextOperation

@dynamic delegates;
@dynamic object;

- (instancetype)initWithObject:(NSManagedObjectContext *)object {
    self = [super initWithObject:object];
    
    [self.center addObserver:self selector:@selector(objectsDidChangeNotification:) name:NSManagedObjectContextObjectsDidChangeNotification object:object];
    [self.center addObserver:self selector:@selector(didSaveNotification:) name:NSManagedObjectContextDidSaveNotification object:object];
    [self.center addObserver:self selector:@selector(willSaveNotification:) name:NSManagedObjectContextWillSaveNotification object:object];
    
    [self.delegates.exceptions addObject:NSStringFromSelector(@selector(nseManagedObjectContextObjectsDidChange:))];
    [self.delegates.exceptions addObject:NSStringFromSelector(@selector(nseManagedObjectContextDidSave:))];
    [self.delegates.exceptions addObject:NSStringFromSelector(@selector(nseManagedObjectContextWillSave:))];
    
    return self;
}

- (void)objectsDidChangeNotification:(NSNotification *)notification {
    self.userInfo = [NSEManagedObjectContextUserInfo.alloc initWithDictionary:notification.userInfo].nseAutorelease;
    [self.delegates nseManagedObjectContextObjectsDidChange:notification.object];
}

- (void)didSaveNotification:(NSNotification *)notification {
    self.userInfo = [NSEManagedObjectContextUserInfo.alloc initWithDictionary:notification.userInfo].nseAutorelease;
    [self.delegates nseManagedObjectContextDidSave:notification.object];
}

- (void)willSaveNotification:(NSNotification *)notification {
    self.userInfo = [NSEManagedObjectContextUserInfo.alloc initWithDictionary:notification.userInfo].nseAutorelease;
    [self.delegates nseManagedObjectContextWillSave:notification.object];
}

@end
