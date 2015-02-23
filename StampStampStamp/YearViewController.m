//
//  YearViewController.m
//  StampStampStamp
//
//  Created by Tawatchai Sunarat on 2/21/15.
//  Copyright (c) 2015 pddk. All rights reserved.
//

#import "YearViewController.h"
#import "YearHeader.h"
#import "YearCell.h"
#import "CollectionViewController.h"

static NSArray *years = nil;

@interface YearViewController () <UICollectionViewDelegateFlowLayout>

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

#pragma mark - screen

-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    [self.collectionView reloadData];
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
    YearCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"Cell" forIndexPath:indexPath];
    
    NSString *imageName = [NSString stringWithFormat:@"%@.JPG", [years objectAtIndex:indexPath.section]];
    cell.imageView.image = [UIImage imageNamed:imageName];
    
    return cell;
}

-(UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath
{
    YearHeader *section = [collectionView dequeueReusableSupplementaryViewOfKind:kind
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

#pragma mark - Navigation

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([[segue identifier] isEqualToString:@"ShowCollection"]) {

        CollectionViewController *cvc = [segue destinationViewController];
        YearCell *cell = (YearCell *)sender;
        NSIndexPath *indexPath = [self.collectionView indexPathForCell:cell];
        NSString *year = [years objectAtIndex:indexPath.section];
        
        cvc.year = [year copy];
    }
}

@end
