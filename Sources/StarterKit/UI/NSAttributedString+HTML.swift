//
//  NSAttributedString+HTML.swift
//  StarterKit
//
//  Created by Emilio Pavia on 25/11/2019.
//  Copyright © 2019 Emilio Pavia. All rights reserved.
//

import UIKit

extension NSAttributedString {
    public convenience init?(htmlBody: String?,
                             font: UIFont,
                             color: UIColor,
                             tintColor: UIColor? = nil,
                             lineHeight: Float? = nil,
                             alignment: NSTextAlignment = .left,
                             layoutDirection: UITraitEnvironmentLayoutDirection = .leftToRight) {
        guard let body = htmlBody else { return nil }
        
        var r: CGFloat = 0, g: CGFloat = 0, b: CGFloat = 0, a: CGFloat = 0
        color.getRed(&r, green: &g, blue: &b, alpha: &a)
        
        var tr: CGFloat = 0, tg: CGFloat = 0, tb: CGFloat = 0, ta: CGFloat = 0
        (tintColor ?? color).getRed(&tr, green: &tg, blue: &tb, alpha: &ta)
        
        // FIXME: https://openradar.appspot.com/6153065
        let fontFamily: String
        if font.familyName == UIFont.systemFont(ofSize: font.pointSize).familyName {
            fontFamily = "-apple-system"
        } else {
            fontFamily = font.familyName
        }
        
        let lh = lineHeight != nil ? "\(lineHeight!)px" : "normal"
        
        let document = """
          <html>
          <head>
          <style>
              html * {
                  color: rgba(\(r * 255.0), \(g * 255.0), \(b * 255.0), \(a));
                  font-family: \(fontFamily) !important;
                  font-size: \(font.pointSize) !important;
                  line-height: \(lh);
                  text-align: \(alignment.htmlTextAlignment);
                  direction: \(layoutDirection.htmlDirection);
              }
              a {
                  color: rgba(\(tr * 255.0), \(tg * 255.0), \(tb * 255.0), \(ta));
                  font-weight: bold;
              }
          </style>
          </head>
          <body>
          \(body)
          </body>
          </html>
          """
        
        try? self.init(data: document.data(using: String.Encoding.utf8)!,
                       options: [.documentType: NSAttributedString.DocumentType.html,
                                 .characterEncoding: String.Encoding.utf8.rawValue],
                       documentAttributes: nil)
    }
}

extension NSTextAlignment {
    var htmlTextAlignment: String {
        switch self {
        case .center:
            return "center"
        case .right:
            return "right"
        case .justified:
            return "justify"
        default:
            return "left"
        }
    }
}

extension UITraitEnvironmentLayoutDirection {
    var htmlDirection: String {
        switch self {
        case .rightToLeft:
            return "rtl"
        default:
            return "ltr"
        }
    }
}
