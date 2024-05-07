import UIKit

class ViewController: UIViewController {
    let manager = AFManager.shared
    
    var cryptos = [CryptoDetail]() {
        didSet {
            tableView.reloadData()
        }
    }
    
    lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(CryptoDetailsTableViewCell.self, forCellReuseIdentifier: CryptoDetailsTableViewCell.cellIdentifier)
        return tableView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        view.addSubview(tableView)
        tableView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        
        manager.getCrypto { model in
//            print(model)
            self.cryptos = model?.data ?? []
        }
        
    }

}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        cryptos.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: CryptoDetailsTableViewCell.cellIdentifier, for: indexPath) as? CryptoDetailsTableViewCell else { return UITableViewCell() }
        cell.configure(cryptos[indexPath.row])
        return cell
    }
    
}

