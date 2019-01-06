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

@end



@implementation NSEManagedObjectContextUserInfo

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
    
    [self.delegates.exceptions addObject:NSStringFromSelector(@selector(nseManagedObjectContextObjectsDidChange:))];
    [self.delegates.exceptions addObject:NSStringFromSelector(@selector(nseManagedObjectContextDidSave:))];
    
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

@end
