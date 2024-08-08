import UIKit

final class LoginScene: UIViewController {
    
    //MARK: Variables
    private let viewModel: LoginSceneModel
    
    //MARK: UI Components
    private let titleLabel = makeTitleLabel()
    private let imageView = makeImageView()
    private lazy var autWithGoogleButton = makeSingInButton()
    private lazy var autWithAppleButton = makeSingInButton()
    private let separatorLeftLine = makeUIView()
    private let separatorOnButton = makeBodyLabel()
    private let separatorRightLine = makeUIView()
    private lazy var createAccButton = makeSingInButton()
    private let outInformation = makeBodyLabel()
    private let loginTitle = makeBodyLabel()
    private lazy var loginButton = makeLoginButton()
    
    //MARK: LifeCycle
    init(viewModel: LoginSceneModel) {
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
        setupBindings()
    }
    
    //MARK: Selectors
    private func updateUI() {
        view.backgroundColor = .systemBackground
        titleLabel.text = "loginScreenTitle".localizable
        imageView.image = UIImage(named: "X_image")
        autWithGoogleButton.setTitle("google".localizable, for: .normal)
        autWithAppleButton.setTitle("apple".localizable, for: .normal)
        separatorOnButton.text = "or"
        createAccButton.setTitle("create".localizable, for: .normal)
        outInformation.text = "policyInfo".localizable
        loginTitle.text = "loginTitle".localizable
        loginTitle.font = .systemFont(ofSize: 14)
        loginButton.setTitle("loginButton".localizable, for: .normal)
    }
    
    //MARK: Bindings
    private func setupBindings() {
        autWithGoogleButton.addAction(UIAction { [weak self] _ in
            self?.viewModel.didTapGoogleLogin()
        }, for: .touchUpInside)
        
        autWithAppleButton.addAction(UIAction { [weak self] _ in
            self?.viewModel.didTapAppleLogin()
        }, for: .touchUpInside)
        
        createAccButton.addAction(UIAction { [weak self] _ in
            self?.viewModel.didTapCreateAccount()
        }, for: .touchUpInside)
        
        loginButton.addAction(UIAction { [weak self] _ in
            self?.viewModel.didTapLogInAccount()
        }, for: .touchUpInside)
    }
}


//MARK: - Setup Constrain
private extension LoginScene {
    func setupConstrain() {
        setupTitleLabel()
        setupImageView()
        setupAutWithGoogleButton()
        setupAutWithAppleButton()
        setupSeparatorLineInButton()
        setupCreateAccountButton()
        setupOutInformation()
        setupLoginTitle()
        setupLoginButton()
    }
    
    func setupTitleLabel() {
        view.addSubview(titleLabel)
        
        NSLayoutConstraint.activate([
            titleLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: -140),
            titleLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            titleLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20)
        ])
    }
    
    func setupImageView() {
        view.addSubview(imageView)
        
        NSLayoutConstraint.activate([
            imageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            imageView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 30),
            imageView.widthAnchor.constraint(equalToConstant: 40),
            imageView.heightAnchor.constraint(equalToConstant: 40)
        ])
    }
    
    func setupAutWithGoogleButton() {
        view.addSubview(autWithGoogleButton)
        
        NSLayoutConstraint.activate([
            autWithGoogleButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            autWithGoogleButton.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 170)
        ])
    }
    
    func setupAutWithAppleButton() {
        view.addSubview(autWithAppleButton)
        
        NSLayoutConstraint.activate([
            autWithAppleButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            autWithAppleButton.topAnchor.constraint(equalTo: autWithGoogleButton.bottomAnchor, constant: 15)
        ])
    }
    
    func setupSeparatorLineInButton() {
        view.addSubview(separatorLeftLine)
        view.addSubview(separatorOnButton)
        view.addSubview(separatorRightLine)
        
        NSLayoutConstraint.activate([
            separatorLeftLine.topAnchor.constraint(equalTo: separatorOnButton.centerYAnchor),
            separatorLeftLine.leadingAnchor.constraint(equalTo: autWithAppleButton.leadingAnchor, constant: 20),
            separatorLeftLine.trailingAnchor.constraint(equalTo: separatorOnButton.leadingAnchor, constant: -10)
        ])
        
        NSLayoutConstraint.activate([
            separatorOnButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            separatorOnButton.topAnchor.constraint(equalTo: autWithAppleButton.bottomAnchor, constant: 15)
        ])
        
        NSLayoutConstraint.activate([
            separatorRightLine.topAnchor.constraint(equalTo: separatorOnButton.centerYAnchor),
            separatorRightLine.leadingAnchor.constraint(equalTo: separatorOnButton.trailingAnchor, constant: 10),
            separatorRightLine.trailingAnchor.constraint(equalTo: autWithAppleButton.trailingAnchor, constant: -20)
        ])
    }
    
    func setupCreateAccountButton() {
        view.addSubview(createAccButton)
        
        NSLayoutConstraint.activate([
            createAccButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            createAccButton.topAnchor.constraint(equalTo: separatorOnButton.bottomAnchor, constant: 15),
            createAccButton.heightAnchor.constraint(equalToConstant: 75)
        ])
    }
    
    func setupOutInformation() {
        view.addSubview(outInformation)
        
        NSLayoutConstraint.activate([
            outInformation.topAnchor.constraint(equalTo: createAccButton.bottomAnchor, constant: 15),
            outInformation.leadingAnchor.constraint(equalTo: createAccButton.leadingAnchor, constant: 5),
            outInformation.trailingAnchor.constraint(equalTo: createAccButton.trailingAnchor, constant: -5)
        ])
    }
    
    func setupLoginTitle() {
        view.addSubview(loginTitle)
        
        NSLayoutConstraint.activate([
            loginTitle.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -30),
            loginTitle.leadingAnchor.constraint(equalTo: outInformation.leadingAnchor)
        ])
    }
    
    func setupLoginButton() {
        view.addSubview(loginButton)
        
        NSLayoutConstraint.activate([
            loginButton.centerYAnchor.constraint(equalTo: loginTitle.centerYAnchor),
            loginButton.leadingAnchor.constraint(equalTo: loginTitle.trailingAnchor, constant: 5)
        ])
    }
}

//MARK: - Make UI
private extension LoginScene {
    static func makeTitleLabel() -> UILabel {
        let view = UILabel()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.font = .boldSystemFont(ofSize: 32)
        view.textColor = .whitePrimary
        view.numberOfLines = 0
        view.textAlignment = .center
        return view
    }
    
    static func makeBodyLabel() -> UILabel {
        let view = UILabel()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.font = .boldSystemFont(ofSize: 12)
        view.textColor = .secondaryCharcoa
        view.numberOfLines = 0
        view.textAlignment = .left
        return view
    }
    
    static func makeImageView() -> UIImageView {
        let view = UIImageView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.sizeToFit()
        return view
    }
    
    func makeSingInButton() -> UIButton {
        let view = UIButton()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.widthAnchor.constraint(equalToConstant: 350).isActive = true
        view.heightAnchor.constraint(equalToConstant: 50).isActive = true
        view.layer.cornerRadius = 25
        view.backgroundColor = .white
        view.titleLabel?.font = .boldSystemFont(ofSize: 16)
        view.setTitleColor(.black, for: .normal)
        return view
    }
    
    static func makeUIView() -> UIView {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .secondaryCharcoa
        view.heightAnchor.constraint(equalToConstant: 1).isActive = true
        return view
    }
    
    func makeLoginButton() -> UIButton {
        let view = UIButton(type: .system)
        view.translatesAutoresizingMaskIntoConstraints = false
        view.titleLabel?.font = .systemFont(ofSize: 14)
        return view
    }
}


