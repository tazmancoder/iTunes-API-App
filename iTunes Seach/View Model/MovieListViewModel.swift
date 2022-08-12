//
//  MovieListViewModel.swift
//  iTunes Seach
//
//  Created by Mark Perryman on 8/10/22.
//

import Foundation
import Combine

class MovieListViewModel: ObservableObject {
    
    @Published var searchTerm: String = ""
    @Published var movies: [Movie] = [Movie]()
    @Published var state: FetchState = .good
    
    private let service = APIService()

    let defaultLimits = 50
    
    var subscriptions = Set<AnyCancellable>()
    
    init() {

        $searchTerm
            .removeDuplicates()
            .dropFirst()
            .debounce(for: .seconds(0.5), scheduler: RunLoop.main)
            .sink { [weak self] term in
                self?.clear()
                self?.fetchMovies(for: term)
            }.store(in: &subscriptions)
        
    }
    
    func clear() {
        state = .good
        movies = []
//        page = 0
    }
    
    func fetchMovies(for searchTerm: String) {
        
        guard !searchTerm.isEmpty else {
            return
        }
        
        guard state == FetchState.good else {
            return
        }
        
        state = .isLoading
        
        service.fetchMovies(searchTerm: searchTerm) { [weak self]  result in
            DispatchQueue.main.async {
                switch result {
                    case .success(let results):
                        self?.movies = results.results
                
                        if results.resultCount == self?.defaultLimits {
                            self?.state = .good
                        } else {
                            self?.state = .loadedAll
                        }
                      
                        print("Fetched Movies: \(results.resultCount) - \(results.results.count)")
                        
                    case .failure(let error):
                        print("error loading movies: \(error)")
                        self?.state = .error(error.localizedDescription)
                }
            }
        }
    }
    
    func loadMore() {
        fetchMovies(for: searchTerm)
    }
    
    static func example() -> MovieListViewModel {
        let vm = MovieListViewModel()
        vm.movies = [Movie.example()]
        return vm
    }
}
