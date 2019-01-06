//
//  NSEManagedObjectContext.h
//  CoreDataExt
//
//  Created by Dan Kalinin on 1/6/19.
//

#import <CoreData/CoreData.h>
#import <Helpers/Helpers.h>

@class NSEManagedObjectContext;
@class NSEManagedObjectContextUserInfo;
@class NSEManagedObjectContextOperation;

@protocol NSEManagedObjectContextDelegate;












@interface NSManagedObjectContext (NSE)

@property (readonly) NSEManagedObjectContextOperation *nseOperation;

@end










@interface NSEManagedObjectContext : NSManagedObjectContext

@end










@interface NSEManagedObjectContextUserInfo : NSEDictionaryObject

@end










@protocol NSEManagedObjectContextDelegate <NSEObjectDelegate>

@optional
- (void)nseManagedObjectContextObjectsDidChange:(NSManagedObjectContext *)context;
- (void)nseManagedObjectContextDidSave:(NSManagedObjectContext *)context;

@end



@interface NSEManagedObjectContextOperation : NSEObjectOperation

@property (readonly) HLPArray<NSEManagedObjectContextDelegate> *delegates;

@property (weak, readonly) NSManagedObjectContext *object;
@property (weak, readonly) NSEManagedObjectContextUserInfo *userInfo;

@end
