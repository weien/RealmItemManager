//
//  Note.h
//  RealmItemManager
//
//  Created by Weien Wang on 8/10/16.
//  Copyright © 2016 Weien Wang. All rights reserved.
//

#import <Realm/Realm.h>

@class Item;

@interface Note : RLMObject
@property NSString *content;
@property Item *item;
@end

RLM_ARRAY_TYPE(Note)
