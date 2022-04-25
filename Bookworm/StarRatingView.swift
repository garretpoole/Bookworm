//
//  StarRatingView.swift
//  Bookworm
//
//  Created by Garret Poole on 4/2/22.
//

import SwiftUI

struct StarRatingView: View {
    @Binding var rating: Int
    
    var label = ""
    var maxRating = 5
    
    var offImage: Image?
    var onImage = Image(systemName: "star.fill")
    
    var offColor = Color.gray
    var onColor = Color.yellow
    
    var body: some View {
        HStack {
            if label.isEmpty == false {
                Text(label)
            }
            ForEach(1..<maxRating + 1, id: \.self) { number in
                image(for: number)
                    .foregroundColor(number > rating ? offColor : onColor)
                    .onTapGesture {
                        rating = number
                    }
                //Approcah 1: works but not fluid
//                    .accessibilityLabel("\(number == 1 ? "1 Star" : "\(number) Stars")")
//                    .accessibilityRemoveTraits(.isImage)
//                    .accessibilityAddTraits(number > rating ? .isButton : [.isButton, .isSelected])
            }
        }
        //Approach 2: flatten children and apply to whole HStack
        //allows to swipe up for increment and down for decrement
        .accessibilityElement()
        .accessibilityLabel("Rating")
        .accessibilityValue(rating == 1 ? "1 star" : "\(rating) stars")
        .accessibilityAdjustableAction { direction in
            switch direction {
            case .increment:
                if rating < maxRating { rating += 1 }
            case .decrement:
                if rating > 1 { rating -= 1 }
            default:
                break
            }
        }
    }
    
    func image(for number: Int) -> Image {
        if number > rating {
            return offImage ?? onImage
        } else {
            return onImage
        }
    }
}

struct StarRatingView_Previews: PreviewProvider {
    static var previews: some View {
        StarRatingView(rating: .constant(4))
    }
}
