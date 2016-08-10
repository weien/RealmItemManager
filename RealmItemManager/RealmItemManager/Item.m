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

// Specify default values for properties

//+ (NSDictionary *)defaultPropertyValues
//{
//    return @{};
//}

// Specify properties to ignore (Realm won't persist these)

//+ (NSArray *)ignoredProperties
//{
//    return @[];
//}

@end
