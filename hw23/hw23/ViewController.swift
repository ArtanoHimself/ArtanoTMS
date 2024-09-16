
import UIKit
import WebKit

class ViewController: UIViewController {
    
    enum Values {
        static let searchFieldCR: CGFloat = 10
        static let navigationPanelLeadingAnchorOffset: CGFloat = 20
        static let navigationPanelTrailingAnchorOffset: CGFloat = -20
        static let searchFieldLeadingAnchorOffset: CGFloat = 20
        static let searchFieldTrailingAnchorOffset: CGFloat = -20
        static let searchButtonTrailingAnchorOffset: CGFloat = -10
        static let webViewTopAnchorOffset: CGFloat = 10
        static let webViewBotAnchorOffset: CGFloat = -10
    }
    
    lazy var navigationPanel = UIStackView()
    lazy var goLeftButton = CustomButton(image: UIImage(systemName: "chevron.left"))
    lazy var goRightButton = CustomButton(image: UIImage(systemName: "chevron.right"))
    lazy var addBookmarkButton = CustomButton(image: UIImage(systemName: "bookmark"))
    lazy var bookmarksButton = CustomButton(image: UIImage(systemName: "house"))
    lazy var reloadButton = CustomButton(image: UIImage(systemName: "arrow.clockwise"))
    
    lazy var searchButton = CustomButton(image: UIImage(systemName: "magnifyingglass"))
    lazy var searchField = CustomTextField()
    
    lazy var webView = WKWebView()
    
    var previousURLs: [URL] = []
    var nextURLs: [URL] = []
    var bookmarkURLs: [URL] = []
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    func setupUI() {
        view.backgroundColor = .systemGray6
        componentsSetup()
        setConstraints()
        webViewSetup()
    }
    
    func componentsSetup() {
        view.addSubview(navigationPanel)
        view.addSubview(searchField)
        view.addSubview(searchButton)
        view.addSubview(webView)
        
        navigationPanel.addArrangedSubview(goLeftButton)
        navigationPanel.addArrangedSubview(goRightButton)
        navigationPanel.addArrangedSubview(reloadButton)
        navigationPanel.addArrangedSubview(addBookmarkButton)
        navigationPanel.addArrangedSubview(bookmarksButton)
        navigationPanel.distribution = .equalSpacing
        
        searchField.backgroundColor = .systemBackground
        searchField.layer.cornerRadius = Values.searchFieldCR
        
        goLeftButton.addTarget(self, action: #selector(goBack), for: .touchUpInside)
        goRightButton.addTarget(self, action: #selector(goForward), for: .touchUpInside)
        searchButton.addTarget(self, action: #selector(load), for: .touchUpInside)
        reloadButton.addTarget(self, action: #selector(reload), for: .touchUpInside)
        addBookmarkButton.addTarget(self, action: #selector(addBookmark), for: .touchUpInside)
        bookmarksButton.addTarget(self, action: #selector(showBookmarks), for: .touchUpInside)
        goLeftButton.isEnabled = false
        goRightButton.isEnabled = false
    }
    
    func setConstraints() {
        navigationPanel.translatesAutoresizingMaskIntoConstraints = false
        searchField.translatesAutoresizingMaskIntoConstraints     = false
        searchButton.translatesAutoresizingMaskIntoConstraints    = false
        webView.translatesAutoresizingMaskIntoConstraints         = false
        
        NSLayoutConstraint.activate([
            navigationPanel.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            navigationPanel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: Values.navigationPanelLeadingAnchorOffset),
            navigationPanel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: Values.navigationPanelTrailingAnchorOffset),
            
            searchField.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            searchField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: Values.searchFieldLeadingAnchorOffset),
            searchField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: Values.searchFieldTrailingAnchorOffset),
            
            searchButton.trailingAnchor.constraint(equalTo: searchField.trailingAnchor, constant: Values.searchButtonTrailingAnchorOffset),
            searchButton.centerYAnchor.constraint(equalTo: searchField.centerYAnchor),
            
            webView.topAnchor.constraint(equalTo: searchField.bottomAnchor, constant: Values.webViewTopAnchorOffset),
            webView.bottomAnchor.constraint(equalTo: navigationPanel.topAnchor, constant: Values.webViewBotAnchorOffset),
            webView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            webView.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        ])
    }
    
    func webViewSetup() {
        webView.navigationDelegate                  = self
        webView.allowsBackForwardNavigationGestures = true
    }
    
    func disableButtons() {
        goLeftButton.isEnabled      = false
        goRightButton.isEnabled     = false
        reloadButton.isEnabled      = false
        searchButton.isEnabled      = false
        bookmarksButton.isEnabled   = false
        addBookmarkButton.isEnabled = false
    }
    
    @objc func goBack() {
        if previousURLs.count >= 1 {
            previousURLs.removeLast()
            if let url = webView.url {
                nextURLs.append(url)
            }
        }
        guard let url = previousURLs.last else { return }
        webView.load(URLRequest(url: url))
        disableButtons()
    }
    
    @objc func goForward() {
        if nextURLs.count >= 1 {
            guard let url = nextURLs.last else { return }
            webView.load(URLRequest(url: url))
            nextURLs.removeLast()
        }
        if let url = webView.url {
            previousURLs.append(url) }
        disableButtons()
    }
    
    @objc func load() {
        guard let url = URL(string: ("https://" + (searchField.text ?? ""))) else { return }
        webView.load(URLRequest(url: url))
        view.endEditing(true)
        
        if let url = webView.url {
            previousURLs.append(url)}
    }
    
    @objc func reload() {
        guard let url = webView.url else { return }
        webView.load(URLRequest(url: url))
    }
    
    @objc func addBookmark() {
        guard let url = webView.url else { return }
        bookmarkURLs.append(url)
        addBookmarkButton.isEnabled = false
    }
    
    @objc func showBookmarks() {
        let vc = BookmarksViewController()
        vc.bookmarksUrls = self.bookmarkURLs
        present(vc, animated: true)
    }
}

extension ViewController: WKNavigationDelegate {
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        searchField.text = ""
        searchField.placeholder = webView.url?.description
        
        goLeftButton.isEnabled      = true
        goRightButton.isEnabled     = true
        reloadButton.isEnabled      = true
        searchButton.isEnabled      = true
        bookmarksButton.isEnabled   = true
        addBookmarkButton.isEnabled = true
        
        if previousURLs.count <= 1 {
            goLeftButton.isEnabled = false
        }
        if nextURLs.count == 0 {
            goRightButton.isEnabled = false
        }
    }
    
}

