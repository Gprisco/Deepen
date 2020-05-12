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

struct Evening: Codable {
    let morningId: Int?
    let text: String
}

let morningQuotes: [Morning] = [
    Morning(id: 1, text: "Fai il letto e sarai un eroe!", compatible: false),
    Morning(id: 2, text: "Oggi mangiamo un po’ di frutta?", compatible: false),
    Morning(id: 3, text: "Trascorri un po' di tempo all’aperto, ti va una boccata d’aria?", compatible: false),
    Morning(id: 4, text: "Metti in ordine il tuo spazio, oggi voglio una bella scrivania pulita", compatible: false),
    Morning(id: 5, text: "Splendi ogni giorno di più ed è fantastico, non mollare mai!", compatible: false)
]

let eveningQuotes: [Evening] = [
    Evening(morningId: nil, text: "Come è andata questa giornata?"),
    Evening(morningId: nil, text: "Tutto molto bello ma in parole?"),
    Evening(morningId: nil, text: "Ti va di fare due chiacchiere?"),
    Evening(morningId: nil, text: "Scrivi 3 cose che ti piacciono di te"),
    Evening(morningId: nil, text: "Scommetto che hai grandi piani per domani, inizia a scrivere quelli che hai completato oggi")
]
