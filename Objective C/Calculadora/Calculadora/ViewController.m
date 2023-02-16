//
//  ViewController.m
//  Calculadora
//
//  Created by alumno on 13/02/23.
//

#import "ViewController.h"

@interface ViewController ()
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
    
}

- (IBAction)clearButton:(UIButton*)sender {
    _numbersLabel.text = @"";
}

- (IBAction)operation:(UIButton*)sender {
    NSString *value1;
    NSString *value2;
    NSString *operation;
    NSString *resultLabel;
    int result;
    if([_numbersLabel.text isEqual:(@"")]){
        _numbersLabel.text = @"";
    }else{
        if([sender.titleLabel.text isEqual:(@"+")]){
            value1 = _numbersLabel.text;
            _numbersLabel.text = @"";
            operation = @"+";
        }
        if([sender.titleLabel.text isEqual:(@"-")]){
            value2 = _numbersLabel.text;
            if([operation isEqual:(@"+")]){
                result = (value1.intValue + value2.intValue);
                printf("%d", result);
                resultLabel = [@(result) stringValue];
                _numbersLabel.text = resultLabel;
            }
        }
        
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

