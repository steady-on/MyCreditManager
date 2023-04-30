//
//  CreditManageError.swift
//  MyCreditManager
//
//  Created by Roen White on 2023/04/30.
//

import Foundation

enum InputType {
    case menu
    case text
}

enum FunctionType {
    case deleteStudent
    case update
    case deleteCredit
    case check
}

enum CreditManageError: Error {
    case invalidInput(InputType)
    case emptyStudents(FunctionType)
    case existStudent(name: String)
    case notFoundStudent(name: String)
    case invalidGradeInput
    case notFoundSubject(name: String, subject: String)
    case emptyCredits(name: String)
    
    var localizedDescription: String {
        switch self {
        case .invalidInput(.menu):
            return "잘못된 입력입니다. 1~5 사이의 숫자 혹은 X를 입력해주세요."
        case .invalidInput(.text):
            return "잘못된 입력입니다. 다시 확인해 주세요."
        case .emptyStudents(.deleteStudent):
            return "삭제할 학생이 없습니다. 먼저 학생을 추가해 주세요."
        case .emptyStudents(.update):
            return "성적을 추가(변경)할 학생이 없습니다. 먼저 학생을 추가해 주세요."
        case .emptyStudents(.deleteCredit):
            return "성적을 삭제할 학생이 없습니다. 먼저 학생을 추가해 주세요."
        case .emptyStudents(.check):
            return "성적을 조회할 학생이 없습니다. 먼저 학생을 추가해 주세요."
        case .existStudent(let name):
            return "\(name) 학생의 데이터는 이미 존재하므로 추가되지 않습니다."
        case .notFoundStudent(let name):
            return "\(name) 학생을 찾을 수 없습니다."
        case .invalidGradeInput:
            return "올바르지 않은 성적이 입력되었습니다. 다시 확인해 주세요."
        case .notFoundSubject(let name, let subject):
            return "\(name) 학생의 \(subject)에 대한 성적을 찾을 수 없습니다. 다시 확인해 주세요."
        case .emptyCredits(let name):
            return "\(name) 학생은 아직 입력된 성적이 없습니다. 성적을 추가해 주세요."
        }
    }
}
