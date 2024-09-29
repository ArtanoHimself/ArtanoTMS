import UIKit

// Optionals


// Optional is a piece of data that MAY, or MAY NOT have value


// There is always a value and it's "Boolean"
let myBool: Bool = true                   // It can be true or false

// We don't know if there is a value, and if there is, it's Bool
let myOtherBool: Bool? = nil         // It can be true, false or nil


// nil coalescing operatonr "??". "??" - means otherwise.                  ------------      1st Unwrap

let newValue: Bool? = myOtherBool

let newValue2: Bool = myOtherBool ?? false    // This means that "newValue2" is equal to the value of "myOtherBool" (if there is one). If the value is nil - then it will default false

print("New Value 2 = \(newValue2.description)") // It takes the default value because "myOtherBool" is nil

// Any type can be nil

var myString: String? = nil

let myOtherString = myString ?? "Some default value"

print(myOtherString)


//---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

var userIsPremium: Bool? = false

func checkIfUserIsPremium() -> Bool? {
    return userIsPremium
}

func checkIfUserIsPremium2() -> Bool {
    return userIsPremium ?? false
}

let isPremuim = checkIfUserIsPremium2() // isPremium sets to Bool, not to Bool?. Because func returns an actual value because of unwrapping



// If let UNWRAP method                                                     -----------       2nd Unwrap
// When if-let is successeful, enter the clouse


func checkIfUserIsPremium3() -> Bool {
    
    // If there is a value, let newValue equal that value
    if let newValue = userIsPremium {
        // Here we recieve non-optional value we can use in this closure
        return newValue
    } else {
        return false
    }
}

func checkIfUserIsPremium4() -> Bool {
    
    // Instead of creating a new constant "newValue" we return clean non-optional userIsPremium and we can work with it in this closure
    if let userIsPremium{
        return userIsPremium
    } else {
        return false
    }
}


// Guard UNWRAP method                                                      -----------      3rd unwrap
// When a guard is a failure, enter the closure

func checkIfUserIsPremium6() -> Bool {
    
    // Make sure there is a value
    // If there is, let newValue equal that value
    // Else (otherwise) return out of the function
    guard let newValue = userIsPremium else {
        return false
    }
    // Here we have access to non-optional value
    return newValue
}

func checkIfUserIsPremium7() -> Bool {
    guard let userIsPremium else {
        return false
    }
    
    return userIsPremium
}

//---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

var userIsNew: Bool? = true
var userDidCompleteOnboarding: Bool? = true
var userFavoriteMovie: String? = nil

func checkIfUserIsSetUp() -> Bool {
    
    if let userIsNew, let userDidCompleteOnboarding, let userFavoriteMovie {
        // userIsNew == Bool AND
        // userDidCompleteOnboarding == Bool AND
        // userFavouriteMovie == String
        return getUserStatus(userIsNew: userIsNew, userDidCompleteUnboarding: userDidCompleteOnboarding, userFavoriteMovie: userFavoriteMovie)
    } else {
        // userIsNew == nil OR
        // userDidCompleUnboarding == nil OR
        // userFavouriteMovie == nil
        return false
    }
}


func checkIfUserIsSetUp2() -> Bool {
    guard let userIsNew, let userDidCompleteOnboarding, let userFavoriteMovie else {
        // userIsNew == Bool AND
        // userDidCompleteOnboarding == Bool AND
        // userFavouriteMovie == String
        return false
    }
    return getUserStatus(userIsNew: userIsNew, userDidCompleteUnboarding: userDidCompleteOnboarding, userFavoriteMovie: userFavoriteMovie)
}






func getUserStatus(userIsNew: Bool, userDidCompleteUnboarding: Bool, userFavoriteMovie: String) -> Bool {
    if userIsNew && userDidCompleteUnboarding {
        return true
    } else {
        return false
    }
}



// Layered guard

func checkIfUserSetUp3 () -> Bool {
    guard let userIsNew else {
        return false
    }
    guard let userDidCompleteOnboarding else {
        return false
    }
    guard let userFavoriteMovie else {
        return false
    }
    return getUserStatus(
        userIsNew: userIsNew,
        userDidCompleteUnboarding: userDidCompleteOnboarding,
        userFavoriteMovie: userFavoriteMovie)
}

func checkIfUserSetUp4() -> Bool {
    guard let userIsNew,
          let userDidCompleteOnboarding,
          let userFavoriteMovie else {
        return false
        }
    return getUserStatus(
        userIsNew: userIsNew,
        userDidCompleteUnboarding: userDidCompleteOnboarding,
        userFavoriteMovie: userFavoriteMovie)
            
}


// Optional chaining

let user: String? = nil

func getUserData() {
    let username: String? = user
    let count = username?.count
    // "I will get the count if username is not nil"
    
    
    // Uf username has a value, and first character in username has value
    let firstCharLowercased = username?.first?.isLowercase ?? false
    print(firstCharLowercased)
  
}



/*
 
Safely unwrap an optional
  
  1. nil coalscing
  2. if-let
  3. guard
  
 Unsafe method with ! 
 */




