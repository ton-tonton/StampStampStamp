//
//  CollectionViewController.m
//  StampStampStamp
//
//  Created by Tawatchai Sunarat on 2/23/15.
//  Copyright (c) 2015 pddk. All rights reserved.
//

#import "CollectionViewController.h"
#import "CollectionCell.h"
#import "CollectionHeader.h"
#import "SeriesViewController.h"

static NSArray *titles;

@interface CollectionViewController () <UICollectionViewDelegateFlowLayout>

@property (nonatomic, strong) NSMutableArray *imagesName;

@end

@implementation CollectionViewController

#pragma mark - initial

-(void)prepareDataForYear
{
    self.imagesName = [NSMutableArray array];
    int startNumberOfImg = (2015 - [self.year intValue]) * 8;
    
    for (int i = 0; i < 8; i++) {
        [self.imagesName addObject:[NSString stringWithFormat:@"%d", (i + startNumberOfImg)]];
    }
    
    titles = @[@"2015 year beast bloom", @"2014 legendary of legion commander", @"2013 god of riki", @"2012 play with me free damage"];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self prepareDataForYear];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

#pragma mark - screen

-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    [self.collectionView reloadData];
}

#pragma mark <UICollectionViewDataSource>

-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return 1;
}

-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return [self.imagesName count];
}

-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    CollectionCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"Cell" forIndexPath:indexPath];
    NSString *imageName = [NSString stringWithFormat:@"%@.JPG", self.imagesName[indexPath.row]];
    cell.imageView.image = [UIImage imageNamed:imageName];
    
    return cell;
}

-(UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath
{
    CollectionHeader *header = [collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionHeader
                                                                  withReuseIdentifier:@"Header"
                                                                         forIndexPath:indexPath];
    int index = 2015 - [self.year intValue];
    header.headerLabel.text = titles[index];
    
    return header;
}

#pragma mark <UICollectionViewDelegate>

#pragma mark - UICollectionViewDelegateFlowLayout

-(CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    return CGSizeMake(44, 44);
}

#pragma mark - Navigation

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([[segue identifier] isEqualToString:@"ShowSeries"]) {
        
        SeriesViewController *svc = [segue destinationViewController];
        NSString *title = titles[(2015 - [self.year intValue])];
        svc.title = title;
        svc.imagesName = self.imagesName;
    }
}

@end
