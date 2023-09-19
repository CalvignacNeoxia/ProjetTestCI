
import Foundation
import CoreData


extension RecipeSaved {

    public class func fetchRequest() -> NSFetchRequest<RecipeSaved> {
        return NSFetchRequest<RecipeSaved>(entityName: "RecipeSaved")
    }

    @NSManaged public var image: String?
    @NSManaged public var ingredientLines: NSObject?
    @NSManaged public var ingredients: String?
    @NSManaged public var label: String?
    @NSManaged public var totalTime: Int16
    @NSManaged public var url: String?
    @NSManaged public var yield: Int16

}
