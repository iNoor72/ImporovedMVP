//
//  Presenter.swift
//  PrimeNumbers
//
//  Created by Noor Walid on 23/04/2021.
//

import Foundation
import UIKit

protocol PresenterDelegate {
    func setCounter()
}

protocol PresenterProtocol {
    var counter : Int { get }
    func increase()
    func decrease()
    func isPrime(value: Int) -> Bool
}


//General for all ViewControllers (ViewController, TableViewController, etc...)
typealias ViewPresenter = PresenterDelegate & UIResponder

class Presenter : PresenterProtocol {
   
    weak var delegate: ViewProtocol?
    
    var counter = 0 {
        didSet{
            setCounter()
        }
    }
    
    init(delegate: ViewProtocol) {
        self.delegate = delegate
    }
    
    func increase() {
        counter += 1
    }
    
    func decrease() {
        guard counter > 0 else { return }
        
        counter -= 1
    }
    
    func isPrime(value: Int) -> Bool {
        if value <= 1 { return false }
        if value == 2 { return true }
        for number in 2..<value {
            if value % number == 0 { return false }
        }
        return true
    }
    
    
    func setCounter() {
        delegate?.setCounter(with: counter)
    }
}
