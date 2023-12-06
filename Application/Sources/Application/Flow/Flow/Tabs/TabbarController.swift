import UIKit
 
class TabBarController: UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)

        // 초기 위치 설정 (화면 위쪽)
        self.tabBar.center = CGPoint(x: self.tabBar.center.x, y: self.tabBar.center.y - self.tabBar.frame.size.height)

        // 애니메이션 적용
        UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 0.5, initialSpringVelocity: 0.5, options: .curveEaseInOut, animations: {
            // 최종 위치 설정 (원래의 위치)
            self.tabBar.center = CGPoint(x: self.tabBar.center.x, y: self.tabBar.center.y + self.tabBar.frame.size.height)
        }, completion: nil)
    }

    override func tabBar(_ tabBar: UITabBar, didSelect item: UITabBarItem) {
        
        guard let idx = tabBar.items?.firstIndex(of: item), tabBar.subviews.count > idx + 1, let imageView = tabBar.subviews[idx + 1].subviews.compactMap ({ $0 as? UIImageView }).first else {
                  return
              }
        
        performSpringAnimation(imgView: imageView)
    }
    
    //이미지뷰에 스프링 애니메이션 적용하기
    func performSpringAnimation(imgView: UIImageView) {
        
        UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 0.5, initialSpringVelocity: 0.5, options: .curveEaseInOut, animations: {
            
            imgView.transform = CGAffineTransform.init(scaleX: 1.4, y: 1.4)
            
            UIView.animate(withDuration: 0.5, delay: 0.2, usingSpringWithDamping: 0.5, initialSpringVelocity: 0.5, options: .curveEaseInOut, animations: {
                imgView.transform = CGAffineTransform.init(scaleX: 1, y: 1)
            }) { (flag) in
            }
        }) { (flag) in
            
        }
    }
    
}
