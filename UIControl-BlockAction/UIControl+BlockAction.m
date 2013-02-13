//
//  UIControl+BlockAction.m
//  UIControl+BlockAction
//
//  Created by Eric Horacek on 9/17/12.
//  Copyright (c) 2012 Monospace Ltd. All rights reserved.
//

#import "UIControl+BlockAction.h"
#import "BlockActionWrapper.h"

#import <objc/runtime.h>

static const char * UIControlBlockAction = "UIControlBlockAction";

@implementation UIControl (BlockActions)

- (void)addEventHandler:(void(^)(void))handler forControlEvents:(UIControlEvents)controlEvents
{    
    NSMutableArray * blockActions = objc_getAssociatedObject(self, &UIControlBlockAction);
    if (blockActions == nil) {
        blockActions = [NSMutableArray array];
        objc_setAssociatedObject(self, &UIControlBlockAction, blockActions, OBJC_ASSOCIATION_RETAIN);
    }
    
    BlockActionWrapper * target = [[BlockActionWrapper alloc] init];
    [target setBlockAction:handler];
    [blockActions addObject:target];
    
    [self addTarget:target action:@selector(invokeBlock:) forControlEvents:controlEvents];
}

@end
