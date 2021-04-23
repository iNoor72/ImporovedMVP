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
//General
typealias ViewPresenter = PresenterDelegate & UIResponder

class Presenter {
    weak var delgate: ViewPresenter?
    
    var counter = 0 {
        didSet{
            setCounter()
        }
    }
    
     func isPrime(value: Int) -> Bool {
        if value <= 1 { return false }
        if value == 2 { return true }
        for number in 2..<value {
            if value % number == 0 { return false }
        }
        return true
    }
    
    private func setCounter() {
        delgate?.setCounter()
    }
}
