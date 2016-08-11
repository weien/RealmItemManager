//
//  StorageController.m
//  RealmItemManager
//
//  Created by Weien Wang on 8/10/16.
//  Copyright © 2016 Weien Wang. All rights reserved.
//

#import "StorageController.h"

@implementation StorageController

- (RLMRealm*) defaultRealmForCurrentThread { //not sure if this is necessary
    NSMutableDictionary* dictionary = [[NSThread currentThread] threadDictionary];
    RLMRealm* realm = [dictionary objectForKey:@"RealmForCurrentThread"];
    if (realm == nil) {
        realm = [RLMRealm defaultRealm];
        [dictionary setObject:realm forKey:@"RealmForCurrentThread"];
    }
    return realm;
}

- (void) addObjectToRealm:(RLMObject*)object {
    RLMRealm* realm = [self defaultRealmForCurrentThread];
    [realm beginWriteTransaction];
    [realm addObject:object];
    [realm commitWriteTransaction];
}

- (void) deleteObjectFromRealm:(RLMObject*)object {
    RLMRealm* realm = [self defaultRealmForCurrentThread];
    [realm beginWriteTransaction];
    [realm deleteObject:object];
    [realm commitWriteTransaction];
}

- (RLMResults*) retrieveAllItems {
    return [Item allObjectsInRealm:[self defaultRealmForCurrentThread]];
}

- (RLMResults*) retrieveAllNotesForItem:(Item*)item {
    NSPredicate* predicate = [NSPredicate predicateWithFormat:@"item == %@", item];
    return [Note objectsInRealm:[self defaultRealmForCurrentThread] withPredicate:predicate];
}

@end
