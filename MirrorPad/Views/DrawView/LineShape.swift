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

public class LineShape: CAShapeLayer, Copying {

  // MARK: - Instance Properties
  private let bezierPath: UIBezierPath

  // MARK: - Object Lifecycle
  public init(color: UIColor, width: CGFloat, startPoint: CGPoint) {
    bezierPath = UIBezierPath()
    bezierPath.move(to: startPoint)
    super.init()

    fillColor = nil
    lineWidth = width
    path = bezierPath.cgPath
    strokeColor = color.cgColor
  }

  public override convenience init(layer: Any) {
    let lineShape = layer as! LineShape
		self.init(lineShape)
  }
	
	public required init(_ prototype: LineShape) {
		bezierPath = prototype.bezierPath.copy() as! UIBezierPath
		// CALayer 的 init 方法
		super.init(layer: prototype)
		fillColor = nil
		lineWidth = prototype.lineWidth
		path = bezierPath.cgPath
		strokeColor = prototype.strokeColor
	}

  public required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) is not supported")
  }

  // MARK: - Instance Methods
  public func addPoint(_ point: CGPoint) {
    bezierPath.addLine(to: point)
    path = bezierPath.cgPath
  }
}
