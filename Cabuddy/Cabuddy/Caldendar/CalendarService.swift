//
//  CalendarService.swift
//  Cabuddy
//
//  Created by YML1 on 30/04/23.
//

import Foundation

protocol CalendarService {
    // To create/update the user data
    func updateUser()
    
    // Signout/Delete user data
    func deleteUser()
    
    // Get user's event additional info
    func getEventDetails()
    
    // Update event details for
    func updateEventDetails()
}
