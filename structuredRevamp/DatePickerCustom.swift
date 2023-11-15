//
//  DatePickerCustom.swift
//  structuredRevamp
//
//  Created by Salvo on 14/11/23.
//

import Foundation
import UIKit
import SwiftUI

class MyDatePicker: UIView {
    
    var changeClosure: ((Date)->())?
    var dismissClosure: (()->())?
    let dPicker: UIDatePicker = {
        let v = UIDatePicker()
        return v
    }()
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        commonInit()
    }
    func commonInit() -> Void {
        let blurEffect = UIBlurEffect(style: .dark)
        let blurredEffectView = UIVisualEffectView(effect: blurEffect)
        let pickerHolderView: UIView = {
            let v = UIView()
            v.backgroundColor = .white
            v.layer.cornerRadius = 8
            return v
        }()
        
        [blurredEffectView, pickerHolderView, dPicker].forEach { v in
            v.translatesAutoresizingMaskIntoConstraints = false
        }
        addSubview(blurredEffectView)
        pickerHolderView.addSubview(dPicker)
        addSubview(pickerHolderView)
        
        NSLayoutConstraint.activate([
            
            blurredEffectView.topAnchor.constraint(equalTo: topAnchor),
            blurredEffectView.leadingAnchor.constraint(equalTo: leadingAnchor),
            blurredEffectView.trailingAnchor.constraint(equalTo: trailingAnchor),
            blurredEffectView.bottomAnchor.constraint(equalTo: bottomAnchor),
            pickerHolderView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20.0),
            pickerHolderView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20.0),
            pickerHolderView.centerYAnchor.constraint(equalTo: centerYAnchor),
            dPicker.topAnchor.constraint(equalTo: pickerHolderView.topAnchor, constant: 20.0),
            dPicker.leadingAnchor.constraint(equalTo: pickerHolderView.leadingAnchor, constant: 20.0),
            dPicker.trailingAnchor.constraint(equalTo: pickerHolderView.trailingAnchor, constant: -20.0),
            dPicker.bottomAnchor.constraint(equalTo: pickerHolderView.bottomAnchor, constant: -20.0),
        ])
        
        if #available(iOS 14.0, *) {
            dPicker.preferredDatePickerStyle = .inline
        } else {
            // use default
        }
        
        dPicker.addTarget(self, action: #selector(didChangeDate(_:)), for: .valueChanged)
        
        let t = UITapGestureRecognizer(target: self, action: #selector(tapHandler(_:)))
        blurredEffectView.addGestureRecognizer(t)
    }
    
    @objc func tapHandler(_ g: UITapGestureRecognizer) -> Void {
        dismissClosure?()
    }
    
    @objc func didChangeDate(_ sender: UIDatePicker) -> Void {
        changeClosure?(sender.date)
    }
    
}

class ViewControllerData: UIViewController {
    
    let myPicker: MyDatePicker = {
        let v = MyDatePicker()
        return v
    }()
    let myButton: UIButton = {
        let v = UIButton()
        v.setImage(UIImage(systemName: "calendar"), for: .normal)
        return v
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        [myButton, myPicker].forEach { v in
            v.translatesAutoresizingMaskIntoConstraints = false
            view.addSubview(v)
        }
        let g = view.safeAreaLayoutGuide
        NSLayoutConstraint.activate([
            
            // custom picker view should cover the whole view
            myPicker.topAnchor.constraint(equalTo: g.topAnchor),
            myPicker.leadingAnchor.constraint(equalTo: g.leadingAnchor),
            myPicker.trailingAnchor.constraint(equalTo: g.trailingAnchor),
            myPicker.bottomAnchor.constraint(equalTo: g.bottomAnchor),
            
            myButton.centerXAnchor.constraint(equalTo: g.centerXAnchor),
            myButton.topAnchor.constraint(equalTo: g.topAnchor, constant: 40.0),
            myButton.widthAnchor.constraint(equalTo: g.widthAnchor, multiplier: 0.75),
            
        ])
        
        // hide custom picker view
        myPicker.isHidden = true
        
        // add closures to custom picker view
        myPicker.dismissClosure = { [weak self] in
            guard let self = self else {
                return
            }
            self.myPicker.isHidden = true
        }
        myPicker.changeClosure = { [weak self] val in
            guard let self = self else {
                return
            }
            print(val)
            // do something with the selected date
        }
        
        // add button action
        myButton.addTarget(self, action: #selector(tap(_:)), for: .touchUpInside)
    }
    
    @objc func tap(_ sender: Any) {
        myPicker.isHidden = false
    }
    
}

struct YourParentView: View {
   @State private var presented = false
   var body: some View {

      // some other code that activates `presented` state

      SomeUIElement()
         .sheet(isPresented: $presented) {
             YourMessageViewControllerRepresentable()
         }
   }
}

#Preview {
    ViewControllerData()
}
