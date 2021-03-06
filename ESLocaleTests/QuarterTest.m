#import "QuarterTest.h"
#import "SqlitePersistentDateFormatter.h"

@implementation QuarterTest

-(void)setUp
{
    [ [ SqlitePersistentDateFormatter instance ] setFormat: nil
                                                    locale: @"ru_RU" ];
}

-(void)testJan1IsInFirstSeason
{
    NSString* result_ = nil;
    
    result_ = [ [ SqlitePersistentDateFormatter instance ] getYearAndQuarter: @"2012-01-01" ];
    STAssertTrue( [ result_ isEqualToString: @"Q1 2012" ], @"Q1 expected - %@", result_ );
}

-(void)testMarch31IsInFirstSeason
{
    NSString* result_ = nil;
    
    result_ = [ [ SqlitePersistentDateFormatter instance ] getYearAndQuarter: @"2012-03-31" ];
    STAssertTrue( [ result_ isEqualToString: @"Q1 2012" ], @"Q1 expected - %@", result_ );
}

-(void)testApril1IsInSecondSeason
{
    NSString* result_ = nil;
    
    result_ = [ [ SqlitePersistentDateFormatter instance ] getYearAndQuarter: @"2012-04-01" ];
    STAssertTrue( [ result_ isEqualToString: @"Q2 2012" ], @"Q2 expected - %@", result_ );
}

-(void)testJun30IsInSecondSeason
{
    NSString* result_ = nil;
    
    result_ = [ [ SqlitePersistentDateFormatter instance ] getYearAndQuarter: @"2011-06-30" ];
    STAssertTrue( [ result_ isEqualToString: @"Q2 2011" ], @"Q2 expected - %@", result_ );
}


-(void)testJuly1IsInThirdSeason
{
    NSString* result_ = nil;
    
    result_ = [ [ SqlitePersistentDateFormatter instance ] getYearAndQuarter: @"2012-07-01" ];
    STAssertTrue( [ result_ isEqualToString: @"Q3 2012" ], @"Q3 expected - %@", result_ );
}

-(void)testSep30IsInThirdSeason
{
    NSString* result_ = nil;
    
    result_ = [ [ SqlitePersistentDateFormatter instance ] getYearAndQuarter: @"2012-09-30" ];
    STAssertTrue( [ result_ isEqualToString: @"Q3 2012" ], @"Q3 expected - %@", result_ );
}

-(void)testOct1IsInFourthSeason
{
    NSString* result_ = nil;
    
    result_ = [ [ SqlitePersistentDateFormatter instance ] getYearAndQuarter: @"2012-10-01" ];
    STAssertTrue( [ result_ isEqualToString: @"Q4 2012" ], @"Q4 expected - %@", result_ );
}

-(void)testDec31IsInFourthSeason
{
    NSString* result_ = nil;
    
    result_ = [ [ SqlitePersistentDateFormatter instance ] getYearAndQuarter: @"2012-12-31" ];
    STAssertTrue( [ result_ isEqualToString: @"Q4 2012" ], @"Q4 expected - %@", result_ );
}

@end
