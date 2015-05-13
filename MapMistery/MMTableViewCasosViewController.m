//
//  MMTableViewCasosViewController.m
//  MapMistery
//
//  Created by Vitor on 5/11/15.
//  Copyright (c) 2015 BEPID. All rights reserved.
//

#import "MMTableViewCasosViewController.h"
#import "Caso.h"
#import "MMCasoStore.h"
#import "CasoViewController.h"

@interface MMTableViewCasosViewController () <UITableViewDataSource, UITableViewDelegate, NSFetchedResultsControllerDelegate>
@property (weak, nonatomic) IBOutlet UITableView *tableview;

@property (nonatomic, readonly) NSFetchedResultsController *fetchedResultsController;

@end

@implementation MMTableViewCasosViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (NSFetchedResultsController *)fetchedResultsController {
    return [[MMCasoStore sharedStore] fetchedResultsController];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
//    NSLog(@"count: %ld", [[self.fetchedResultsController sections][section] numberOfObjects]);
    return [[self.fetchedResultsController sections][section] numberOfObjects];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"CasoCell"];
    Caso *caso = [self.fetchedResultsController objectAtIndexPath:indexPath];
    
    cell.textLabel.text = caso.nome;
    
    return cell;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)controller:(NSFetchedResultsController *)controller didChangeObject:(id)anObject atIndexPath:(NSIndexPath *)indexPath forChangeType:(NSFetchedResultsChangeType)type newIndexPath:(NSIndexPath *)newIndexPath
{
    [self.fetchedResultsController performFetch:nil];
    [self.tableview reloadData];
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    
    CasoViewController *casoViewController = segue.destinationViewController;
    NSIndexPath *indexPath = [self.tableview indexPathForSelectedRow];
    Caso *caso = [[self fetchedResultsController] objectAtIndexPath:indexPath];
    casoViewController.nomeCaso = caso.nome;
    casoViewController.historiaCaso = caso.historia;
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
