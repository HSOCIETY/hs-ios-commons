//
//  UIImage_Extension.swift
//  SkyPeople
//
//  Created by yoseop park on 2017. 4. 4..
//  Copyright © 2017년 HSOCIETY. All rights reserved.
//

import Foundation

extension UIImage {

    // uiview를 이미지로 만들기
    public convenience init?(view: UIView) {
        UIGraphicsBeginImageContextWithOptions(view.bounds.size, view.isOpaque, 0.0)
        view.drawHierarchy(in: view.bounds, afterScreenUpdates: false)
        let image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()

        guard let viewImage = image, let cgViewImage = viewImage.cgImage else {return nil}
        self.init(cgImage: cgViewImage)
    }

    public func resizeImage(size: CGSize) -> UIImage {
        let scale = size.width / self.size.width
        let newHeight = self.size.height * scale

        UIGraphicsBeginImageContext(CGSize(width: size.width * UIScreen.main.scale, height: newHeight * UIScreen.main.scale))

        self.draw(in: CGRect(x: 0, y: 0, width: size.width, height: newHeight))
        let newImage = UIGraphicsGetImageFromCurrentImageContext()

        UIGraphicsEndImageContext()

        return newImage!
    }

    /*
     이미지를 정사각형으로 만들어주기.
     센터베이스로 크롭해줌.
     */
    public func cropToSquare() -> UIImage {
        let contextImage: UIImage = UIImage(cgImage: self.cgImage!)
        let contextSize: CGSize = contextImage.size
        var posX: CGFloat = 0.0
        var posY: CGFloat = 0.0
        var cgwidth: CGFloat = CGFloat(self.size.width)
        var cgheight: CGFloat = CGFloat(self.size.height)

        // See what size is longer and create the center off of that
        if contextSize.width > contextSize.height {
            posX = ((contextSize.width - contextSize.height) / 2)
            posY = 0
            cgwidth = contextSize.height
            cgheight = contextSize.height
        } else {
            posX = 0
            posY = ((contextSize.height - contextSize.width) / 2)
            cgwidth = contextSize.width
            cgheight = contextSize.width
        }

        let rect: CGRect = CGRect(x: posX, y: posY, width: cgwidth, height: cgheight)
        let imageRef: CGImage = contextImage.cgImage!.cropping(to: rect)!

        let image: UIImage = UIImage(cgImage: imageRef, scale: self.scale, orientation: self.imageOrientation)

        return image
    }

    public func toBlur() -> UIImage? {
        let context = CIContext(options: nil)
        let inputImage = CIImage(image: self)
        let originalOrientation = self.imageOrientation
        let originalScale = self.scale

        let filter = CIFilter(name: "CIGaussianBlur")
        filter?.setValue(inputImage, forKey: kCIInputImageKey)
        filter?.setValue(20.0, forKey: kCIInputRadiusKey)
        let outputImage = filter?.outputImage

        var cgImage: CGImage?

        if let asd = outputImage {
            cgImage = context.createCGImage(asd, from: (inputImage?.extent)!)
        }

        if let cgImageA = cgImage {
            return UIImage(cgImage: cgImageA, scale: originalScale, orientation: originalOrientation)
        }

        return nil
    }
}
