//
//  StorageController.h
//  RealmItemManager
//
//  Created by Weien Wang on 8/10/16.
//  Copyright © 2016 Weien Wang. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <Realm/Realm.h>
#import "Item.h"

@interface StorageController : NSObject
- (void) addObjectToRealm:(RLMObject*)object;
- (void) deleteObjectFromRealm:(RLMObject*)object;
- (RLMResults*) retrieveAllItems;
- (RLMResults*) retrieveAllNotesForItem:(Item*)item;
@end
