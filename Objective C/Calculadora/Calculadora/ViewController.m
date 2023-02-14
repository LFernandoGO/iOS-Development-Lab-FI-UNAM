//
//  ViewController.m
//  Calculadora
//
//  Created by alumno on 13/02/23.
//

#import "ViewController.h"

@interface ViewController ()
- (IBAction)numberButton:(id)sender;
- (IBAction)operation:(id)sender;
- (IBAction)clearButton:(id)sender;
- (IBAction)resultButton:(id)sender;
@property (weak, nonatomic) IBOutlet UILabel *numbersLabel;
@property (strong, nonatomic) IBOutletCollection(UIButton) NSArray *numberButtonOutlet;


@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}


- (IBAction)resultButton:(id)sender {
    
}

- (IBAction)clearButton:(id)sender {
}

- (IBAction)operation:(id)sender {
}

- (IBAction)numberButton:(id)sender {
    NSMutableString *text;
    UIButton *boton;
    boton = _numberButtonOutlet[1];
    text = boton.titleLabel;
    NSMutableString(*_numbersLabel) = text;
    
}
@end

