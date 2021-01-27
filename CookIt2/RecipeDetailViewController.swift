//
//  RecipeDetailViewController.swift
//  CookIt2
//
//  Created by OWEN on 26/1/21.
//

import UIKit

class RecipeDetailViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    var recipe: Recipes?
  
  @IBOutlet weak var imageView: UIImageView!
  @IBOutlet weak var tableView: UITableView!
  
  override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
      self.title = recipe?.title
      tableView.delegate = self
      tableView.dataSource = self
    
    guard let unWrappedRecipe = recipe,
        let url = URL(string: unWrappedRecipe.imageURL),
        let data = try? Data(contentsOf: url),
        let validImage = UIImage(data: data)
    else{
      print("error retrieving image from recipe image url")
      return
    }
    
    self.title = unWrappedRecipe.title
    imageView.image = validImage
    }
    
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return recipe?.steps.count ?? 0
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: "stepCell", for: indexPath)
    
    cell.textLabel?.text = recipe?.steps[indexPath.row]
    return cell
  }
  
}
