//
//  LoadImageFromDock.swift
//  Dunedayn
//
//  Created by Aleksandr Mayyura on 11.11.2021.
//

import Foundation
import UIKit

public class ImageManager {
    
    
   public func documentsDirectory() -> String {
        let documentsFolderPath = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true).first
        return documentsFolderPath!
    }
    
    public func fileInDocumentsDirectory(filename: String) -> String {
        return documentsDirectory().appending(filename)
    }
    
    func loadImageFromPath(path: String) -> UIImage? {
        let image = UIImage(contentsOfFile: path)

        return image
    }
    

    
}
