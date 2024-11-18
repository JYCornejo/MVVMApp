//
//  ViewController.swift
//  MVVMTable
//
//  Created by MacOsX on 11/17/24.
//


// ViewController.swift
import UIKit

class ViewController: UIViewController {
private let viewModel = MultiplicationViewModel()

private let numberInputField: UITextField = {
let textField = UITextField()
textField.placeholder = "Ingresa un número"
textField.borderStyle = .roundedRect
textField.keyboardType = .numberPad
textField.translatesAutoresizingMaskIntoConstraints = false
return textField
}()

private let generateButton: UIButton = {
let button = UIButton(type: .system)
button.setTitle("Generar Tabla", for: .normal)
button.translatesAutoresizingMaskIntoConstraints = false
return button
}()

private let resultsTextView: UITextView = {
let textView = UITextView()
textView.isEditable = false
textView.font = .systemFont(ofSize: 16)
textView.layer.borderColor = UIColor.gray.cgColor
textView.layer.borderWidth = 1
textView.layer.cornerRadius = 5
textView.translatesAutoresizingMaskIntoConstraints = false
return textView
}()

override func viewDidLoad() {
super.viewDidLoad()
view.backgroundColor = .white
setupUI()
setupActions()
}

private func setupUI() {
view.addSubview(numberInputField)
view.addSubview(generateButton)
view.addSubview(resultsTextView)

NSLayoutConstraint.activate([
numberInputField.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
numberInputField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
numberInputField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),

generateButton.topAnchor.constraint(equalTo: numberInputField.bottomAnchor, constant: 10),
generateButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),

resultsTextView.topAnchor.constraint(equalTo: generateButton.bottomAnchor, constant: 20),
resultsTextView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
resultsTextView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
resultsTextView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -20),
])
}

private func setupActions() {
generateButton.addTarget(self, action: #selector(generateTable), for: .touchUpInside)
}

@objc private func generateTable() {
guard let input = numberInputField.text, let number = Int(input) else {
resultsTextView.text = "Por favor, ingresa un número válido."
return
}

viewModel.updateNumber(number)
resultsTextView.text = viewModel.tableData.joined(separator: "\n")
}
}
