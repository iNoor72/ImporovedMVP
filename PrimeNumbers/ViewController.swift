//
//  ViewController.swift
//  PrimeNumbers
//
//  Created by Noor Walid on 23/04/2021.
//

//This is MVP example

import UIKit

class ViewController: UIViewController, PresenterDelegate {
    @IBOutlet weak var whatIsPrimeButton: UIButton!
    @IBOutlet weak var counterLabel: UILabel!
    
    var presenter: Presenter = Presenter()

    override func viewDidLoad() {
        super.viewDidLoad()
        presenter.delgate = self
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationItem.largeTitleDisplayMode = .always
        
    }
    

    @IBAction func plusTapped(_ sender: UIButton) {
        presenter.counter += 1
    }
    @IBAction func minusTapped(_ sender: UIButton) {
        guard presenter.counter > 0 else {return}
        
        presenter.counter -= 1
    }
    @IBAction func isThisPrime(_ sender: UIButton) {
        switch presenter.isPrime(value: presenter.counter) {
        case true:
            let alert = UIAlertController(title: "Is Prime Finished!", message: "We checked the passed number, the result is: The number \(presenter.counter) is prime 🎉", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Horrray! 🥳", style: .default, handler: nil))
            present (alert, animated: true)
        case false:
            let alert = UIAlertController(title: "Is Prime Finished!", message: "We checked the passed number, the result is: The number \(presenter.counter) is not prime 😔", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Sorry 🥲", style: .default, handler: nil))
            present (alert, animated: true)
        }
        print(presenter.isPrime(value: presenter.counter))
    }
    @IBAction func whatIsPrime(_ sender: UIButton) {
    }
    func setCounter() {
        counterLabel.text = "\(presenter.counter)"
    }
    
}

