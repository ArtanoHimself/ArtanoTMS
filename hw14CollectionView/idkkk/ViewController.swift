import UIKit

class ViewController: UIViewController {
    
    lazy var collectionView: UICollectionView = .init(
        frame: .zero,
        collectionViewLayout: .init()
    )
    
    let layout = UICollectionViewFlowLayout()
    var images: [UIImage] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        populateImages()
        configureCollectionView()
        
        
    }
    
    
    func configureCollectionView() {
        view.addSubview(collectionView)
        collectionView.backgroundColor = .black
        setCollectionViewConstraints()
        setCollectionViewDelegates()
        collectionView.collectionViewLayout = layout
        layoutSetup()
        collectionView.register(CustomCollectionViewCell.self, forCellWithReuseIdentifier: CustomCollectionViewCell.identifier)
        
    }
    
    func setCollectionViewDelegates() {
        collectionView.delegate   = self
        collectionView.dataSource = self
    }

    func setCollectionViewConstraints() {
        collectionView.translatesAutoresizingMaskIntoConstraints                                            = false
        collectionView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor).isActive           = true
        collectionView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor).isActive     = true
        collectionView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor).isActive   = true
        collectionView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor).isActive = true
    }
    
    func populateImages() {
            images.append(UIImage(named: "Geniy") ?? UIImage())
            images.append(UIImage(named: "naruto") ?? UIImage())
            images.append(UIImage(named: "Nuts") ?? UIImage())
            images.append(UIImage(named: "stariy") ?? UIImage())
            images.append(UIImage(named: "v_dubaiske") ?? UIImage())
            images.append(UIImage(named: "Bratishka") ?? UIImage())
            images.append(UIImage(named: "v_Boklere") ?? UIImage())
            images.append(UIImage(named: "sumashedshiy") ?? UIImage())
            images.append(UIImage(named: "Tupa_Ya") ?? UIImage())
            images.append(UIImage(named: "V_Cirke") ?? UIImage())
    }
    
    func layoutSetup() {
        let availibleWidth = UIScreen.main.bounds.width - 10
        layout.minimumLineSpacing = 20
        layout.itemSize = .init(width: availibleWidth, height: availibleWidth)
    }

}

extension ViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return images.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CustomCollectionViewCell.identifier, for: indexPath) as? CustomCollectionViewCell
        cell?.configure(image: images[indexPath.item], name: "random picture # \(indexPath.item + 1)")
        return cell ?? UICollectionViewCell()
    }
}

