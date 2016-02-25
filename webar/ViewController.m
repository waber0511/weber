//
//  ViewController.m
//  webar
//
//  Created by 贾玉斌 on 16/2/20.
//  Copyright © 2016年 贾玉斌. All rights reserved.
//

#import "ViewController.h"
#import "MyDownloader.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    
    
    
    
}



-(void)downoloadMyData{
    

    
    [downloadManager getNsurl:commentTopic whenSuccess:^(id representData) {
        NSDictionary *rootDic = [NSJSONSerialization JSONObjectWithData:representData options:NSJSONReadingMutableContainers error:nil];
        
        NSDictionary *dictApp =rootDic[@"content"][@"shouts"];
        //       NSLog(@"%@",dictApp);
        NSMutableArray *tempArray = [NSMutableArray array];
        [tempArray addObject:dictApp[@"name"]];
        [tempArray addObject:dictApp[@"desc"]];
        for (NSInteger i =0; i<[dictApp[@"latest_authors"] count]; i++) {
            [tempArray addObject:dictApp[@"latest_authors"][i][@"photo60"]];
        }
        [_dataArray addObject:tempArray];
        
        NSMutableArray *tempArray1 = [NSMutableArray array];
        NSDictionary *dictApp1 = [rootDic[@"content"][@"forums"] firstObject];
        //        NSLog(@"%@",dictApp1);
        [tempArray1 addObject:dictApp1[@"name"]];
        [tempArray1 addObject:dictApp1[@"desc"]];
        for (NSInteger i =0; i<[dictApp1[@"latest_authors"] count]; i++) {
            [tempArray1 addObject:dictApp1[@"latest_authors"][i][@"photo60"]];
        }
        [_dataArray addObject:tempArray1];
        //        NSLog(@"%@",_dataArray);
        [_tableView reloadData];
        
    } andFailure:^(NSString *error) {
        
        NSLog(@"%@",error);
    }];
    
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
