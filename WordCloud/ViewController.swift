//
//  ViewController.swift
//  WordCloud
//
//  Created by Marcea Decker on 3/6/15.
//  Copyright (c) 2015 md. All rights reserved.
//

import UIKit

class ViewController: UIViewController,  UIPickerViewDelegate, UIPickerViewDataSource {
    
    //THIS IS FOR PICKERVIEW
    var songArray = ["All You Need is Love","Hello Goodbye","Blackbird","Helter Skelter","Hey Jude", "Magical Mystery Tour" ]
    
    @IBOutlet weak var wordCloud: UITextView!
    @IBOutlet weak var wordCloudLabel: UILabel!
    @IBOutlet weak var myLabel: UILabel!
    
    var attributedString = NSMutableAttributedString()
 
    var myString:NSString = "when I get to the bottom I go back to the top of the slide where I stop and I turn and I go for a ride till I get to the bottom and I see you again do you don't you want me to love you I'm coming down fast but I'm miles above you tell me tell me tell me come on tell me the answer well you may be a lover but you ain't no dancer will you won't you want me to make you I'm coming down fast but don't let me break you tell me tell me tell me the answer you may be a lover but you ain't no dancer look out look out cos here she comes when I get to the bottom I go back to the top of the slide and I stop and I turn and I go for a ride and I get to the bottom and I see you again well do you, don't you want me to make you I'm coming down fast but don't let me break you tell me tell me tell me the answer you may be a lover but you ain't no dancer look out look out she's coming down fast yes she is yes she is coming down fast" as NSString
    
    var countArray = [Int]()
    var newArray = [NSString]()


    override func viewDidLoad() {
        super.viewDidLoad()
        
        //user-input string UITextView BELOW
        //var myString:NSString = wordCloud.text as NSString
        
        var arr = myString.componentsSeparatedByString(" ")
        println(arr)
        for var i = 0; i < arr.count; ++i {
            if( arr[i] as NSString ==  "I" || arr[i] as NSString ==  "am" || arr[i] as NSString ==  "of" || arr[i] as NSString ==  "you" || arr[i] as NSString ==  "to" || arr[i] as NSString ==  "the" || arr[i] as NSString ==  "a" || arr[i] as NSString ==  "me"){
                arr.removeAtIndex(i)
                i--;
                
            }
        }
        println("arr: \(arr)")
        
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
        
        
        var newString: NSString = ""
        var mutableString = NSMutableAttributedString()
        
        wordCloudLabel.lineBreakMode = NSLineBreakMode.ByWordWrapping
        wordCloudLabel.numberOfLines = 0
        
//      Concatenate strings in newArray into only one string: newString
        for var i = 0; i < newArray.count; ++i {
            var s = newArray[i]
            newString = newString + s + " "
        }
        mutableString = NSMutableAttributedString(string: newString)
        var attrOffset = 0
        println(newString)
        println("***")
        
//      Add attribute to newString
        for var i = 0; i < newArray.count; ++i {
            var countNum : Int = countArray[i]
            var countNumF = CGFloat(countNum)

            mutableString.addAttribute(NSFontAttributeName,
                value: UIFont.systemFontOfSize(countNumF * 7.0),
                range: NSRange(location: attrOffset, length: newArray[i].length))
            
            mutableString.addAttribute(NSForegroundColorAttributeName,
                value: UIColor(red: countNumF * 50.0/255.0, green: 150.0/255.0, blue: 180.0/255.0, alpha: 1.0),
                range: NSRange(location: attrOffset, length: newArray[i].length))
            
            attrOffset += newArray[i].length + 1
        }
        wordCloudLabel.attributedText = mutableString
        //wordCloud.attributedText = mutableString
    }
        


    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    /// UIPickerViewDataSource Methods
    // Required Methods
    func numberOfComponentsInPickerView(pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return songArray.count
    }
    
    func pickerView(pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String! {
        return songArray[row]
        // calls this array for each element in the row and each component
    }
    func pickerView(pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        
        switch row {
        case 0,1,2,4,5:
            myLabel.text = "Try Again!"
        case 3:
            myLabel.text = "Good Job!"
        default:
            myLabel.text = "Try Again!"
            
        }


}

}
