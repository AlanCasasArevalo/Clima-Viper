//
//  WebService.swift
//  Clima-Viper
//
//  Created by Casa on 05/07/2019.
//  Copyright © 2019 Alan Casas. All rights reserved.
//

import Foundation

internal enum WebServiceError: Error {
    case badStatus(Int, Data)
    case api(Int, String)
}

final internal class WebService {
    
    private let configuration: WebServiceConfiguration
    private let session = URLSession(configuration: .default)
    private let baseURL = WebConstants.baseURL
    private let decoder = JSONDecoder()
    
    init(configuration: WebServiceConfiguration = .default) {
        self.configuration = configuration
    }
    
    func fetchResultFromAPI <T: Decodable> (type: T.Type, endpoint: Endpoint, completionHandler: @escaping (Result<T, Error>) -> ()) {
        
        let request = endpoint.request(with: baseURL, parameters: configuration.parameters)
        
        let task = session.dataTask(with: request, completionHandler: { (data, response, error) in
            guard let dataDes = data else {return}
            let statusCode = (response as! HTTPURLResponse).statusCode
            print("URL Session Log in Task Succeeded: \(statusCode) -> HTTP")
            if (error == nil) {
                do{
                    let json = try JSONDecoder().decode(T.self, from: dataDes)
                    completionHandler(.success(json))
                } catch let DecodingError.dataCorrupted(context) {
                    print(context)
                } catch let DecodingError.keyNotFound(key, context) {
                    print("Key '\(key)' not found:", context.debugDescription)
                    print("codingPath:", context.codingPath)
                } catch let DecodingError.valueNotFound(value, context) {
                    print("Value '\(value)' not found:", context.debugDescription)
                    print("codingPath:", context.codingPath)
                } catch let DecodingError.typeMismatch(type, context)  {
                    print("Type '\(type)' mismatch:", context.debugDescription)
                    print("codingPath:", context.codingPath)
                } catch {
                    completionHandler(.failure(error))
                }
            }else {
                print("URL Session Log in Task Failed: %@", error!.localizedDescription);
                completionHandler(.failure(error!))
            }
        })
        task.resume()
    }
}

