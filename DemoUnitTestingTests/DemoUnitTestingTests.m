//
//  DemoUnitTestingTests.m
//  DemoUnitTestingTests
//
//  Created by ajjnix on 24.05.15.
//  Copyright (c) 2015 ajjnix. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <XCTest/XCTest.h>


@interface MyException : NSException
@end

@implementation MyException
@end


@interface DemoUnitTestingTests : XCTestCase
@end


@implementation DemoUnitTestingTests

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testAlwaysFailed {
    /*
     аргумент1 - текст ошибки
     */
    XCTFail(@"always failed");
}

- (void)testIsEqualPrimitive {
    /*
     аргумент1 - примитив1
     аргумент2 - примитив2
     необязательно
     аргумент3 - формат вывода
     последующие - аргументы в формат для вывода ошибки
     */
    int primitive1 = 5;
    int primitive2 = 5;
    XCTAssertEqual(primitive1, primitive2, @"(%d) equal to (%d)", primitive1, primitive2);
}

- (void)testIsNotEqualPrimitive {
    /*
     аргумент1 - примитив1
     аргумент2 - примитив2
     необязательно
     аргумент3 - формат вывода
     последующие - аргументы в формат для вывода ошибки
     */
    int primitive1 = 5;
    int primitive2 = 6;
    XCTAssertNotEqual(primitive1, primitive2, @"(%d) not equal to (%d)", primitive1, primitive2);
}

- (void)testIsEqualWithAccuracyPrimitive {
    /*
     аргумент1 - примитив1
     аргумент2 - примитив2
     аргумент3 - велечина допустимой погрешности
     необязательно
     аргумент4 - формат вывода
     последующие - аргументы в формат для вывода ошибки
     */
    float primitive1 = 5.012f;
    float primitive2 = 5.014f;
    float accuracy = 0.005;
    XCTAssertEqualWithAccuracy(primitive1, primitive2, accuracy, @"(%f) equal to (%f) with accuracy %f", primitive1, primitive2, accuracy);
}

- (void)testIsNotEqualWithAccuracyPrimitive {
    /*
     аргумент1 - примитив1
     аргумент2 - примитив2
     аргумент3 - велечина допустимой погрешности
     необязательно
     аргумент4 - формат вывода
     последующие - аргументы в формат для вывода ошибки
     */
    float primitive1 = 5.012f;
    float primitive2 = 5.014f;
    float accuracy = 0.001;
    XCTAssertNotEqualWithAccuracy(primitive1, primitive2, accuracy, @"(%f) not equal to (%f) with accuracy %f", primitive1, primitive2, accuracy);
}

- (void)testIsTrue {
    /*
     аргумент1 - boolean либо приведение
     необязательно
     аргумент2 - формат вывода
     последующие - аргументы в формат вывода ошибки
     */
    BOOL isTrue = YES;
    XCTAssertTrue(isTrue);
}

- (void)testIsFalse {
    /*
     аргумент1 - boolean либо приведение
     необязательно
     аргумент2 - формат вывода
     последующие - аргументы в формат вывода ошибки
     */
    BOOL isTrue = NO;
    XCTAssertFalse(isTrue);
}

- (void)testIsNil {
    /*
     аргумент1 - указатель
     необязательно
     аргумент2 - формат вывода
     последующие - аргументы в формат вывода ошибки
     */
    id foo = nil;
    XCTAssertNil(foo, @"pointer:%p", foo);
}

- (void)testIsNotNil {
    /*
     аргумент1 - указатель
     необязательно
     аргумент2 - формат вывода
     последующие - аргументы в формат вывода ошибки
     */
    id foo = @"";
    XCTAssertNotNil(foo);
}

- (void)testGreaterPrivitive {
    /*
     аргумент1 - примитив1
     аргумент2 - примитив2
     необязательно
     аргумент3 - формат вывода
     последующие - аргументы в формат вывода ошибки
     */
    int privitive1 = 4;
    int privitive2 = 3;
    XCTAssertGreaterThan(privitive1, privitive2);
}

- (void)testGreaterOrEqualPrivitive {
    /*
     аргумент1 - примитив1
     аргумент2 - примитив2
     необязательно
     аргумент3 - формат вывода
     последующие - аргументы в формат вывода ошибки
     */
    int privitive1 = 4;
    int privitive2 = 4;
    XCTAssertGreaterThanOrEqual(privitive1, privitive2);
}

- (void)testLessPrivitive {
    /*
     аргумент1 - примитив1
     аргумент2 - примитив2
     необязательно
     аргумент3 - формат вывода
     последующие - аргументы в формат вывода ошибки
     */
    int privitive1 = 3;
    int privitive2 = 4;
    XCTAssertLessThan(privitive1, privitive2);
}

- (void)testLessOrEqualPrivitive {
    /*
     аргумент1 - примитив1
     аргумент2 - примитив2
     необязательно
     аргумент3 - формат вывода
     последующие - аргументы в формат вывода ошибки
     */
    int privitive1 = 4;
    int privitive2 = 4;
    XCTAssertLessThanOrEqual(privitive1, privitive2);
}

- (void)testThrowException {
    /*
     аргумент1 - блок/метод/функция
     необязательно
     аргумент2 - формат вывода
     последующие - аргументы в формат вывода ошибки
     */
    void (^block)() = ^{
        @throw [NSException exceptionWithName:NSGenericException
                                       reason:@"test throw"
                                     userInfo:nil];
    };
    XCTAssertThrows(block());
}

- (void)testNoThrowException {
    /*
     аргумент1 - блок/метод/функция
     необязательно
     аргумент2 - формат вывода
     последующие - аргументы в формат вывода ошибки
     */
    void (^block)() = ^{
    };
    XCTAssertNoThrow(block());
}

- (void)testThrowExceptionClass {
    /*
     аргумент1 - блок/метод/функция
     аргумент2 - класс исключения
     необязательно
     аргумент3 - формат вывода
     последующие - аргументы в формат вывода ошибки
     */
    void (^block)() = ^{
        @throw [MyException exceptionWithName:NSGenericException
                                       reason:@"test throw"
                                     userInfo:nil];
    };
    XCTAssertThrowsSpecific(block(), MyException);
}

- (void)testNoThrowExceptionClass {
    /*
     аргумент1 - блок/метод/функция
     аргумент2 - класс исключения
     необязательно
     аргумент3 - формат вывода
     последующие - аргументы в формат вывода ошибки
     */
    void (^block)() = ^{
        @throw [NSException exceptionWithName:NSGenericException
                                       reason:@"test throw"
                                     userInfo:nil];
    };
    XCTAssertNoThrowSpecific(block(), MyException);
}

- (void)testThrowWithNamedExceptionClass {
    /*
     аргумент1 - блок/метод/функция
     аргумент2 - класс исключения
     аргумент3 - имя ошибки
     необязательно
     аргумент4 - формат вывода
     последующие - аргументы в формат вывода ошибки
     */
    NSString *nameException = @"name expection";
    void (^block)() = ^{
        @throw [MyException exceptionWithName:nameException
                                       reason:@"test throw"
                                     userInfo:nil];
    };
    XCTAssertThrowsSpecificNamed(block(), MyException, nameException);
}

- (void)testNoThrowWithNamedExceptionClass {
    /*
     аргумент1 - блок/метод/функция
     аргумент2 - класс исключения
     аргумент3 - имя ошибки
     необязательно
     аргумент4 - формат вывода
     последующие - аргументы в формат вывода ошибки
     */
    NSString *nameException = @"name expection";
    void (^block)() = ^{
        @throw [MyException exceptionWithName:[nameException stringByAppendingString:@"123"]
                                       reason:@"test throw"
                                     userInfo:nil];
    };
    XCTAssertNoThrowSpecificNamed(block(), MyException, nameException);
}

- (void)testEqualObject {
    /*
     аргумент1 - объект реализующий isEqual
     аргумент2 - объект реализующий isEqual
     необязательно
     аргумент3 - формат вывода
     последующие - аргументы в формат вывода ошибки
     */
    id obj1 = @[];
    id obj2 = @[];
    XCTAssertEqualObjects(obj1, obj2, @"obj1(%@) not equal to obj2(%@))", obj1, obj2);
}

- (void)testNoEqualObject {
    /*
     аргумент1 - объект реализующий isEqual
     аргумент2 - объект реализующий isEqual
     необязательно
     аргумент3 - формат вывода
     последующие - аргументы в формат вывода ошибки
     */
    id obj1 = @"name";
    id obj2 = @{};
    XCTAssertNotEqualObjects(obj1, obj2, @"obj1(%@) not equal to obj2(%@))", obj1, obj2);
}

- (void)testAsync {
    /*
     1. Создаем ожидание с описанием (будет показано в случае провала теста)
     2. Выполняем необходимые действия
     3. Устанавливаем ожидание
     4. Вызываем fulfill метод у объекта класса XCTestExpectation
     Если сперва вызвать fulfill и потом установить ожидание - тест будет считаться пройденным
     */
    XCTestExpectation *expectation = [self expectationWithDescription:@"block not call"];
    NSTimeInterval timeout = 1.0f;
    [expectation performSelector:@selector(fulfill)
                      withObject:nil
                      afterDelay:0.3f];
    [self waitForExpectationsWithTimeout:timeout
                                 handler:nil];
}

@end
