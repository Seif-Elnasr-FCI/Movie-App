//
//  NetworkManager.m
//  Movies
//
//  Created by seif amr on 24/09/2023.
//

#import <Foundation/Foundation.h>
#import "NetworkManager.h"

@implementation NetworkManager

- (void)getAllMovies:(UIViewController *)delegate
{
    NSURL *url = [NSURL URLWithString:@"https://mocki.io/v1/44768466-a5be-41b8-aa6a-d9ee83b149f5"];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    NSURLConnection *connetion = [[NSURLConnection alloc] initWithRequest:request delegate:delegate];
    [connetion start];
}

@end
