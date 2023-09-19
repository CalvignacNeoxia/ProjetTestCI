import UIKit

// MARK: - MainTabBarViewController
class MainTabBarViewController: UITabBarController {

    @IBOutlet weak var myTabBar: UITabBar?
    var arrayTabBarItem = [UITabBarItem]()

    override func viewDidLoad() {
         super.viewDidLoad()

         uiSetup()
         tabBarCustom()

     }

}

// MARK: - Setup UI Implementation
private extension MainTabBarViewController {

    func uiSetup() {

        let fontAttributes = [
           NSAttributedString.Key.font: UIFont(
           name: "Marker felt",
           size: 30)
        ]

        UITabBarItem.appearance().setTitleTextAttributes(
            fontAttributes as [NSAttributedString.Key: Any], for: .normal
        )
    }

}

// MARK: - Variables
private extension MainTabBarViewController {

    var arrayTitle: [String] {[
        "Search",
        "Favorite"
    ]}

}

extension MainTabBarViewController: UITabBarControllerDelegate {
    // UITabBarDelegate
    override func tabBar(_ myTabBar: UITabBar, didSelect item: UITabBarItem) {
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        appDelegate.favorite = myTabBar.selectedItem?.title == arrayTitle[1] ? true : false
    }
}

// MARK: - Tab Bar custum
 extension MainTabBarViewController {

    func tabBarCustom() {

        myTabBar?.tintColor = .gray

        guard let myTabBarItem0 = tabBar.items?[0],
              let myTabBarItem1 = tabBar.items?[1]
        else {return}

        arrayTabBarItem.append(myTabBarItem0)
        arrayTabBarItem.append(myTabBarItem1)

        for counter in 0...1 {
            arrayTabBarItem[counter].title = arrayTitle[counter]
        }

        tabBar.tintColor = .white
        tabBar.unselectedItemTintColor = .gray
        
        tabBar.layer.addWaghaBorder(edge: .top, color: .gray, thickness: 10)
        tabBar.layer.addWaghaBorder(edge: .middle, color: .gray, thickness: 10)
    }

}
