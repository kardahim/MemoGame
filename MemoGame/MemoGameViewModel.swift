import SwiftUI

class MemoGameViewModel: ObservableObject {
    private static let emojis1 = ["👺", "😁", "🐶", "🐴", "🦄", "⚽️", "📞", "🔋"]
    private static let emojis2 = ["🍏","🍎", "🍐", "🥥", "🍑", "🥑", "🍆", "🌽"]
    private static let emojis3 = ["1️⃣", "2️⃣", "3️⃣", "4️⃣", "5️⃣", "6️⃣", "7️⃣", "8️⃣"]
    private static let emojis = [
        Color.blue: emojis1,
        Color.red: emojis2,
        Color.green: emojis3
    ]
    static var theme = Color.blue
    
    @Published private var model = createMemoGame()
    @Published var themeColor = Color.blue
    var score: Int {
        model.score
    }
    
    public static func createMemoGame() -> MemoGameModel<String> {
        return MemoGameModel<String>(numberPairOfCard: 8) { index in
            if emojis[theme]!.indices.contains(index) {
                return emojis[theme]![index]
            } else {
                return "?!"
            }
        }
    }
    
    var cards: Array<MemoGameModel<String>.Card> {
        return model.cards
    }
    
    func shuffle() {
        model.shuffle()
    }
    
    func choose(_ card: MemoGameModel<String>.Card) {
        model.choose(card)
    }
    
    func changeTheme(color: Color) {
        themeColor = color
        MemoGameViewModel.theme = color
        model.score = 0
        
        model.changeCardSet(numberPairOfCard: 8) { index in
            if MemoGameViewModel.emojis[MemoGameViewModel.theme]!.indices.contains(index) {
                return MemoGameViewModel.emojis[MemoGameViewModel.theme]![index]
            } else {
                return "?!"
            }
        }
    }
}
