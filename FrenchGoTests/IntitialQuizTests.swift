//
//  FrenchGoTests.swift
//  FrenchGoTests
//
//  Created by Andrei Mirica on 17.05.2023.
//

import XCTest
@testable import FrenchGo
var sut: QuizViewModel!

final class IntitialQuizTests: XCTestCase {

    override func setUpWithError() throws {
        try super.setUpWithError()
        sut = QuizViewModel()
    }

    override func tearDownWithError() throws {
        sut = nil
        try super.tearDownWithError()
    }

    func testExample() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        // Any test you write for XCTest can be annotated as throws and async.
        // Mark your test throws to produce an unexpected failure when your test encounters an uncaught error.
        // Mark your test async to allow awaiting for asynchronous code to complete. Check the results with assertions afterwards.
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        measure {
            // Put the code you want to measure the time of here.
        }
    }
    
    func testInitialQuizLevelCalculation() {

        let level1 = sut.calculateLevel(rightAnswers: [.easy, .easy, .easy], totalQuestions: 3)
              XCTAssertEqual(level1, .beginner, "Expected level: Beginner")
              
              // Test case 2: Mixed difficulty levels
        let level2 = sut.calculateLevel(rightAnswers: [.easy, .intermediate, .hard], totalQuestions: 3)
              XCTAssertEqual(level2, .intermediate, "Expected level: Intermediate")
              
              // Test case 3: All answers are hard
        let level3 = sut.calculateLevel(rightAnswers: [.hard, .hard, .hard], totalQuestions: 3)
              XCTAssertEqual(level3, .advance, "Expected level: Advance")
              
              // Test case 4: No answers
        let level4 = sut.calculateLevel(rightAnswers: [], totalQuestions: 0)
              XCTAssertEqual(level4, .beginner, "Expected level: Beginner")
        
        
               // Test case 5: More easy answers than hard answers
        let level5 = sut.calculateLevel(rightAnswers: [.easy, .easy, .easy, .easy, .hard, .hard, .hard], totalQuestions: 7)
               XCTAssertEqual(level5, .intermediate, "Expected level: Intermediate")
               
               // Test case 6: More hard answers than easy answers
        let level6 = sut.calculateLevel(rightAnswers: [.easy, .easy, .hard, .hard, .hard, .hard, .hard, .hard, .hard], totalQuestions: 9)
               XCTAssertEqual(level6, .advance, "Expected level: Advance")
               
               // Test case 7: More easy answers, large number of questions
        let level7 = sut.calculateLevel(rightAnswers: Array(repeating: .easy, count: 4), totalQuestions: 20)
        XCTAssertEqual(level7, .beginner, "Expected level: Easy")
        
    }
    
    func testQuizScore() {
        let percentage1 = sut.correctAnswersPercentage(rightAnswers: 10, questionsCount: 10)
                XCTAssertEqual(percentage1, 100, "Expected percentage: 100")
                
                // Test case 2: Half of the answers are correct
        let percentage2 = sut.correctAnswersPercentage(rightAnswers: 5, questionsCount: 10)
                XCTAssertEqual(percentage2, 50, "Expected percentage: 50")
                
                // Test case 3: No correct answers
        let percentage3 = sut.correctAnswersPercentage(rightAnswers: 0, questionsCount: 10)
                XCTAssertEqual(percentage3, 0, "Expected percentage: 0")
                
                // Test case 4: All answers are correct, large number of questions
        let percentage4 = sut.correctAnswersPercentage(rightAnswers: 50, questionsCount: 50)
                XCTAssertEqual(percentage4, 100, "Expected percentage: 100")
        
        let percentage6 = sut.correctAnswersPercentage(rightAnswers: 3, questionsCount: 10)
               XCTAssertEqual(percentage6, 30, "Expected percentage: 30")
               
               // Test case 7: 70% correct answers
        let percentage7 = sut.correctAnswersPercentage(rightAnswers: 7, questionsCount: 10)
               XCTAssertEqual(percentage7, 70, "Expected percentage: 70")
                
    }
    
    func testScoreAlertTitle() {
            // Test case 1: Score > 79
        let title1 = sut.scoreAlertTitle(rightAnswers: 8, questionsCount: 10)
            XCTAssertEqual(title1, "Congratulations", "Expected title: Congratulations")
            
            // Test case 2: Score <= 79
        let title2 = sut.scoreAlertTitle(rightAnswers: 5, questionsCount: 10)
            XCTAssertEqual(title2, "You need to retake the quiz", "Expected title: You need to retake the quiz")
            
            // Test case 3: Score = 0
        let title3 = sut.scoreAlertTitle(rightAnswers: 0, questionsCount: 10)
            XCTAssertEqual(title3, "You need to retake the quiz", "Expected title: You need to retake the quiz")
            
            // Test case 4: All answers correct
        let title4 = sut.scoreAlertTitle(rightAnswers: 10, questionsCount: 10)
            XCTAssertEqual(title4, "Congratulations", "Expected title: Congratulations")
            
        }
    
    func testScoreAlertMessage() {
            // Test case 1: Score < 80
        let message1 = sut.scoreAlertMessage(rightAnswers: 6, questionsCount: 10)
            XCTAssertEqual(message1, "You got 60% right. The minimum pass grade is 80", "Expected message: You got 60% right. The minimum pass grade is 80")
            
            // Test case 2: Score >= 80
        let message2 = sut.scoreAlertMessage(rightAnswers: 8, questionsCount: 10)
            XCTAssertEqual(message2, "You got 80% right. You can start the next lesson.", "Expected message: You got 80% right. You can start the next lesson.")
            
            // Test case 3: Score = 0
        let message3 = sut.scoreAlertMessage(rightAnswers: 0, questionsCount: 10)
            XCTAssertEqual(message3, "You got 0% right. The minimum pass grade is 80", "Expected message: You got 0% right. The minimum pass grade is 80")
            
            // Test case 4: All answers correct
        let message4 = sut.scoreAlertMessage(rightAnswers: 10, questionsCount: 10)
            XCTAssertEqual(message4, "You got 100% right. You can start the next lesson.", "Expected message: You got 100% right. You can start the next lesson.")
            
        }
    
    

}
