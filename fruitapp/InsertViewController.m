//
//  InsertViewController.m
//  fruitapp
//
//  Created by Roberta Marino on 24/12/12.
//  Copyright (c) 2012 kodlounge. All rights reserved.
//

#import "InsertViewController.h"
#import <QuartzCore/QuartzCore.h>
#import "Fruit.h"
#import "ListViewController.h"
#import "InsertDelegate.h"

@interface InsertViewController ()

@end

@implementation InsertViewController

@synthesize delegate = _delegate;
//@synthesize fruit = fruitObject;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        self.view.backgroundColor = [UIColor yellowColor];
        
        
        
        CGRect rettangolo1= CGRectMake(10, 5, 200, 40);
                               
        UILabel *name= [[UILabel alloc] initWithFrame:rettangolo1];
        
        name.text =@"Nome";
        name.backgroundColor=[UIColor clearColor];
        name.textColor= [UIColor blackColor];
        name.font= [UIFont boldSystemFontOfSize:20];
        [self.view addSubview:name];
        
        CGRect rettangolo2= CGRectMake(10, 90, 200, 40);
        
        UILabel *origin = [[UILabel alloc] initWithFrame:rettangolo2];
        origin.text = @"Origine";
        origin.backgroundColor = [UIColor clearColor];
        origin.textColor = [UIColor blackColor];
        origin.font= [UIFont boldSystemFontOfSize:20];
        [self.view addSubview:origin];
        
        CGRect rettangolo3= CGRectMake(10, 270, 200, 50);
        
        UILabel *description = [[UILabel alloc]initWithFrame:rettangolo3];
        description.text= @"Descrizione";
        description.backgroundColor= [UIColor clearColor];
        description.textColor= [UIColor blackColor];
        description.font=[UIFont boldSystemFontOfSize:20];
        [self.view addSubview:description];
        
        
        
        UIToolbar *toolbar = [[UIToolbar alloc] initWithFrame:CGRectMake(0, 0, 320, 44)];
        
        toolbar.barStyle = UIBarStyleBlackTranslucent;
        UIBarButtonItem *doneButton = [[UIBarButtonItem alloc] initWithTitle:@"Fatto" style:UIBarButtonItemStyleDone target:self action:@selector(dismissKeyboard) ];
        
        
        
        toolbar.items = [NSArray arrayWithObjects:doneButton, nil];
        
        
        
        
        CGRect rettangolo4= CGRectMake(10, 40, 300, 60);
        //UITextField * _nameTextField= [[UITextField alloc] initWithFrame:rettangolo4];
         _nameTextField= [[UITextField alloc] initWithFrame:rettangolo4];
        _nameTextField.placeholder=@"Inserisci il nome";
        _nameTextField.textColor=[UIColor blackColor];
        _nameTextField.font=[UIFont boldSystemFontOfSize:14];
        _nameTextField.backgroundColor=[UIColor whiteColor];
        _nameTextField.borderStyle=UITextBorderStyleRoundedRect;
        _nameTextField.delegate=self;
        //_nameTextField.inputAccessoryView = toolbar;
        [self.view addSubview:_nameTextField];
        
        CGRect rettangolo5=CGRectMake(10, 130, 300, 60);
        //UITextField *_originTextField=[[UITextField alloc] initWithFrame:rettangolo5];
         _originTextField=[[UITextField alloc] initWithFrame:rettangolo5];
        _originTextField.placeholder=@"Inserisci l'origine";
        _originTextField.textColor=[UIColor blackColor];
        _originTextField.font=[UIFont boldSystemFontOfSize:14];
        _originTextField.backgroundColor=[UIColor whiteColor];
        _originTextField.borderStyle=UITextBorderStyleRoundedRect;
        _originTextField.delegate=self;
        //_originTextField.inputAccessoryView = toolbar;
        [self.view addSubview:_originTextField];
        
        
        
        
        
        
        
        CGRect rettangolo7= CGRectMake(10, 280, 300, 80);
        //UITextView *_descriptionTextView= [[UITextView alloc] initWithFrame:rettangolo7];
        _descriptionTextView= [[UITextView alloc] initWithFrame:rettangolo7];
        
        _descriptionTextView.textColor=[UIColor blackColor];
        _descriptionTextView.font=[UIFont boldSystemFontOfSize:14];
        _descriptionTextView.backgroundColor=[UIColor whiteColor];
        _descriptionTextView.delegate=self;
        
        _descriptionTextView.inputAccessoryView = toolbar;
        
        [self.view addSubview:_descriptionTextView];
        
        _resetButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
        _resetButton.frame = CGRectMake(10, 370, 140, 30);        
        [_resetButton addTarget:self action:@selector(resetButtonTapped) forControlEvents:UIControlEventTouchUpInside];            
        [_resetButton setTitle:@"Reset" forState:UIControlStateNormal];
        [_resetButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [self.view addSubview:_resetButton];
        
        _addButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
        _addButton.frame = CGRectMake(160, 370, 140, 30);
        [_addButton addTarget:self action:@selector(addButtonTapped) forControlEvents:UIControlEventTouchUpInside];
        [_addButton setTitle:@"Inserisci" forState:UIControlStateNormal];
        [_addButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [self.view addSubview:_addButton];
        
        _imageButtonArray = [[NSArray alloc]initWithObjects:[UIImage imageNamed:@"pera.png"],
                             [UIImage imageNamed:@"arancia.png"],
                             [UIImage imageNamed:@"mela.png"],nil];
        
        _buttonArray = [[NSMutableArray alloc]init];
        
        for (int i =0; i< 3; i++) {
            UIButton * button = [UIButton buttonWithType:UIButtonTypeCustom];
            button.frame = CGRectMake(20+(100*i), 200, 80, 80);
            [button setImage:[_imageButtonArray objectAtIndex:i] forState:UIControlStateNormal];
            [button addTarget:self action:@selector(selectImageButton:) forControlEvents:UIControlEventTouchUpInside];
            button.tag = i;
            [self.view addSubview:button];
            [_buttonArray addObject:button];
        }
        
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



/*
- (BOOL)textView:(UITextView *)textView shouldChangeTextInRange:(NSRange)range
 replacementText:(NSString *)text {
    if(self) {
        [textView resignFirstResponder];
        return NO;
    }
    return YES;
}
*/

- (void)textViewDidBeginEditing:(UITextView *)textView
{
    CGAffineTransform translateUp = CGAffineTransformMakeTranslation(0.0, -150.0);
    
    [UIView beginAnimations:nil context:nil];
    [UIView setAnimationDuration:0.2];
    self.view.transform = translateUp;
    [UIView commitAnimations];
}

- (void)textViewDidEndEditing:(UITextView *)textView
{
    CGAffineTransform translateUp = CGAffineTransformMakeTranslation(0.0, 0.0);
    
    [UIView beginAnimations:nil context:nil];
    [UIView setAnimationDuration:0.2];
    self.view.transform = translateUp;
    [UIView commitAnimations];
}

- (void)addButtonTapped{
    NSLog(@"Button TAPPED !!");
    
    /*
    
    for (int i = 0; i < 3; i++) {
        UIButton *  button = [_buttonArray objectAtIndex:i];
        if (button.selected == YES) {
            index = i;
            button.layer.borderWidth = 0.0;
            [button setSelected:NO];
        }
    }
    
    UIImage * fruitImage = [_imageButtonArray objectAtIndex:index];
    
    Fruit * fruitObject= [[Fruit alloc]initWithName:_nameTextField.text origin:_originTextField.text description:_descriptionTextView.text image:fruitImage];
    
    _nameTextField.text = @"";
    _originTextField.text = @"";
    _descriptionTextView.text = @"";
     */
    
   
    int index;
    BOOL imageSelected = NO;
    
    for (int i = 0; i < 3; i++) {
        UIButton *  button = [_buttonArray objectAtIndex:i];
        if (button.selected == YES) {
            index = i;
            imageSelected = YES;
            button.layer.borderWidth = 0.0;
            [button setSelected:NO];
        }
    }
    
    
     /*
    imageSelected = YES;
    _nameTextField.text = @"hi";
    _originTextField.text = @"hello";
    _descriptionTextView.text = @"ciao";

   
    if (imageSelected == NO || _nameTextField.text == nil || _originTextField.text == nil || _descriptionTextView.text == nil) {
    
      
      if (imageSelected == NO || ![_nameTextField.text isEqualToString:@""] ||  ![_originTextField.text isEqualToString:@""] || ![_descriptionTextView.text isEqualToString:@""] ){
    
      imageSelected = YES;
      _nameTextField.text = @"hi";
      _originTextField.text = @"hello";
      _descriptionTextView.text = @"ciao";
      */
    
    NSLog(@"image selected: %@", imageSelected ? @"YES" : @"NO");
    NSLog(@"name: %@", _nameTextField.text);
    NSLog(@"origin: %@", _originTextField.text);
    NSLog(@"description: %@", _descriptionTextView.text);
    
    if (imageSelected == NO || [_nameTextField.text isEqualToString:@""] || [_originTextField.text isEqualToString:@""] || [_descriptionTextView.text isEqualToString:@""]) {
    
        
        UIAlertView * alertView = [[UIAlertView alloc]initWithTitle:@"Attenzione!"
                                                            message:@"Tutti i campi sono obbligatori"
                                                           delegate:nil cancelButtonTitle:nil
                                                  otherButtonTitles:@"Ok", nil];
        
        [alertView show];
        
        return;
        
    }
     
     
    UIImage * fruitImage = [_imageButtonArray objectAtIndex:index];
    
    
    
    Fruit * fruitObject= [[Fruit alloc]initWithName:_nameTextField.text origin:_originTextField.text description:_descriptionTextView.text image:fruitImage];
    
    
    //Fruit * fruitObject= [[Fruit alloc]initWithName:@"ciao1" origin:@"ciao2" description:@"ciao3" image:fruitImage];
    
    
     
    [self.delegate insertNewFruit:fruitObject];
    
    _nameTextField.text = @"";
    _originTextField.text = @"";
    _descriptionTextView.text = @"";
}

- (void)resetButtonTapped{
     NSLog(@"Button RESET TAPPED !!");
    _originTextField.text = @"";
    _nameTextField.text = @"";
    _descriptionTextView.text = @"";
}

- (void)dismissKeyboard{
    
    if ([_nameTextField isFirstResponder]) {
        [_nameTextField resignFirstResponder];
    }
    
    if ([_originTextField isFirstResponder]) {
        [_originTextField resignFirstResponder];
    }
    
    if ([_descriptionTextView isFirstResponder]) {
        [_descriptionTextView resignFirstResponder];
    }
}

- (void)selectImageButton:(UIButton *)sender{
    for (UIButton * button in _buttonArray) {
        if (button.tag == sender.tag) {
            button.layer.borderColor = [UIColor blackColor].CGColor;
            button.layer.borderWidth = 3.0;
            [button setSelected:YES];
        }
        else{
            button.layer.borderWidth = 0.0;
            [button setSelected:NO];
        }
        
    }
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [textField resignFirstResponder];
    return YES;
}

- (BOOL)textViewShouldReturn:(UITextView *)textView
{
    [textView resignFirstResponder];
    return YES;
}@end
