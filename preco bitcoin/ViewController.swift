//
//  ViewController.swift
//  preco bitcoin
//
//  Created by Helder Rocha on 09/03/18.
//  Copyright © 2018 Helder Rocha. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        if let url = URL(string: "https://blockchain.info/pt/ticker") {
            let tarefa = URLSession.shared.dataTask(with: url) { (dados, requisicao, erro) in
                if erro == nil {
                    if let dadosDeRetorno = dados {
                        do {
                            if let objetoJson = try JSONSerialization.jsonObject(with: dadosDeRetorno, options: []) as? [String: Any] {
                                if let brl = objetoJson["BRL"] as? [String: Any]{
                                    if let preco = brl["buy"] as?  Float {
                                            print(preco)
                                    }
                                
                                }
                            }
                            
                        } catch {
                            print("erro ao realizar requisição")
                        }
                    }
                } else {
                    
                }
            }
            
            tarefa.resume()
        }
    }
    
   

}

