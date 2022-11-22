//  HomeViewController.swift
//  CloneInstagram
//
//  Created by 강주원 on 2022/10/30.


import UIKit
import YPImagePicker
import Kingfisher

class HomeViewController: UIViewController {
	
	@IBOutlet weak var homeCollectionView: UICollectionView!
	
	var storyCount: Int = 0
	var contentCount: Int = 0
	
	private var picker: YPImagePicker?
	var imgArr: [UIImage] = []
	var urlArr: [String] = []
	
	lazy var photoUrl: String = ""
	
	lazy var dataManager: HomeDataManager = HomeDataManager()
	
	//Post data
	var postResult: [HomeResult]?
	
	var uploadImg: UploadImgRequest = UploadImgRequest(imgList: [])
	var uploadImgUrls: [String] = []
	
	lazy var uploadDataManager: UploadImgDataManager = UploadImgDataManager()
	
	//Story
	var storyResult: StoryResult?
	lazy var storyDataManager: StoryDataManager = StoryDataManager()
	
	//delegate
	var selectedPostId: String = ""
	var selectedName: String = ""
	var selectedTime: String = ""
	var selectedContent: String = ""
	var selectedImg: String = ""
	
	override func viewWillAppear(_ animated: Bool) {
		//		print("token:\(Constant.accessToken)")
		self.dataManager.getHomeData(delegate: self)
		self.storyDataManager.getStory(delegate: self)
		//		homeCollectionView.reloadData()
	}
	
	override func viewDidLoad() {
		super.viewDidLoad()
		//
		//		print("result: \(postResult)")
		//		setupCollectionView(viewName: homeCollectionView, cell: "HomeStoryCell", identifier: "homeStoryCell")
		setupCollectionView(viewName: homeCollectionView, cell: "HomeStoryUpperCell", identifier: "homeStoryUpperCell")
		setupCollectionView(viewName: homeCollectionView, cell: "HomeCell", identifier: "homeCell")
		
		
		self.navigationController?.isNavigationBarHidden = true
		//		homeCollectionView.collectionViewLayout = CollectionViewLeftAlignFlowLayout()
		
	}
	
	
	
	// MARK: - Register Btn Action -- Picker Appear
	@IBAction func registerBtnAction(_ sender: UIButton) {
		var config = YPImagePickerConfiguration()
		config.library.maxNumberOfItems = 5
		config.library.mediaType = .photo
		config.screens = [.library, .photo]
		config.startOnScreen = .library
		
		
		let picker = YPImagePicker(configuration: config)
		
		picker.didFinishPicking { [self, weak picker] items, cancelled in
			if cancelled {
				print("Picker cancelled")
				picker?.dismiss(animated: true)
			} else {
				for item in items {
					switch item {
					case .photo(let photo):
						//						print("photo: \(photo.image)")
						//data
						if let img = photo.image.jpegData(compressionQuality: 0.5) {
							//							print("img: \(img)")
							self.uploadImg.imgList.append(img)
						}
						
					case .video(let video):
						print(video)
					}
				}
				
				//				DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + .seconds(5)) {
				print("imgimg: \(self.uploadImg)")
				uploadDataManager.uploadImg(parameters: self.uploadImg, delegate: self)
				
				picker?.dismiss(animated: true)
				print("1:Picker dismissed")
				print("imgList : \(self.uploadImg.imgList)")
				// picker dismissed
				
			}
		} //didFinishPicking end
		
		self.modalPresentationStyle = .fullScreen
		present(picker, animated: true)
	}
	
	
	
	// MARK: - Setup collectionView
	func setupCollectionView(viewName: UICollectionView, cell: String, identifier: String) {
		
		let nib = UINib(nibName: cell, bundle: nil)
		viewName.register(nib, forCellWithReuseIdentifier: identifier)
		
		viewName.delegate = self
		viewName.dataSource = self
	}
	
	
}


// MARK: - CollectionView Settings
extension HomeViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
	
	func numberOfSections(in collectionView: UICollectionView) -> Int {
		return 2
	}
	
	func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
		
		switch section {
		case 0:
			print("cell loaded-- storycount: \(self.storyCount)")
//			return storyCount+1
			return 1
		case 1:
			return contentCount
		default:
			return 1
		}
	}
	
	func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
		//		print("aaaa")
		
		switch indexPath.section {
		case 0:
			let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "homeStoryUpperCell", for: indexPath) as! HomeStoryUpperCell
			
			cell.storyCount = self.storyCount + 1
			cell.storyResult = self.storyResult
			cell.reloadCell()
			return cell
		case 1:
			let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "homeCell", for: indexPath) as! HomeCell
			
			guard let result = postResult else { return cell }
			let postData = result[indexPath.row]
			//			print("postData = \(postData)")
			
			//넘김
			cell.imageUrls = postData.imgUrls
			cell.imageCount = postData.imgUrls.count
			//			print("cell data sended.")
			cell.reloadCell()
			
			let imgUrl = postData.profileImg
			if postData.profileImg == "" {
				cell.profileImg.image = UIImage(named: "emptyProfile")
			} else if postData.profileImg != "" {
				//한글주소 처리
				guard let decodedUrl = imgUrl.decodeUrl() else { return cell }
				let encodedUrl = decodedUrl.encodeUrl()!
				
				//			print("처리전: \(decodedUrl)")
				//			print("한글처리후: \(encodedUrl)")
				
				cell.profileImg.kf.setImage(with: URL(string: encodedUrl))
			}
			
			//test
			//			cell.profileImg.kf.setImage(with: URL(string: "https://instagram-s3-bucket.s3.ap-northeast-2.amazonaws.com/posts/a1dfdeaa-fc29-44f7-a10f-6c973e3475261-2.JPG"))
			
			cell.nameLbl.text = postData.uniqueName
			//			cell.locationLbl.text = ""
			cell.likeLbl.text = "좋아요 \(postData.postLikeCount!)개"
			
			cell.contentLbl.text = postData.content
			
			cell.isLike = postData.isLike
			cell.postId = postData.postId
			cell.likeCount = postData.postLikeCount!
			
			cell.sendPostId = String(postData.postId)
			cell.name = postData.uniqueName
			cell.content = postData.content
			cell.time = postData.date ?? "지금"
			cell.profileImgUrl = postData.profileImg
			
			if postData.isLike {
				cell.likeBtn.setImage(UIImage(named: "like.fill"), for: .normal)
				cell.likeBtn.isSelected = true
			} else {
				cell.likeBtn.setImage(UIImage(named: "like"), for: .normal)
				cell.likeBtn.isSelected = false
			}
			
			//delegate
			
			cell.delegate = self

			return cell
			
		default:
			return UICollectionViewCell()
		}
	}
	
	func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
		
		switch indexPath.section {
		case 0:
			return CGSize(width: self.view.frame.width, height: 150)
			//			return CGSize(width: Int(self.view.frame.width)/storyCount, height: 100)
		case 1:
			return CGSize(width: self.view.frame.width, height: 600)
		default:
			return CGSize(width: 50, height: 50)
		}
	}
	
	func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
		
		switch section {
		case 0:
			return UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
		case 1:
			return UIEdgeInsets(top: 10, left: 0, bottom: 10, right: 0)
		default:
			return UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
		}
	}
	
	//		func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
	//			return 5
	//		}
	
		func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
			return 10
		}
	
	func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
		guard let result = self.postResult else { return }
		let res = result[indexPath.row]
		
		if indexPath.section == 1 {
			selectedPostId = String(res.postId)
			selectedName = res.uniqueName
			selectedTime = res.date ?? "지금"
			selectedContent = res.content
			selectedImg = res.profileImg
			print("CELL selected,, postid: \(self.selectedPostId)")
		}
	}
	
}

// MARK: - API 관련
extension HomeViewController {
	
	// 게시글 피드 관련
	func didSuccessConnect(result: [HomeResult]) {
		print("homeVC api connected")
		self.postResult = result
		self.contentCount = result.count
		homeCollectionView.reloadData()
//				print("postResult: \(self.postResult)")
	}
	
	// 이미지 업로드 관련
	//	func didSuccessUploadImg(result: [UploadImgResponse]) {
	func didSuccessUploadImg(result: [String]) {
		
		self.uploadImgUrls = result
				print("Upload api connected. uploadImgUrls: \(uploadImgUrls)")
		
		let vc = self.storyboard?.instantiateViewController(withIdentifier: "registerVC") as! RegisterViewController
		vc.modalPresentationStyle = .fullScreen
		//					vc.photoUrlArr = urlArr
		vc.photoUrlArr = self.uploadImgUrls
		//		print("check: \(vc.photoUrlArr)")
		self.present(vc, animated: true)
	}
	
	// 스토리 GET
	func didSuccessGetStory(result: StoryResult) {
		self.storyResult = result
		self.storyCount = result.storyList.count
		self.homeCollectionView.reloadData()
//		print("storyresult: \(result)")
	}
	
	// Request 에러
	func failedToRequest(message: String) {
		print("error:\(message)")
		print(message)
	}
	
}


// MARK: - HomeCell delegate
extension HomeViewController: HomeCellDelegate {

	func commentBtnAction() {
		print("homecell delegate okokok")
		let vc = CommentVC(nibName: "CommentVC", bundle: nil)
		vc.modalPresentationStyle = .fullScreen

		print("cccc postId: \(self.selectedPostId)")
		vc.postId = self.selectedPostId
		vc.name = self.selectedName
		vc.time = self.selectedTime
		vc.content = self.selectedContent
		vc.profileImgUrl = self.selectedImg

		self.present(vc, animated: true)
	}
}
