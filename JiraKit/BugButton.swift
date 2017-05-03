//
//  BugButton.swift
//  JIraKit
//
//  Created by Yannick Heinrich on 02.09.16.
//  Copyright © 2016 yageek. All rights reserved.
//

import UIKit

final class BugButton: UIButton {

    //MARK: Styles
    fileprivate static var defaultSize = CGSize(width: 40, height: 40)
    fileprivate static var bugImage: UIImage = {

        let bundle = Bundle(for: BugButton.self)
        let image = UIImage(named: "debug", in: bundle, compatibleWith: nil)!
        return image
    }()

    //MARK: ivars
    fileprivate var position: CGPoint
    //MARK: Initializers
    fileprivate func commonInit() {
        // Setup Image
        setImage(BugButton.bugImage, for: UIControlState())
        setImage(BugButton.bugImage, for: .highlighted)
        self.imageView?.contentMode = .scaleAspectFit

        self.backgroundColor = UIColor(red: 135.0/255.0, green: 40.0/255.0, blue: 200.0/255.0, alpha: 1.0)
        self.layer.cornerRadius = self.frame.size.width / 2.0
        //Position
        self.frame.origin = position
        self.isUserInteractionEnabled = true

        let panGesture = UIPanGestureRecognizer(target: self, action: #selector(self.move))
        addGestureRecognizer(panGesture)

    }

    //MARK: Position and recentering
    @objc fileprivate func move(_ gesture: UIPanGestureRecognizer) {
        let translation = gesture.translation(in: self)
        if let view = gesture.view{

            defer  {
                gesture.setTranslation(CGPoint.zero, in: self)
            }

            switch gesture.state {
            case .cancelled:
                fallthrough
            case .ended:
                fallthrough
            case .failed:

                //TODO: Asset to grid limit
                break;
            case .changed:
                view.center = CGPoint(x: view.center.x + translation.x, y: view.center.y + translation.y)
            default:
                break

            }
        }

    }

    fileprivate func recenterInSuperView() {

    }


    public init(position: CGPoint = CGPoint(x: 10.0, y: 74.0)) {
        self.position = position
        super.init(frame: CGRect(origin: position, size: BugButton.defaultSize))
        commonInit()

    }
    
    required public init?(coder aDecoder: NSCoder) {
        fatalError("notImplemented")
    }

}
