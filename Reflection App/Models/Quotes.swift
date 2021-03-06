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

struct Reward {
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
    Evening(morningId: nil, text: localizableString("Mind is complicated. The content might be different but the essence is the same. Understand yourself and you will understand the world.")),
    Evening(morningId: nil, text: localizableString("It's time to take some time for you ... How was your day? I can't wait to listen to you")),
    Evening(morningId: nil, text: localizableString("What’s on your mind? Remember I’m always here to help.")),
    Evening(morningId: nil, text: localizableString("The important thing is to never stop questioning. Start your reflection!")),
    Evening(morningId: nil, text: localizableString("Find 5 minutes to reflect, you won’t regret ;)")),
    Evening(morningId: nil, text: localizableString("How did your day go? Would you like to talk about it?")),
    Evening(morningId: nil, text: localizableString("By opening your mind you learn much more than by opening your mouth. Do you want to reflect?")),
    Evening(morningId: nil, text: localizableString("Success in life is not given by exceptional events, but by daily dedication."))
]

let firstQuestions: [String] = localizableStrings([
    "How did it go today?",
    "Wanna write something about your day?",
    "How about your day?",
    "Write something",
    "My day was...",
    "I achieved..."
])

let rewardQuotes: [Reward] = [
    Reward(text: localizableString("The thing about meditation is… you become more and more you.")),
    Reward(text: localizableString("It does not matter how slowly you go as long as you do not stop.")),
    Reward(text: localizableString("Our greatest weakness lies in giving up. The most certain way to succeed is always to try just one more time.")),
    Reward(text: localizableString("Don’t fear difficult moments. The best comes from them.")),
    Reward(text: localizableString("Difficulties break some men, but make others.")),
    Reward(text: localizableString("Change your life today. Don’t gamble on the future, act now, without delay.")),
    Reward(text: localizableString("The future belongs to those who believe in the beauty of their dreams.")),
    Reward(text: localizableString("You never know how strong you are, until being strong is your only choice.")),
    Reward(text: localizableString("Ever tried. Ever failed. No matter. Try Again. Fail again. Fail better.")),
    Reward(text: localizableString("There will always be rocks in the road ahead of us. They will be stumbling blocks or stepping stones; it all depends on how you use them.")),
    Reward(text: localizableString("Life is 10% what happens to you and 90% how you react to it.")),
    Reward(text: localizableString("To succeed, work hard, never give up and above all cherish a magnificent obsession.")),
    Reward(text: localizableString("Just make sure you never do less than your best.")),
    Reward(text: localizableString("It always seems impossible until it’s done.")),
    Reward(text: localizableString("Fall down seven times, stand up eight.")),
    Reward(text: localizableString("Only those who dare to fail greatly can ever achieve greatly.")),
    Reward(text: localizableString("For the past 33 years, I have looked in the mirror every morning and asked myself: “If today were the last day of my life, would I want to do what I am about to do today?” And whenever the answer has been “No” for too many days in a row, I know I need to change something.")),
    Reward(text: localizableString("Ones best success comes after their greatest disappointments.")),
    Reward(text: localizableString("Failure is simply the opportunity to begin again, this time more intelligently.")),
    Reward(text: localizableString("I’ve missed more than 9000 shots in my career. I’ve lost almost 300 games. 26 times, I’ve been trusted to take the game winning shot and missed. I’ve failed over and over and over again in my life. And that is why I succeed.")),
    Reward(text: localizableString("Never confuse a single defeat with a final defeat.")),
    Reward(text: localizableString("Don’t wait for extraordinary opportunities. Seize common occasions and make them great. Weak men wait for opportunities; strong men make them.")),
    Reward(text: localizableString("There is a driving force more powerful than steam, electricity and nuclear power: the will.")),
    Reward(text: localizableString("If you’re not making mistakes, you’re not trying.")),
    Reward(text: localizableString("It’s better to light a candle than curse the darkness.")),
    Reward(text: localizableString("It is not enough that we do our best; sometimes we must do what is required.")),
    Reward(text: localizableString("The difference between a successful person and others is not a lack of strength, not a lack of knowledge, but rather a lack of will.")),
    Reward(text: localizableString("It is hard to fail, but it is worse never to have tried to succeed.")),
    Reward(text: localizableString("Only those who dare may fly.")),
    Reward(text: localizableString("Before you react, think. Before you spend, earn. Before you criticize, wait. Before you quit, try.")),
    Reward(text: localizableString("In the middle of every difficulty lies an opportunity.")),
    Reward(text: localizableString("The man who moves a mountain begins by carrying away small stones.")),
    Reward(text: localizableString("Don’t wait. The time will never be just right.")),
    Reward(text: localizableString("A bend in the road is not the end of the road, unless you fail to make the turn.")),
    Reward(text: localizableString("Don’t find fault, find a remedy.")),
    Reward(text: localizableString("It isn’t where you came from. It’s where you’re going that counts.")),
    Reward(text: localizableString("When one door closes another door opens; but we so often look so long and so regretfully upon the closed door, that we do not see the ones which open for us."))
]

// MARK: Categories (work, health, relationship, study)
let secondQuestions: SecondQuestions = [
    SecondQuestion(category: "work", text: localizableString("Do you struggle with procrastination?")),
    SecondQuestion(category: "work", text: localizableString("Are you spending time on things really important to you?")),
    SecondQuestion(category: "work", text: localizableString("Where do you see yourself in 5 or 10 years?")),
    SecondQuestion(category: "work", text: localizableString("List 3 work experiences you would like to have in your life but you have not yet done")),
    SecondQuestion(category: "work", text: localizableString("What is preventing you from finding the ideal job?")),
    SecondQuestion(category: "work", text: localizableString("What are the things you should spend most time on?")),
    SecondQuestion(category: "relationship", text: localizableString("Are you spending your time with the right people?")),
    SecondQuestion(category: "relationship", text: localizableString("If you moved to the other side of the world, what would you miss most of what you have today?")),
    SecondQuestion(category: "relationship", text: localizableString("Who are the people who make you feel comfortable?")),
    SecondQuestion(category: "relationship", text: localizableString("What are the features you are looking for in a friend?")),
    SecondQuestion(category: "relationship", text: localizableString("What is the main flaw that others recognize in you?")),
    SecondQuestion(category: "health", text: localizableString("What are your healthy and changing habits?")),
    SecondQuestion(category: "health", text: localizableString("Which word would best describe the way you spent the last month of your life?")),
    SecondQuestion(category: "health", text: localizableString("What do you do when you don't feel happy?")),
    SecondQuestion(category: "health", text: localizableString("What is the main change you need to make in your life?")),
    SecondQuestion(category: "study", text: localizableString("What are you able to do today that you didn't know how to do a year ago?")),
    SecondQuestion(category: "study", text: localizableString("What have you recently learned about yourself again?")),
    SecondQuestion(category: "study", text: localizableString("What are the activities that attract your attention?")),
    SecondQuestion(category: "choose for me", text: localizableString("What is the most satisfying thing for you?")),
    SecondQuestion(category: "choose for me", text: localizableString("What would you like to improve about yourself?")),
    SecondQuestion(category: "choose for me", text: localizableString("Make a list of your flaws. Include all the criticisms they have addressed you and that you have absorbed")),
    SecondQuestion(category: "choose for me", text: localizableString("Make a list of your positives aspects")),
    SecondQuestion(category: "choose for me", text: localizableString("If you had the ability to choose something you can do all day, what would you choose?")),
    SecondQuestion(category: "choose for me", text: localizableString("What was your childhood dream?")),
    SecondQuestion(category: "choose for me", text: localizableString("What's the most important thing for you that you've done so far?")),
    SecondQuestion(category: "choose for me", text: localizableString("What's the stupidest thing you've ever done in life?")),
    SecondQuestion(category: "choose for me", text: localizableString("What's the best thing that could happen to you now?")),
    SecondQuestion(category: "choose for me", text: localizableString("Do you have any regrets?")),
    SecondQuestion(category: "choose for me", text: localizableString("What do you usually think before falling asleep?")),
    SecondQuestion(category: "choose for me", text: localizableString("If you had the chance to change one thing in your life right now, what would you change?")),
    SecondQuestion(category: "choose for me", text: localizableString("In one sentence, who are you?")),
    SecondQuestion(category: "choose for me", text: localizableString("What do you want to be appreciated for?")),
    SecondQuestion(category: "choose for me", text: localizableString("What fear of making mistakes prevented you from doing?")),
    SecondQuestion(category: "choose for me", text: localizableString("What are the problems you keep refusing to face?")),
    SecondQuestion(category: "choose for me", text: localizableString("What is the thing you've done that you're most proud of?")),
    SecondQuestion(category: "choose for me", text: localizableString("What have you changed your opinion in recent times?")),
    SecondQuestion(category: "choose for me", text: localizableString("If you could go back in time and give yourself advice as a young person, what advice would you give yourself?")),]

func localizableString(_ text: String) -> String {
    return NSLocalizedString(text, comment: "Quotes")
}

func localizableStrings(_ texts: [String]) -> [String] {
    var output = [String]()
    
    for text in texts {
        output.append(NSLocalizedString(text, comment: "Mood/Emotion"))
    }
    
    return output
}
