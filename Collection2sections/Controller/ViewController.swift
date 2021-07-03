
import UIKit

class ViewController: UIViewController {
    
    lazy var myCollection: UICollectionView = {
        let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        var co = UICollectionView(frame: self.view.frame, collectionViewLayout: layout)
        co.register(FirstCollectionViewCell.self, forCellWithReuseIdentifier: "MyCell")
        co.register(SecondCollectionViewCell.self, forCellWithReuseIdentifier: "MyCell2")
        co.backgroundColor = UIColor.gray
        co.translatesAutoresizingMaskIntoConstraints = false
        return co
    }()
    
    var arrayGitRepos: [GithubRepoModel] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let network = HTTPServices()
        
        network.request(endpoint: GithubReposEndpoint()) { (result: Result<[GithubRepoModel], NetworkError>) in
            switch result {
            case .success:
                do {
                    let repoResult = try result.get()
                    self.arrayGitRepos = repoResult
                    DispatchQueue.main.async {
                        self.myCollection.reloadData()
                    }
                } catch let error {
                    print(error.localizedDescription)
                }
            case .failure:
                print("falhou a requisicao: \(result)")
            }
        }
        
        view.addSubview(myCollection)
        
        myCollection.dataSource = self
        myCollection.delegate = self
    }
    

}

extension ViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 2
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if indexPath.item == 0 {
            let myCell = collectionView.dequeueReusableCell(withReuseIdentifier: "MyCell", for: indexPath) as! FirstCollectionViewCell
            myCell.configure(arrayRepo: arrayGitRepos)
            return myCell
        } else if indexPath.item == 1 {
            let myCell2 = collectionView.dequeueReusableCell(withReuseIdentifier: "MyCell2", for: indexPath) as! SecondCollectionViewCell
            myCell2.configure()
            return myCell2
        } else {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath)
            return cell
        }
    }
    
}

extension ViewController: UICollectionViewDelegate {
 
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
       print("User tapped on item \(indexPath.row)")
    }
}

extension ViewController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView,
                          layout collectionViewLayout: UICollectionViewLayout,
                          sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: UIScreen.main.bounds.width-20, height: 200)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 50, left: 10, bottom: 10, right: 10)
    }
    
}


