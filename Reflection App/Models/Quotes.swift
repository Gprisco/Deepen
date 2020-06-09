//
//  Quotes.swift
//  Reflection App
//
//  Created by Giovanni Prisco on 11/05/2020.
//  Copyright © 2020 Giovanni Prisco. All rights reserved.
//

import Foundation

typealias SecondQuestions = [SecondQuestion]

struct Morning {
    let id: Int
    let text: String
    let compatible: Bool
}

struct Evening: Codable {
    let morningId: Int?
    let text: String
}

struct SecondQuestion {
    let category: String
    let text: String
}

let morningQuotes: [Morning] = [
    Morning(id: 1, text: localizableString("Make the bed and you will be a hero!"), compatible: false),
    Morning(id: 2, text: localizableString("Are we going to eat some fruit today?"), compatible: false),
    Morning(id: 3, text: localizableString("Spend some time outdoors, would you like some fresh air?"), compatible: false),
    Morning(id: 4, text: localizableString("Put your space in order, today I want a nice clean desk"), compatible: false),
    Morning(id: 5, text: localizableString("Shine more every day and it's fantastic, never give up!"), compatible: false),
    Morning(id: 6, text: localizableString("Ready to take on your commitments today? Remember: The greater the obstacle, the more glory in overcoming it."), compatible: false),
    Morning(id: 7, text: localizableString("Count 10 seconds before making a decision."), compatible: false),
    Morning(id: 8, text: localizableString("Today take a moment to walk a bit and relax."), compatible: false),
    Morning(id: 9, text: localizableString("Try to remember what has made you full of energy in the past"), compatible: false),
    Morning(id: 10, text: localizableString("During your next meal, detach yourself from the rest and focus on the flavor"), compatible: false),
    Morning(id: 11, text: localizableString("Recite an affirmation: “I already have everything I need to be happy”"), compatible: false),
    Morning(id: 12, text: localizableString("Just wanted to say: keep working on yourself, you are doing a great job. Don’t give up!"), compatible: false),
    Morning(id: 13, text: localizableString("Try not to say “no”, but to answer with a “Yes, but…”"), compatible: false),
    Morning(id: 14, text: localizableString("Take 10 minutes today to reflect on where you are in life and where you want to be heading"), compatible: false),
    Morning(id: 15, text: localizableString("Studying without thinking is useless. Reflecting without studying is dangerous."), compatible: false),
    Morning(id: 16, text: localizableString("Give each day the chance to be the most beautiful of your life."), compatible: false)
]

let eveningQuotes: [Evening] = [
    Evening(morningId: nil, text: localizableString("Come è andata questa giornata?")),
    Evening(morningId: nil, text: localizableString("Tutto molto bello ma in parole?")),
    Evening(morningId: nil, text: localizableString("Ti va di fare due chiacchiere?")),
    Evening(morningId: nil, text: localizableString("Scrivi 3 cose che ti piacciono di te")),
    Evening(morningId: nil, text: localizableString("Scommetto che hai grandi piani per domani, inizia a scrivere quelli che hai completato oggi"))
]

// MARK: Categories (work, health, relationship, study)
let secondQuestions: SecondQuestions = [
    SecondQuestion(category: "", text: "")
]

func localizableString(_ text: String) -> String {
    return NSLocalizedString(text, comment: "Quotes")
}

func localizableStrings(_ texts: [String]) -> [String] {
    var output = [String]()
    
    for text in texts {
        output.append(text)
    }
    
    return output
}
