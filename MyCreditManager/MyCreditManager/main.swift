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
            updateCredit()
            continue
        case "4":
            deleteCredit()
            continue
        case "5":
            checkScore()
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
    
    guard !name.isEmpty else {
        print("입력이 잘못되었습니다. 다시 확인해주세요.")
        return
    }
    
    if students[name] != nil {
        print("\(name) 학생은 이미 존재하는 학생입니다. 추가하지 않습니다.")
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
        print("\(name) 학생을 찾을 수 없습니다.")
    } else {
        students[name] = nil
        print("\(name) 학생을 삭제했습니다.")
    }
}

func updateCredit() {
    guard !students.isEmpty else {
        print("성적을 추가할 학생이 없습니다. 먼저 학생을 추가해 주세요.")
        return
    }
    
    print("성적을 추가할 학생의 이름, 과목, 성적(A+, A, F 등)을 띄어쓰기로 구분하여 차례로 입력해주세요.")
    print("입력예) Haru Swift A+")
    print("만약에 학생의 성적 중 해당 과목이 존재하면 기존 점수가 갱신됩니다.")
    
    guard let input = readLine() else { return }
    
    let inputValues = input.trimmingCharacters(in: .whitespaces).components(separatedBy: " ")
    
    guard inputValues.count == 3 else {
        print("입력이 잘못되었습니다. 다시 확인해주세요.")
        return
    }
    
    let (name, subject, credit) = (inputValues[0], inputValues[1], inputValues[2])
    
    if students[name] != nil {
        students[name]![subject] = credit
        print("\(name) 학생의 \(subject) 과목이 \(credit)으로 추가(변경)되었습니다.")
    } else {
        print("\(name) 학생을 찾을 수 없습니다.")
    }
}

func deleteCredit() {
    guard !students.isEmpty else {
        print("성적을 추가할 학생이 없습니다. 먼저 학생을 추가해 주세요.")
        return
    }
    
    print("성적을 삭제할 학생의 이름, 과목을 띄어쓰기로 구분하여 차례로 입력해주세요.")
    print("입력예) Haru Swift")
    
    guard let input = readLine() else { return }
    
    let inputValues = input.trimmingCharacters(in: .whitespaces).components(separatedBy: " ")
    
    guard inputValues.count == 2 else {
        print("입력이 잘못되었습니다. 다시 확인해주세요.")
        return
    }
    
    let (name, subject) = (inputValues[0], inputValues[1])
    
    if var student = students[name] {
        student[subject] = nil
        print("\(name) 학생의 \(subject) 과목의 성적이 삭제 되었습니다.")
    } else {
        print("\(name) 학생을 찾을 수 없습니다.")
    }
}

func checkScore() {
    guard !students.isEmpty else {
        print("성적을 확인할 학생이 없습니다. 먼저 학생을 추가해 주세요.")
        return
    }
    
    print("성적을 확인할 학생의 이름을 입력해주세요.")
    
    guard let input = readLine() else { return }
    
    let name = input.trimmingCharacters(in: .whitespaces)
    
    guard !name.isEmpty else {
        print("입력이 잘못되었습니다. 다시 확인해주세요.")
        return
    }
    
    if let reportCard = students[name] {
        guard !reportCard.isEmpty else {
            print("\(name) 학생은 아직 성적이 입력된 과목이 없습니다. 성적을 추가해 주세요.")
            return
        }
        
        var totalScore: Double = 0
        
        for (subject, credit) in reportCard {
            print("\(subject): \(credit)")
            
            switch credit {
            case "A+": totalScore += 4.5
            case "A" : totalScore += 4.0
            case "B+": totalScore += 3.5
            case "B" : totalScore += 3.0
            case "C+": totalScore += 2.5
            case "C" : totalScore += 2.0
            case "D+": totalScore += 1.5
            case "D" : totalScore += 1.0
            default  : break
            }
        }
        
        print("평점: \(totalScore / Double(reportCard.count))")
    } else {
        print("\(name) 학생을 찾지 못했습니다.")
    }
}

startProgram()
