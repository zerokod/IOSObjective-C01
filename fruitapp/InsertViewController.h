//
//  InsertViewController.h
//  fruitapp
//
//  Created by Roberta Marino on 24/12/12.
//  Copyright (c) 2012 kodlounge. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "InsertDelegate.h"
#import "Fruit.h"

__weak id <InsertDelegate> _delegate;


//@interface InsertViewController : UIViewController
@interface InsertViewController : UIViewController <UITextViewDelegate, UITextFieldDelegate, UITableViewDataSource,UITableViewDelegate>


{
    
    
    
    UITextField *_nameTextField;
    UITextField *_originTextField;
    UITextView *_descriptionTextView;
    
    UIButton *_resetButton;
    UIButton *_addButton;
    
    NSArray *_imageButtonArray;
    NSMutableArray *_buttonArray;
    
    //int *index;
    //UIViewController *fruitObject;
    
       
}



-(void)addButtonTapped;
-(void)resetButtonTapped;
-(void)dismissKeyboard;
- (void)selectImageButton:(UIButton *)sender;

@property (strong, nonatomic) UIWindow *window;
@property(nonatomic,weak) id <InsertDelegate> delegate;
//@property (strong, nonatomic) UIViewController *fruit;

@end
