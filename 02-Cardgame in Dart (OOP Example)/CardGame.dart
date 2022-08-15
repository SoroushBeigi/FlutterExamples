//A simple card game program written in dart language as an example of OOP in dart

class Card{
  String suit;
  String rank;
  Card({required this.suit,required this.rank});

    toString(){ //Customized toString() method for our class
    return '$rank of $suit';
  }
}

class Deck{
  List<Card> cards = [];

  var ranks = ["Ace","Two","Three","Four","Five","Six","Seven","Eight","Nine","Ten","Jack","Queen","King"];
  var suits = ["Diamonds","Hearts","Spades","Clubs"];

//Generating all 13 × 4 = 52 Cards
  Deck(){ 
    for(var suit in suits){
      for(var rank in ranks){
        var c = new Card(rank:rank,suit:suit);
        cards.add(c);
      }
    }
  }

  toString(){
    return cards.toString();
  }

//Randomizing the order of the cards
  Shuffle(){ 
    cards.shuffle();
  }

//Returning all cards from the deck with a specific suit
  cardsWithSuit(String suit){
    List<Card> c = [];
    for(var card in cards){
      if (card.suit == suit) c.add(card);
    }
    return c;

    //An easier, single-line method:
    //return cards.where((card) => card.suit==suit);
  }

  
  deal(int num){
    var hand = cards.sublist(0,num);
    cards = cards.sublist(num); //Sublist's second argument is optional, so if u don't pass any argument
                                //It will automatically select all the list items from "num" to the end of our list
    return hand;
  }

  removeCard(String suit,String rank){
    
    cards.removeWhere((card) => (card.rank==rank && card.suit==suit) );
    return cards;
  }

}

void main(){
 var deck = new Deck();
 print('\nFull Deck: \n' + deck.toString() + '\n');
 print('\nOnly Diamonds: \n' + deck.cardsWithSuit('Diamonds').toString()+ '\n');
print('\nFull Deck without Two of Diamonds: \n' + deck.removeCard("Diamonds", "Two").toString()+ '\n');
print('\nFirst 10 Cards: \n' + deck.deal(10).toString()+ '\n');
 deck.Shuffle();
 print('\nFull Shuffled Deck: \n' + deck.toString() + '\n');



}