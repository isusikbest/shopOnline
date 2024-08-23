//
//  CartViewController.swift
//  shopOnline
//
//  Created by Vladimir Liubarskiy on 03/08/2024.
//

import UIKit

class CartViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    
    @IBOutlet var cartTableView: UITableView!
    @IBOutlet var totalPriceLabel: UILabel!
    @IBOutlet var emptyViewLabel: UIView!
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        reload()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configure()
        
    }
   
    func reload() {
        emptyViewLabel.isHidden = CartService.shared.cart.count > 0
        cartTableView.reloadData()
        if let footer = cartTableView.tableFooterView as? CartFooterView {
            footer.set(items: CartService.shared.cart)
            footer.onTapCheckout = {
                let storyBoard  = UIStoryboard(name: "Main", bundle: nil)
               let controller = storyBoard.instantiateViewController(withIdentifier: "CheckOutViewController") as! CheckOutViewController
                self.present(controller, animated: true)
                
            }
        }
        
    }
    func configure() {
        cartTableView.delegate = self
        cartTableView.dataSource = self
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return CartService.shared.cart.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CartCell", for: indexPath) as! CartCell
        cell.set(product: CartService.shared.cart[indexPath.row])
        return cell
    }
    
}
