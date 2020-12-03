//
//  LoginVIewModel.swift
//  SpreadSheet_2
//
//  Created by 송정훈 on 2020/12/03.
//

class LoginViewModel{
    let login:loginModel
    init(login:loginModel){
        self.login = login
    }
    func getName() -> String{
        return login.name
    }
}
