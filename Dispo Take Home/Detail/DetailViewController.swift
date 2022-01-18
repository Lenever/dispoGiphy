import UIKit

class DetailViewController: UIViewController {
    var viewModel = DetailViewModel()
    var gifInfo: GifObject? {
        didSet {
            guard let detail = gifInfo else { return }
            imageView.kf.setImage(with: detail.images.fixed_height.url)
            titleLabel.text = detail.title
            sourceLabel.text = detail.source_tld
            ratingLabel.text = detail.rating
        }
    }
    var gifId: String {
        didSet {
            loadGif(gifId: gifId)
        }
    }
    
    var imageView = UIImageView()
    var titleLabel = UILabel()
    var sourceLabel = UILabel()
    var ratingLabel = UILabel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        setUp()
        layoutSubviews()
        loadGif(gifId: gifId)
    }
    
    init(gifId: String) {
        self.gifId = gifId
        super.init(nibName: nil, bundle: nil)
    }
    
    func setUp() {
        
    }
    
    func layoutSubviews() {
        setupNavigationBar()
        setupImageView()
        setuptitleLabel()
        setupSourceLabel()
        setupRatingLabel()
    }
    
    func setupNavigationBar() {
        navigationController?.navigationBar.isTranslucent = true
        navigationItem.title = "Gif Info Details"
    }
    
    func setupImageView() {
        view.addSubview(imageView)
        imageView.backgroundColor = .systemPink
        imageView.contentMode = .scaleAspectFill
        imageView.snp.makeConstraints { (make) in
            make.top.equalTo(view).offset(100)
            make.leading.equalTo(view).offset(25)
            make.trailing.equalTo(view).offset(-25)
            make.height.equalTo(view).multipliedBy(0.3)
        }
    }
    
    func setuptitleLabel() {
        view.addSubview(titleLabel)
        titleLabel.text = "Title of things and things and things and things and things"
        titleLabel.numberOfLines = 0
        titleLabel.lineBreakMode = .byWordWrapping
        titleLabel.textAlignment = .center
        titleLabel.snp.makeConstraints { (make) in
            make.top.equalTo(imageView.snp.bottom).offset(25)
            make.leading.equalTo(view).offset(25)
            make.trailing.equalTo(view).offset(-25)
        }
    }
    
    func setupSourceLabel() {
        view.addSubview(sourceLabel)
        sourceLabel.text = "Source"
        sourceLabel.numberOfLines = 0
        sourceLabel.lineBreakMode = .byWordWrapping
        sourceLabel.textAlignment = .center
        sourceLabel.snp.makeConstraints { (make) in
            make.top.equalTo(titleLabel.snp.bottom).offset(25)
            make.leading.equalTo(view).offset(25)
            make.trailing.equalTo(view).offset(-25)
        }
    }
    
    func setupRatingLabel() {
        view.addSubview(ratingLabel)
        ratingLabel.text = "Rating"
        ratingLabel.numberOfLines = 0
        ratingLabel.lineBreakMode = .byWordWrapping
        ratingLabel.textAlignment = .center
        ratingLabel.snp.makeConstraints { (make) in
            make.top.equalTo(sourceLabel.snp.bottom).offset(25)
            make.leading.equalTo(view).offset(25)
            make.trailing.equalTo(view).offset(-25)
        }
    }
    
    func loadGif(gifId: String) {
        viewModel.fetchGif(
          gifId: gifId,
          success: { gifInfo in
              self.gifInfo = gifInfo
              DispatchQueue.main.async {
                  print(gifInfo, "<<||>>")
              }
          },
          failure: { error in
              print(error)
          }
        )
    }
    
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
}
