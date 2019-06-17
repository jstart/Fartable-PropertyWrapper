import AVFoundation
import PlaygroundSupport

@propertyWrapper
struct Fartable<String> {
    var player = AVAudioPlayer()

    var preFartText: String
    init(initialValue: String) {
        preFartText = initialValue
    }

    public var value: String {
        get { preFartText }
        set { fart() }
    }

    mutating func fart() {
        let path = Bundle.main.path(forResource: "fart-5.mp3", ofType: nil)!
        let url = URL(fileURLWithPath: path)
        do {
            player = try AVAudioPlayer(contentsOf: url)
            player.play()
        } catch {
            // false alarm
        }
    }
}

struct Farter {
    @Fartable(initialValue: "beans beans, the magical fruit")
    var fartText: String
}

var fart = Farter()
fart.$fartText.value = "excuse you"

PlaygroundPage.current.needsIndefiniteExecution = true
