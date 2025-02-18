//
//  Categories.swift
//  Trivia
//
//  Created by Julia Husar on 2/18/25.
//

struct Question{
    let text: String
    let answers: [String]
    let correctAnswerIndex: Int
    let category: String
}

enum Categories: CaseIterable{
    case Folk
    case IndiePop
    case Electronic
    
    
    func questionsAnswers() -> [Question]{
        switch self{
            case .Folk:
            return [Question(text: "What other famous singer songwriter did Leonard Cohen date?", answers: ["Joni Mitchell", "Bob Dylan", "Joan Baez", "Stevie Nicks"], correctAnswerIndex: 0, category: "Folk"), Question(text: "What prison did Johnny Cash play at?", answers: ["Alcatraz", "San Diego", "San Quentin", "Seattle"], correctAnswerIndex: 2, category: "Folk"), Question(text: "What was Bob Dylan's breakthrough album?", answers: ["Freewheelin' Bob Dylan", "The Time They are a' Changin", "Time Out of Mind", "Highway 61 Revisited"], correctAnswerIndex: 0, category: "Folk"), Question(text: "What band is a modern folk band", answers: ["Big Thief", "Crosby Stills and Nash", "Van Halen", "Weezer"], correctAnswerIndex: 2, category: "Folk")]
            case .IndiePop:
            return [Question(text: "Who is the leader singer of Japanese Breakfast?", answers: ["Hayley Williams", "Michelle Zauner", "PJ Harvey", "Kate Bush"], correctAnswerIndex: 1, category: "Indie Pop")]
            case .Electronic:
            return [Question(text: "What was Bjork's first album called?", answers: ["Little Earthquakes", "Debut", "Post", "Homogenic"], correctAnswerIndex: 1, category: "Electronic")]
        }
        
    }
        
    
    /* Implement if planning to add more questions to particular case
    func chooseRandomQuestions(length: Int) -> Int {
        
    }
     */
}
