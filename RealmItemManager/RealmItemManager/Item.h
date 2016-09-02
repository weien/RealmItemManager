//
//  Item.h
//  RealmItemManager
//
//  Created by Weien Wang on 8/10/16.
//  Copyright © 2016 Weien Wang. All rights reserved.
//

#import <Realm/Realm.h>

@interface Item : RLMObject
@property NSString *content;
@property (readonly) RLMLinkingObjects *notes;
@end

RLM_ARRAY_TYPE(Item)
