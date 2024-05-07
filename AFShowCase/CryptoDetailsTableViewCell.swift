import UIKit
import SnapKit

class CryptoDetailsTableViewCell: UITableViewCell {
    
    static let cellIdentifier = "CryptoDetailsTableViewCell"
    
    lazy var nameLabel: UILabel = {
        let label = UILabel()
        label.text = ""
        label.font = .systemFont(ofSize: 15, weight: .regular)
        return label
    }()
    
    lazy var rankLabel: UILabel = {
        let label = UILabel()
        label.text = ""
        label.font = .systemFont(ofSize: 15, weight: .regular)
        return label
    }()
    
    lazy var changeLabel: UILabel = {
        let label = UILabel()
        label.text = ""
        label.font = .systemFont(ofSize: 15, weight: .regular)
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupViews() {
        contentView.addSubview(nameLabel)
        contentView.addSubview(rankLabel)
        contentView.addSubview(changeLabel)
        setupConstraints()
    }
    
    private func setupConstraints() {
        nameLabel.snp.makeConstraints { make in
            make.leading.top.equalToSuperview().inset(8)
        }
        
        rankLabel.snp.makeConstraints { make in
            make.trailing.top.equalToSuperview().inset(8)
        }
        
        changeLabel.snp.makeConstraints { make in
            make.top.equalTo(nameLabel.snp.bottom)
            make.leading.bottom.equalToSuperview().inset(8)
        }
    }
    
    func configure(_ detail: CryptoDetail){
        nameLabel.text = detail.symbol
        rankLabel.text = detail.rank
        changeLabel.text = detail.changePercent24Hr
    }
    
}



