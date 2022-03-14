//
//  RankViewController.swift
//  AI_Carrefour
//
//  Created by zeze on 2022/3/12.
//
// RecommendRankViewController＿lowprice

import UIKit
import SafariServices

class LowRankViewController: UIViewController, UITextFieldDelegate, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet var table: UITableView!
    //    設計按鍵進行TableView
    @IBOutlet var field: UITextField!
    //    設計表格
    var textFiled = String()
    var product = [Product]()
    //第一個，var arr:[String] = []通常用於在初始化時添加值
    //你可以像這樣創建一個空數組，但通常你會做第二個來創建空數組：var are = [String]()
 
    override func viewDidLoad() {
        super.viewDidLoad()
        field.text = textFiled
        
        //要把資料裝進table，首先要設計一個cell，並且可以供table使用。
        //swift提供了register（可以進行給表個一個名字）(_:forCellReuseIdentifier:)這個方法，讓你可以依據cell的名字註冊一個cell給table，而可以被註冊的只有：
        //UINib UITableViewCell及其子類別
        
       
        table.register(LowProductTableViewCell.nib(), forCellReuseIdentifier: LowProductTableViewCell.identifier)
        table.delegate = self
        table.dataSource = self
        field.delegate = self
        
        searchProduct()
       
        
        //呼叫ViewController(
        
        
        //都為了讓資料可以在物件(struct 或 class)間傳遞。只不過一個是用來控制 UI event(delegate) 像是選擇 table cell後該做什麼動作，一個是用來顯示 table cell 內的資料(datasource)。
    }
    
    
    // textField 按下return後執行搜尋
//    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
//        searchProduct()
//        return true
//    }
    
    func searchProduct() {
        // 鍵盤可以收回
        field.resignFirstResponder()
        
        guard let text = field.text, !text.isEmpty else {
            return
        }
        
        
        
        let query = text.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)!
        
        product.removeAll()
        // 將20%替代空字串將裡面搜尋結果進行移除
        
        print("http://34.72.27.77:5000/crawler/low/\(query)")
        
        // 巧克力
        URLSession.shared.dataTask(with: URL(string: "http://34.72.27.77:5000/crawler/low/\(query)")!,
                                   completionHandler:
                                    { data, response, error in
            
            guard let data = data, error == nil else {
                return
            }

            //抓完進行判斷
            // Convert
            var result: Result?
            do {
                result = try JSONDecoder().decode(Result.self, from: data)
                print(result!)
            }
            catch {
                print("error")
            }
            
            guard let finalResult = result else {
                return
            }
            
            // Update our product array
            let newMovies = finalResult.five_product_low
            self.product.append(contentsOf: newMovies)
            
            // Refresh our table
            //按鈕件將裡面的進行程式
            
            DispatchQueue.main.async {
                self.table.reloadData()
            }
            
        }).resume()
        //最後加上收尾
        
    }
    
    // Table
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return product.count
    }//輸出電影數的總格數
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: LowProductTableViewCell.identifier, for: indexPath) as! LowProductTableViewCell
        cell.configure(with: product[indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 130
        
    }
    
}

struct Result: Codable {
    let five_product_low: [Product]
}

struct Product: Codable {
    let name: String
    let price: String
    let pic: String
}
