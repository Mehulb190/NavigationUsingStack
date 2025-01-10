import SwiftUI

struct BackButtonToolbar: ToolbarContent {
    let action: () -> Void
    let isClose: Bool
    
    var body: some ToolbarContent {
        ToolbarItem(placement: .navigationBarLeading) {
            if isClose {
                Button(action: action) {
                    HStack(spacing: 4) {
                        Image(systemName: "xmark")
                            .font(.system(size: 16, weight: .medium))
                    }
                    .foregroundColor(.purple)
                }
            } else {
                Button(action: action) {
                    HStack(spacing: 4) {
                        Image(systemName: "chevron.left")
                            .font(.system(size: 16, weight: .medium))
                    }
                    .foregroundColor(.purple)
                }
            }
        }
    }
}

extension View {
    func withBackButton(isClose: Bool = false, action: @escaping () -> Void) -> some View {
        self.toolbar {
            BackButtonToolbar(action: action, isClose: isClose)
        }
        .navigationBarBackButtonHidden(true)
    }
}

