//
//  HeaderViewController.swift
//  ContainerApp
//
//  Created by Madhusudhan Reddy Putta on 02/07/21.
//

import UIKit

class HeaderViewController: UIViewController {
        
    private lazy var topSafeAreaHeight: CGFloat = { () -> CGFloat in
        var safeAreaHeight: CGFloat = 20
        if #available(iOS 11.0, *) {
          let window = UIApplication.shared.windows[0]
          let safeFrame = window.safeAreaLayoutGuide.layoutFrame
          safeAreaHeight = safeFrame.minY
        }
        return safeAreaHeight
    }()
    
    var headerView: HeaderView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        setUpHeaderView()
    }
    
    func setUpHeaderView() {
                
        headerView = HeaderView.instantiateFromNib()
        view.addSubview(headerView)
        headerView.delegate = self

        headerView.translatesAutoresizingMaskIntoConstraints = false
        headerView.topAnchor.constraint(equalTo: self.view.topAnchor).isActive = true
        headerView.heightAnchor.constraint(equalToConstant: topSafeAreaHeight+44).isActive = true
        headerView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor).isActive = true
        headerView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor).isActive = true
    }


    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

extension HeaderViewController: HeaderViewDelegate {
    func menuTapped() {
        
    }
    
    func profleTapped() {
        
    }
}

//    convenience init() {
//        self.init( nibName: nil, bundle: nil )
//    }
//
//    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
//        super.init(nibName: "HeaderViewController", bundle: nibBundleOrNil)
//    }
//
//    required init?(coder: NSCoder) {
//        super.init(coder: coder)
//    }
