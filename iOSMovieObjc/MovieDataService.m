//
//  MovieDataService.m
//  iOSMovieObjc
//
//  Created by Sunny Chan on 7/11/17.
//  Copyright © 2017 sunnystudio. All rights reserved.
//

#import "MovieDataService.h"
#import "MovieModel.h"
#import "MOAPIClient.h"

@interface MovieDataService ()

@property (nonatomic) MovieDataServiceType serviceType;
@property (nonatomic, strong) MOAPIClient *apiClient;
@property (nonatomic, strong) NSString *URLStr;

@end

@implementation MovieDataService

- (instancetype)initWith:(MovieDataServiceType)serviceType {
    self = [super init];
    self.serviceType = serviceType;
    self.apiClient = [[MOAPIClient alloc] init];
    
    NSString *baseURL = @"https://api.themoviedb.org/3/movie/";
    NSString *partialURL = @"";
    
    switch (serviceType) {
        case now_playing:
            partialURL = @"now_playing";
            break;
        case popular:
            partialURL = @"popular";
            break;
        case top_rated:
            partialURL = @"top_rated";
            break;
        case upcoming:
            partialURL = @"upcoming";
            break;
    }
    
    self.URLStr = [NSString stringWithFormat:@"%@%@", baseURL, partialURL];
    
    return self;
}

- (void)getListWithPage:(NSInteger)page
      completionHandler:(void (^)(NSURLResponse * _Nonnull, id _Nullable, NSError * _Nullable))completionHandler
{
    NSDictionary<NSString *, NSString *> *params = @{@"page": [@(page) stringValue]};
    [self.apiClient sendHTTPGETRequestWithURLStr:self.URLStr headers:nil queryStringParams:params completionHandler:completionHandler];
}

- (void)getListWithPage:(NSInteger)page successHandler:(void (^)(NSArray * _Nonnull))successHandler {
    NSDictionary<NSString *, NSString *> *params = @{@"page": [@(page) stringValue]};
    [self.apiClient
     sendHTTPGETRequestWithURLStr:self.URLStr
     headers:nil queryStringParams:params
     completionHandler:^(NSURLResponse *response, id responseObject, NSError *error) {
         if ([responseObject isKindOfClass:[NSDictionary class]]) {
             NSDictionary *responseDict = responseObject;
             NSArray *movieDicts = responseDict[@"results"];
             NSMutableArray *movies = [[NSMutableArray alloc] init];
             
             for (NSDictionary *movieDict in movieDicts) {
                 MovieModel *movie = [[MovieModel alloc] initWith:movieDict];
                 [movies addObject:movie];
             }
             
             successHandler(movies);
         }
     }];
}

@end
