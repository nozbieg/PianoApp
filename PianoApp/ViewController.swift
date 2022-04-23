import UIKit
import AVFoundation

class ViewController: UIViewController {

    
    var audioPlayer = AVAudioPlayer()
    
    
    @IBOutlet var notes: [UIButton]!
    let references = ["C3", "Cc", "D", "Dd", "E", "F", "Ff", "G", "Gg", "A", "Aa", "B", "C4"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


    @IBAction func notePressed(_ sender: UIButton) {
         play(note: notes.index(of: sender)! + 1 )
    }
    
    func play(note: Int) {
        print(note,references[note - 1])
        let reference = references[note - 1]
        if let path = Bundle.main.path(forResource: reference, ofType: "wav") {
            let url = URL(fileURLWithPath: path)
            do {
                audioPlayer = try AVAudioPlayer(contentsOf: url)
                audioPlayer.prepareToPlay()
                audioPlayer.play()
            }
            catch {
                print(error)
            }
        }
    }
}



