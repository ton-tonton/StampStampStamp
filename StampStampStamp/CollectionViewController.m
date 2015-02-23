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
        [self.imagesName addObject:[NSString stringWithFormat:@"%d.JPG", (i + startNumberOfImg)]];
    }
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
    cell.imageView.image = [UIImage imageNamed:[self.imagesName objectAtIndex:indexPath.row]];
    
    return cell;
}

-(UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath
{
    CollectionHeader *header = [collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionHeader
                                                                  withReuseIdentifier:@"Header"
                                                                         forIndexPath:indexPath];
    
    NSString *title;
    switch ([self.year intValue]) {
        case 2015:
            title = @"2015 year beast bloom";
            break;
        
        case 2014:
            title = @"2014 legendary of legion commander";
            break;
            
        case 2013:
            title = @"2013 god of riki";
            break;
            
        default:
            title = @"2012 play with me free damage";
            break;
    }
    
    header.headerLabel.text = title;
    
    return header;
}

#pragma mark <UICollectionViewDelegate>

#pragma mark - UICollectionViewDelegateFlowLayout

-(CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    return CGSizeMake(44, 44);
}

@end
