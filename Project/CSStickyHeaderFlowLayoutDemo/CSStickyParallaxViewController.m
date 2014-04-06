//
//  CSStickyParallaxViewController.m
//  CSStickyHeaderFlowLayoutDemo
//
//  Created by Christopher Carlsson on 2014-04-06.
//  Copyright (c) 2014 Jamz Tang. All rights reserved.
//

#import "CSStickyParallaxViewController.h"
#import "CSStickyHeaderFlowLayout.h"
#import "CSCell.h"

@interface CSStickyParallaxViewController ()

@property (nonatomic, strong) NSArray *sections;
@property (nonatomic, strong) UINib *headerNib;

@end

@implementation CSStickyParallaxViewController

- (id)initWithCoder:(NSCoder *)aDecoder {
    self = [super initWithCoder:aDecoder];
    if (self) {
        self.sections = @[
                          @{@"Twitter":@"http://twitter.com"},
                          @{@"Facebook":@"http://facebook.com"},
                          @{@"Tumblr":@"http://tumblr.com"},
                          @{@"Pinterest":@"http://pinterest.com"},
                          @{@"Instagram":@"http://instagram.com"},
                          @{@"Github":@"http://github.com"},
                          ];
        
        self.headerNib = [UINib nibWithNibName:@"CSParallaxSticky" bundle:nil];
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
	CSStickyHeaderFlowLayout *layout = (id)self.collectionViewLayout;
    
    if ([layout isKindOfClass:[CSStickyHeaderFlowLayout class]]) {
        layout.parallaxHeaderReferenceSize = CGSizeMake(320, 213);
		layout.parallaxHeaderMinimumReferenceSize = CGSizeMake(320,	0);
		
		// Addition
		layout.parallaxHeaderStickHeight = CGSizeMake(320, 80);
    }
	
    [self.collectionView registerNib:self.headerNib
          forSupplementaryViewOfKind:CSStickyHeaderParallaxHeader
                 withReuseIdentifier:@"header"];
}


- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return 1;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return 20;
}

- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section
{
    return 0;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
	UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"cell" forIndexPath:indexPath];
	
    return cell;
}

- (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath
{
	UICollectionReusableView *cell = [collectionView dequeueReusableSupplementaryViewOfKind:kind
																		withReuseIdentifier:@"header"
																			   forIndexPath:indexPath];
	
	return cell;
	
}
@end
