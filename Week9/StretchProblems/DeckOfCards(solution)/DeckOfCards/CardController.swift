//
//  CardController.swift
//  DeckOfCards
//
//  Created by James Pacheco on 12/8/15.
//  Copyright © 2015 James Pacheco. All rights reserved.
//

import UIKit

class CardController {
    static let SharedInstance = CardController()
    
    var deckID: String? = nil {
        didSet{
            print("The deck ID is \(deckID)")
        }
    }
    
    var cards: [Card] = [] {
        didSet{
            print("The cards are \(cards)")
        }
    }
    
    var clubs: [Card] {
        return cards.filter({$0.suit == "CLUBS"})
    }
    
    var spades: [Card] {
        return cards.filter({$0.suit == "SPADES"})
    }
    
    var diamonds: [Card] {
        return cards.filter({$0.suit == "DIAMONDS"})
    }
    
    var hearts: [Card] {
        return cards.filter({$0.suit == "HEARTS"})
    }
    
    static func fetchDeck(completion: (deckID: String?) -> Void) {
        let urlString = "http://deckofcardsapi.com/api/deck/new/"
        NetworkController.dataAtURL(urlString) { (data) in
            guard let data = data,
                json = try? NSJSONSerialization.JSONObjectWithData(data, options: .AllowFragments) else {
                    print("JSON could not be serialized from data")
                    completion(deckID: nil)
                    return
            }
            if let responseDictionary = json as? [String: AnyObject] {
                if let deckID = responseDictionary["deck_id"] as? String {
                    SharedInstance.deckID = deckID
                    completion(deckID: deckID)
                } else {
                    completion(deckID: nil)
                    print("deckID didn't exist in the network call's response")
                }
            } else {
                completion(deckID: nil)
                print("our jsonObject wasn't of type [String: AnyObject]")
            }
        }
        
    }
    
    static func fetchCards(completion: (cards: [Card]) -> Void) {
        guard let deckID = SharedInstance.deckID else {print("no deck"); completion(cards: []); return}
        let urlString = "http://deckofcardsapi.com/api/deck/\(deckID)/draw/?count=52"
        NetworkController.dataAtURL(urlString) { (data) in
            guard let data = data,
                json = try? NSJSONSerialization.JSONObjectWithData(data, options: .AllowFragments) else {
                    print("JSON could not be serialized from data")
                    completion(cards: [])
                    return
            }
            if let responseDictionary = json as? [String: AnyObject] {
                if let cardArray = responseDictionary["cards"] as? [[String: AnyObject]] {
                    var cards: [Card] = []
                    for cardDictionary in cardArray {
                        if let newCard = Card(cardDictionary: cardDictionary) {
                            cards.append(newCard)
                        }
                    }
                    //let cards = cardArray.flatMap({Card(cardDictionary: $0)})
                    SharedInstance.cards = cards
                    completion(cards: cards)
                } else {
                    print("cardArray wasn't of type [[String:AnyObject]]")
                    completion(cards: [])
                }
            } else {
                completion(cards: [])
                print("the response wasn't of type [String: AnyObject]")
            }
            
        }
        
    }
}