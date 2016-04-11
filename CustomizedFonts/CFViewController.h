//
//  ViewController.h
//  CustomizedFonts
//
//  Created by Hussain  on 9/4/16.
//  Copyright © 2016 OnWardGroup. All rights reserved.
//

#import <UIKit/UIKit.h>
extern NSString *const FontFamily, *const FontSize, *const FontColor, *const FontTraits, *const FontTitle;
@interface CFViewController : UIViewController<UITableViewDelegate,UITableViewDataSource,UIPickerViewDelegate,UIPickerViewDataSource>
@property (nonatomic,weak) IBOutlet UIView *pickerView;
@property (nonatomic,weak) IBOutlet UITableView *tableView;
@property (nonatomic,weak) IBOutlet UIPickerView *picker;
@end

