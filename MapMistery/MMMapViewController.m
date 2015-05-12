//
//  MapViewController.m
//  MapMistery
//
//  Created by Vitor on 5/11/15.
//  Copyright (c) 2015 BEPID. All rights reserved.
//

#import "MMMapViewController.h"
#import "MMLocalStore.h"
#import "Local.h"
#import "MMCustomAnnotation.h"
@import MapKit;
@import CoreLocation;

@interface MMMapViewController () <MKMapViewDelegate, NSFetchedResultsControllerDelegate>

@property (nonatomic) CLLocationManager *locationManager;
@property (nonatomic) MKLocalSearchRequest *localSearchRequest;
@property (nonatomic) MKLocalSearch *localSearch;
@property (weak, nonatomic) IBOutlet MKMapView *map;
@property (nonatomic) NSManagedObjectContext *managedObjectContext;

@end

@implementation MMMapViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.map.delegate = self;
    self.locationManager = [CLLocationManager new];
    self.localSearchRequest = [MKLocalSearchRequest new];
    
    if ([_locationManager respondsToSelector:@selector(requestWhenInUseAuthorization)]) {
        [_locationManager requestWhenInUseAuthorization];
    }
    
    [self.locationManager startUpdatingLocation];
    
//    UIView *tab = [[UIView alloc] initWithFrame:CGRectMake(50, 50, 50, 50)];
//    tab.backgroundColor = [UIColor redColor];
//    UIButton *button = [[UIButton alloc] initWithFrame:CGRectMake(5, 5, 30, 10)];
//    button.backgroundColor = [UIColor blueColor];
//    [tab addSubview:button];
//    [self.map addSubview:tab];
}

- (void)viewDidAppear:(BOOL)animated{
    
    MKCoordinateRegion region;
    
    region = MKCoordinateRegionMakeWithDistance(self.locationManager.location.coordinate, 2000, 2000);
    
    [self.map setRegion:region animated:YES];
    
    [self.locationManager stopUpdatingLocation];
    
    self.localSearchRequest.region = region;
    self.localSearchRequest.naturalLanguageQuery = @"Restaurante";
    
    self.localSearch = [[MKLocalSearch alloc] initWithRequest:self.localSearchRequest];
    
    [self.localSearch startWithCompletionHandler:^(MKLocalSearchResponse *response, NSError *error) {
        if (error) {
            NSLog(@"Erro na busca");
        } else {
            
            for(MKMapItem *mapItem in response.mapItems){
                
//                MKPointAnnotation *point = [MKPointAnnotation new];
//                point.coordinate = mapItem.placemark.coordinate;
//                point.title = mapItem.name;
//                [self.map addAnnotation:point];
//                NSLog(@"Nome: %@\nRua: %@", mapItem.name, mapItem.placemark.thoroughfare);
                MMCustomAnnotation *customAnnotation = [[MMCustomAnnotation alloc] initWithTitle:mapItem.name andCoordinate:mapItem.placemark.coordinate];
                [self.map addAnnotation:customAnnotation];
            }
        }
    }];
}

- (MKAnnotationView *)mapView:(MKMapView *)mapView viewForAnnotation:(id<MKAnnotation>)annotation{
    
    if ([annotation isKindOfClass:[MMCustomAnnotation class]]) {
        
        MMCustomAnnotation *customAnnotation = (MMCustomAnnotation *) annotation;
        MKAnnotationView *annotationView = [mapView dequeueReusableAnnotationViewWithIdentifier:@"CustomAnnotation"];
        if (annotationView == nil) {
            
            annotationView = customAnnotation.annotationView;
        } else {
            
            annotationView.annotation = annotation;
        }
        
        return annotationView;
    } else {
        
        return nil;
    }
}

- (NSFetchedResultsController *)fetchedResultsController {
    return [[MMLocalStore sharedStore] fetchedResultsController];
}

- (void)mapView:(MKMapView *)mapView didSelectAnnotationView:(MKAnnotationView *)view{
    
    CLLocationCoordinate2D coord = [view.annotation coordinate];
    NSLog(@"antes");
    NSString *latitude = [NSString stringWithFormat:@"%f", coord.latitude];
    NSString *longitude = [NSString stringWithFormat:@"%f", coord.longitude];
//    NSLog(@"Longitude %@ %@", local.longitude, local.latitude);
    MKPointAnnotation *currentAnnotation = view.annotation;
    Local *local = [[MMLocalStore sharedStore] createLocalWithLatitude:latitude andLongitude:longitude andTitle:currentAnnotation.title andTipo:@"bla"];
//    NSLog(@"local title: %@ current: %@", local.title, currentAnnotation.title);
}

- (void)controller:(NSFetchedResultsController *)controller didChangeObject:(id)anObject atIndexPath:(NSIndexPath *)indexPath forChangeType:(NSFetchedResultsChangeType)type newIndexPath:(NSIndexPath *)newIndexPath
{
    [self.fetchedResultsController performFetch:nil];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
