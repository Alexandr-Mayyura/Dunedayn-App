//
//  SaveImage.swift
//  Dunedayn
//
//  Created by Aleksandr Mayyura on 08.11.2021.
//

import Foundation
import UIKit

//class SaveImage {
//
//
//    func saveImage (image: UIImage, path: String ) -> Bool{
//
//        let pngImageData = image.pngData()
//        //let jpgImageData = UIImageJPEGRepresentation(image, 1.0)   // if you want to save as JPEG
//        let result = pngImageData?.write(to: path, options: <#T##Data.WritingOptions#>)
////        let result = pngImageData.writeToFile(path, atomically: true)
//
//        return result
//
//    }
//
//    // Get the documents Directory
//
//    func documentsDirectory() -> String {
//        let documentsFolderPath = NSSearchPathForDirectoriesInDomains(NSSearchPathDirectory.DocumentDirectory, NSSearchPathDomainMask.UserDomainMask, true)[0] as! String
//        return documentsFolderPath
//    }
//    // Get path for a file in the directory
//
//    func fileInDocumentsDirectory(filename: String) -> String {
//        return documentsDirectory().stringByAppendingPathComponent(filename)
//    }
//}
