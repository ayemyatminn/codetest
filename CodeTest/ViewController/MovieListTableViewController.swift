//
//  MovieListTableViewController.swift
//  CodeTest
//
//  Created by Aye Myat Minn on 18/11/2023.
//

import UIKit

class MovieListTableViewController: UITableViewController {
    
    
    let viewModel = MovieListViewModel()
    
    static var identifier : String {
        return String(describing:MovieListTableViewController.self)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        tableView.separatorStyle = .none
        tableView.showsHorizontalScrollIndicator = false
        tableView.showsVerticalScrollIndicator = false
        
        bindData()
    }
    
    func bindData() {
        viewModel.fetchMovies()
        viewModel.$popularMovies
            .receive(on: DispatchQueue.main)
            .sink { [weak self] _ in
                self?.tableView.reloadData()
            }
            .store(in: &viewModel.cancellables)

        viewModel.$upcomingMovies
            .receive(on: DispatchQueue.main)
            .sink { [weak self] _ in
                self?.tableView.reloadData()
            }
            .store(in: &viewModel.cancellables)
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return section == 0 ? viewModel.popularMovies.count : viewModel.upcomingMovies.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MovieCell", for: indexPath)
        let movie = indexPath.section == 0 ? viewModel.popularMovies[indexPath.row] : viewModel.upcomingMovies[indexPath.row]

        cell.textLabel?.text = movie.title
        cell.detailTextLabel?.text = "Release Date: \(movie.releaseDate)"

        return cell
    }

    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return section == 0 ? "Popular Movies" : "Upcoming Movies"
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let storyBoard = UIStoryboard(name: "Main", bundle: nil)
        if let vc = storyBoard.instantiateViewController(withIdentifier: MovieDetailViewController.identifier) as? MovieDetailViewController{
            vc.selectedMovie = indexPath.section == 0 ? viewModel.popularMovies[indexPath.row] : viewModel.upcomingMovies[indexPath.row]
            vc.modalPresentationStyle = .fullScreen
            self.present(vc, animated: true, completion: nil)
        }
    }
}

