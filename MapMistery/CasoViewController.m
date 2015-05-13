//
//  CasoViewController.m
//  MapMistery
//
//  Created by Vitor on 5/13/15.
//  Copyright (c) 2015 BEPID. All rights reserved.
//

#import "CasoViewController.h"

@interface CasoViewController ()
@property (weak, nonatomic) IBOutlet UILabel *lbHistoriaCaso;

@end

@implementation CasoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    NSLog(@"%@", self.nomeCaso);
    [[self navigationController] setTitle:self.nomeCaso];
    self.lbHistoriaCaso.text = self.historiaCaso;
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
