//
//  Quotes.swift
//  Reflection App
//
//  Created by Giovanni Prisco on 11/05/2020.
//  Copyright © 2020 Giovanni Prisco. All rights reserved.
//

import Foundation

struct Morning {
    let id: Int
    let text: String
    let compatible: Bool
}

struct Evening {
    let morningId: Int?
    let text: String
}

let morningQuotes: [Morning] = [
    Morning(id: 1, text: "Frase A", compatible: true),
    Morning(id: 2, text: "Frase B", compatible: true),
    Morning(id: 3, text: "Frase C", compatible: false)
]

let eveningQuotes: [Evening] = [
    Evening(morningId: 1, text: "Frase collegata ad A"),
    Evening(morningId: 1, text: "Frase 2 collegata ad A"),
    Evening(morningId: 2, text: "Frase collegata a B"),
    Evening(morningId: nil, text: "Frase scollegata")
]
