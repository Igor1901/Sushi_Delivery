//
//  ViewController.swift
//  Sushi_Delivery
//
//  Created by Игорь Пачкин on 3/6/23.
//


import UIKit

class LoginVC: UIViewController {
    
    private let imageView = UIImageView()
    private let signInLabel = UILabel()
    private let emailLabel = UILabel()
    private let emailTextField = UITextField()
    private let underlineView = UIView()
    private let passwordLabel = UILabel()
    private let passwordTextField = UITextField()
    private let eyeButton = EyeButton()
    private let underlineView2 = UIView()
    private let switchLabel = UILabel()
    private let faceIDSwitch = UISwitch()
    private let entryButton = UIButton(type: .system)
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
        addSubviews()
        setConstraints()
    }
    
    private func configureUI(){
        
        imageView.image = UIImage(named: "Logo")
        imageView.contentMode = .scaleAspectFit
        
        
        eyeButton.firstImage = UIImage(named: "Eye1")
        eyeButton.secondImage = UIImage(named: "Eye2")
        eyeButton.setImage(eyeButton.firstImage, for: .normal)
        eyeButton.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)

        
        view.backgroundColor = .white
       
        let colorForLabels = UIColor(red: 173/255, green: 194/255, blue: 239/255, alpha: 1)
        let colorForUnderline = UIColor(red: 232/255, green: 232/255, blue: 232/255, alpha: 1)
        
        signInLabel.text = "Sign In"
        signInLabel.font = UIFont.boldSystemFont(ofSize: 24)
        
        emailLabel.text = "Email"
        emailLabel.textColor =  colorForLabels
        emailLabel.font = UIFont.boldSystemFont(ofSize: 16)
        
        emailTextField.borderStyle = .none
        emailTextField.addSubview(underlineView)
        emailTextField.placeholder = "example@gmail.com"
        
        underlineView.backgroundColor = colorForUnderline
        
        passwordLabel.text = "Password"
        passwordLabel.textColor = colorForLabels
        passwordLabel.font = UIFont.boldSystemFont(ofSize: 16)
        
        passwordTextField.borderStyle = .none
        passwordTextField.addSubview(underlineView2)
        passwordTextField.isSecureTextEntry = true
        passwordTextField.placeholder = "*******"
        
        underlineView2.backgroundColor = colorForUnderline
        
        switchLabel.text = "Вход по Face ID"
        switchLabel.textColor = .black
        switchLabel.font = UIFont.boldSystemFont(ofSize: 16)
        

        
        entryButton.setTitleColor(.white, for: .normal)
        entryButton.backgroundColor = UIColor(red: 84/255, green: 118/255, blue: 171/255, alpha: 1)
        entryButton.layer.cornerRadius = 5
        entryButton.setTitle("Войти", for: .normal)
        entryButton.addTarget(self, action: #selector(enterFunc), for: .touchUpInside)
        
        
        
        
    }
    
    private func addSubviews(){
        view.addSubview(imageView)
        view.addSubview(imageView)
        view.addSubview(signInLabel)
        view.addSubview(emailLabel)
        view.addSubview(emailTextField)
        view.addSubview(passwordLabel)
        view.addSubview(passwordTextField)
        view.addSubview(eyeButton)
        view.addSubview(switchLabel)
        view.addSubview(faceIDSwitch)
        view.addSubview(entryButton)
    }
    
    private func setConstraints(){
        
        imageView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            imageView.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor),
            imageView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 30.0),
            imageView.widthAnchor.constraint(equalToConstant: 160.0),
            imageView.heightAnchor.constraint(equalToConstant: 160.0),
            ])
        
        signInLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            signInLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 225.0),
            signInLabel.leftAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor, constant: 50.0),
        ])
        
        emailLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            emailLabel.leftAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor, constant: 50.0),
            emailLabel.rightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.rightAnchor, constant: -50.0),
            emailLabel.topAnchor.constraint(equalTo: signInLabel.topAnchor, constant: 50.0),
        ])
        
        emailTextField.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            emailTextField.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor),
            emailTextField.leftAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor, constant: 50.0),
            emailTextField.rightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.rightAnchor, constant: -50.0),
            emailTextField.heightAnchor.constraint(equalToConstant: 40.0),
            emailTextField.topAnchor.constraint(equalTo: emailLabel.bottomAnchor, constant: 10.0),
        ])
        
        underlineView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            underlineView.bottomAnchor.constraint(equalTo: emailTextField.bottomAnchor),
            underlineView.heightAnchor.constraint(equalToConstant: 1.0),
            underlineView.leftAnchor.constraint(equalTo: emailTextField.leftAnchor),
            underlineView.rightAnchor.constraint(equalTo: emailTextField.rightAnchor),
        ])
        
        passwordLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            passwordLabel.topAnchor.constraint(equalTo: underlineView.bottomAnchor, constant: 20.0),
            passwordLabel.leftAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor, constant: 50.0),
            passwordLabel.rightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.rightAnchor, constant: -50.0),
        ])
            
        passwordTextField.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            passwordTextField.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor),
            passwordTextField.leftAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor, constant: 50.0),
            passwordTextField.rightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.rightAnchor, constant: -50.0),
            passwordTextField.heightAnchor.constraint(equalToConstant: 40.0),
            passwordTextField.topAnchor.constraint(equalTo: passwordLabel.bottomAnchor, constant: 10.0),
        ])
           
        underlineView2.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            underlineView2.bottomAnchor.constraint(equalTo: passwordTextField.bottomAnchor),
            underlineView2.heightAnchor.constraint(equalToConstant: 1.0),
            underlineView2.leftAnchor.constraint(equalTo: passwordTextField.leftAnchor),
            underlineView2.rightAnchor.constraint(equalTo: passwordTextField.rightAnchor),
        ])
        
        switchLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            switchLabel.topAnchor.constraint(equalTo: underlineView2.bottomAnchor, constant: 20.0),
            switchLabel.leftAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor, constant: 150.0),
        ])
         
        faceIDSwitch.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            faceIDSwitch.leftAnchor.constraint(equalTo: switchLabel.rightAnchor, constant: 10.0),
            faceIDSwitch.centerYAnchor.constraint(equalTo: switchLabel.centerYAnchor),
        ])
          
        entryButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            entryButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            entryButton.topAnchor.constraint(equalTo: switchLabel.bottomAnchor, constant: 25.0),
            entryButton.widthAnchor.constraint(equalToConstant: 250.0),
            entryButton.heightAnchor.constraint(equalToConstant: 40.0),
        ])
            
        eyeButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            eyeButton.leftAnchor.constraint(equalTo: passwordTextField.rightAnchor, constant: -25.0),
            eyeButton.centerYAnchor.constraint(equalTo: passwordTextField.centerYAnchor),
            eyeButton.widthAnchor.constraint(equalToConstant: 22.0),
            eyeButton.heightAnchor.constraint(equalToConstant: 22.0),
            ])
        
    }
    
    @objc func enterFunc(){
        
        let viewController2 = CatalogVC()
        let viewController3 = BasketVC()
        viewController2.delegate = viewController3
        // Создаем экземпляр UITabBarController
        let tabBarController = UITabBarController()
        
        // Создаем навигационные контроллеры для каждого контроллера
        let navController2 = UINavigationController(rootViewController: viewController2)
        let navController3 = UINavigationController(rootViewController: viewController3)
        
        // Устанавливаем контроллеры в UITabBarController
        tabBarController.viewControllers = [navController2, navController3]
        
        // Установка modalPresentationStyle на .fullScreen
        tabBarController.modalPresentationStyle = .fullScreen
        
        // Устанавливаем ваши контроллеры в виде TabBarItem'ов
        navController2.tabBarItem = UITabBarItem(tabBarSystemItem: .contacts, tag: 0)
        navController3.tabBarItem = UITabBarItem(tabBarSystemItem: .mostViewed, tag: 1)
        
        // Презентуем UITabBarController
        present(tabBarController, animated: true, completion: nil)
        
    }
    
    @objc func showPasswordButtonTapped() {
        passwordTextField.isSecureTextEntry.toggle() // Изменение значения secureTextEntry
        
    }
    
    @objc func buttonTapped(_ sender: EyeButton) {
        sender.toggle()
        passwordTextField.isSecureTextEntry.toggle()
    }
    
}

