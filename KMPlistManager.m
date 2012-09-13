//
//  KMPlistManager.m
//  KMPlistManager
//
//  Created by Kazutaka Mukai on 08/01/12.
//  Copyright (c) 2012 Kazutaka Mukai. All rights reserved.
//

#import "KMPlistManager.h"

@interface KMPlistManager ()

@property (nonatomic, readwrite) NSDictionary *plist;

- (id)_initResource:(NSString *)resourc;

@end

@implementation KMPlistManager

+ (id)sharedInstanceWithResource:(NSString *)resource {
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

- (id)objectForKey:(NSString *)key {
  return [self.plist objectForKey:key];
}

#pragma mark - Private

- (id)_initResource:(NSString *)resource {
  self = [super init];
  if (self) {
    NSString *path = [[NSBundle mainBundle] pathForResource:resource
                                                     ofType:@"plist"];
    self.plist = [NSDictionary dictionaryWithContentsOfFile:path];
  }
  
  return self;
}

@end
