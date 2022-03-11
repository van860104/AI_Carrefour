//
//  ChatViewController.swift
//  AI_Carrefour
//
//  Created by zeze on 2022/3/7.
//

import UIKit


class ChatViewController: UIViewController, UITextViewDelegate {
    
    
    @IBOutlet weak var textView: UITextView!
  
    @IBOutlet weak var label: UILabel!
    var labeltext = String()
    
    
    @IBOutlet weak var item1: UIImageView!
    @IBOutlet weak var item2: UIImageView!
    @IBOutlet weak var item3: UIImageView!
    @IBOutlet weak var item4: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(imageTapped(tapGestureRecognizer1:)))
        item1.isUserInteractionEnabled = true
        item1.addGestureRecognizer(tapGestureRecognizer)
        item1.roundCorners([.topLeft], radius: 10)
        let tapGestureRecognizer2 = UITapGestureRecognizer(target: self, action: #selector(imageTapped(tapGestureRecognizer2:)))
        item2.isUserInteractionEnabled = true
        item2.addGestureRecognizer(tapGestureRecognizer2)
        item2.roundCorners([.topRight], radius: 10)
        let tapGestureRecognizer3 = UITapGestureRecognizer(target: self, action: #selector(imageTapped(tapGestureRecognizer3:)))
        item3.isUserInteractionEnabled = true
        item3.addGestureRecognizer(tapGestureRecognizer3)
        item3.roundCorners([.bottomLeft], radius: 10)
        let tapGestureRecognizer4 = UITapGestureRecognizer(target: self, action: #selector(imageTapped(tapGestureRecognizer4:)))
        item4.isUserInteractionEnabled = true
        item4.addGestureRecognizer(tapGestureRecognizer4)
        item4.roundCorners([.bottomRight], radius: 10)
        textView.text = labeltext
     
        //        userinfo.contentInset = UIEdgeInsets(top: 12, left: 5, bottom: 12, right: 5)
        
//        userinfo.isEditable = false
//        userinfo.isUserInteractionEnabled = false
        textView.layer.cornerRadius = 10
        textView.clipsToBounds = true

        textView.font = UIFont.preferredFont(forTextStyle: .title3)
        textView.delegate = self
        textView.isScrollEnabled = false
         
        
    }
    
    @objc func imageTapped(tapGestureRecognizer1: UITapGestureRecognizer)
    {
       
        let mapview = MapViewController()
        mapview.modalPresentationStyle = .automatic
        mapview.view.backgroundColor = .white
        present(mapview,animated: true, completion: nil)
        
    
    }
    
    @objc func imageTapped(tapGestureRecognizer2: UITapGestureRecognizer)
    {
       
        let mapview = MapViewController()
        mapview.modalPresentationStyle = .automatic
        mapview.view.backgroundColor = .white
        present(mapview,animated: true, completion: nil)
        
    
    }
    
    
    @IBAction func test2(_ sender: Any) {
        
        
                    
    }
    
    @objc func imageTapped(tapGestureRecognizer3: UITapGestureRecognizer)
    {
       
        let mapview = MapViewController()
        mapview.modalPresentationStyle = .automatic
        mapview.view.backgroundColor = .white
        present(mapview,animated: true, completion: nil)
        
    
    }
    
    
    
    @objc func imageTapped(tapGestureRecognizer4: UITapGestureRecognizer)
    {
       
        let mapview = MapViewController()
        mapview.modalPresentationStyle = .automatic
        mapview.view.backgroundColor = .white
        present(mapview,animated: true, completion: nil)
        
    
    }
    
    


    @IBOutlet weak var textview: UITextView!
    

    
    var i = 0
    @IBAction func test(_ sender: Any) {
         
        
                   let x:Int = 100 + (i % 4) * 60
                   let y:Int = 140 + (i / 4) * 60
            let buttonNumber:UIButton = UIButton(type: UIButton.ButtonType.system) as UIButton
                   //按鈕位置 大小
                   buttonNumber.frame = CGRect(x: x,y: y,width: 40, height: 35)
                   //文字顏色
            buttonNumber.setTitleColor(UIColor.white, for: UIControl.State.normal)
                   //按鈕背景
                   buttonNumber.backgroundColor = UIColor.black
                   //字型大小
                   buttonNumber.titleLabel?.font = UIFont(name: "System", size: 22.0)
                   //加入按鈕
                   view.addSubview(buttonNumber)
               
          i = i+1
          
        
    }
    
    
    
    @IBAction func goback(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
//
    func textViewDidChange(_ textView: UITextView) {
//        let size = CGSize(width: view.frame.width, height: .infinity)
//        let estimatedSize = textView.sizeThatFits(size)
//
//        textView.constraints.forEach { (constraint) in
//            if constraint.firstAttribute == .height {
//                constraint.constant = estimatedSize.height
//            }
//        }
//            let fixedWidth = textView.frame.size.width
//            let newSize = textView.sizeThatFits(CGSize(width: fixedWidth, height: CGFloat.greatestFiniteMagnitude))
//            textView.frame.size = CGSize(width: max(newSize.width, fixedWidth), height: newSize.height)
//
    }
    
    
}

extension UIImageView {
    public func roundCorners(_ corners: UIRectCorner, radius: CGFloat) {
        let maskPath = UIBezierPath(roundedRect: bounds,
                                    byRoundingCorners: corners,
                                    cornerRadii: CGSize(width: radius, height: radius))
        let shape = CAShapeLayer()
        shape.path = maskPath.cgPath
        layer.mask = shape
    }
}
