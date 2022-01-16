import UIKit

class MainViewController: UIViewController {

  let customCellIdentifier = Constants.customCellIdentifier
    
  override func viewDidLoad() {
    super.viewDidLoad()
    navigationItem.titleView = searchBar
  }

  override func loadView() {
    view = UIView()
    view.backgroundColor = .systemBackground
    view.addSubview(collectionView)

    collectionView.snp.makeConstraints {
      $0.edges.equalToSuperview()
    }
  }

  private lazy var searchBar: UISearchBar = {
    let searchBar = UISearchBar()
    searchBar.placeholder = "search gifs..."
    searchBar.delegate = self
    return searchBar
  }()

  private var layout: UICollectionViewLayout {
    // TODO: implement
//    fatalError()
      let _layout = UICollectionViewFlowLayout()
      _layout.itemSize = CGSize(width: view.safeAreaLayoutGuide.layoutFrame.width, height: 90)
      _layout.scrollDirection = .vertical
      _layout.minimumInteritemSpacing = 0.0
      return _layout
  }

  private lazy var collectionView: UICollectionView = {
    let collectionView = UICollectionView(
      frame: .zero,
      collectionViewLayout: layout
    )
    collectionView.backgroundColor = .clear
    collectionView.keyboardDismissMode = .onDrag
    collectionView.dataSource = self
    collectionView.delegate = self
    collectionView.register(MainCollectionViewCell.self, forCellWithReuseIdentifier: customCellIdentifier)
    return collectionView
  }()
}

// MARK: UISearchBarDelegate

extension MainViewController: UISearchBarDelegate {
  func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
    // TODO: implement
  }
}

extension MainViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        3
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {        
        guard let customCell = collectionView.dequeueReusableCell(withReuseIdentifier: customCellIdentifier, for: indexPath) as? MainCollectionViewCell else { fatalError(Constants.fatalError) }
//        let movie = movies[(indexPath as NSIndexPath).item]
//        customCell.movieCell = movie
//        if let profileImageUrl = movie.image {
//            customCell.movieThumbNail.loadImageUsingCacheWithUrlString(urlString: profileImageUrl)
//        }
        return customCell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: view.safeAreaLayoutGuide.layoutFrame.width, height: 90)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let searchResult = SearchResult(id: "", gifUrl: URL(string: "www.google.com")!, title: "")
        let viewController = DetailViewController(searchResult: searchResult)
        
        self.navigationController?.pushViewController(viewController, animated: true)
    }
}
