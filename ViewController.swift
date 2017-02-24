import UIKit

enum TextSegue: String {
    case zebra
    case lion
    
    init?(url: URL) {
        self.init(rawValue: url.absoluteString)
    }
}

class ViewController: UIViewController, UITextViewDelegate {
    
       @IBOutlet weak var textView: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //People are saying the error is because it is not being initialized yet
        textView.delegate = self
        setUpLinks()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func setUpLinks() {
        
        let string = "Click on zebra to learn more, or on lion to learn about those"
        let attributedString = NSMutableAttributedString(string: string)
        let zebraRange = (string as NSString).range(of: "zebra")
        let lionRange = (string as NSString).range(of: "lion")
        
        attributedString.setAttributes([NSLinkAttributeName: TextSegue.zebra.rawValue], range: zebraRange)
        attributedString.setAttributes([NSLinkAttributeName: TextSegue.lion.rawValue], range: lionRange)
        
        textView.attributedText = attributedString
    }
    
    func textView(_ textView: UITextView, shouldInteractWith URL: URL, in characterRange: NSRange, interaction: UITextItemInteraction) -> Bool {
        
        guard let segue = TextSegue(url: URL) else {
            print("Invalid URL")
            return false
        }
        
        switch segue {
        case .zebra: print("Zebra") // go to zebra view controller
        case .lion: print("Lion") // go to lion view controller
        }
        
        return false
    }
}
