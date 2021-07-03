//
//  TableViewController.swift
//  Collection2sections
//
//  Created by gustavo.cosenza on 02/07/21.
//

import UIKit

class TableViewController: UITableViewController {
    
    var arrayGitRepos: [GithubRepoModel] = []
    
    override func viewWillAppear(_ animated: Bool) {
        let network = HTTPServices()

        
            network.request(endpoint: GithubReposEndpoint()) { (result: Result<[GithubRepoModel], NetworkError>) in
                switch result {
                    case .success:
                        do {
                            let teste = try result.get()
                            print(teste.count)
                            self.arrayGitRepos = teste
//                            DispatchQueue.main.async {
//                                self.tableView.reloadData()
//                            }
                        } catch let error {
                            print(error.localizedDescription)
                        }
                    case .failure:
                        print("falhou a requisicao: \(result)")
                    }
                
            }
        
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.tableView.register(UITableViewCell.self, forCellReuseIdentifier: "reuseIdentifier")
    }
    
    

    // MARK: - Table view data source
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return arrayGitRepos.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)
        cell.textLabel?.text = arrayGitRepos[indexPath.row].name
        return cell
    }

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
