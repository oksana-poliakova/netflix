//
//  OnboardingScreenView.swift
//  Nexflix
//
//  Created by Oksana Poliakova on 13.01.2023.
//

import UIKit

final class OnboardingScreenView: UIView {
    
    // MARK: - Properties
    
    private var onboardingScreens: [Onboarding] =
                                        [Onboarding(title: "Watch on any device",
                                                    subtitle: "Stream on your phone, tablet, laptop, and TV without paying more",
                                                    image: UIImage(named: "onboarding1")),
                                         Onboarding(title: "Download and go",
                                                    subtitle: "Save your data, watch offline on a plane, train, or submarine...",
                                                    image: UIImage(named: "onboarding2")),
                                         Onboarding(title: "No pesky contracts",
                                                    subtitle: "Join today, cancel anytime",
                                                    image: UIImage(named: "onboarding3"))]
    
    
    private var pageViewController: UIPageViewController?
    private var pageControll: UIPageControl = UIPageControl(frame: .zero)
    private var pageViewControllers: [OnboardingContentViewController] = []
    private var currentIndex: Int = 0
    
    // MARK: - Init
    
    init() {
        super.init(frame: .zero)
        
        setupPages()
        setupPageController()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Private functions
    
    private func setupPageController() {
        pageViewController = UIPageViewController(transitionStyle: .scroll, navigationOrientation: .horizontal)
        
        guard let pageViewController = pageViewController else { return }
        pageViewController.dataSource = self
        pageViewController.delegate = self
        pageViewController.view.frame = CGRect(x: 0, y: 0, width: bounds.width, height: bounds.height)
        
        let initialViewController = viewControllerAtIndex(currentIndex)
        pageViewController.setViewControllers([initialViewController], direction: .forward, animated: false)
        
        // Appearance
        guard let pageView = pageViewController.view else { return }
        [pageView, pageControll].forEach {
            $0.translatesAutoresizingMaskIntoConstraints = false
            addSubview($0)
        }
        
        // Constraints
        NSLayoutConstraint.activate([
            pageView.leadingAnchor.constraint(equalTo: leadingAnchor),
            pageView.topAnchor.constraint(equalTo: topAnchor),
            pageView.trailingAnchor.constraint(equalTo: trailingAnchor),
            pageView.bottomAnchor.constraint(equalTo: pageControll.topAnchor, constant: 2),
            
            pageControll.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -4),
            pageControll.centerXAnchor.constraint(equalTo: centerXAnchor),
            pageControll.heightAnchor.constraint(equalToConstant: 10)
        ])
    }
    
    private func setupPages() {
        // Map from the onboardings model to the OnboardingContentViewController
        pageViewControllers = onboardingScreens.isEmpty ? [returnPage(index: 0, onboarding: Onboarding(title: "", subtitle: ""))] : onboardingScreens.enumerated().map { returnPage(index: $0.offset, onboarding: Onboarding(title: $0.element.title, subtitle: $0.element.subtitle, image: $0.element.image)) }
        pageControll.numberOfPages = pageViewControllers.count
        pageControll.isHidden = onboardingScreens.count < 2
        pageViewController?.setViewControllers([self.viewControllerAtIndex(self.currentIndex)], direction: .forward, animated: false)
    }
    
    // MARK: - Factory function method

    private func returnPage(index: Int, onboarding: Onboarding) -> OnboardingContentViewController {
        let onboardingContentViewController = OnboardingContentViewController(onboarding: onboarding)
        onboardingContentViewController.index = index
        return onboardingContentViewController
    }
    
    private func viewControllerAtIndex(_ index: Int) -> UIViewController {
        if pageViewControllers.isEmpty {
            return OnboardingContentViewController(onboarding: Onboarding(title: "", subtitle: ""))
        } else {
            return pageViewControllers[index]
        }
    }
}

// MARK: - UIPageViewControllerDataSource

extension OnboardingScreenView: UIPageViewControllerDataSource {
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        guard var index = (viewController as? OnboardingContentViewController)?.index else { return nil }
        
        index += 1
        
        if index == pageViewControllers.count {
            return nil
        }
        
        return viewControllerAtIndex(index)
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        guard var index = (viewController as? OnboardingContentViewController)?.index else { return nil }
    
        if index == 0 {
            return nil
        }
        
        index -= 1
        
        return viewControllerAtIndex(index)
    }
}

// MARK: - UIPageViewControllerDelegate

extension OnboardingScreenView: UIPageViewControllerDelegate {
    func pageViewController(_ pageViewController: UIPageViewController, didFinishAnimating finished: Bool, previousViewControllers: [UIViewController], transitionCompleted completed: Bool) {
        guard completed else { return }
        
        guard let pageController = self.pageViewController, let viewControllers = pageController.viewControllers, let lastViewController = viewControllers.first, let index = (lastViewController as? OnboardingContentViewController)?.index else { return }
        currentIndex = index
        pageControll.currentPage = currentIndex
    }
}
