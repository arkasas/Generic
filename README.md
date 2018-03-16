Generic
============
[![Carthage compatible](https://img.shields.io/badge/Carthage-compatible-4BC51D.svg?style=flat)](https://github.com/Carthage/Carthage)
![Build passing](https://img.shields.io/badge/build-passing-brightgreen.svg?style=flat)
![Swift 4.0](https://img.shields.io/badge/Swift-4.0-orange.svg)

Genric is a framework written in Swift that makes create UITableView and UICollectionView easier than even before. 

- [Features](#features)
- [The Basics](#the-basics)
- [Simple plist file](#use-included-support-for-plist-file)
- [Plist file with section](#use-included-support-for-plist-file)
- [Separete with Section](#separete-with-section)
- [Extension](#extension)
- [To Do](#to-do)
- [Instalation](#instalation)

# Features:
 - Generate Data Source for UICollectionView
 - Generate Data Source for UITableView
 - Support for create data from .plist file
 
 # The Basics 
 To support generic create data source you need to do a several thing. First of them is create a model that describe your cell:
 ```swift
 class SimpleModel: Model {
     var reuseIdentifier: String = "Cell"
   
     var name: String!
     init(name: String) {
         self.name = name
     }
 }
 ```
 Variable reuseIdentifier is identifier of your cell defined in storyboard file co in code. 
 Next you need create your cell:
 
 - UITableViewCell
  ```swift
 class TableViewCell: BaseTableViewCell<SimpleModel> {
     override var model: SimpleModel {
         didSet {
             textLabel?.text = model?.name   
         }
     }
 }
 ```
 
 - UICollectionViewCell
  ```swift
 class CollectionViewCell: BaseCollectionViewCell<SimpleModel> {
     @IBOutlet weak var textLabel: UILabel!
     override var model: SimpleModel {
         didSet {
             textLabel.text = model?.name   
         }
     }
 }
 ```
 
 End in the end you create data source to add it to UITableView
  ```swift
 lazy var dataSource: TableDataSource<StandardDataManager<SimpleModel>> = {
        let section = Section<SimpleModel>(rows: [
            SimpleModel(name: "Uno"),
            SimpleModel(name: "Dos"),
            SimpleModel(name: "Tres")
            ])

        let manager = StandardDataManager<SimpleModel>(sections: [section])
        return TableDataSource(dataManager: manager)
    }()
  ```
  
```swift
tableView.dataSource = dataSource
```

Or for UICollectionView

  ```swift
 lazy var dataSource: CollectionDataSource<StandardDataManager<SimpleModel>> = {
        let section = Section<SimpleModel>(rows: [
            SimpleModel(name: "Uno"),
            SimpleModel(name: "Dos"),
            SimpleModel(name: "Tres")
            ])

        let manager = StandardDataManager<SimpleModel>(sections: [section])
        return TableDataSource(dataManager: manager)
    }()
  ```
  
```swift
collectionView.dataSource = dataSource
```


So, you say that in this example is not easier or simpler for you. But imagine project with ten UITableView, or UIColectionView, or both. In simple
way you elimnate not nessesery code. Is amazing with use generic models.

 # Use included support for plist file
 Image that you have manu in your app. Course you can configure it in code but maybe use plist file is beter options. So simple plist file 
 looks like that:
 ```plist
 <dict>
	<key>Menu</key>
	<array>
		<dict>
			<key>name</key>
			<string>One</string>
		</dict>
		<dict>
			<key>name</key>
			<string>Two</string>
		</dict>
		<dict>
			<key>name</key>
			<string>Three</string>
		</dict>
		<dict>
			<key>name</key>
			<string>Four</string>
		</dict>
		<dict>
			<key>name</key>
			<string>Five</string>
		</dict>
		<dict>
			<key>name</key>
			<string>Six</string>
		</dict>
		<dict>
			<key>name</key>
			<string>Seven</string>
		</dict>
		<dict>
			<key>name</key>
			<string>Eight</string>
		</dict>
	</array>
</dict>

```
Which is converted to this:
![alt text](https://github.com/arkasas/Generic/blob/master/Images/plist_template.png)

To bind this file to your table view you have to create model and cell. in this case cell could be the same as in basic template. Model is:
 ```swift
class SimpleModel: DictionaryDecoder, Model {
    var reuseIdentifier: String = "Cell"
    var name: String!

    required init(dictinary: NSDictionary) {
        name = dictinary.object(forKey: "name") as! String
    }
}
 ```

Next create data source to support yout Table/Collection View
 ```swift
lazy var dataSource: TableDataSource<PlistDataManager<SimpleModel>> = { 
    let manager = PlistDataManager<SimpleModel>(fileName: "Your File Name", dictKey: "Key for yout dictinary - in this case: Menu")
    return TableDataSource(dataManager: manager)
}()
```
Next:
 ```swift
 tableView.dataSource = dataSource
```
Same is in UICollectionView.

# Separete with Section
Many times we need separate our Table View to different options. With Generic and included supporter for plist section file is easy and helpfuly.
Start with create plist file like this:
```plist
<dict>
	<key>Menu</key>
	<array>
		<array>
			<dict>
				<key>name</key>
				<string>One</string>
			</dict>
			<dict>
				<key>name</key>
				<string>Two</string>
			</dict>
			<dict>
				<key>name</key>
				<string>Three</string>
			</dict>
		</array>
		<array>
			<dict>
				<key>name</key>
				<string>Uno</string>
			</dict>
			<dict>
				<key>name</key>
				<string>Dos</string>
			</dict>
			<dict>
				<key>name</key>
				<string>Tres</string>
			</dict>
		</array>
		<array>
			<dict>
				<key>name</key>
				<string>Jeden</string>
			</dict>
			<dict>
				<key>name</key>
				<string>Dwa</string>
			</dict>
			<dict>
				<key>name</key>
				<string>Trzy</string>
			</dict>
		</array>
	</array>
</dict>
```

Is shourt code should create sometting like
![alt text](https://github.com/arkasas/Generic/blob/master/Images/plist_section_template.png)
You could use cell for first basic template, and model for second template(Simple plist model)

```swift
lazy var dataSource: TableDataSource<PlistSectionDataManager<SimpleModel>> = {
    let manager = PlistSectionDataManager<SectionPlistModel>(name: "Section", key: "Menu")
    return TableDataSource(dataManager: manager)
}()
```
```swift
tableView.dataSource = dataSource
```
End.. Thats is all.

# Extension
Maybe you need something more. Of course is possible with this Library. Most important is extension for StandardDataManager. 
Let see for PlistSectionDataManager
```swift
class PlistSectionDataManager<T>: StandardDataManager<T> where T: DictionaryDecoder {

    private let fileName: String
    private let dictKey: String

    enum PlistSectionError: Error {
        case fileNotExist
        case cannotOpenFile
    }

    public init(name: String, key: String) {
        self.fileName = name
        self.dictKey = key

        super.init()

        tryAddObjectToManager()
    }

    private func tryAddObjectToManager() {
        do {
            let sections = try setup()
            super.append(newSections: sections)
        } catch {
            print(error)
        }
    }

    private func setup() throws -> [Section<T>] {
        let pArray = try openPlistFile()
        let section = parseSections(arrays: pArray)
        return section
    }

    private func openPlistFile() throws -> [NSArray] {
        guard let path = Bundle.main.path(forResource: fileName, ofType: "plist") else {
            throw PlistSectionError.fileNotExist
        }
        guard let rootDictinary = NSDictionary(contentsOfFile: path), let sections = rootDictinary[dictKey] as? [NSArray] else {
            throw PlistSectionError.cannotOpenFile
        }
        return sections
    }

    private func parseSections(arrays: [NSArray]) -> [Section<T>] {
        var sections = [Section<T>]()
        for object in arrays {
            let sec = Section<T>(name: " ", rows: parseNSArray(array: object))
            sections.append(sec)
        }

        return sections
    }

    private func parseNSArray(array: NSArray) -> [T] {
        var arr = [T]()
        for object in array where object is NSDictionary {
            arr.append(T(dictinary: object as! NSDictionary))
        }
        return arr
    }
```
So we need Protocol for model but you could use avaliable: DictionaryDecoder or Model. Next just write code goer generate models and voilà.
You could use own Manager.

# To do
- Manager for download JSON models

# Instalation
### Carthage
If you're using [Carthage](https://github.com/Carthage/Carthage) you can add a dependency on ObjectMapper by adding it to your `Cartfile`:

```
github "arkasas/Generic"
```

### Submodule
Otherwise, Generic can be added as a submodule:

1. Add Generic as a [submodule](http://git-scm.com/docs/git-submodule) by opening the terminal, `cd`-ing into your top-level project directory, and entering the command `git submodule add https://github.com/arkasas/Generic.git`
2. Open the `Generic` folder, and drag `Generic.xcodeproj` into the file navigator of your app project.
3. In Xcode, navigate to the target configuration window by clicking on the blue project icon, and selecting the application target under the "Targets" heading in the sidebar.
4. Ensure that the deployment target of `Generic.framework` matches that of the application target.
5. In the tab bar at the top of that window, open the "Build Phases" panel.
6. Expand the "Target Dependencies" group, and add `Generic.framework`.
7. Click on the `+` button at the top left of the panel and select "New Copy Files Phase". Rename this new phase to "Copy Frameworks", set the "Destination" to "Frameworks", and add `Generic.framework`.

