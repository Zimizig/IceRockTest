//
//  AppRepository.swift
//  JuniorGitHubProject
//
//  Created by Роман on 08.11.2023.
//

import Foundation
import Alamofire
import UIKit

class AppRepository {
    
    //    func getRepositories(completion: @escaping (Array<Repo>?, Error?) -> Void) {
    //              // TODO:
    //    }
    //
    //    func getRepository(repoId: String, completion: @escaping (RepoDetails?, Error?) -> Void) {
    //             // TODO:
    //    }
    //
    //    func getRepositoryReadme(ownerName: String, repositoryName: String, branchName: String, completion: @escaping (String?, Error?) -> Void) {
    //        // TODO:
    //    }
    //
//        func signIn(token: String, completion: @escaping (UserInfo?, Error?) -> Void) {
//            
//        }
    // TODO:
    
    static let sharedInstance = AppRepository()
    
    func signIn(token: String, completion: @escaping (Result<[Model], NetworkError>) -> Void) {
        
        let url = "https://api.github.com/user/repos"
        let headers: HTTPHeaders = ["Authorization":"Bearer \(token)"]
        
        AF.request(url, method: .get, parameters: nil, encoding: URLEncoding.default, headers: headers, interceptor: nil )
            .validate()
            .response { responce in
                switch responce.result {
                case .success(let data) :
                    do {
                        let jsonData = try JSONDecoder().decode([Model].self, from: data!)
                        print(jsonData)
                    } catch {
                        print(String(describing: error))
                    }
                case .failure(let error) :
                    print(error.localizedDescription)
                }
            }
    }
}

func warningMessage (error: NetworkError) -> String {
    switch error {
    case.noData:
        return "404: Нет данных"
    case .toManyRequests:
        return "429: Слишком много запросов"
    case .deCodingError:
        return "Ошибка декодировки данных"
    }
    
}

struct Model: Codable {
    let id: Int
}

enum NetworkError: Error {
    case noData
    case toManyRequests
    case deCodingError
}
