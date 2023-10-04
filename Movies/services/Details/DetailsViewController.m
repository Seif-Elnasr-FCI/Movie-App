//
//  DetailsViewController.m
//  Movies
//
//  Created by seif amr on 24/09/2023.
//
#import "DetailsViewController.h"
#import <SDWebImage/SDWebImage.h>
@implementation DetailsViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.movieTitle.text = self.movie.title;
    self.movieYear.text = [NSString stringWithFormat:@"%d", self.movie.releaseYear];
    self.movieRating.text = [NSString stringWithFormat:@"%.2lf", self.movie.rating];
    self.movieGenre.text = [self.movie.genre componentsJoinedByString:@", "];
    
    [self.movieImage sd_setImageWithURL: [NSURL URLWithString:self.movie.image] placeholderImage:[UIImage imageNamed:@"placeholder.png"]];
    
}

- (IBAction)deletion:(UIBarButtonItem *)sender {
    [_homeVC DeleteMovie:_movie];
    [self.navigationController popViewControllerAnimated:YES];
}
@end
