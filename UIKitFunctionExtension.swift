//
//  UIKitFunctionExtension.swift
//  Tasty
//
//  Created by Vitaliy Kuzmenko on 19/01/15.
//  Copyright (c) 2015 Vitaliy Kuz'menko. All rights reserved.
//

import UIKit

// MARK: - Application: Status Bar

func setStatusBarLightStyleAnimated(animated: Bool) {
    setStatusBarStyle(UIStatusBarStyle.LightContent, animated)
}

func setStatusBarDefaultStyleAnimated(animated: Bool) {
    setStatusBarStyle(UIStatusBarStyle.Default, animated)
}

func setStatusBarStyle(statusBarStyle: UIStatusBarStyle, animated: Bool) {
    UIApplication.sharedApplication().setStatusBarStyle(statusBarStyle, animated: true)
}

func showStatusBarWithAnimation(animation: UIStatusBarAnimation) {
    setStatusBarHidden(false, withAnimation: animation)
}

func hideStatusBarWithAnimation(animation: UIStatusBarAnimation) {
    setStatusBarHidden(true, withAnimation: animation)
}

func setStatusBarHidden(hidden: Bool, withAnimation animation: UIStatusBarAnimation) {
    UIApplication.sharedApplication().setStatusBarHidden(hidden, withAnimation: animation)
}
