//
//  CreditManager.swift
//  MyCreditManager
//
//  Created by Roen White on 2023/04/30.
//

import Foundation

class CreditManager {
    private var students: [Student] = []

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
                print(CreditManageError.invalidInput(.menu).localizedDescription)
                continue
            }
        }
    }

    private func addStudent() {
        print("추가할 학생의 이름을 입력해주세요.")

        guard let name: String = getText() else { return }

        if students.contains(where: { $0.name == name }) {
            print("\(name)", CreditManageError.existStudent.localizedDescription)
        } else {
            let student = Student(name: name)
            students.append(student)
            print("\(name) 학생을 추가했습니다.")
        }
    }

    private func deleteStudent() {
        guard !students.isEmpty else {
            print(CreditManageError.emptyStudents(.deleteStudent).localizedDescription)
            return
        }

        print("삭제할 학생의 이름을 입력해주세요.")

        guard let name: String = getText() else { return }

        if let index = students.firstIndex(where: { $0.name == name }) {
            students.remove(at: index)
            print("\(name) 학생을 삭제했습니다.")
        } else {
            print("\(name)", CreditManageError.notFoundStudent.localizedDescription)
        }
    }

    private func updateCredit() {
        guard !students.isEmpty else {
            print(CreditManageError.emptyStudents(.update).localizedDescription)
            return
        }

        print("성적을 추가할 학생의 이름, 과목, 성적(A+, A, F 등)을 띄어쓰기로 구분하여 차례로 입력해주세요.")
        print("입력예) Haru Swift A+")
        print("만약에 학생의 성적 중 해당 과목이 존재하면 기존 점수가 갱신됩니다.")

        guard let texts: [String] = getText(3) else { return }

        let (name, subject, inputCredit) = (texts[0], texts[1], texts[2])
        
        guard let credit = Credit(rawValue: inputCredit) else {
            print(CreditManageError.invalidGradeInput.localizedDescription)
            return
        }
        
        if let index = students.firstIndex(where: { $0.name == name }) {
            students[index].credits[subject] = credit
            print("\(name) 학생의 \(subject) 과목이 \(inputCredit)으로 추가(변경)되었습니다.")
        } else {
            print("\(name)", CreditManageError.notFoundStudent.localizedDescription)
        }
    }

    private func deleteCredit() {
        guard !students.isEmpty else {
            print(CreditManageError.emptyStudents(.deleteCredit))
            return
        }

        print("성적을 삭제할 학생의 이름, 과목을 띄어쓰기로 구분하여 차례로 입력해주세요.")
        print("입력예) Haru Swift")

        guard let texts: [String] = getText(2) else { return }

        let (name, subject) = (texts[0], texts[1])
        
        guard let index = students.firstIndex(where: { $0.name == name }) else {
            print("\(name)", CreditManageError.notFoundStudent.localizedDescription)
            return
        }
        
        if students[index].credits[subject] != nil {
            students[index].credits[subject] = nil
            print("\(name) 학생의 \(subject) 과목의 성적이 삭제 되었습니다.")
        } else {
            print(CreditManageError.notFoundSubject(name: name, subject: subject))
        }
    }

    private func checkScore() {
        guard !students.isEmpty else {
            print(CreditManageError.emptyStudents(.deleteCredit))
            return
        }

        print("성적을 확인할 학생의 이름을 입력해주세요.")

        guard let name: String = getText() else { return }
        
        if let student = students.first(where: { $0.name == name}) {
            guard !student.credits.isEmpty else {
                print("\(name)", CreditManageError.emptyCredits.localizedDescription)
                return
            }
            
            for (subject, credit) in student.credits {
                print("\(subject): \(credit.rawValue)")
            }
            
            print("평점: \(student.score)")
        } else {
            print("\(name)", CreditManageError.notFoundStudent.localizedDescription)
        }
    }
}

extension CreditManager {
    private func getText<T>(_ count: Int = 1) -> T? {
        guard let input = readLine() else { return nil }

        let word = input.trimmingCharacters(in: .whitespaces)

        guard !word.isEmpty else {
            print(CreditManageError.invalidInput(.text).localizedDescription)
            return nil
        }
        
        let inputValues = word.components(separatedBy: " ")
        
        guard inputValues.count == count else {
            print(CreditManageError.invalidInput(.text).localizedDescription)
            return nil
        }
        
        if inputValues.count == 1 {
            return word as? T
        } else {
            return inputValues as? T
        }
    }
}
