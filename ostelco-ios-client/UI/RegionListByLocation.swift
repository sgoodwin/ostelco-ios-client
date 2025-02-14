//
//  RegionListByLocation.swift
//  ostelco-ios-client
//
//  Created by mac on 10/10/19.
//  Copyright © 2019 mac. All rights reserved.
//

import SwiftUI

struct RegionListByLocation: View {
    
    @EnvironmentObject var store: CoverageStore
    @EnvironmentObject var global: GlobalStore
    
    var body: some View {
        renderListOrUnavailable()
    }
    
    private func renderSimProfile(_ regionDetails: PrimeGQL.RegionDetailsFragment, country: Country) -> AnyView {
        
        if (regionDetails.simProfiles ?? []).contains(where: { SimProfile(gqlSimProfile: $0.fragments.simProfileFields).isInstalled }) {
            return AnyView(
                OstelcoContainer(state: .inactive) {
                    ESimCountryView(image: country.image, country: regionDetails.region.name, heading: "BASED ON LOCATION", icon: "checkmark")
                }
            )
        }
        return AnyView(
            OstelcoContainer {
                ESimCountryView(image: country.image, country: regionDetails.region.name, heading: "BASED ON LOCATION", action: {
                    self.store.startOnboardingForRegion(regionDetails, targetCountry: country)
                })
            }
        )
    }
    
    private func renderListOrUnavailable() -> AnyView {
        
        if let country = global.country {
            // regions can be nil if its not loaded or we failed to fetch them from server, we present these errors as if there are no available regions.
            if let regionCodes = store.countryCodeToRegionCodeMap[country.countryCode], let regionDetailsList = store.regions?.filter({ regionCodes.contains($0.region.id.lowercased()) }), regionDetailsList.isNotEmpty {
                
                return AnyView(
                    Group {
                        ForEach(regionDetailsList, id: \.region.id) { regionDetails in
                            self.renderSimProfile(regionDetails, country: country)
                        }
                    }
                )
            } else {
                return AnyView(
                    Text("Unfortunately, OYA is currently not\navailable in \(country.nameOrPlaceholder) 😭")
                        .multilineTextAlignment(.center)
                        .lineLimit(nil)
                )
            }
        } else {
            return AnyView(
                Text("We are having trouble finding your location.")
            )
        }
    }
}

struct RegionListByLocation_Previews: PreviewProvider {
    static var previews: some View {
        RegionListByLocation()
    }
}
