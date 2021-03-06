//
//  KMPlistManager.h
//  KMPlistManager
//
//  Created by Kazutaka Mukai on 08/01/12.
//  Copyright (c) 2012 Kazutaka Mukai. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface KMPlistManager : NSObject

@property (nonatomic, readonly) NSDictionary *plist;

+ (id)sharedInstanceWithResource:(NSString *)resource;

- (id)objectForKey:(NSString *)key;

@end
