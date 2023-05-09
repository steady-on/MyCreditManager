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
            do { try addStudent() } catch { print(error) }
            continue
        case "2":
            do { try deleteStudent() } catch { print(error) }
            continue
        case "3":
            do { try updateCredit() } catch { print(error) }
            continue
        case "4":
            do { try deleteCredit() } catch { print(error) }
            continue
        case "5":
            checkScore()
            continue
        case "X", "x":
            print("프로그램을 종료합니다...")
            break menuLoop
        default:
            continue
        }
    }
    }
    
    private func addStudent() throws {
        print("추가할 학생의 이름을 입력해주세요.")
        
        guard let name = verifyInputValue() else { throw InputValueError.text }
        
        guard students.contains(where: { $0.name == name }) else { throw InvalidDataError.duplicatedStudent(name: name) }
        
        let student = Student(name: name)
        
        students.append(student)
        
        print("\(name) 학생을 추가했습니다.")
    }
    
    private func deleteStudent() throws {
        guard students.isEmpty == false else { throw EmptyDataError.deleteStudent }
        
        print("삭제할 학생의 이름을 입력해주세요.")
        
        guard let name = verifyInputValue() else { throw InputValueError.text }
        
        guard let index = students.firstIndex(where: { $0.name == name }) else {
            throw InvalidDataError.notFoundStudent(name: name)
        }
        
        students.remove(at: index)
        print("\(name) 학생을 삭제했습니다.")
    }
    
    private func updateCredit() throws {
        guard students.isEmpty == false else { throw EmptyDataError.updateCredit }
        
        print("""
            성적을 추가할 학생의 이름, 과목, 성적(A+, A, F 등)을 띄어쓰기로 구분하여 차례로 입력해주세요.
            입력예) Haru Swift A+
            만약 학생의 성적 중 해당 과목이 존재하면 기존 점수가 갱신됩니다.
            """)
        
        guard let inputValues = verifyInputValues(count: 3) else { throw InputValueError.text }
        
        let (name, subject, inputCredit) = (inputValues[0], inputValues[1], inputValues[2])
        
        guard let credit = Credit(rawValue: inputCredit) else { throw InputValueError.grade }
        
        guard let index = students.firstIndex(where: { $0.name == name }) else { throw InvalidDataError.notFoundStudent(name: name) }
        
        students[index].credits[subject] = credit
        print("\(name) 학생의 \(subject) 과목이 \(inputCredit)으로 추가(변경)되었습니다.")
    }
    
    private func deleteCredit() throws {
        guard students.isEmpty == false else { throw EmptyDataError.deleteCredit }
        
        print("성적을 삭제할 학생의 이름, 과목을 띄어쓰기로 구분하여 차례로 입력해주세요.")
        print("입력예) Haru Swift")
        
        guard let inputValues = verifyInputValues(count: 2) else { throw InputValueError.text }
        
        let (name, subject) = (inputValues[0], inputValues[1])
        
        guard let index = students.firstIndex(where: { $0.name == name }) else {
            throw InvalidDataError.notFoundStudent(name: name)
        }
        
        guard students[index].credits[subject] != nil else { throw InvalidDataError.notFoundSubject(name: name, subject: subject) }
        
        students[index].credits[subject] = nil
        print("\(name) 학생의 \(subject) 과목의 성적이 삭제 되었습니다.")
    }
    
    private func checkScore() throws {
        guard students.isEmpty == false else { throw EmptyDataError.deleteCredit }
        
        print("성적을 확인할 학생의 이름을 입력해주세요.")
        
        guard let name = verifyInputValue() else { throw InputValueError.text }
        
        guard let student = students.first(where: { $0.name == name}) else { throw InvalidDataError.notFoundStudent(name: name) }
                
        guard student.credits.isEmpty == false else { throw EmptyDataError.emptyCredits(name: name) }
        
        for (subject, credit) in student.credits {
            print("\(subject): \(credit.rawValue)")
        }
        
        print("평점: \(student.score)")
    }
}

extension CreditManager {
    private func verifyInputValue() -> String? {
        guard let inputValue = readLine()?.trimmingCharacters(in: .whitespaces),
              inputValue.isEmpty == false else { return nil }
        
        return inputValue
    }
    
    private func verifyInputValues(count: Int) -> [String]? {
        guard let inputString = readLine()?.trimmingCharacters(in: .whitespaces),
              inputString.isEmpty == false else { return nil }
        
        let inputValues = inputString.components(separatedBy: " ")
        
        guard inputValues.count == count else { return nil }
        
        return inputValues
    }
}
