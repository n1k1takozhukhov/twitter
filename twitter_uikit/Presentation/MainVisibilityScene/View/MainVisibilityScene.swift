import UIKit

final class MainVisibilityScene: UIViewController {
    //MARK: Variables
    private let viewModel: MainVisibilityViewModel
    
    
    //MARK: UI Components
    private let imageView = makeImageView()
    
    
    //MARK: LifeCycle
    init(viewModel: MainVisibilityViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupConstrain()
        updateUI()
        viewModel.viewController = self
        viewModel.startTransitionToLoginSceneAfterDelay()
    }
    
    
    //MARK: Selectors
    private func updateUI() {
        view.backgroundColor = .systemBackground
        imageView.image = UIImage(named: "X_image")
    }
}


//MARK: - Setup Constrain
private extension MainVisibilityScene {
    func setupConstrain() {
        setupImageView()
    }
    
    func setupImageView() {
        view.addSubview(imageView)
        
        NSLayoutConstraint.activate([
            imageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            imageView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            imageView.widthAnchor.constraint(equalToConstant: 60),
            imageView.heightAnchor.constraint(equalToConstant: 60),
        ])
    }
}


//MARK: - Make UI
private extension MainVisibilityScene {
    static func makeImageView() -> UIImageView {
        let view = UIImageView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.sizeToFit()
        return view
    }
}
