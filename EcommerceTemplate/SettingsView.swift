//
//  SettingsView.swift
//  EcommerceTemplate
//
//  Created by Jean-Marc Boullianne on 12/7/19.
//  Copyright © 2019 Jean-Marc Boullianne. All rights reserved.
//

import SwiftUI

struct SettingsView: View {
    
    @State private var showNotifications = true
    @State private var playSounds = false
    @State private var showAds = false
    
    init() {
        // To remove only extra separators below the list:
        UITableView.appearance().tableFooterView = UIView()

        // To remove all separators including the actual ones:
        //UITableView.appearance().separatorStyle = .none
    }
    
    var body: some View {
        VStack {
            // Header - "Your Cart"
            VStack(alignment: .center, spacing: 4) {
                Text("Settings")
                    .font(Font.system(size: 16, weight: .bold, design: .rounded))
            }
            .padding(.bottom, 10)
            
            List {
                Toggle(isOn: $showNotifications) {
                    Text("Notifications")
                }
                Toggle(isOn: $playSounds) {
                    Text("Sound Alerts")
                }
                Toggle(isOn: $showAds) {
                    Text("Show Ads")
                }
            }
        }
        
        
    }
}

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView()
    }
}
