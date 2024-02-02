////
////  Apimanager.swift
////  NetflixVision
////
////  Created by Turdesan Csaba on 24/01/2024.
////
//
import Foundation
import Moya

enum ApiServices: TargetType {
    case getFilms(apikey: String)
    case getTrendingFilms(apikey: String)
    case getUpcomingMovies(apikey: String)
    case getPopularMovies(apikey: String)
    case getTopratedMovies(apikey: String)
    case getDiscoverMovies(apikey: String)
    case search(apikey: String, query: String)
    case getMovieYoutube(apikey: String, query: String)
    
    var baseURL: URL {
        switch self {
        case .getFilms:
            return URL(string: "https://api.themoviedb.org/3/")!

        case .getTrendingFilms:
            return URL(string: "https://api.themoviedb.org/3/")!

        case .getUpcomingMovies:
            return URL(string: "https://api.themoviedb.org/3/")!

        case .getPopularMovies:
            return URL(string: "https://api.themoviedb.org/3/")!

        case .getTopratedMovies:
            return URL(string: "https://api.themoviedb.org/3/")!

        case .getDiscoverMovies:
            return URL(string: "https://api.themoviedb.org/3/")!

        case .search:
            return URL(string: "https://api.themoviedb.org/3/")!

        case .getMovieYoutube:
            return URL(string: "https://www.googleapis.com/youtube/v3/")!
        }
    }
    
    var path: String {
        switch self {
        case .getFilms:
            return "trending/all/day"
            
        case .getTrendingFilms:
            return "trending/movie/day"
            
        case .getUpcomingMovies:
            return "movie/upcoming"
            
        case .getPopularMovies:
            return "movie/popular"
            
        case .getTopratedMovies:
            return "movie/top_rated"
            
        case .getDiscoverMovies:
            return "discover/movie"
            
        case .search:
            return "search/movie"
            
        case .getMovieYoutube:
            return "search/"
        }
    }
    
    var method: Moya.Method {
        return .get
    }
    
    var task: Moya.Task {
        switch self {
        case .getFilms(let apikey):
            return .requestParameters(parameters: ["api_key": apikey ], encoding: URLEncoding.queryString)
            
        case .getTrendingFilms(let apikey):
            return .requestParameters(parameters: ["api_key": apikey ], encoding: URLEncoding.queryString)
            
        case .getUpcomingMovies(let apikey):
            return .requestParameters(parameters: ["api_key": apikey ], encoding: URLEncoding.queryString)
            
        case .getPopularMovies(let apikey):
            return .requestParameters(parameters: ["api_key": apikey ], encoding: URLEncoding.queryString)
            
        case .getTopratedMovies(let apikey):
            return .requestParameters(parameters: ["api_key": apikey ], encoding: URLEncoding.queryString)
            
        case .getDiscoverMovies(let apikey):
            return .requestParameters(parameters: ["api_key": apikey ], encoding: URLEncoding.queryString)
            
        case .search(let apikey, let query):
            return .requestParameters(parameters: ["api_key": apikey, "query": query], encoding: URLEncoding.queryString)
            
        case .getMovieYoutube(let apikey, let query):
            return .requestParameters(parameters: ["q": query, "key": apikey], encoding: URLEncoding.queryString)
        }
    }
    
    var headers: [String : String]? {
        return [ "Content-Type": "application/json" ]
    }
}

class ApiManager: ObservableObject {
    
    @Published var trendingMovies: [Title] = []
    @Published var trendingTvs: [Title] = []
    @Published var upcomingMovies: [Title] = []
    @Published var popularMovies: [Title] = []
    @Published var discoverMovies: [Title] = []
    @Published var topRatedMovies: [Title] = []
    
    @Published var search: [Title] = []
    
    let apikey = ""
    let youtubeApikey = ""
    
    /*
     you can get your apikey -> https://themoviedb.org/
     //you can get your apikey -> https://console.cloud.google.com/
     */
    
    let provider = MoyaProvider<ApiServices>()
    
    
    func getTrendingMovies() {
        provider.request(.getFilms(apikey: apikey)) { result in
            switch result {
                
            case .success(let response):
                print(response.statusCode)
                do {
                    let decodedJson = try JSONDecoder().decode(TrendingMoviesResponse.self, from: response.data)
                    self.trendingMovies = decodedJson.results
                } catch {
                    print(String(describing: error))
                }
            case .failure(let error):
                print(String(describing: error))
            }
        }
    }
    
    func getTrendingTvs() {
        provider.request(.getTrendingFilms(apikey: apikey)) { result in
            switch result{
            case .success(let response):
                do{
                    let decodedJson = try JSONDecoder().decode(TrendingMoviesResponse.self, from: response.data)
                    self.trendingTvs = decodedJson.results
                } catch {
                    print(String(describing: error))
                }
            case .failure(let error):
                print(String(describing: error))
            }
        }
    }
    
    func getUpcomingMovies(){
        provider.request(.getUpcomingMovies(apikey: apikey)) { result in
            switch result {
            case .success(let response):
                print(response.statusCode)
                do {
                    let decodedJson = try JSONDecoder().decode(TrendingMoviesResponse.self, from: response.data)
                    self.upcomingMovies = decodedJson.results
                } catch{
                    print(String(describing: error))
                }
            case .failure(let error):
                print(String(describing: error))
            }
        }
    }
    
    func getPopularMovies() {
        provider.request(.getPopularMovies(apikey: apikey)) { result in
            switch result {
            case .success(let response):
                print(response.statusCode)
                do {
                    let decodedJson = try JSONDecoder().decode(TrendingMoviesResponse.self, from: response.data)
                    self.popularMovies = decodedJson.results
                } catch{
                    print(String(describing: error))
                }
            case .failure(let error):
                print(String(describing: error))
            }
        }
    }
    
    func getToprated() {
        provider.request(.getTopratedMovies(apikey: apikey)) { result in
            switch result {
            case .success(let response):
                print(response.statusCode)
                do {
                    let decodedJson = try JSONDecoder().decode(TrendingMoviesResponse.self, from: response.data)
                    self.topRatedMovies = decodedJson.results
                } catch{
                    print(String(describing: error))
                }
            case .failure(let error):
                print(String(describing: error))
            }
        }
    }
    
    func getDiscoverMovies(){
        provider.request(.getDiscoverMovies(apikey: apikey)) { result in
            switch result{
            case .success(let response):
                print(response.statusCode)
                do {
                    let decodedJson = try JSONDecoder().decode(TrendingMoviesResponse.self, from: response.data)
                    self.discoverMovies = decodedJson.results
                } catch{
                    print(String(describing: error))
                }
            case .failure(let error):
                print(String(describing: error))
            }
        }
    }
    
    func search(with query: String) {
        provider.request(.search(apikey: apikey, query: query)) { result in
            switch result {
            case .success(let response):
                print(response.statusCode)
                do {
                    let decodedJson = try JSONDecoder().decode(TrendingMoviesResponse.self, from: response.data)
                    self.search = decodedJson.results
                } catch {
                    print(String(describing: error))
                }
            case .failure(let error):
                print(String(describing: error))
            }
        }
    }
    
    func getMovieYoutube(with query: String, completed: @escaping ([VideoElement]) -> Void) {
         provider.request(.getMovieYoutube(apikey: youtubeApikey, query: query)) { result in
             switch result {
             case .success(let response):
                 print(response.statusCode)
                 print(response.response?.url?.absoluteURL)
                 do{
                     let decodedJson = try JSONDecoder().decode(YoutubeSearchResponse.self, from: response.data)
                     completed(decodedJson.items)
                 } catch {
                     print(String(describing: error))
                 }
             case .failure(let error):
                 print(String(describing: error))
             }
         }
     }
}
