//
//  ViewController.swift
//  Counter
//
//  Created by Сергей on 01.08.2025.
//

import UIKit

class ViewController: UIViewController {
    
    // MARK: - Outlets
    @IBOutlet weak var counterLabel: UILabel!
    @IBOutlet weak var plusButton: UIButton!
    @IBOutlet weak var minusButton: UIButton!
    @IBOutlet weak var resetButton: UIButton!
    @IBOutlet weak var historyTextView: UITextView!
    
    // MARK: - Properties
    private var counter = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    // MARK: - UI Setup
    private func setupUI() {
        updateCounterLabel()
        setupHistoryTextView()
        addHistoryEntry("История изменений:")
    }
    
    private func setupHistoryTextView() {
        historyTextView.isEditable = false
        historyTextView.isSelectable = false
        historyTextView.backgroundColor = UIColor.systemGray6
        historyTextView.layer.cornerRadius = 8
    }
    
    // MARK: - Actions
    @IBAction func plusButtonTapped(_ sender: UIButton) {
        counter += 1
        updateCounterLabel()
        addHistoryEntry("значение изменено на +1")
    }
    
    @IBAction func minusButtonTapped(_ sender: UIButton) {
        if counter > 0 {
            counter -= 1
            updateCounterLabel()
            addHistoryEntry("значение изменено на -1")
        } else {
            addHistoryEntry("попытка уменьшить значение счётчика ниже 0")
        }
    }
    
    @IBAction func resetButtonTapped(_ sender: UIButton) {
        counter = 0
        updateCounterLabel()
        addHistoryEntry("значение сброшено")
    }
    
    // MARK: - Helper Methods
    private func updateCounterLabel() {
        counterLabel.text = "Значение счётчика: \(counter)"
    }
    
    private func addHistoryEntry(_ message: String) {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd.MM.yyyy HH:mm:ss"
        let timestamp = dateFormatter.string(from: Date())
        
        let entry = "[\(timestamp)]: \(message)\n"
        
        if historyTextView.text.isEmpty {
            historyTextView.text = entry
        } else {
            historyTextView.text += entry
        }
        
        // Автоматическая прокрутка к концу
        let bottom = NSMakeRange(historyTextView.text.count - 1, 1)
        historyTextView.scrollRangeToVisible(bottom)
    }
}

