//
//  Item.m
//  RealmItemManager
//
//  Created by Weien Wang on 8/10/16.
//  Copyright © 2016 Weien Wang. All rights reserved.
//

#import "Item.h"
#import "Note.h"

@implementation Item

+ (NSDictionary *)linkingObjectsProperties {
    return @{
             @"notes": [RLMPropertyDescriptor descriptorWithClass:Note.class propertyName:@"item"],
             };
}

@end
