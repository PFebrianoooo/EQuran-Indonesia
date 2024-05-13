//
//  DateFormatter.swift
//  EQuran
//
//  Created by Putra Pebriano Nurba on 06/05/24.
//

import Foundation

extension Date {
    
    /// This functions for converting date into string with any other date format.
    ///  you can customize anything you want
    ///  ```
    ///  convert Date() to 2024-06-24
    ///  ```
    ///  parameter  formate:  inputted anyformat
    ///  Default format is "YYYY-MM-DD"
    func toString(format: String = "yyyy-MM-dd") -> String {
            let formatter = DateFormatter()
            formatter.locale = Locale(identifier: "id-ID")
            formatter.dateStyle = .short
            formatter.dateFormat = format
            return formatter.string(from: self)
        }
    
    /// This functions for converting date into time 24H format with current date
    /// And change date format into string
    ///  ```
    ///  convert standard date to 2024-06-20 12:00
    ///  ```

    func dateAndTimetoString(format: String = "yyyy-MM-dd HH:mm") -> String {
        let formatter = DateFormatter()
        formatter.dateStyle = .short
        formatter.dateFormat = format
        return formatter.string(from: self)
    }
       
    /// This functions for converting date into time 24H format.
    /// And change date format into string
    ///  ```
    ///  convert standard date to 12:00 current time
    ///  ```
    func timeIn24HourFormat() -> String {
        let formatter = DateFormatter()
        formatter.dateStyle = .none
        formatter.dateFormat = "HH:mm"
        return formatter.string(from: self)
    }
    
    /// this functions for converting default date modifier to indoensian version
    /// with added informations about day and date
    /// ```
    /// convert Monday, 13 May 2024 to Senin,13 Mei 2024
    /// ```
    
    func timeInLocalVersion() -> String {
        let formatter = DateFormatter()
        // change languange date
        formatter.locale = Locale(identifier: "id-ID")
        formatter.dateStyle = .full
        return formatter.string(from: self)
    }
}
