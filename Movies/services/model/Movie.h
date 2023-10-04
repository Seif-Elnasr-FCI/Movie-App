//
//  Movie.h
//  Movies
//
//  Created by seif amr on 24/09/2023.
//

#ifndef Movie_h
#define Movie_h
@interface Movie: NSObject

    @property NSString *title;
    @property NSString *image;
    @property double rating;
    @property int releaseYear;
    @property NSArray *genre;

@end
#endif /* Movie_h */
