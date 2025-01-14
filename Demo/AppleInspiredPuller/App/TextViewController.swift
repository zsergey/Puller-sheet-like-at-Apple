import UIKit
import Puller

final class TextViewController: UIViewController {
  
  var text = "Eat some more of these soft French buns and drink some tea."
  
  private var label: UILabel?
  private let insets: UIEdgeInsets = .init(top: 65, left: 16, bottom: 16, right: 16)
  
  override func loadView() {
    view = PullerResizableView()
  }
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    view.backgroundColor = .lightTurquoiseColor
    setupView()
  }
  
  override func viewDidLayoutSubviews() {
    super.viewDidLayoutSubviews()
    
    let defaultHeight = (label?.frame.size.height ?? 0) + insets.top + insets.bottom
    (view as? PullerResizableView)?.defaultHeight = defaultHeight
  }
  
  private func setupView() {
    let numberOfLines = Int.random(in: 1...40)
    let phrase = "Eat some more of these soft French buns and drink some tea."
    var text = ""
    for _ in 0..<numberOfLines {
      text += text.isEmpty ? phrase : " " + phrase
    }
    
    let label = UILabel()
    label.numberOfLines = 0
    label.text = text
    label.textColor = .grapiteColor
    view.addSubview(label)
    label.top(to: view, constant: insets.top)
    label.left(to: view, constant: insets.left)
    label.right(to: view, constant: insets.right)
    self.label = label
  }
}
