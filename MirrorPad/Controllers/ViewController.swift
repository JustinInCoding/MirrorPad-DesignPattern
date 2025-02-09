/// Copyright (c) 2018 Razeware LLC
///
/// Permission is hereby granted, free of charge, to any person obtaining a copy
/// of this software and associated documentation files (the "Software"), to deal
/// in the Software without restriction, including without limitation the rights
/// to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
/// copies of the Software, and to permit persons to whom the Software is
/// furnished to do so, subject to the following conditions:
///
/// The above copyright notice and this permission notice shall be included in
/// all copies or substantial portions of the Software.
///
/// Notwithstanding the foregoing, you may not use, copy, modify, merge, publish,
/// distribute, sublicense, create a derivative work, and/or sell copies of the
/// Software in any work that is designed, intended, or marketed for pedagogical or
/// instructional purposes related to programming, coding, application development,
/// or information technology.  Permission for such use, copying, modification,
/// merger, publication, distribution, sublicensing, creation of derivative works,
/// or sale is expressly withheld.
///
/// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
/// IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
/// FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
/// AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
/// LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
/// OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
/// THE SOFTWARE.

import UIKit

public class ViewController: UIViewController {

	// MARK: - properties
	public lazy var sharedFacade: ShareFacade =
	ShareFacade(entireDrawing: drawViewContainer,
							inputDrawing: inputDrawView,
							parentViewController: self)
	
  // MARK: - Outlets
  @IBOutlet public var drawViewContainer: UIView!
  @IBOutlet public var inputDrawView: DrawView!
  @IBOutlet public var mirrorDrawViews: [DrawView]!

  // MARK: - Actions
  @IBAction public func animatePressed(_ sender: Any) {
    inputDrawView.animate()
		mirrorDrawViews.forEach { $0.copyLines(from: inputDrawView) }
		mirrorDrawViews.forEach { $0.animate() }
  }

  @IBAction public func clearPressed(_ sender: Any) {
    inputDrawView.clear()
    mirrorDrawViews.forEach { $0.clear() }
  }

  @IBAction public func sharePressed(_ sender: Any) {
		sharedFacade.presentShareController()
  }
  
  // MARK: - View Lifecycle
  public override var preferredScreenEdgesDeferringSystemGestures: UIRectEdge {
    return .top
  }
	
	public override func viewDidLoad() {
		super.viewDidLoad()
		mirrorDrawViews.forEach {
			inputDrawView.addDelegate($0)
		}
	}
}
