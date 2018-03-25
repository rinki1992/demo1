//
//  ViewController.m
//  task1
//
//  Created by RINKI NEGI on 24/03/18.
//  Copyright © 2018 RINKI NEGI. All rights reserved.
//

#import "ViewController.h"
#import "CustomCell.h"
#import "Reachability.h"


@interface CustomViewController ()

@end

@implementation CustomViewController{
    NSString *cellIdentifier;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    cellIdentifier = @"cellIdentifier";
    // Do any additional setup after loading the view, typically from a nib.
    self.title = @"Title";
    self.view.backgroundColor = [UIColor whiteColor];
    
    
    //[CustomViewController registerClass:[UITableViewCell class] forCellWithReuseIdentifier:@"Cell"];
    //    NSString *strURL = @"https://www.googleapis.com/youtube/v3/search?part=id,snippet&maxResults=20&channelId=UCCq1xDJMBRF61kiOgU90_kw&key=AIzaSyBRLPDbLkFnmUv13B-Hq9rmf0y7q8HOaVs";
    NSString *strURL = @"https://dl.dropboxusercontent.com/s/2iodh4vg0eortkl/facts.json";
    
    NSURLRequest * urlRequest = [NSURLRequest requestWithURL:[NSURL URLWithString:strURL]];
    
    NSURLResponse * response = nil;
    
    NSError *error = nil;
    
    NSData *data = [NSURLConnection sendSynchronousRequest:urlRequest
                    
                                         returningResponse:&response
                    
                                                     error:&error];
    
    
    
    if (error == nil){
        
        // Parse data here
        
        //NSLog(data);
        
        NSDictionary *jsonObj = [NSJSONSerialization JSONObjectWithData: data options: NSJSONReadingMutableContainers error: &error];
        
        NSLog(@"%@", jsonObj);
        //         = [jsonObj objectForKey:@"etag"];
    }

}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

//MARK :- TableView

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return 8;
    
}

-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    
    if(cell == nil) {
        
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
        
    }
    cell.textLabel.text = @"Hello World";
    return cell;
}
@end
