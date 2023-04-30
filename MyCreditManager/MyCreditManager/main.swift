//
//  main.swift
//  MyCreditManager
//
//  Created by Roen White on 2023/04/29.
//

import Foundation

var students: [String: [String: String]] = [:]

func startProgram() {
    while true {
        print("원하는 기능의 숫자를 입력해주세요.")
        print("1: 학생추가, 2: 학생삭제, 3: 성적추가(수정), 4: 성적삭제, 5: 성적확인, X: 종료")
        
        let menuChoice = readLine()
        
        switch menuChoice {
        case "1":
            print("학생추가")
            continue
        case "2":
            print("학생삭제")
            continue
        case "3":
            print("성적추가(수정)")
            continue
        case "4":
            print("성적삭제")
            continue
        case "5":
            print("성적확인")
            continue
        case "X", "x":
            print("프로그램을 종료합니다...")
            break
        default:
            print("입력이 잘못되었습니다. 1~5 사이의 숫자 혹은 X를 입력해주세요.")
            continue
        }
        
        break
    }
}

startProgram()
