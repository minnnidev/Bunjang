//
//  AddViewController.swift
//  Bunjang
//
//  Created by 김민 on 2022/08/21.
//

import UIKit
import PanModal
import Alamofire
import FirebaseStorage

class AddViewController: UIViewController {
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var selectCategoryView: UIView!
    @IBOutlet weak var selectTagView: UIView!
    @IBOutlet weak var selectOptionButton: UIButton!
    @IBOutlet weak var contentTextView: UITextView!
    @IBOutlet weak var registerButton: UIButton!
    @IBOutlet weak var bungaePayDetailButton: UIButton!
    @IBOutlet weak var bungaePayButtonView: UIView!
    @IBOutlet weak var stockLabel: UILabel!
    @IBOutlet weak var isOldLabel: UILabel!
    @IBOutlet weak var isExchangePossibleLabel: UILabel!
    @IBOutlet weak var checkmark: UIImageView!
    @IBOutlet weak var shippingFeeButton: UIButton!
    @IBOutlet weak var categoryNameLabel: UILabel!
    @IBOutlet weak var goToAlbumButton: UIView!
    @IBOutlet weak var getImageView: UIImageView!
    @IBOutlet weak var tagLabel: UILabel!
   
    @IBOutlet weak var backgroundScrollView: UIScrollView!
    
    @IBOutlet weak var priceField: UITextField!
    

    var option: Option?
    var category: String?
    var isBungaePayOK = true
    var isNotIncludeShippingFee = true
    var isCategoryWritten = false
    let imagePicker = UIImagePickerController()
    var arrayOfImages: [String] = []
    var categoryCode: String?
    var tags: [String] = []
    
    let addManager = AddManager()
    let storage = Storage.storage()
    
    var imageCount = 1
    var delivery =  0
    var stock: Int?
    var isNew = 0
    var exchange = 0
    var safePay = 1
    var isAd = 0
    var inspection = 1
    
    
//MARK: - Lifecycle
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.navigationBar.isHidden = false
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.configureView()
        self.setGesture()
        self.setImagePicker()
        self.placeHolderSetting()
        
        self.imageCount = UserDefaults.standard.integer(forKey: "imageCount")
        print("imageCount: ", imageCount)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        NotificationCenter.default.addObserver(self, selector: #selector(categoryNotification(_:)), name: NSNotification.Name("test"), object: nil)
    }
    
    
//MARK: - objc function
    @objc func categoryNotification(_ notification: Notification) {
        //수정된 diary 객체를 전달받아 뷰를 업데이트
        guard let categoryCode = notification.object as? CategoryCode else {return}
        self.categoryNameLabel.text = categoryCode.categoryName
        self.categoryCode = categoryCode.categoryCode
        self.categoryNameLabel.textColor = .black
    
    }
    
    @objc func tapAlbumView() {
        imagePicker.modalPresentationStyle = .fullScreen
        self.present(imagePicker, animated: true, completion: nil)
    }
    
    @objc func tapPayView() {
        if isBungaePayOK {
            isBungaePayOK = false
            self.bungaePayButtonView.layer.borderColor = UIColor.lightGray.cgColor
            checkmark.tintColor = .lightGray
        } else {
            isBungaePayOK = true
            self.bungaePayButtonView.layer.borderColor = UIColor.red.cgColor
            checkmark.tintColor = .red
        }
    }
    
    @objc func tapCategoryView() {
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "CategoryViewController") as! CategoryViewController
        self.isCategoryWritten = true
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    @objc func tapTagView() {
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "TagViewController") as! TagViewController
        vc.delegate = self
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    
//MARK: - private function
    private func configureView() {
        self.nameTextField.setRegisterTextField(text: "상품명")
        self.priceField.setRegisterTextField(text: "가격")
        
        self.selectOptionButton.layer.borderColor = UIColor(red: 211/255, green: 211/255, blue: 211/255, alpha: 1.0).cgColor
        self.selectOptionButton.layer.borderWidth = 1
        self.selectOptionButton.layer.cornerRadius = 8
        
        self.bungaePayButtonView.layer.borderColor = UIColor.red.cgColor
        self.bungaePayButtonView.layer.borderWidth = 1
        self.bungaePayButtonView.layer.cornerRadius = 8
        
        self.registerButton.layer.cornerRadius = 8
        
        self.bungaePayDetailButton.setUnderline()
        
        self.backgroundScrollView.delegate = self
    }
    
    private func setGesture() {
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(tapCategoryView))
        self.selectCategoryView.addGestureRecognizer(tapGesture)
        
        let payTapGesture = UITapGestureRecognizer(target: self, action: #selector(tapPayView))
        self.bungaePayButtonView.addGestureRecognizer(payTapGesture)
        
        let albumTapGesture = UITapGestureRecognizer(target: self, action: #selector(tapAlbumView))
        self.goToAlbumButton.addGestureRecognizer(albumTapGesture)
        
        let tagTapGesture = UITapGestureRecognizer(target: self, action: #selector(tapTagView))
        self.selectTagView.addGestureRecognizer(tagTapGesture)
    }
    
    private func setImagePicker() {
        self.imagePicker.delegate = self
        self.imagePicker.allowsEditing = true
        self.imagePicker.sourceType = .photoLibrary
    }
    
    private func uploadImage(img: UIImage) {
        var data = Data()
        data = img.jpegData(compressionQuality: 0.8)!
        let filePath = "path/img/\(imageCount)"
        let metaData = StorageMetadata()
        metaData.contentType = "image/png"
        
        storage.reference().child(filePath).putData(data, metadata: metaData) {
            (metaData, error) in
            if let error = error {
                print(error.localizedDescription)
                return
            } else {
                print("이미지 업로드 완료")
            }
        }
    }
    
    private func downloadURL()  {
        storage.reference(forURL: "gs://bunjang-ab1f7.appspot.com/path/img/\(imageCount)").downloadURL { url, error in
            guard let imageURL = url else {return}
            let urlString = imageURL.absoluteString
            
            DispatchQueue.main.async {
                self.arrayOfImages.append(urlString)
                print("array에 넣기 완료")
                print("array: ", self.arrayOfImages)
            }
        }
    }
    
    private func placeHolderSetting() {
        self.contentTextView.delegate = self
        self.contentTextView.text = "여러 장의 상품 사진과 구입 연도, 브랜드, 사용감, 하자 유무 등 구매자에게 필요한 정보를 꼭 포함해 주세요. 문의를 줄이고 더 쉽게 판매할 수 있어요. (10장 이상)"
        self.contentTextView.textColor = UIColor.lightGray

    }
    
//MARK: - Action
    
    @IBAction func tapBackButton(_ sender: UIBarButtonItem) {
        self.dismiss(animated: true, completion: nil)
    }
    
    
    @IBAction func tapSelectOptionButton(_ sender: UIButton) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "OptionViewController") as! OptionViewController
        vc.delegate = self
        self.presentPanModal(vc)
    }
    
    
    @IBAction func tapShippingFee(_ sender: UIButton) {
        if isNotIncludeShippingFee {
            isNotIncludeShippingFee = false
            self.shippingFeeButton.setImage(UIImage(systemName: "checkmark.circle.fill"), for: .normal)
            self.shippingFeeButton.tintColor = .red
        } else {
            isNotIncludeShippingFee = true
            self.shippingFeeButton.setImage(UIImage(systemName: "checkmark.circle"), for: .normal)
            self.shippingFeeButton.tintColor = .lightGray
        }
    }
    
    //등록버튼
    @IBAction func tapRegisterButton(_ sender: UIButton) {
        guard let name = self.nameTextField.text else {return}
        guard let categoryCode = self.categoryCode else {return}
        
        //tag
        guard let priceString = self.priceField.text else {return}
        let priceInt = Int(priceString)
        guard let price = priceInt else {return}
    

        if isNotIncludeShippingFee {
            self.delivery = 0
        } else {
            self.delivery = 1
        }
        
        guard let stockString = self.stockLabel.text else {return}
        let stockInt = Int(stockString)
        guard let stock = stockInt else {return}
        
        
        if isOldLabel.text == "중고상품" {
            self.isNew = 0
        } else {
            self.isNew = 1
        }
        
        if isExchangePossibleLabel.text == "교환불가" {
            self.exchange = 0
        } else {
            self.exchange = 1
        }
        
        guard let content = self.contentTextView.text else {return}
        
        if isBungaePayOK {
            self.safePay = 1
        } else {
            self.safePay = 0
        }
        
        self.isAd = 0
        self.inspection = 1

        self.imageCount = self.imageCount+1
        UserDefaults.standard.set(self.imageCount, forKey: "imageCount")
        
         
        let parameters = AddRequest(images: self.arrayOfImages, name: name, category: categoryCode, tags: self.tags, price: price, delivery: self.delivery, stock: stock, isNew: isNew, exchange: exchange, content: content, safePay: self.safePay, location: "서울시 중구", isAd: 0, inspection: 1)
        
        
        print(parameters)
        
        addManager.postAddItem(parameters: parameters) { response in
            print(response)
            
        }
    
        self.dismiss(animated: true, completion: nil)
    }
}

//MARK: - extension: Option, Tag
extension AddViewController: OptionViewDelegate, TagViewDelegate {
    func sendData(_ option: Option) {
        self.stockLabel.text = option.stock
        self.isOldLabel.text = option.isOldText
        self.isExchangePossibleLabel.text = option.isExchangePossibleText
    }
    
    func sendTags(_ tags: [String]) {
        self.tags = tags
        var tagList = ""
        for i in 0..<tags.count {
            if i == tags.count - 1 {
                tagList = tagList + "\(tags[i])"
            } else {
                tagList = tagList + "\(tags[i]) | "
            }
        }
        self.tagLabel.text = tagList
        self.tagLabel.textColor = .black
    }
}

//MARK: - extension: image Picker
extension AddViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        let newImage = info[UIImagePickerController.InfoKey.editedImage] as? UIImage
        self.getImageView.image = newImage
        self.uploadImage(img: newImage!)
        self.downloadURL()
        
    
        self.imagePicker.dismiss(animated: true)
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        //이미지가 선택되지 않았습니다! 알림창 뜨도록
    }
}

extension AddViewController: UIScrollViewDelegate {
    func scrollViewWillBeginDragging(_ scrollView: UIScrollView) {
        self.view.endEditing(true)
    }
}


extension AddViewController: UITextViewDelegate {
    func textViewDidBeginEditing(_ textView: UITextView) {
        if textView.textColor == UIColor.lightGray {
            textView.text = ""
            textView.textColor = .black
        }
    }
}
