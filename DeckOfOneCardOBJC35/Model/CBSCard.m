//
//  CBSCard.m
//  DeckOfOneCardOBJC35
//
//  Created by Colton Swapp on 8/11/20.
//  Copyright © 2020 Colton Swapp. All rights reserved.
//

#import "CBSCard.h"

@implementation CBSCard

- (instancetype)initWithName:(NSString *)cardValue suit:(NSString *)suit imageURL:(NSString *)imageURL
{
    self = [super init];
    if (self)
    {
        _cardValue = cardValue;
        _suit = suit;
        _imageURL = imageURL;
    }
    return self;
}

- (instancetype)init
{
    return [self initWithName:@"" suit:@"" imageURL:@""];
}

@end

@implementation CBSCard (JSONConvertable)

- (instancetype)initWithDictionary:(NSDictionary *)dictionary
{
    NSString * cardValue = dictionary[@"value"];
    NSString * suit = dictionary[@"suit"];
    NSString * imageURL = dictionary[@"image"];
    
    return [self initWithName:cardValue suit:suit imageURL:imageURL];
}

@end
