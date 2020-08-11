//
//  CBSCardController.h
//  DeckOfOneCardOBJC35
//
//  Created by Colton Swapp on 8/11/20.
//  Copyright © 2020 Colton Swapp. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CBSCard.h"
#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface CBSCardController : NSObject

+ (instancetype)sharedInstance;

+ (void)drawNewCard:(NSNumber *)numberOfCards completion:(void(^)(NSArray<CBSCard *> * _Nullable cards))completion;

+ (void)fetchCardImage:(CBSCard *)forCard
            completion:(void(^)(UIImage * _Nullable image))completion;

@end

NS_ASSUME_NONNULL_END
