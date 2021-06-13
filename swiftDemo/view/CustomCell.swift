//
//  CustomCell.swift
//  swiftDemo
//
//  Created by yicen on 2021/6/13.
//

import UIKit
import SnapKit
@objc protocol CustomCellDelegate {
    @objc optional func clickCell()
    func clickBtn()
    func test(str:String)->Void
}

class CustomCell: UITableViewCell {
    open weak var  deletage:CustomCellDelegate?
    var iconView:UIImageView = UIImageView.init()
    let titleLb:UILabel = UILabel.init()
    var subTitle:UILabel = UILabel.init()
    let arrowView:UIImageView = UIImageView()
    let btn:UIButton = UIButton.init()
    var strBlock : ((_ :String,_  : String) -> Void)?

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.initUI()
    }

    
    func initUI() -> Void {
        self.separatorInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0);
        self.selectionStyle = .none
        self.iconView = UIImageView.init();
        self.contentView.addSubview(self.iconView)
        self.iconView.snp.makeConstraints { make in
            make.left.equalTo(16);
            make.centerY.equalTo(self.contentView);
        }
        
        self.titleLb.textColor = UIColor.gray
        contentView.addSubview(titleLb)
        self.titleLb.text = "123"
        self.titleLb.snp.makeConstraints { make in
            make.left.equalTo(50);
            make.centerY.equalTo(self.contentView);
        }

        arrowView.image = UIImage.init(named: "user_rightArrow_iconF")
        contentView.addSubview(self.arrowView)
        arrowView.snp.makeConstraints { make in
            make.right.equalTo(-12);
            make.centerY.equalTo(self.titleLb);
        }
        
        self.subTitle.textColor = UIColor.purple
        contentView.addSubview(subTitle)
        subTitle.snp.makeConstraints { make in
            make.trailing.equalTo(self.arrowView.snp_leading).offset(-5);
            make.centerY.equalTo(self.contentView);
        }
        
        contentView.addSubview(self.btn)
        btn.setTitle("点击", for: .normal)
        btn.snp.makeConstraints { make in
            make.center.equalToSuperview()
            make.height.equalTo(60)
            make.width.equalTo(100)
        }
//        btn.setImage(UIImage.init(named: "user_setting"), for: .normal)
        btn.backgroundColor = UIColor.systemPink
        btn.layer.cornerRadius = 5
        btn.addTarget(self, action: #selector(click(sender: )), for: .touchUpInside)
    }
    
    @objc fileprivate func click(sender:UIButton){
        print(sender)
        
        deletage?.clickBtn()
        deletage?.test(str: "使用代理传值--测试")
        strBlock?("使用闭包传值","swift")
    }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()

    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }
    
}

//-(void)setModel:(TYFUserModel *)model{
//    _model = model;
//    self.titleLb.text = EMPTY_IF_NIL(model.title);
//    self.iconView.image = model.image;
//}
//
//- (void)updateCellWithModel:(TYFUserModel *)model {
//    _model = model;
//
//    self.iconView.image = [UIImage imageFromBundleImageName:EMPTY_IF_NIL(model.imageName)];
//    self.titleLb.text = EMPTY_IF_NIL(model.title);
//    self.subTitle.text = EMPTY_IF_NIL(model.subTitle);
//    if (model.arrowImageName) {
//        self.arrowView.image = [UIImage imageFromBundleImageName:model.arrowImageName];
//    }
//}
//
//- (void)updateCellWithItemModel:(TYFBaseItemModel *)model {
//    self.iconView.image = [UIImage imageFromBundleImageName:EMPTY_IF_NIL(model.imageName)];
//    self.titleLb.text = EMPTY_IF_NIL(model.title);
//    self.subTitle.text = EMPTY_IF_NIL(model.subTitle);
//    if (model.arrowImageName) {
//        self.arrowView.image = [UIImage imageFromBundleImageName:model.arrowImageName];
//    }
//}
