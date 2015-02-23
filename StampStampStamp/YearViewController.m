//
//  YearViewController.m
//  StampStampStamp
//
//  Created by Tawatchai Sunarat on 2/21/15.
//  Copyright (c) 2015 pddk. All rights reserved.
//

#import "YearViewController.h"
#import "SectionHeader.h"
#import "CollectionCell.h"

static NSArray *years = nil;

@interface YearViewController ()

@end

@implementation YearViewController

#pragma mark - initial

- (void)viewDidLoad {
    [super viewDidLoad];
    
    years = @[@"2015", @"2014", @"2013", @"2012"];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

#pragma mark - UICollectionViewDataSource

-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return [years count];
}

-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return 1;
}

-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    CollectionCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"Cell" forIndexPath:indexPath];
    
    NSString *imageName = [NSString stringWithFormat:@"%@.JPG", [years objectAtIndex:indexPath.section]];
    cell.imageView.image = [UIImage imageNamed:imageName];
    
    return cell;
}

-(UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath
{
    SectionHeader *section = [collectionView dequeueReusableSupplementaryViewOfKind:kind
                                                                    withReuseIdentifier:@"Header"
                                                                           forIndexPath:indexPath];
    section.headerLabel.text = [years objectAtIndex:indexPath.section];

    return section;
}

#pragma mark - UICollectionViewDelegateFlowLayout

-(CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    return CGSizeMake(self.collectionView.bounds.size.width, 200);
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout referenceSizeForHeaderInSection:(NSInteger)section
{
    return CGSizeMake(self.collectionView.bounds.size.width, 60);
}

@end
