

import UIKit



extension UIView {
    @IBInspectable var CornerRadius :CGFloat {
        get {return self.layer.cornerRadius}
        set {self.layer.cornerRadius = newValue}
    }
    
    @IBInspectable var BorderColer : UIColor {
        
        get {return UIColor(cgColor: self.layer.borderColor!)}
        set {self.layer.borderColor = newValue.cgColor}
        
    }
    
    
    @IBInspectable var BorderWidth :CGFloat {
        get {return self.layer.borderWidth}
        set {self.layer.borderWidth = newValue}
    }
    
}

extension UITextField {
    @IBInspectable var PlaceHolderColor :UIColor {
        get {return self.PlaceHolderColor}
        set {
            self.attributedPlaceholder = NSAttributedString(string: self.placeholder != nil ?
                self.placeholder! : "",attributes : [NSAttributedString.Key.foregroundColor : newValue])
            
            
        
    }
    
}

}

