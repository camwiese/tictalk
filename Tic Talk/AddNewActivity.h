//
//  AddNewActivity.h
//  Tic Talk
//
//  Created by Cameron Wiese on 11/21/13.
//  Copyright (c) 2013 Wyatt Smith. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AddNewActivity : UIViewController <UITextFieldDelegate, UICollectionViewDataSource, UICollectionViewDelegate>

@property (nonatomic, strong) IBOutlet UICollectionView *collectionView;

@end
