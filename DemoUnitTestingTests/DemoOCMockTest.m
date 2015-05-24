//
//  DemoOCMockTest.m
//  DemoUnitTesting
//
//  Created by ajjnix on 24.05.15.
//  Copyright (c) 2015 ajjnix. All rights reserved.
//

#import <XCTest/XCTest.h>
#import <OCMock/OCMock.h>
#import "ClassA.h"
#import "ClassB.h"


@interface DemoOCMockTest : XCTestCase
@end


@implementation DemoOCMockTest

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testInit {
    /*
     Создадим mock объект класса ClassB и передадим его в init класса ClassA
     Проверим, что classA.classB указывает на тот же адрес что и mockClassB
     */
    id mockClassB = OCMClassMock([ClassB class]);
    ClassA *classA = [[ClassA alloc] initWithClassB:mockClassB];
    XCTAssertEqual(classA.classB, mockClassB);
}

- (void)testStub {
    /*
     Создадим mock объект класса ClassB и напишем stub метод, возвращающий ожидаемые данные.
     Настоящий же метод в классе ClassB будет выбрасывать исключение
     */
    NSString *expectedInfo = @"info";
    id mockClassB = OCMClassMock([ClassB class]);
    OCMStub([mockClassB info]).andReturn(expectedInfo);
    
    NSString *info = [mockClassB info];
    XCTAssertEqualObjects(info, expectedInfo);
}

- (void)testNotification {
    /*
     Создадим mock объект класса ClassB и напишем stub метод, посылающий нотификацию
     Создадим mock observer для нотификации
     Создадим ожидание срабатывания нотификации от mock объекта
     Проверим сработали ли все созданные ожидания для mock observer
     */
    id mockClassB = OCMClassMock([ClassB class]);
    NSString *notificationName = @"notification name";
    NSNotification *notification = [NSNotification notificationWithName:notificationName
                                                                 object:mockClassB];
    OCMStub([mockClassB postNotification]).andPost(notification);
    
    id mockObserver = OCMObserverMock();
    [[NSNotificationCenter defaultCenter] addMockObserver:mockObserver
                                                     name:notificationName
                                                   object:mockClassB];
    OCMExpect([mockObserver notificationWithName:notificationName
                                          object:mockClassB]);
    
    [mockClassB postNotification];
    OCMVerifyAll(mockObserver);
}

- (void)testVerifyExpect {
    /*
     Создадим mock объект класса ClassB и напишем ожидания вызова методов info и postNotification
     Проверим сработали ли все созданные ожидания для mock объекта
     */
    id mockClassB = OCMClassMock([ClassB class]);
    OCMExpect([mockClassB info]);
    OCMExpect([mockClassB postNotification]);
    [mockClassB info];
    [mockClassB postNotification];
    OCMVerifyAll(mockClassB);
}

- (void)testStubWithArg {
    /*
     Создадим mock объект класса ClassB и напишем stub метод зависимый от входных данных
     Проверим возвращаемые значения
     */
    id mockClassB = OCMClassMock([ClassB class]);
    NSInteger expectedFactorial3 = 6;
    NSInteger expectedFactorial5 = 120;
    OCMExpect([mockClassB factorial:3]).andReturn(expectedFactorial3);
    OCMExpect([mockClassB factorial:5]).andReturn(expectedFactorial5);
    
    NSInteger factorial3 = [mockClassB factorial:3];
    NSInteger factorial5 = [mockClassB factorial:5];
    
    XCTAssertEqual(factorial3, expectedFactorial3);
    XCTAssertEqual(factorial5, expectedFactorial5);
}

- (void)testPartialMockObject {
    /*
     Создадим объект класса ClassA, изменим для теста состояние поля count.
     Поле count будет readonly
     */
    id classA = [[ClassA alloc] initWithCount:3];
    XCTAssertEqual([classA count], 3);
    
    id partialMock = OCMPartialMock(classA);
    OCMStub([partialMock count]).andReturn(41);
    XCTAssertEqual([classA count], 41);
}

- (void)testStubWithBlock {
    /*
     Создадим mock объект класса ClassB и напишем stub метод принимающий блок и вызывающий его
     Создадим mock объект класса ClassA и напишем ожидание вызова блока
     Убедимся, что вызов блока произошел в некий допустимый промежуток времени
     */
    void (^block)() = [OCMArg checkWithBlock:^BOOL(id value) {
        return YES;
    }];
    id mockClassB = OCMClassMock([ClassB class]);
    OCMExpect([mockClassB setBlock:block]);

    id mockClassA = OCMClassMock([ClassA class]);
    OCMStub([mockClassA useBlockInClassB]).andDo(^(NSInvocation *invocation) {
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            [mockClassB setBlock:^{
            }];
        });
    });

    [mockClassA useBlockInClassB];
    OCMVerifyAllWithDelay(mockClassB, 2);
}

@end
