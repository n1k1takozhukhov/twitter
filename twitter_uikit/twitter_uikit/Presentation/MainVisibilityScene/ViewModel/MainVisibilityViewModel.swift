import UIKit

final class MainVisibilityViewModel {
    //MARK: Variables
    let model: TwitterModel
    weak var viewController: UIViewController?

    //MARK: LifeCycle
    init(model: TwitterModel) {
        self.model = model
    }
    
    //MARK: Selectors
    func startTransitionToLoginSceneAfterDelay() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.5) { [weak self] in
            self?.presentLoginScene()
        }
    }
    
    private func presentLoginScene() {
        guard let viewController = viewController else { return }
        
        let loginSceneModel = LoginSceneModel(model: model)
        let loginScene = LoginScene(viewModel: loginSceneModel)
        loginScene.modalTransitionStyle = .crossDissolve
        loginScene.modalPresentationStyle = .fullScreen
        viewController.present(loginScene, animated: true, completion: nil)
        
    }
}
