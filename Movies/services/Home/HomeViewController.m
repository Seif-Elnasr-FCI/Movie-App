//
//  HomeViewController.m
//  Movies
//
//  Created by seif amr on 24/09/2023.
//

#import <Foundation/Foundation.h>
#import "HomeViewController.h"
#import "Movie.h"
#import "DetailsViewController.h"
#import <SDWebImage/SDWebImage.h>

@implementation HomeViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    _movies = [NSMutableArray new];
    _networkManager = [NetworkManager new];
    [_networkManager getAllMovies:self];
}

- (void)connection:(NSURLConnection *)connection didReceiveResponse:(NSURLResponse *)response
{
    _responeData = [[NSMutableData alloc] init];
}

- (void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)data
{
    [self.responeData appendData:data];
}

- (void)connectionDidFinishLoading:(NSURLConnection *)connection
{
    NSMutableArray *movie_dict = [NSJSONSerialization JSONObjectWithData:self.responeData options:NSJSONReadingAllowFragments error:nil];
    for (int index=0; index<movie_dict.count; index++) {
        Movie *movie = [self convertDictionaryToMovie:[ movie_dict objectAtIndex:index]];
        [_movies addObject:movie];
    }
    [self.tableView reloadData];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return _movies.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
    
    //NSDictionary *currentDict = _movies[indexPath.row];
    //cell.textLabel.text = [currentDict objectForKey:@"title"];
    //NSString *image_str = [currentDict objectForKey:@"image"];
    //Movie *movie = [self convertDictionaryToMovie:currentDict];
    Movie *movie = _movies[indexPath.row];
    cell.textLabel.text = movie.title;
    NSString *image_str = movie.image;
    [cell.imageView sd_setImageWithURL:[NSURL URLWithString:image_str] placeholderImage:[UIImage imageNamed:@"placeholder.png"]];
    cell.imageView.layer.cornerRadius = 28;
    cell.imageView.layer.masksToBounds = true;
    
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 50;
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    //NSDictionary *currentDict = _movies[self.tableView.indexPathForSelectedRow.row];
    ((DetailsViewController *)segue.destinationViewController).movie = _movies[self.tableView.indexPathForSelectedRow.row];
    ((DetailsViewController *)segue.destinationViewController).homeVC = self;
}

-(Movie *) convertDictionaryToMovie: (NSDictionary*) dict
{
    Movie *movie = [Movie new];
    movie.title = [dict objectForKey:@"title"];
    movie.image = [dict objectForKey:@"image"];
    movie.rating = [[dict objectForKey:@"rating"] doubleValue];
    movie.releaseYear = [[dict objectForKey:@"releaseYear"] intValue];
    movie.genre = [dict objectForKey:@"genre"];
    
    return movie;
}

- (void)DeleteMovie:(Movie *)movie
{
    [_movies removeObject:movie];
    [self.tableView reloadData];
}

@end
