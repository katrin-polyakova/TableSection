//
//  ViewController.m
//  PlayWithTableSections
//
//  Created by Kate Polyakova on 5/16/15.
//  Copyright (c) 2015 Kate Polyakova. All rights reserved.
//

#import "ViewController.h"

@interface ViewController () <UITableViewDataSource, UITableViewDelegate> // добавлены протоколы для таблицы
@property (weak, nonatomic) IBOutlet UITableView *tableView; // создана переменная под таблицу

@property (strong, nonatomic) NSMutableArray *sectionTitles; // изменяемый массив (количество секций)
@property(nonatomic, strong) NSMutableArray *sectionData; // изменяемый массив (данные внутри секции)
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    self.sectionTitles = [[NSMutableArray alloc] init]; // инициализация массива секций
    self.sectionData = [[NSMutableArray alloc] init]; // инициализация массива данных внутри секций

    [self.sectionTitles addObject:@"A letter"]; //заполнение массива секций
    [self.sectionTitles addObject:@"B letter"];
    [self.sectionTitles addObject:@"C letter"];
    [self.sectionTitles addObject:@"D letter"];


    [self.sectionData addObject:@[@"Apple", @"Apricot", @"Airport"]]; //заполнение массива данных внутри секций
    [self.sectionData addObject:@[@"Banana", @"Bingo", @"Blast", @"Boom", @"Bus"]];
    [self.sectionData addObject:@[@"C++", @"Cable", @"Clip", @"Cup"]];
    [self.sectionData addObject:@[]];

    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"Identifier"]; // создание таблицы
    [self.tableView reloadData]; // перезагрузка данных
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView { // метод определяет количество секций в таблице
    return self.sectionTitles.count; // количество элементов в массиве sectionTitles
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section { // метод создает заголовки секций
    return self.sectionTitles[(NSUInteger)section]; // элементы в массиве sectionTitles
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section { // метод создает количество сторок в секции
    NSArray *objForSection = self.sectionData[(NSUInteger)section]; //элементами массива sectionData заполнен массив objForSection
    return objForSection.count; //количество строк в массиве objForSection
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath { //метод создает ячейки в таблице
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Identifier" forIndexPath:indexPath]; //заполнение ячеек данными

    NSArray *objsOfSection = self.sectionData [(NSUInteger) indexPath.section]; // берем массив данных sectionData в нужной секции
    cell.textLabel.text = objsOfSection[(NSUInteger) indexPath.row]; // заполняем строки секции данными из массива sectionData

    return cell;
}

@end
