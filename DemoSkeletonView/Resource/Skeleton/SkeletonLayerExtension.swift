//
//  SkeletonLayerExtension.swift
//  DemoSkeletonView
//
//  Created by Boung on 28/9/21.
//

import UIKit

extension CAGradientLayer: SkeletonLoadable {
    
    func configSkeletonLoading(for view: UIView, beginTime: CFTimeInterval = 0.0) {
        configStartAndEnd(view: view)
        configGroup(beginTime: beginTime)
    }
    
    func configSkeletonFrame(from view: UIView) {
        frame = view.bounds
        cornerRadius = view.bounds.height / 2
    }
    
    private func configStartAndEnd(view: UIView) {
        startPoint = CGPoint(x: 0, y: 0.5)
        endPoint = CGPoint(x: 1, y: 0.5)
        view.layer.addSublayer(self)
    }
    
    private func configGroup(beginTime: CFTimeInterval = 0.0) {
        let group = makeAnimationGroup()
        group.beginTime = beginTime
        add(group, forKey: "backgroundColor")
    }
}
