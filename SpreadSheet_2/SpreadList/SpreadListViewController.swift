//
//  SpreadListViewController.swift
//  SpreadSheet_2
//
//  Created by 송정훈 on 2020/12/03.
//

import UIKit

class SpreadListViewController: UITableViewController {
    var listVM = ListViewModel()
    var name:String = ""
    var token:NSObjectProtocol?
    deinit{
        if let token = token{
            NotificationCenter.default.removeObserver(token)
        }
    }
    @IBAction func addList(_ sender:UIButton){
        listVM.addSheet(name: name)
        self.tableView.reloadData()
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        token = NotificationCenter.default.addObserver(forName: SpreadSheetViewController.modifyFinished, object: nil, queue: OperationQueue.main) { noti in
            self.tableView.reloadData()
        }
        let loginViewModel = LoginViewModel(login: loginModel(id: "124sjh", name: "송정훈", pwd: "1"))
        name = loginViewModel.getName()
    }
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return listVM.sheet.count
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "SpreadListCell", for: indexPath) as? SpreadListCell else { return UITableViewCell() }
        cell.initTime.text = listVM.sheet[indexPath.row].initTime
        cell.sheetName.text = listVM.sheet[indexPath.row].sheetName
        cell.writer.text = listVM.sheet[indexPath.row].writer
        return cell
    }
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        //옆으로 스와이프 해서 삭제
        if editingStyle == .delete {
            //삭제 구현
            listVM.deleteSheet(index: indexPath)
            self.tableView.reloadData()
        } else if editingStyle == .insert {
        }
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let cell = sender as? UITableViewCell,let index = tableView.indexPath(for: cell) else {return}
        if let vc = segue.destination as? SpreadSheetViewController{
            self.listVM.currentIndex = index.row
            vc.layout.sheetVM = listVM
            vc.sheetName.setTitle(listVM.sheet[listVM.currentIndex].sheetName, for: .normal)
            if (vc.layout.sheetVM.sheet[listVM.currentIndex].layoutStandard.count == 0){
                vc.layout.sheetVM.initStandard()
            }
        }
    }
}
class SpreadListCell:UITableViewCell{
    @IBOutlet weak var sheetName:UILabel!
    @IBOutlet weak var initTime:UILabel!
    @IBOutlet weak var writer:UILabel!
}
