//
//  Scan.swift
//  MedicineReader
//
//  Created by Hamza Jabali on 15/03/1444 AH.
//

import Foundation

struct Scan:Identifiable {
    var id = UUID()
    let content:String
    
    init(content:String) {
        self.content = content
    }
}
