//
//  PersonagemViewController.m
//  MapMistery
//
//  Created by Vitor on 5/13/15.
//  Copyright (c) 2015 BEPID. All rights reserved.
//

#import "PersonagemViewController.h"
#import "MMMapViewController.h"

@interface PersonagemViewController ()

@end

@implementation PersonagemViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
//    self.view.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"MapMystery-63"]];
}
- (IBAction)voltar:(id)sender {
    
    MMMapViewController *mapViewController = [self.storyboard instantiateViewControllerWithIdentifier:@"MapViewController"];
    [self presentViewController:mapViewController animated:YES completion:nil];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
