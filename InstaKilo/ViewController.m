//
//  ViewController.m
//  InstaKilo
//
//  Created by Harry Li on 2017-06-14.
//  Copyright © 2017 Harry. All rights reserved.
//

#import "ViewController.h"
#import "MyCollectionViewCell.h"
#import "Photo.h"
#import "Header.h"

@interface ViewController () <UICollectionViewDelegate,UICollectionViewDataSource>

@property (weak, nonatomic) IBOutlet UICollectionView *collectionView;

@property (nonatomic) NSDictionary *subjectDictionary;
@property (nonatomic) NSDictionary *locationDictionary;
@property (nonatomic) NSArray *subjectKeys;
@property (nonatomic) NSArray *locationKeys;
@property (nonatomic) BOOL sortBySubject;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self initPhotos];
}

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
    if (self.sortBySubject) {
        return self.subjectDictionary.count;
    }else{
        return self.locationDictionary.count;
    }
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    if (self.sortBySubject) {
        NSArray *temp = [self.subjectDictionary objectForKey:self.subjectKeys[section]];
        return temp.count;
    }else{
        NSArray *temp = [self.locationDictionary objectForKey:self.locationKeys[section]];
        return temp.count;
    }
}


- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    MyCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"Cell" forIndexPath:indexPath];
    
    if (self.sortBySubject) {
        NSArray *temp = [self.subjectDictionary objectForKey:self.subjectKeys[indexPath.section]];
        cell.imageView.image = [temp[indexPath.item] photo];
    }else{
        NSArray *temp = [self.locationDictionary objectForKey:self.locationKeys[indexPath.section]];
        cell.imageView.image = [temp[indexPath.item] photo];
    }
    return cell;
}

-(UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath{
    
    if ([kind isEqualToString:UICollectionElementKindSectionHeader]) {
        Header *headerView = [collectionView dequeueReusableSupplementaryViewOfKind:kind withReuseIdentifier:@"header" forIndexPath:indexPath];
        
        if (self.sortBySubject) {
            headerView.headerLabel.text = self.subjectKeys[indexPath.section];
        }else{
            headerView.headerLabel.text = self.locationKeys[indexPath.section];
        }
        return headerView;
    }
    return nil;
}

- (IBAction)sortBySubject:(UISegmentedControl *)sender {
    if (sender.selectedSegmentIndex == 0) {
        self.sortBySubject = YES;
    }else{
        self.sortBySubject = NO;
    }
    [self.collectionView reloadData];
}



- (void)initPhotos{
    Photo *photo1 = [[Photo alloc] initWithImage:[UIImage imageNamed:@"image1"] andSubject:@"subjectA" andLocation:@"locationA"];
    Photo *photo2 = [[Photo alloc] initWithImage:[UIImage imageNamed:@"image2"] andSubject:@"subjectA" andLocation:@"locationB"];
    Photo *photo3 = [[Photo alloc] initWithImage:[UIImage imageNamed:@"image3"] andSubject:@"subjectA" andLocation:@"locationB"];
    Photo *photo4 = [[Photo alloc] initWithImage:[UIImage imageNamed:@"image4"] andSubject:@"subjectB" andLocation:@"locationB"];
    Photo *photo5 = [[Photo alloc] initWithImage:[UIImage imageNamed:@"image5"] andSubject:@"subjectB" andLocation:@"locationC"];
    Photo *photo6 = [[Photo alloc] initWithImage:[UIImage imageNamed:@"image6"] andSubject:@"subjectB" andLocation:@"locationC"];
    Photo *photo7 = [[Photo alloc] initWithImage:[UIImage imageNamed:@"image7"] andSubject:@"subjectC" andLocation:@"locationD"];
    Photo *photo8 = [[Photo alloc] initWithImage:[UIImage imageNamed:@"image8"] andSubject:@"subjectC" andLocation:@"locationD"];
    Photo *photo9 = [[Photo alloc] initWithImage:[UIImage imageNamed:@"image9"] andSubject:@"subjectC" andLocation:@"locationD"];
    Photo *photo10 = [[Photo alloc] initWithImage:[UIImage imageNamed:@"image10"] andSubject:@"subjectC" andLocation:@"locationE"];
    
    self.subjectDictionary = @{
                               @"subjectA" : @[photo1,photo2,photo3],
                               @"subjectB" : @[photo4,photo5,photo6],
                               @"subjectC" : @[photo7,photo8,photo9,photo10]
                               };
    
    self.locationDictionary = @{
                                @"locationA" : @[photo1],
                                @"locationB" : @[photo2,photo3,photo4],
                                @"locationC" : @[photo5,photo6],
                                @"locationD" : @[photo7,photo8,photo9],
                                @"locationE" : @[photo10]
                                };
    
    self.subjectKeys = [[NSArray alloc]initWithArray:[self.subjectDictionary allKeys]];
    self.locationKeys = [[NSArray alloc]initWithArray:[self.locationDictionary allKeys]];
    self.sortBySubject = YES;
}

@end
