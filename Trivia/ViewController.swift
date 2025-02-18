//
//  ViewController.swift
//  Trivia
//
//  Created by Julia Husar on 2/18/25.
//

import UIKit

class ViewController: UIViewController{
    var finalizedQuestionList: [Question] = []
    var position:Int = 0
    var score:Int = 0
    @IBOutlet weak var questionLength: UILabel!
    @IBOutlet weak var QuestionView: UIView!
    @IBOutlet weak var musicCategory: UILabel!
    @IBOutlet weak var actualQuestion: UILabel!
    @IBOutlet weak var answerOne: UIButton!
    @IBOutlet weak var answerTwo: UIButton!
    @IBOutlet weak var answerFour: UIButton!
    @IBOutlet weak var answerThree: UIButton!
    
    let alert = UIAlertController(title: "Title", message: "Message", preferredStyle: .alert)

    func selectQuestions() -> [Question]{
        var questionList: [Question] = []
        
        for category in Categories.allCases{
            let allQuestions = category.questionsAnswers()
            if let firstQuestion = allQuestions.first {
                questionList.append(firstQuestion)
            }
        }
        return questionList
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        finalizedQuestionList = selectQuestions()
        let firstQuestion: Question = finalizedQuestionList[0]
        questionLength.text = "Question \(position+1) / \(finalizedQuestionList.count)"
        actualQuestion.text = firstQuestion.text
        answerOne.setTitle( firstQuestion.answers[0], for: .normal)
        answerTwo.setTitle( firstQuestion.answers[1], for: .normal)
        answerThree.setTitle( firstQuestion.answers[2], for: .normal)
        answerFour.setTitle( firstQuestion.answers[3], for: .normal)
        musicCategory.text = firstQuestion.category
    }
  
    @IBAction func answerOne(_ sender: Any) {
        if answerSelected(0){
            score+=1
        }
        setStuff()
    }
    @IBAction func answerTwo(_ sender: Any) {
        if answerSelected(1){
            score+=1
        }
        setStuff()
    }
    @IBAction func answerThree(_ sender: Any) {
        if answerSelected(2){
            score+=1
        }
        setStuff()
    }
    @IBAction func answerFour(_ sender: Any) {
        if answerSelected(3){
            score+=1
        }
        setStuff()
    }
    
    func answerSelected(_ index: Int) -> Bool {
        if index == finalizedQuestionList[position].correctAnswerIndex{
            return true
        } else {
            return false
        }
        
    }
    func setStuff() {
          position += 1

          guard position < finalizedQuestionList.count else {
              let alert = UIAlertController(title: "Quiz Finished", message: "Your score: \(score) /3", preferredStyle: .alert)
              let okAction = UIAlertAction(title: "OK", style: .default) { _ in
                  self.resetQuiz()
              }
              alert.addAction(okAction)
              present(alert, animated: true, completion: nil)

              return
          }

          let nextQuestion = finalizedQuestionList[position]
          questionLength.text = "Question \(position + 1) / \(finalizedQuestionList.count)"
          actualQuestion.text = nextQuestion.text
          answerOne.setTitle(nextQuestion.answers[0], for: .normal)
          answerTwo.setTitle(nextQuestion.answers[1], for: .normal)
          answerThree.setTitle(nextQuestion.answers[2], for: .normal)
          answerFour.setTitle(nextQuestion.answers[3], for: .normal)
        musicCategory.text = nextQuestion.category
      }

      func resetQuiz() {
          position = -1
          score = 0
          finalizedQuestionList = selectQuestions()
          setStuff()
      }

}
