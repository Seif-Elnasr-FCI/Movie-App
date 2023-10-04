//
//  DetailsViewController.h
//  Movies
//
//  Created by seif amr on 24/09/2023.
//

#ifndef DetailsViewController_h
#define DetailsViewController_h
#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "Movie.h"
#import "DeleteMovie.h"

@interface DetailsViewController : UIViewController

@property Movie *movie;
@property id<DeleteMe> homeVC;

@property (strong, nonatomic) IBOutlet UIImageView *movieImage;
@property (strong, nonatomic) IBOutlet UILabel *movieTitle;
@property (strong, nonatomic) IBOutlet UILabel *movieYear;
@property (strong, nonatomic) IBOutlet UILabel *movieRating;
@property (strong, nonatomic) IBOutlet UILabel *movieGenre;
- (IBAction)deletion:(UIBarButtonItem *)sender;

@end

#endif /* DetailsViewController_h */
