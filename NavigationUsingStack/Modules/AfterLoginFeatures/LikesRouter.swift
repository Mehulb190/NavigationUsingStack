import SwiftUI

// MARK: - Likes Routes
enum LikesRoute: Hashable {
    case likeDetail(Int)
}

class LikesRouter: ObservableObject {
    @Published var path = NavigationPath()
    
    func navigate(to route: LikesRoute) {
        path.append(route)
    }
    
    func navigateBack() {
        if !path.isEmpty {
            path.removeLast()
        }
    }
    
    func clearNavigation() {
        path = NavigationPath()
    }
    
    @ViewBuilder
    func view(for route: LikesRoute) -> some View {
        switch route {
        case .likeDetail(let id):
            Text("Like Detail View \(id)")
                .navigationTitle("Like Detail")
                .withBackButton(action: navigateBack)
        }
    }
    
    @ViewBuilder
    func rootView() -> some View {
        List(1...5, id: \.self) { id in
            Button("Like Item \(id)") {
                self.navigate(to: .likeDetail(id))
            }
        }
        .navigationTitle("Likes")
    }
}
