//
//  EditProfileVC.swift
//  A2
//
//  Created by Vin Bui on 6/4/23.
//

import UIKit

class EditProfileVC: UIViewController {
    
    // MARK: - Properties (view)
    
    private let profileImage = UIImageView()
    private let nameLabel = UILabel()
    private let bioLabel = UILabel()
    
    private let hometownLabel = UILabel()
    private let enterHometown = UITextField()
    
    private let majorLabel = UILabel()
    private let enterMajor = UITextField()
    
    private let saveButton = UIButton()
        
    // MARK: - Properties (data)
    
    private let name: String
    private let bio: String
    
    private let placeholderHometown: String
    private let placeholderMajor: String
    
    private weak var delegate: UpdateTextDelegate?
    
    // MARK: - viewDidLoad and init
    
    init(name: String, bio: String, placeholderHometown: String, placeholderMajor: String, delegate: UpdateTextDelegate) {
        self.name = name
        self.bio = bio
        
        self.placeholderHometown = placeholderHometown
        self.placeholderMajor = placeholderMajor
        
        self.delegate = delegate
        
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Edit Profile"
        view.backgroundColor = UIColor.a2.white
        
        setupProfileImage()
        setupNameLabel()
        setupBioLabel()
        
        setupHometownLabel()
        setupEnterHometown()

        setupMajorLabel()
        setupEnterMajor()
        
        setupSaveButton()
    }
    
    // MARK: - Set Up Views
    
    private func setupProfileImage() {
        profileImage.image = UIImage(named: "profile")
        
        profileImage.translatesAutoresizingMaskIntoConstraints = false
        
        profileImage.layer.cornerRadius = profileImage.frame.width / 2
        profileImage.layer.masksToBounds = true
        view.addSubview(profileImage)
        
        NSLayoutConstraint.activate([
            profileImage.widthAnchor.constraint(equalToConstant: 96),
            profileImage.heightAnchor.constraint(equalToConstant: 96),
            profileImage.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 32),
            profileImage.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 32)
        ])
    }
    
    private func setupNameLabel() {
        nameLabel.text = name
        nameLabel.textColor = UIColor.a2.black
        nameLabel.font = .systemFont(ofSize: 24, weight: .semibold)
        
        view.addSubview(nameLabel)
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            nameLabel.topAnchor.constraint(equalTo: profileImage.topAnchor, constant: 23),
            nameLabel.leadingAnchor.constraint(equalTo: profileImage.trailingAnchor, constant: 16),
            nameLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -32),
            nameLabel.bottomAnchor.constraint(equalTo: profileImage.bottomAnchor, constant: -44)
        ])
    }
    
    private func setupBioLabel() {
        bioLabel.text = bio
        bioLabel.textColor = UIColor.a2.black
        bioLabel.font = .italicSystemFont(ofSize: 14)
        
        view.addSubview(bioLabel)
        bioLabel.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            bioLabel.topAnchor.constraint(equalTo: nameLabel.topAnchor, constant: 33),
            bioLabel.bottomAnchor.constraint(equalTo: profileImage.bottomAnchor, constant: -23),
            bioLabel.leadingAnchor.constraint(equalTo: profileImage.trailingAnchor, constant: 16),
            bioLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -32)
        ])
    }

    private func setupHometownLabel() {
        hometownLabel.text = "Hometown"
        hometownLabel.textColor = UIColor.a2.black
        hometownLabel.font = .systemFont(ofSize: 14, weight: .semibold)
        
        view.addSubview(hometownLabel)
        hometownLabel.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            hometownLabel.topAnchor.constraint(equalTo: profileImage.bottomAnchor, constant: 40),
            hometownLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 32),
            hometownLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -32),
            hometownLabel.heightAnchor.constraint(equalToConstant: 17)
        ])
    }
    
    private func setupEnterHometown() {
        enterHometown.layer.borderWidth = 1
        enterHometown.layer.borderColor = UIColor.a2.silver.cgColor
        enterHometown.layer.cornerRadius = 8
        
        enterHometown.text = placeholderHometown
        enterHometown.textColor = UIColor.a2.black
        enterHometown.font = .systemFont(ofSize: 14)
        
        view.addSubview(enterHometown)
        enterHometown.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            enterHometown.topAnchor.constraint(equalTo: hometownLabel.bottomAnchor, constant: 4),
            enterHometown.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 32),
            enterHometown.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -32),
            enterHometown.heightAnchor.constraint(equalToConstant: 40)
        ])
    }
    
    private func setupMajorLabel() {
        majorLabel.text = "Major"
        majorLabel.textColor = UIColor.a2.black
        majorLabel.font = .systemFont(ofSize: 14, weight: .semibold)
        
        view.addSubview(majorLabel)
        majorLabel.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            majorLabel.topAnchor.constraint(equalTo: enterHometown.bottomAnchor, constant: 24),
            majorLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 32),
            majorLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -32),
            majorLabel.heightAnchor.constraint(equalToConstant: 17)
        ])
    }
    
    private func setupEnterMajor() {
        enterMajor.layer.borderWidth = 1
        enterMajor.layer.borderColor = UIColor.a2.silver.cgColor
        enterMajor.layer.cornerRadius = 8
        
        enterMajor.text = placeholderMajor
        enterMajor.textColor = UIColor.a2.black
        enterMajor.font = .systemFont(ofSize: 14)
        
        view.addSubview(enterMajor)
        enterMajor.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            enterMajor.topAnchor.constraint(equalTo: majorLabel.bottomAnchor, constant: 4),
            enterMajor.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 32),
            enterMajor.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -32),
            enterMajor.heightAnchor.constraint(equalToConstant: 40)
        ])
    }
    
    private func setupSaveButton() {
        saveButton.setTitle("Save", for: .normal)
        saveButton.setTitleColor(UIColor.a2.white, for: .normal)
        saveButton.backgroundColor = UIColor.a2.ruby
        saveButton.layer.cornerRadius = 16
        saveButton.addTarget(self, action: #selector(popSave), for: .touchUpInside)
        
        view.addSubview(saveButton)
        saveButton.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            saveButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            saveButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -64),
            saveButton.heightAnchor.constraint(equalToConstant: 56),
            saveButton.widthAnchor.constraint(equalToConstant: 329)
        ])
    }
    
    // MARK: - Button Helpers
    
    @objc func popSave() {
        delegate?.updateText(hometownToUpdate: enterHometown.text ?? "", majorToUpdate: enterMajor.text ?? "")
        navigationController?.popViewController(animated: true)
    }
    
}

