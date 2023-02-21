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
    double result;
    double resultD;
}
- (IBAction)numberButton:(UIButton*)sender;
- (IBAction)operation:(UIButton*)sender;
- (IBAction)clearButton:(UIButton*)sender;
- (IBAction)resultButton:(UIButton*)sender;
- (IBAction)dotButton:(UIButton *)sender;

@property (weak, nonatomic) IBOutlet UILabel *numbersLabel;
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

- (IBAction)dotButton:(UIButton *)sender {
    NSString *text;
    if([_numbersLabel.text isEqual:(@"")]){
        _numbersLabel.text = @"0";
        text = [_numbersLabel.text stringByAppendingString:sender.titleLabel.text];
            _numbersLabel.text = text;
        if([_numbersLabel.text containsString:@"."]){
            _numbersLabel.text = _numbersLabel.text;
        }
    }else{
        if([_numbersLabel.text containsString:@"."]){
            _numbersLabel.text = _numbersLabel.text;
        }else{
            text = [_numbersLabel.text stringByAppendingString:sender.titleLabel.text];
            _numbersLabel.text = text;
        }
    }
}

- (IBAction)resultButton:(UIButton*)sender {
    if([operation isEqual:(@"+")]){
        value2 = _numbersLabel.text;
        _numbersLabel.text = @"";
        result = value1.doubleValue + value2.doubleValue;
        _numbersLabel.text = [@(result) stringValue];
    }
    if([operation isEqual:(@"-")]){
        value2 = _numbersLabel.text;
        _numbersLabel.text = @"";
        result = value1.doubleValue - value2.doubleValue;
        _numbersLabel.text = [@(result) stringValue];
    }
    if([operation isEqual:(@"×")]){
        value2 = _numbersLabel.text;
        _numbersLabel.text = @"";
        result = (value1.doubleValue * value2.doubleValue);
        _numbersLabel.text = [@(result) stringValue];
    }
    if([operation isEqual:(@"÷")]){
        value2 = _numbersLabel.text;
        _numbersLabel.text = @"";
        if (value2.doubleValue == 0){
            _numbersLabel.text = @"Error";
        }
        else{
            resultD = value1.doubleValue / value2.doubleValue;
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
        if([_numbersLabel.text isEqual:(@"0")]){
            _numbersLabel.text = @"0";
        }else{
            text = [_numbersLabel.text stringByAppendingString:sender.titleLabel.text];
                _numbersLabel.text = text;
        }
    }
}

@end

