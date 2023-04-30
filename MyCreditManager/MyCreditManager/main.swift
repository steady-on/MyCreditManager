//
//  main.swift
//  MyCreditManager
//
//  Created by Roen White on 2023/04/29.
//

import Foundation

var students: [String: [String: String]] = [:]

func startProgram() {
menuLoop: while true {
        print("원하는 기능의 숫자를 입력해주세요.")
        print("1: 학생추가, 2: 학생삭제, 3: 성적추가(수정), 4: 성적삭제, 5: 성적확인, X: 종료")
        
        let menuChoice = readLine()
        
        switch menuChoice {
        case "1":
            addStudent()
            continue
        case "2":
            deleteStudent()
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
            break menuLoop
        default:
            print("입력이 잘못되었습니다. 1~5 사이의 숫자 혹은 X를 입력해주세요.")
            continue
        }
    }
}

func addStudent() {
    print("추가할 학생의 이름을 입력해주세요.")
    
    guard let input: String = readLine() else { return }
    
    let name = input.trimmingCharacters(in: .whitespaces)
    
    if name.isEmpty {
        print("입력이 잘못되었습니다. 다시 확인해주세요.")
    } else {
        students[name] = [:]
        print("\(name) 학생을 추가했습니다.")
    }
}

func deleteStudent() {
    guard !students.isEmpty else {
        print("삭제할 학생이 없습니다. 먼저 학생을 추가해 주세요.")
        return
    }
    
    print("삭제할 학생의 이름을 입력해주세요.")
    
    guard let input = readLine() else { return }
    
    let name = input.trimmingCharacters(in: .whitespaces)
    
    guard !name.isEmpty else {
        print("입력이 잘못되었습니다. 다시 확인해주세요.")
        return
    }
    
    if students[name] == nil {
        print("\(name) 학생을 찾지 못했습니다.")
    } else {
        students[name] = nil
        print("\(name) 학생을 삭제했습니다.")
    }
}

startProgram()
