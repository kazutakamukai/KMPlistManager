//
//  KMPlistManager.m
//  KMPlistManager
//
//  Created by Kazutaka Mukai on 08/01/12.
//  Copyright (c) 2012 Kazutaka Mukai. All rights reserved.
//

#import "PlistManager.h"

@implementation PlistManager

+ (id)sharedInstance:(NSString *)resource {
  static NSMutableDictionary *sharedInstances = nil;
  id sharedInstance;
  
  @synchronized(self) {
    if (!sharedInstances) {
      sharedInstances = [NSMutableDictionary dictionary];
    }
    sharedInstance = [sharedInstances objectForKey:resource];
    if (!sharedInstance) {
      sharedInstance = [[self alloc] _initResource:resource];
      [sharedInstances setValue:sharedInstance
                         forKey:resource];
    }
  }
  
  return sharedInstance;
}

- (NSDictionary *)objectForKey:(NSString *)key {
  return [self.plist objectForKey:key];
}

#pragma mark - Private

- (id)_initResource:(NSString *)resource {
  self = [super init];
  if (self) {
    NSString *path = [[NSBundle mainBundle] pathForResource:resource
                                                     ofType:@"plist"];
    _plist = [NSDictionary dictionaryWithContentsOfFile:path];
  }
  
  return self;
}

@end