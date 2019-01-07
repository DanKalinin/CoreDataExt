//
//  NSEPersistentStoreCoordinator.m
//  CoreDataExt
//
//  Created by Dan Kalinin on 1/7/19.
//

#import "NSEPersistentStoreCoordinator.h"










@implementation NSPersistentStoreCoordinator (NSE)

@dynamic nseOperation;

- (Class)nseOperationClass {
    return NSEPersistentStoreCoordinatorOperation.class;
}

@end










@interface NSEPersistentStoreCoordinator ()

@end



@implementation NSEPersistentStoreCoordinator

@end










@interface NSEPersistentStoreCoordinatorOperation ()

@end



@implementation NSEPersistentStoreCoordinatorOperation

@dynamic delegates;
@dynamic object;

- (instancetype)initWithObject:(NSPersistentStoreCoordinator *)object {
    self = [super initWithObject:object];
    
    [self.center addObserver:self selector:@selector(storesDidChangeNotification:) name:NSPersistentStoreCoordinatorStoresDidChangeNotification object:object];
    [self.center addObserver:self selector:@selector(storesWillChangeNotification:) name:NSPersistentStoreCoordinatorStoresWillChangeNotification object:object];
    [self.center addObserver:self selector:@selector(willRemoveStoreNotification:) name:NSPersistentStoreCoordinatorWillRemoveStoreNotification object:object];
    
    return self;
}

- (void)storesDidChangeNotification:(NSNotification *)notification {
    
}

- (void)storesWillChangeNotification:(NSNotification *)notification {
    
}

- (void)willRemoveStoreNotification:(NSNotification *)notification {
    
}

@end
