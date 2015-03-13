//
//  ViewController.swift
//  WordCloud
//
//  Created by Marcea Decker on 3/6/15.
//  Copyright (c) 2015 md. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var wordCloud: UITextView!
 
    
    var myMutableString = NSMutableAttributedString()
    var myString:NSString = "when I get to the bottom I go back to the top of the slide where I stop and I turn and I go for a ride till I get to the bottom and I see you again do you don't you want me to love you I'm coming down fast but I'm miles above you tell me tell me tell me come on tell me the answer well you may be a lover but you ain't no dancer will you won't you want me to make you I'm coming down fast but don't let me break you tell me tell me tell me the answer you may be a lover but you ain't no dancer look out look out cos here she comes when I get to the bottom I go back to the top of the slide and I stop and I turn and I go for a ride and I get to the bottom and I see you again well do you, don't you want me to make you I'm coming down fast but don't let me break you tell me tell me tell me the answer you may be a lover but you ain't no dancer look out look out she's coming down fast yes she is yes she is coming down fast"
    
    var countArray = [Int]()
    var newArray = [NSString]()


    override func viewDidLoad() {
        super.viewDidLoad()
        
        var arr = myString.componentsSeparatedByString(" ")
        println(arr)
        for var i = 0; i < arr.count; ++i {
            if( arr[i] as NSString ==  "I" || arr[i] as NSString ==  "am" || arr[i] as NSString ==  "of" || arr[i] as NSString ==  "you" || arr[i] as NSString ==  "to" || arr[i] as NSString ==  "the" || arr[i] as NSString ==  "a" || arr[i] as NSString ==  "me"){
                arr.removeAtIndex(i)
                i--;
                
            }
        }
        println("arr: \(arr)")
        
//        var myStringParsed = arr.description as NSString
        for var i = 0; i < arr.count; ++i {
            var flag : Bool = false
            for var j = 0; j < newArray.count; ++j {
                if ( arr[i] as NSString == newArray[j] ){
                    countArray[j] =  countArray[j] + 1
                    flag = true
                    break
                }
            }
            if ( flag == false ){
                newArray.append(arr[i] as NSString)
                countArray.append(1)
                
            }
            
        }
        println("arr: \(arr)")
        println("newArray \(newArray)")
        println("countArray \(countArray)")
        

        for var i=0; i<newArray.count; i++ {
            let myString2: NSString = newArray[i] // as NSString
            
            
            
            //myMutableString = NSMutableAttributedString(string: myString2, attributes: [NSFontAttributeName:UIFont(name: "Helvetica", size: 15.0)!])
//            wordCloud.attributedText = myMutableString
            
            // 2 set up the dictionary
            let firstAttributes = [NSForegroundColorAttributeName: UIColor.blueColor(), NSBackgroundColorAttributeName: UIColor.yellowColor(), NSUnderlineStyleAttributeName: 1]
            let secondAttributes = [NSForegroundColorAttributeName: UIColor.redColor(), NSBackgroundColorAttributeName: UIColor.blueColor(), NSStrikethroughStyleAttributeName: 1]
            let thirdAttributes = [NSForegroundColorAttributeName: UIColor.greenColor(), NSBackgroundColorAttributeName: UIColor.blackColor(), NSFontAttributeName: UIFont.systemFontOfSize(40)]
            
            // 3
            
//            println("newArray: \(newArray)")
            
            myMutableString.addAttributes(firstAttributes, range: myString.rangeOfString(newArray[1]))

            myMutableString.addAttributes(firstAttributes, range: myString.rangeOfString("hello"))
//myMutableString.addAttributes(secondAttributes, range: myString.rangeOfString("when", "hey"))
            myMutableString.addAttributes(thirdAttributes, range: myString.rangeOfString("Bottom"))
            
            // 4
            //wordCloud.attributedText = myMutableString

        }
        
        
//        myMutableString = NSMutableAttributedString(string: myString);, attributes: [NSFontAttributeName:UIFont(name: "Helvetica", size: 5.0)!])

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

