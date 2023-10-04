//
//  HomeViewController.h
//  Movies
//
//  Created by seif amr on 24/09/2023.
//

#ifndef HomeViewController_h
#define HomeViewController_h
#import <UIKit/UIKit.h>
#import "NetworkManager.h"
#import "DeleteMovie.h"
@interface HomeViewController : UITableViewController <NSURLConnectionDelegate,NSURLConnectionDataDelegate,DeleteMe>

@property NetworkManager *networkManager;
@property NSMutableArray *movies;
@property NSMutableData *responeData;

@end

#endif /* HomeViewController_h */
