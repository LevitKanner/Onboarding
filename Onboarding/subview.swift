//
//  subview.swift
//  Onboarding
//
//  Created by Levit Kanner on 12/12/2019.
//  Copyright © 2019 Levit Kanner. All rights reserved.
//

import SwiftUI

struct subview: View {
    var imageName: String
    
    var body: some View {
        Image(imageName)
            .resizable()
            .scaledToFill()
            .clipped()
    }
}

struct subview_Previews: PreviewProvider {
    static var previews: some View {
        subview(imageName: "sitting")
    }
}
