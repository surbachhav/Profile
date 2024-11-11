//
//  ProfileVC.swift
//  A2
//
//  Created by Vin Bui on 6/4/23.
//

import UIKit

class ProfileVC: UIViewController {
    
    // MARK: - Properties (view)
    
    private let profileImage = UIImageView()
    private let nameLabel = UILabel()
    private let bioLabel = UILabel()
    
    private let hometownImage = UIImageView()
    private let hometownLabel = UILabel()

    private let majorImage = UIImageView()
    private let majorLabel = UILabel()
    
    private let editProfileButton = UIButton()
    
    // MARK: - Properties (data)
    private let name: String = "Vin Bui"
    private let bio: String = "Never waste diamonds on a hoe"
    
    private var hometown: String = "Dallax, TX"
    private var major: String = "Information Science"
    
    // MARK: - viewDidLoad
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "My Profile"
        view.backgroundColor = UIColor.a2.white
        
        setupProfileImage()
        setupNameLabel()
        setupBioLabel()
        
        setupHometownImage()
        setupHometownLabel()
        
        setupMajorImage()
        setupMajorLabel()
        
        setupEditProfileButton()
    }
    
    // MARK: - Set Up Views
    
    private func setupProfileImage() {
        profileImage.image = UIImage(named: "profile")
        
        profileImage.translatesAutoresizingMaskIntoConstraints = false
        
        profileImage.layer.cornerRadius = profileImage.frame.width / 2
        profileImage.layer.masksToBounds = true
        view.addSubview(profileImage)
        
        NSLayoutConstraint.activate([
            profileImage.widthAnchor.constraint(equalToConstant: 128),
            profileImage.heightAnchor.constraint(equalToConstant: 128),
            profileImage.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            profileImage.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 32)
        ])
    }
    
    private func setupNameLabel() {
        nameLabel.text = name
        nameLabel.textColor = UIColor.a2.black
        nameLabel.font = .systemFont(ofSize: 32, weight: .semibold)
        
        view.addSubview(nameLabel)
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            nameLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            nameLabel.topAnchor.constraint(equalTo: profileImage.bottomAnchor, constant: 16),
        ])
    }
    
    private func setupBioLabel() {
        bioLabel.text = bio
        bioLabel.textColor = UIColor.a2.black
        bioLabel.font = .italicSystemFont(ofSize: 16)
        
        view.addSubview(bioLabel)
        bioLabel.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            bioLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            bioLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 8)
        ])
    }
    
    private func setupHometownImage() {
        hometownImage.image = UIImage(named: "hometown")
        
        hometownImage.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(hometownImage)
        
        NSLayoutConstraint.activate([
            hometownImage.widthAnchor.constraint(equalToConstant: 24),
            hometownImage.heightAnchor.constraint(equalToConstant: 24),
            hometownImage.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 32),
            hometownImage.topAnchor.constraint(equalTo: bioLabel.bottomAnchor, constant: 48)
        ])
    }
    
    private func setupHometownLabel() {
        hometownLabel.text = hometown
        hometownLabel.textColor = UIColor.a2.black
        hometownLabel.font = .systemFont(ofSize: 16)
        
        view.addSubview(hometownLabel)
        hometownLabel.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            hometownLabel.leadingAnchor.constraint(equalTo: hometownImage.trailingAnchor, constant: 16),
            hometownLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -32),
            hometownLabel.centerYAnchor.constraint(equalTo: hometownImage.centerYAnchor),
            hometownLabel.heightAnchor.constraint(equalToConstant: 24)
        ])
    }
    
    private func setupMajorImage() {
        majorImage.image = UIImage(named: "major")
        
        majorImage.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(majorImage)
        
        NSLayoutConstraint.activate([
            majorImage.widthAnchor.constraint(equalToConstant: 24),
            majorImage.heightAnchor.constraint(equalToConstant: 24),
            majorImage.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 32),
            majorImage.topAnchor.constraint(equalTo: hometownImage.bottomAnchor, constant: 24)
        ])
    }
    
    private func setupMajorLabel() {
        majorLabel.text = major
        majorLabel.textColor = UIColor.a2.black
        majorLabel.font = .systemFont(ofSize: 16)
        
        view.addSubview(majorLabel)
        majorLabel.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            majorLabel.leadingAnchor.constraint(equalTo: majorImage.trailingAnchor, constant: 16),
            majorLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -32),
            majorLabel.centerYAnchor.constraint(equalTo: majorImage.centerYAnchor),
            majorLabel.heightAnchor.constraint(equalToConstant: 24)
        ])
    }
    
    private func setupEditProfileButton() {
        editProfileButton.setTitle("Edit Profile", for: .normal)
        editProfileButton.setTitleColor(UIColor.a2.white, for: .normal)
        editProfileButton.backgroundColor = UIColor.a2.ruby
        editProfileButton.layer.cornerRadius = 16
        editProfileButton.addTarget(self, action: #selector(pushEditProfile), for: .touchUpInside)
        
        view.addSubview(editProfileButton)
        editProfileButton.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            editProfileButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            editProfileButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -64),
            editProfileButton.heightAnchor.constraint(equalToConstant: 56),
            editProfileButton.widthAnchor.constraint(equalToConstant: 329)
        ])
    }
    
    // MARK: - Button Helpers
    
    @objc func pushEditProfile() {
        let editProfileVC = EditProfileVC(name: name, bio: bio, placeholderHometown: hometown, placeholderMajor: major, delegate: self)
        navigationController?.pushViewController(editProfileVC, animated: true)
    }
    
}

protocol UpdateTextDelegate: AnyObject {
    func updateText(hometownToUpdate: String, majorToUpdate: String)
}

extension ProfileVC: UpdateTextDelegate {
    
    func updateText(hometownToUpdate: String, majorToUpdate: String) {
        self.hometown = hometownToUpdate
        self.hometownLabel.text = hometownToUpdate
        
        self.major = majorToUpdate
        self.majorLabel.text = majorToUpdate
    }
    
}
