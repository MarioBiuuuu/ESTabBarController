//
//  ESTabBarController.swift
//
//  Created by Vincent Li on 2017/2/8.
//  Copyright (c) 2013-2018 ESTabBarController (https://github.com/eggswift/ESTabBarController)
//
//  Permission is hereby granted, free of charge, to any person obtaining a copy
//  of this software and associated documentation files (the "Software"), to deal
//  in the Software without restriction, including without limitation the rights
//  to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
//  copies of the Software, and to permit persons to whom the Software is
//  furnished to do so, subject to the following conditions:
//
//  The above copyright notice and this permission notice shall be included in
//  all copies or substantial portions of the Software.
//
//  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
//  IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
//  FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
//  AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
//  LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
//  OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
//  THE SOFTWARE.
//

import UIKit

/*
 * ESTabBarItem继承自UITabBarItem，目的是为ESTabBarItemContentView提供UITabBarItem属性的设置。
 * 目前支持大多常用的属性，例如image, selectedImage, title, tag 等。
 *
 * Unsupport properties:
 *  MARK: UIBarItem properties
 *      1. var isEnabled: Bool
 *      2. var landscapeImagePhone: UIImage?
 *      3. var imageInsets: UIEdgeInsets
 *      4.  var landscapeImagePhoneInsets: UIEdgeInsets
 *      5. func setTitleTextAttributes(_ attributes: [String : Any]?, for state: UIControlState)
 *      6. func titleTextAttributes(for state: UIControlState) -> [String : Any]?
 *  MARK: UITabBarItem properties
 *      7. var titlePositionAdjustment: UIOffset
 *      8. func setBadgeTextAttributes(_ textAttributes: [String : Any]?, for state: UIControlState)
 *      9. func badgeTextAttributes(for state: UIControlState) -> [String : Any]?
 */
@available(iOS 8.0, *)
open class ESTabBarItem: UITabBarItem {
    
    /// Customize content view
    open var contentView: ESTabBarItemContentView?
    
    // MARK: UIBarItem properties
    open override var title: String? // default is nil
        {
        didSet { self.contentView?.title = title }
    }
        open var titleFont: UIFont? {
        didSet {
            self.contentView?.titleFont = titleFont
        }
    }
    open override var image: UIImage? // default is nil
        {
        didSet { self.contentView?.image = image }
    }
    
    // MARK: UITabBarItem properties
    open override var selectedImage: UIImage? // default is nil
        {
        didSet { self.contentView?.selectedImage = selectedImage }
    }
    
    open override var badgeValue: String? // default is nil
        {
        get { return contentView?.badgeValue }
        set(newValue) { contentView?.badgeValue = newValue }
    }
    
    /// Override UITabBarItem.badgeColor, make it available for iOS8.0 and later.
    /// If this item displays a badge, this color will be used for the badge's background. If set to nil, the default background color will be used instead.
    @available(iOS 8.0, *)
    open override var badgeColor: UIColor? {
        get { return contentView?.badgeColor }
        set(newValue) { contentView?.badgeColor = newValue }
    }
    
    open override var tag: Int // default is 0
        {
        didSet { self.contentView?.tag = tag }
    }
    
    /* The unselected image is autogenerated from the image argument. The selected image
     is autogenerated from the selectedImage if provided and the image argument otherwise.
     To prevent system coloring, provide images with UIImageRenderingModeAlwaysOriginal (see UIImage.h)
     */
    public init(_ contentView: ESTabBarItemContentView = ESTabBarItemContentView(), title: String? = nil, image: UIImage? = nil, selectedImage: UIImage? = nil, tag: Int = 0) {
        super.init()
        self.contentView = contentView
        self.setTitle(title, image: image, selectedImage: selectedImage, tag: tag)
    }
    public required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    open func setTitle(_ title: String? = nil, image: UIImage? = nil, selectedImage: UIImage? = nil, tag: Int = 0) {
        self.title = title
        self.image = image
        self.selectedImage = selectedImage
        self.tag = tag
    }
    
}
