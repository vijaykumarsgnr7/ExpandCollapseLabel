//
//  ViewController.swift
//  ExpendLabelDemo
//
//  Created by Vijay Kumar on 27/08/22.
//

import UIKit

class ViewController: UIViewController {
    
    //MARK:- IBOUTLET'S & PROPERTIES
    @IBOutlet weak var lblDescrption: UILabel!
    
    
    var str = "Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old. Richard McClintock, a Latin professor at Hampden-Sydney College in Virginia, looked up one of the more obscure Latin words, consectetur, from a Lorem Ipsum passage, and going through the cites of the word in classical literature, discovered the undoubtable source. Lorem Ipsum comes from sections 1.10.32 and 1.10.33 of de Finibus Bonorum et Malorum (The Extremes of Good and Evil) by Cicero, written in 45 BC. This book is a treatise on the theory of ethics, very popular during the Renaissance. The first line of Lorem Ipsum, Lorem ipsum dolor sit amet.., comes from a line in section 1.10.32. The standard chunk of Lorem Ipsum used since the 1500s is reproduced below for those interested. Sections 1.10.32 and 1.10.33 from de Finibus Bonorum et Malorum by Cicero are also reproduced in their exact original form, accompanied by English versions from the 1914 translation by H. Rackham."
    
    //MARK:- UIVIEWCONTROLLER'S LIFECYCL METHODS
    override func viewDidLoad() {
        super.viewDidLoad()
        lblDescrption.text = self.str
        let readmoreFont = UIFont(name: "Helvetica-Oblique", size: 17.0)
        let readmoreFontColor = UIColor.blue
        DispatchQueue.main.async {
            self.lblDescrption.addTrailing(with: "... ", moreText: "Readmore", moreTextFont: readmoreFont!, moreTextColor: readmoreFontColor)
        }
        
        let string = lblDescrption.text!
        let attributedString = NSMutableAttributedString(string: string, attributes:[NSAttributedString.Key.link: URL(string: "http://www.google.com")!])

        lblDescrption.attributedText = attributedString
        lblDescrption.isUserInteractionEnabled = true
        lblDescrption.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(handleTapOnLabel(_:))))
    }
    
    @objc func handleTapOnLabel(_ recognizer: UITapGestureRecognizer) {
        guard let text = lblDescrption.attributedText?.string else {
            return
        }
        
        if let range = text.range(of: NSLocalizedString("Readmore", comment: "Readmore")),
           recognizer.didTapAttributedTextInLabel(label: lblDescrption, inRange: NSRange(range, in: text)) {
            self.lblDescrption.text = "\(self.str)          "
            self.lblDescrption.numberOfLines = 0
            let readmoreFont = UIFont(name: "Helvetica-Oblique", size: 17.0)
            let readmoreFontColor = UIColor.blue
            DispatchQueue.main.async {
                self.lblDescrption.addTrailing(with: "", moreText: "Readless", moreTextFont: readmoreFont!, moreTextColor: readmoreFontColor)
            }
        } else if let range = text.range(of: NSLocalizedString("Readless", comment: "Readless")),
                  recognizer.didTapAttributedTextInLabel(label: lblDescrption, inRange: NSRange(range, in: text)) {
            self.lblDescrption.text = self.str
            self.lblDescrption.numberOfLines = 3
            let readmoreFont = UIFont(name: "Helvetica-Oblique", size: 17.0)
            let readmoreFontColor = UIColor.blue
            DispatchQueue.main.async {
                self.lblDescrption.addTrailing(with: "... ", moreText: "Readmore", moreTextFont: readmoreFont!, moreTextColor: readmoreFontColor)
            }
        }
    }
}

