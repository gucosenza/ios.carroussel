
import UIKit

class FirstCollectionViewCell: UICollectionViewCell {
    
    static var identifier: String = "Cell"
    var arrayRepo: [GithubRepoModel] = []
    
    lazy var collectionView: UICollectionView = {
           let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
           layout.scrollDirection = .horizontal
           var co = UICollectionView(frame: contentView.frame, collectionViewLayout: layout)
           co.register(FirstCarroucelCell.self, forCellWithReuseIdentifier: "MyCell")
           co.backgroundColor = UIColor.yellow
           co.translatesAutoresizingMaskIntoConstraints = false
           return co
       }()
    
    func configure(arrayRepo: [GithubRepoModel]) {
        self.arrayRepo = arrayRepo
        contentView.backgroundColor = .blue
        
        contentView.addSubview(collectionView)
        
        collectionView.dataSource = self
        collectionView.delegate = self

        collectionView.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 0).isActive = true
        collectionView.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor, constant: 0).isActive = true
        collectionView.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor, constant: 0).isActive = true
        collectionView.bottomAnchor.constraint(equalTo: self.safeAreaLayoutGuide.bottomAnchor, constant: 0).isActive = true
        
        collectionView.reloadData()
    }
    
}


extension FirstCollectionViewCell: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return arrayRepo.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let myCell = collectionView.dequeueReusableCell(withReuseIdentifier: "MyCell", for: indexPath) as! FirstCarroucelCell
        myCell.configure(string: arrayRepo[indexPath.row].name)
        return myCell
    }
}

extension FirstCollectionViewCell: UICollectionViewDelegate {
 
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
       print("User tapped on item \(indexPath.row)")
    }
}

extension FirstCollectionViewCell: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 20, left: 10, bottom: 10, right: 10)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 150, height: 150)
    }
}
