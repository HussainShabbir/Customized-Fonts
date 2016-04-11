//
//  ViewController.m
//  CustomizedFonts
//
//  Created by Hussain  on 9/4/16.
//  Copyright © 2016 OnWardGroup. All rights reserved.
//

#import "CFViewController.h"
#import "CFFontSizeCell.h"
#import "CFModel.h"
#import "CFFontColorCell.h"
#import "UIFont+CFFontType.h"

typedef enum fontOperationsIndex : NSUInteger{
    kfontFamilyIndex = 0,
    kfontSizeIndex,
    kfontColorIndex,
    kfontTraitsIndex,
    kfontTitleIndex
}fontOperations;

NSString * const FontFamily = @"fontFamily";
NSString * const FontSize = @"fontSize";
NSString * const FontColor = @"fontColor";
NSString * const FontTraits = @"fontTraits";
NSString * const FontTitle = @"fontTitle";

@interface CFViewController ()
@property (nonatomic,strong) NSArray *items;
@property (nonatomic,strong) CFModel *model;

@end

@implementation CFViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    NSArray *itemList = [UIFont familyNames];
    NSArray *traits = @[@"Bold",@"Italic",@"Bold Italic",@"Condensed Black",@"Condensed Bold",@"Light",@"Light Italic",@"Medium",@"Medium Italic",@"Thin",@"Thin Italic",@"UltraLight",@"UltraLight Italic"];
    NSArray *colorList = @[ @"0x000000", @"0x262626", @"0x4d4d4d", @"0x666666", @"0x808080", @"0x990000", @"0xcc0000", @"0xfe0000", @"0xff5757", @"0xffabab", @"0xffabab", @"0xffa757", @"0xff7900", @"0xcc6100", @"0x994900", @"0x996f00", @"0xcc9400", @"0xffb900", @"0xffd157", @"0xffe8ab", @"0xfff4ab", @"0xffe957", @"0xffde00", @"0xccb200", @"0x998500", @"0x979900", @"0xcacc00", @"0xfcff00", @"0xfdff57", @"0xfeffab", @"0xf0ffab", @"0xe1ff57", @"0xd2ff00", @"0xa8cc00", @"0x7e9900", @"0x038001", @"0x04a101", @"0x05c001", @"0x44bf41", @"0x81bf80", @"0x81c0b8", @"0x41c0af", @"0x00c0a7", @"0x00a18c", @"0x00806f", @"0x040099", @"0x0500cc", @"0x0600ff", @"0x5b57ff", @"0xadabff", @"0xd8abff", @"0xb157ff", @"0x6700bf", @"0x5700a1", @"0x450080", @"0x630080", @"0x7d00a1", @"0x9500c0", @"0xa341bf", @"0xb180bf", @"0xbf80b2", @"0xbf41a6", @"0xbf0199", @"0xa10181", @"0x800166", @"0x999999", @"0xb3b3b3", @"0xcccccc", @"0xe6e6e6", @"0xffffff"];
    
    self.model = [[CFModel alloc]init];
    [self.model initModelItems:itemList fontColor:colorList fontTraits:traits hexValue:colorList[1] familyName:itemList[5] trait:traits[1] size:10 hideFontFamilyPicker:YES hideFontTraitsPicker:YES];
    self.items = itemList;
    // Do any additional setup after loading the view, typically from a nib.
}

-(void)viewDidAppear:(BOOL)animated{
    self.pickerView.frame = CGRectMake(0, self.view.frame.size.height+300, self.view.frame.size.width, 300);
    [self.picker selectRow:5 inComponent:0 animated:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (BOOL)shouldAutorotate {
    return NO;
}


#pragma Mark - TableView Delegate
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 5;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    CGFloat rowHeight = 48.0;
    switch (indexPath.row) {
        case kfontSizeIndex:
            rowHeight = 100;
            break;
            
        case kfontColorIndex:
            rowHeight = 153;
            break;
    }
    return rowHeight;
}

-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell = nil;
    switch (indexPath.row) {
        case kfontFamilyIndex:
            cell = [tableView dequeueReusableCellWithIdentifier:FontFamily];
            cell.detailTextLabel.text = self.model.currentFamilyName;
            break;
        case kfontSizeIndex:
            cell = [tableView dequeueReusableCellWithIdentifier:FontSize];
            cell.detailTextLabel.text = [NSString stringWithFormat:@"%ld",self.model.fontSize];
            break;
        case kfontColorIndex:
            cell = [tableView dequeueReusableCellWithIdentifier:FontColor];
            break;
        case kfontTraitsIndex:
            cell = [tableView dequeueReusableCellWithIdentifier:FontTraits];
            cell.detailTextLabel.text = self.model.currentTrait;
            break;
        case kfontTitleIndex:
            cell = [tableView dequeueReusableCellWithIdentifier:FontTitle];
            cell.textLabel.text = @"Hello World!";
            break;
    }
    return cell;
    
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell = nil;
    [self.model updateIndexPath:indexPath];
    switch (indexPath.row) {
        case kfontFamilyIndex:
            [self.model showFontFamilyPicker:YES showFontTraitsPicker:NO];
            cell = [tableView dequeueReusableCellWithIdentifier:FontFamily];
            self.items = self.model.fontFamilies;
            [self.picker reloadAllComponents];
            break;
            
        case kfontTraitsIndex:
            [self.model showFontFamilyPicker:NO showFontTraitsPicker:YES];
            cell = [tableView dequeueReusableCellWithIdentifier:FontTraits];
            self.items = self.model.fontTraits;
            [self.picker reloadAllComponents];
            break;
            
        default:
            [self.model showFontFamilyPicker:NO showFontTraitsPicker:NO];
            break;
    }
    if (self.model.fontFamilyPicker || self.model.fontTraitsPicker){
        [self showPickerView];
    }
    else{
        [self hidePickerView];
    }
    
}

-(void)hidePickerView{
    [UIView animateWithDuration:0.5 animations:^{
        self.pickerView.frame = CGRectMake(0, self.view.frame.size.height+300, self.view.frame.size.width, 300);
    }];
}

-(void)showPickerView{
    [UIView animateWithDuration:0.5 animations:^{
        
        self.pickerView.frame = CGRectMake(0, self.view.frame.size.height-300, self.view.frame.size.width, 300);
    }];
}

-(IBAction)done:(id)sender
{
    [self hidePickerView];
}

- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView;
{
    return 1;
}

- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component;
{
    
    return [self.items count];
}

- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component
{
    return[self.items objectAtIndex:row];
}


- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component
{
    UITableViewCell *cell = [self.tableView cellForRowAtIndexPath:self.model.currentIndexPath];
    cell.detailTextLabel.text = self.items[row];
    if (self.model.fontFamilyPicker){
    self.model.currentFamilyName = self.items[row];
    }
    else if (self.model.fontTraitsPicker){
        self.model.currentTrait = self.items[row];
    }
    [self updateFonts];
}


-(IBAction)sliderValueChanged:(UISlider*)sender
{
    NSUInteger sliderValue = [sender value];
    if ([sender viewWithTag:101])
    {
        CFFontSizeCell *fontSizeCell = [self.tableView cellForRowAtIndexPath:[NSIndexPath indexPathForRow:1 inSection:0]];
        [fontSizeCell updateDetailTextValue:[NSString stringWithFormat:@"%ld",sliderValue]];
        self.model.fontSize = sliderValue;
    }
    else if ([sender viewWithTag:102])
    {
        self.model.hexColor = self.model.colors[sliderValue];
    }
    [self updateFonts];
}

-(void)updateTitleWithFont:(UIFont*)font
{
    UITableViewCell *cell = [self.tableView cellForRowAtIndexPath:[NSIndexPath indexPathForRow:4 inSection:0]];
    cell.textLabel.font = font;
    
}


-(void)updateTitleWithFontColor:(NSString*)hexColor
{
    UITableViewCell *cell = [self.tableView cellForRowAtIndexPath:[NSIndexPath indexPathForRow:4 inSection:0]];
    unsigned colorInt = 0;
    [[NSScanner scannerWithString:hexColor] scanHexInt:&colorInt];
    cell.textLabel.textColor = [self colorFromHex:colorInt];
}

-(UIColor*)colorFromHex:(NSUInteger)rgbValue
{
    CGFloat red = ((rgbValue & 0xFF0000) >> 16) / 0xFF;
    CGFloat green = ((rgbValue & 0x00FF00) >> 8) / 0xFF;
    CGFloat blue = (rgbValue & 0x0000FF) / 0xFF;
    CGFloat alpha = 1.0;
    return  [UIColor colorWithRed:red green:green blue:blue alpha:alpha];
}

-(void)updateFonts{
    UIFont *font = [UIFont createFontWithFamily:self.model.currentFamilyName fontSize:self.model.fontSize fontTrait:self.model.currentTrait];
    [self updateTitleWithFont:font];
    [self updateTitleWithFontColor:self.model.hexColor];
}

@end
