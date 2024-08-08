struct LoginSceneModel {
    
    //MARK: Variables
    private let model: TwitterModel

    //MARK: LifeCycle
    init(model: TwitterModel) {
        self.model = model
    }
    
    //MARK: Selectors
    func didTapGoogleLogin() {
        
        print("Continue with Google")
    }
    
    func didTapAppleLogin() {
        
        print("Continue with Apple")
    }

    func didTapCreateAccount() {
        
        print("Create Account")
    }
    
    func didTapLogInAccount() {
        
        print("Log in")
    }

}
