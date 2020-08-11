//
//  CBSCardController.m
//  DeckOfOneCardOBJC35
//
//  Created by Colton Swapp on 8/11/20.
//  Copyright © 2020 Colton Swapp. All rights reserved.
//

#import "CBSCardController.h"
#import "CBSCard.h"

static NSString * const baseURLString = @"https://deckofcardsapi.com/api/deck/new/draw/?count=1";

@implementation CBSCardController

+ (instancetype)sharedInstance
{
    static CBSCardController * sharedInstance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedInstance = [CBSCardController new];
    });
    return sharedInstance;
}

+ (void)drawNewCard:(NSNumber *)numberOfCards completion:(void(^)(NSArray<CBSCard *> * _Nullable cards))completion

{
    NSURL * baseURL = [NSURL URLWithString:baseURLString];
    NSLog(@"%@", baseURL);
    [[[NSURLSession sharedSession] dataTaskWithURL:baseURL completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        
        if (error) {
            NSLog(@"Error fetching a card from the API: %@", error);
            completion(nil); return;
        }
        
        if (!data) {
            NSLog(@"Error data from the url: %@", error);
            completion(nil); return;
        }
        
        NSDictionary * JSONDictionary = [NSJSONSerialization JSONObjectWithData:data options:2 error:&error];
               
               if (!JSONDictionary || ![JSONDictionary isKindOfClass:[NSDictionary class]])
               {
                   NSLog(@"Error fetching and decoding the JSON Dictionary");
                   completion(nil); return;
               }
        NSArray * cardsArray = JSONDictionary[@"cards"];
        NSMutableArray * cardsPlaceHolder = [NSMutableArray array];
        for (NSDictionary * cardDictionary in cardsArray)
        {
        CBSCard * card = [[CBSCard alloc] initWithDictionary:cardDictionary];
            [cardsPlaceHolder addObject:card];
        }
        completion(cardsPlaceHolder);
        
    }] resume];
}

+ (void)fetchCardImage:(CBSCard *)forCard completion:(void (^)(UIImage * _Nullable))completion
{
    NSURL * imageURL = [NSURL URLWithString:forCard.imageURL];
    
    [[[NSURLSession sharedSession] dataTaskWithURL:imageURL completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        
        if (error) {
            NSLog(@"Error fetching a card from the API: %@", error);
            completion(nil); return;
        }
        
        if (!data) {
            NSLog(@"Error data from the url: %@", error);
            completion(nil); return;
        }
        
        UIImage * image = [UIImage imageWithData:data];
        completion(image);
    }] resume];
}

@end
