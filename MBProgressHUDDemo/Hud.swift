//
//  Hud.swift
//  MBProgressHUDDemo
//
//  Created by Sergey Lukaschuk on 12.05.2022.
//

import UIKit
import MBProgressHUD

class Hud {

    let title: String
    let action: HudAction

    private var isCancel = false

    enum HudAction {
        case indeterminateExample
        case labelExample
        case detailsLabelExample
        case determinateExample
        case annularDeterminateExample
        case barDeterminateExample
        case textExample
        case customViewExample
        case cancelationExample
        case modeSwitchingExample
        case windowExample
        case networkingExample
        case determinateNSProgressExample
        case dimBackgroundExample
        case colorExample
    }

    init(title: String, action: HudAction) {
        self.title = title
        self.action = action
    }
}

extension Hud {
    func runHub(action: HudAction, view: UIView, onWindow: UIWindow) {
        switch action {
        case .indeterminateExample:
            indeterminateExample(to: view)
        case .labelExample:
            labelExample(to: view)
        case .detailsLabelExample:
            detailsLabelExample(to: view)
        case .determinateExample:
            determinateExample(to: view)
        case .annularDeterminateExample:
            annularDeterminateExample(to: view)
        case .barDeterminateExample:
            barDeterminateExample(to: view)
        case .textExample:
            textExample(to: view)
        case .customViewExample:
            customViewExample(to: view)
        case .cancelationExample:
            cancelationExample(to: view)
        case .modeSwitchingExample:
            modeSwitchingExample(to: view)
        case .windowExample:
            windowExample(onWindow: onWindow)
        case .networkingExample:
            networkingExample(to: view)
        case .determinateNSProgressExample:
            determinateNSProgressExample()
        case .dimBackgroundExample:
            dimBackgroundExample()
        case .colorExample:
            colorExample()
        }
    }

    private func indeterminateExample(to view: UIView) {
        let hub = MBProgressHUD.showAdded(to: view, animated: true)
        hub.mode = .indeterminate

        DispatchQueue.global(qos: .background).async { [weak self] in
            self?.doSomething()
            DispatchQueue.main.async {
                hub.hide(animated: true)
            }
        }
    }

    private func labelExample(to view: UIView) {
        let hub = MBProgressHUD.showAdded(to: view, animated: true)
        hub.label.text = "Loading..."

        DispatchQueue.global(qos: .background).async { [weak self] in
            self?.doSomething()
            DispatchQueue.main.async {
                hub.hide(animated: true)
            }
        }
    }

    private func detailsLabelExample(to view: UIView) {
        let hub = MBProgressHUD.showAdded(to: view, animated: true)
        hub.label.text = "Loading..."
        hub.detailsLabel.text = "Please, waiting!"

        DispatchQueue.global(qos: .background).async { [weak self] in
            self?.doSomething()
            DispatchQueue.main.async {
                hub.hide(animated: true)
            }
        }
    }

    private func determinateExample(to view: UIView) {
        let hub = MBProgressHUD.showAdded(to: view, animated: true)
        hub.mode = .determinate
        hub.label.text = "Loading..."

        DispatchQueue.global(qos: .background).async { [weak self] in
            self?.doSomethingWithProgress(in: hub)
            DispatchQueue.main.async {
                hub.hide(animated: true)
            }
        }
    }

    private func annularDeterminateExample(to view: UIView) {
        let hub = MBProgressHUD.showAdded(to: view, animated: true)
        hub.mode = .annularDeterminate
        hub.label.text = "Loading..."

        DispatchQueue.global(qos: .background).async { [weak self] in
            self?.doSomethingWithProgress(in: hub)
            DispatchQueue.main.async {
                hub.hide(animated: true)
            }
        }
    }

    private func barDeterminateExample(to view: UIView) {
        let hub = MBProgressHUD.showAdded(to: view, animated: true)
        hub.mode = .determinateHorizontalBar
        hub.label.text = "Loading..."

        DispatchQueue.global(qos: .background).async { [weak self] in
            self?.doSomethingWithProgress(in: hub)
            DispatchQueue.main.async {
                hub.hide(animated: true)
            }
        }
    }

    private func textExample(to view: UIView) {
        let hub = MBProgressHUD.showAdded(to: view, animated: true)
        hub.mode = .text
        hub.label.text = "Message here"
        hub.offset = CGPoint(x: 0, y: MBProgressMaxOffset)
        hub.hide(animated: true, afterDelay: 3)
    }

    private func customViewExample(to view: UIView) {
        let hub = MBProgressHUD.showAdded(to: view, animated: true)
        hub.mode = .customView
        hub.label.text = "Success"

        let image = UIImage(systemName: "checkmark")
        hub.customView = UIImageView(image: image)
        hub.customView?.size(CGSize(width: 50, height: 50))
        hub.customView?.tintColor = .black

        hub.hide(animated: true, afterDelay: 1)
    }

    private func cancelationExample(to view: UIView) {
        let hub = MBProgressHUD.showAdded(to: view, animated: true)
        hub.mode = .determinate
        hub.label.text = "Loading...."
        hub.button.setTitle("Cancel", for: .normal)
        hub.button.addTarget(self, action: #selector(cancelTap), for: .touchUpInside)

        DispatchQueue.global(qos: .background).async { [weak self] in
            self?.doSomethingWithProgress(in: hub)
            DispatchQueue.main.async {
                hub.hide(animated: true)
            }
        }
    }

    private func modeSwitchingExample(to view: UIView) {
        let hub = MBProgressHUD.showAdded(to: view, animated: true)
        hub.mode = .indeterminate
        hub.label.text = "Preparing..."

        DispatchQueue.global(qos: .background).async { [weak self] in
            self?.doSomethingWithMixedProgress(in: hub)
            DispatchQueue.main.async {
                hub.hide(animated: true)
            }
        }
    }

    private func windowExample(onWindow: UIWindow) {
        let hub = MBProgressHUD.showAdded(to: onWindow, animated: true)
        hub.mode = .indeterminate

        DispatchQueue.global(qos: .background).async { [weak self] in
            self?.doSomething()
            DispatchQueue.main.async {
                hub.hide(animated: true)
            }
        }
    }

    private func networkingExample(to view: UIView) {
        let hub = MBProgressHUD.showAdded(to: view, animated: true)
        hub.label.text = "Downloading..."
        doSomeNetworkWorkWithProgress(in: hub)
    }

    private func determinateNSProgressExample() {
        print(#function)
    }

    private func dimBackgroundExample() {
        print(#function)
    }

    private func colorExample() {
        print(#function)
    }

    private func doSomething() {
        sleep(5)
    }

    private func doSomethingWithProgress(in hub: MBProgressHUD) {
        isCancel = false
        var progress: Float = 0.0
        while progress < 1.0 {
            if isCancel { return }
            progress += 0.02
            DispatchQueue.main.async {
                hub.progress = progress
                if progress < 1.0 {
                    hub.detailsLabel.text = "\(Int(round(progress * 100))) %"
                }
            }
            usleep(10000)
        }
    }

    private func doSomethingWithMixedProgress(in hub: MBProgressHUD) {
        sleep(2)

        DispatchQueue.main.async {
            hub.mode = .determinate
            hub.label.text = "Loading..."
        }

        var progress: Float = 0.0
        while progress < 1.0 {
            progress += 0.02
            DispatchQueue.main.async {
                hub.progress = progress
                if progress < 1.0 {
                    hub.detailsLabel.text = "\(Int(round(progress * 100))) %"
                }
            }
            usleep(10000)
        }

        DispatchQueue.main.async {
            hub.mode = .indeterminate
            hub.label.text = "Cleaning up..."
        }

        sleep(2)

        DispatchQueue.main.async {
            hub.mode = .customView
            hub.label.text = "Success"

            let image = UIImage(systemName: "checkmark")
            hub.customView = UIImageView(image: image)
            hub.customView?.size(CGSize(width: 50, height: 50))
            hub.customView?.tintColor = .black

            hub.hide(animated: true, afterDelay: 1)
        }
        sleep(3)
    }


    private func doSomeNetworkWorkWithProgress(in hub: MBProgressHUD) {
        let session = URLSession(configuration: .default)
        guard let url = URL(string: "https://www.apple.com/newsroom/images/product/iphone/standard/Images-of-WWDC22-iOS16.zip") else {
            DispatchQueue.main.async {
                hub.mode = .text
                hub.label.text = "Network Error"
                hub.detailsLabel.text = "Please, check your internet connection and try later."
                hub.hide(animated: true, afterDelay: 3)
            }
            return
        }

        let task = session.downloadTask(with: url) { url, response, error in
            if error != nil {
                print(error ?? "error \(error.debugDescription)")
                DispatchQueue.main.async {
                    hub.mode = .text
                    hub.label.text = "Network Error"
                    hub.detailsLabel.text = "Please, check your internet connection and try later."
                    hub.hide(animated: true, afterDelay: 3)
                }
                return
            }
        }

        DispatchQueue.main.async {
            hub.mode = .customView
            hub.label.text = "Done"
            let image = UIImage(systemName: "checkmark")
            hub.customView = UIImageView(image: image)
            hub.isSquare = true
            hub.hide(animated: true, afterDelay: 3)
        }

        task.resume()
    }


    @objc private func cancelTap() {
        isCancel = true
    }
}
