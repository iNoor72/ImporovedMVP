//
//  ViewController.swift
//  PrimeNumbers
//
//  Created by Noor Walid on 23/04/2021.
//
    
//This is MVP example

import UIKit

protocol ViewProtocol: AnyObject{
    func setCounter(with value: Int)
}

class ViewController: UIViewController {
    @IBOutlet weak var whatIsPrimeButton: UIButton!
    @IBOutlet weak var counterLabel: UILabel!
    
    var presenter: PresenterProtocol?

    override func viewDidLoad() {
        super.viewDidLoad()
        presenter = Presenter(delegate: self)
        
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationItem.largeTitleDisplayMode = .always
        
        setCounter(with: 0)
        
    }
    

    @IBAction func plusTapped(_ sender: UIButton) {
        presenter?.increase()
    }
    @IBAction func minusTapped(_ sender: UIButton) {
        guard presenter?.counter ?? 0 > 0 else {return}
        
        presenter?.decrease()
    }
    @IBAction func isThisPrime(_ sender: UIButton) {
        switch presenter?.isPrime(value: presenter?.counter ?? 0) {
        case true:
            let alert = UIAlertController(title: "Is Prime Finished!", message: "We checked the passed number, the result is: The number \(presenter?.counter ?? 2) is prime 🎉", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Horrray! 🥳", style: .default, handler: nil))
            present (alert, animated: true)
            
        case false:
            let alert = UIAlertController(title: "Is Prime Finished!", message: "We checked the passed number, the result is: The number \(presenter?.counter ?? 0) is not prime 😔", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Sorry 🥲", style: .default, handler: nil))
            present (alert, animated: true)
            
        case .none: break
            
        case .some(_): break
        }
    }
        
    @IBAction func whatIsPrime(_ sender: UIButton) {
    }
}

extension ViewController: ViewProtocol {
    func setCounter(with value: Int) {
        counterLabel.text = "\(presenter?.counter ?? 0)"
    }
}

