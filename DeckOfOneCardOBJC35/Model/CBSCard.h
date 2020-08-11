//
//  CBSCard.h
//  DeckOfOneCardOBJC35
//
//  Created by Colton Swapp on 8/11/20.
//  Copyright © 2020 Colton Swapp. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface CBSCard : NSObject

@property (nonatomic, copy)NSString * cardValue;
@property (nonatomic, copy)NSString * suit;
@property (nonatomic, copy)NSString * imageURL;

- (instancetype)initWithName:(NSString *)cardValue
                        suit:(NSString *)suit
                    imageURL:(NSString *)imageURL
NS_DESIGNATED_INITIALIZER;
@end

@interface CBSCard (JSONConvertable)

- (instancetype) initWithDictionary:(NSDictionary *)dictionary;

@end

NS_ASSUME_NONNULL_END
