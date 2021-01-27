//
//  ViewController.swift
//  CookIt2
//
//  Created by OWEN on 26/1/21.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
  let recipes = [
    Recipe(title: "Veg fried rice", steps: ["S1: use cold rice", "S2: fried the veg first", "S3: Pour the rice in"], imageURL: "https://www.dinneratthezoo.com/wp-content/uploads/2016/10/veggie-fried-rice-6.jpg"),
    Recipe(title: "Veg brinjal", steps: ["S1", "S2"], imageURL: "https://cdn77-s3.lazycatkitchen.com/wp-content/uploads/2017/09/vegan-chinese-aubergine-800x1200.jpg"),
    Recipe(title: "White fungus", steps: ["S1", "S2", "S3"], imageURL: "https://thewoksoflife.com/wp-content/uploads/2019/12/snow-fungus-soup-6.jpg")
  ]
  
  
  @IBOutlet weak var tableView: UITableView!
  
  override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view.
    tableView.delegate = self
    tableView.dataSource = self
  }

  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return recipes.count
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: "recipeCell", for: indexPath)
    
    let recipe = recipes[indexPath.row]
    
    cell.textLabel?.text = recipe.title
    
    guard let url = URL(string: recipe.imageURL),
       let data = try? Data(contentsOf: url),
       let validImage = UIImage(data: data)
    else {
      print("error retrieving..")
      return cell
    }
    
    cell.imageView?.image = validImage
    return cell
  }

  override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
    if let destination = segue.destination as? RecipeDetailViewController,
       let index = tableView.indexPathForSelectedRow?.row {
      destination.recipe = recipes[index]
    }
  }
  
}

