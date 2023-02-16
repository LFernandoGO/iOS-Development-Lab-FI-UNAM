//
//  ViewController.m
//  Calculadora
//
//  Created by Fernando Gutierrez on 13/02/23.
//

#import "ViewController.h"

@interface ViewController () {
    NSString *value1;
    NSString *value2;
    NSString *operation;
    int result;
    float resultD;
}
- (IBAction)numberButton:(UIButton*)sender;
- (IBAction)operation:(UIButton*)sender;
- (IBAction)clearButton:(UIButton*)sender;
- (IBAction)resultButton:(UIButton*)sender;
@property (weak, nonatomic) IBOutlet UILabel *numbersLabel;
@property (strong, nonatomic) IBOutletCollection(UIButton) NSArray *numberButtonOutlet;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self updateView];
    // Do any additional setup after loading the view.
}

- (void) updateView{
    _numbersLabel.text = @"";
}

- (IBAction)resultButton:(UIButton*)sender {
    if([operation isEqual:(@"+")]){
        value2 = _numbersLabel.text;
        _numbersLabel.text = @"";
        result = value1.intValue + value2.intValue;
        _numbersLabel.text = [@(result) stringValue];
    }
    if([operation isEqual:(@"-")]){
        value2 = _numbersLabel.text;
        _numbersLabel.text = @"";
        result = value1.intValue - value2.intValue;
        _numbersLabel.text = [@(result) stringValue];
    }
    if([operation isEqual:(@"×")]){
        value2 = _numbersLabel.text;
        _numbersLabel.text = @"";
        result = (value1.intValue * value2.intValue);
        _numbersLabel.text = [@(result) stringValue];
    }
    if([operation isEqual:(@"÷")]){
        value2 = _numbersLabel.text;
        _numbersLabel.text = @"";
        if (value2 == 0){
            _numbersLabel.text = @"Error";
        }
        else{
            resultD = (value1.intValue / value2.intValue);
            _numbersLabel.text = [@(resultD) stringValue];
        }
    }
}

- (IBAction)clearButton:(UIButton*)sender {
    _numbersLabel.text = @"";
    value1 = 0;
    value2 = 0;
    result = 0;
}

- (IBAction)operation:(UIButton*)sender {
    if([sender.titleLabel.text isEqual:(@"+")]){
        value1 = _numbersLabel.text;
        _numbersLabel.text = @"";
        operation = @"+";
    }
    if([sender.titleLabel.text isEqual:(@"-")]){
        value1 = _numbersLabel.text;
        _numbersLabel.text = @"";
        operation = @"-";
    }
    if([sender.titleLabel.text isEqual:(@"×")]){
        value1 = _numbersLabel.text;
        _numbersLabel.text = @"";
        operation = @"×";
    }
    if([sender.titleLabel.text isEqual:(@"÷")]){
        value1 = _numbersLabel.text;
        _numbersLabel.text = @"";
        operation = @"÷";
    }
}


- (IBAction)numberButton:(UIButton*)sender {
    NSString *text;
    if([_numbersLabel.text isEqual:(@"")]){
        _numbersLabel.text = sender.titleLabel.text;
    }else{
        text = [_numbersLabel.text stringByAppendingString:sender.titleLabel.text];
            _numbersLabel.text = text;
    }
}

@end

