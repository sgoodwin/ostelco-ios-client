//
//  AppStore.swift
//  ostelco-ios-client
//
//  Created by mac on 10/8/19.
//  Copyright © 2019 mac. All rights reserved.
//

final class CoverageStore: ObservableObject {
    @Published var regions: [PrimeGQL.RegionDetailsFragment]?
    @Published var countryCodeToRegionCodeMap = [:] as [String: [String]]
    @Published var regionGroups: [RegionGroupViewModel] = []
    
    @Published var selectedRegionGroup: RegionGroupViewModel?
    
    let controller: TabBarViewController
    
    init(controller: TabBarViewController) {
        self.controller = controller
        loadRegions()
        
        countryCodeToRegionCodeMap = RemoteConfigManager.shared.countryCodeAndRegionCodes.reduce(into: [:], { (result, value) in
            result[value.countryCode] = value.regionCodes
        })
        regionGroups = RemoteConfigManager.shared.regionGroups.map {
            RegionGroupViewModel(
                name: $0.name,
                description: $0.description,
                backgroundColor: $0.backgroundColor,
                isPreview: $0.isPreview,
                countries: $0.countryCodes.map({ Country($0) })
            )
        }
    }
    
    func loadRegions() {
        APIManager.shared.primeAPI.loadRegions()
        .done { self.regions = $0 }.cauterize()
    }
    
    func allowedCountries() -> [String] {
        if let regionDetailslist = regions {
            let regionCodes = Set(
                regionDetailslist.map({ $0.region.id })
            )
            
            let allowedCountryCodes = Array(
                countryCodeToRegionCodeMap
                    .filter({ (_, value) in Set(value).intersection(regionCodes).isNotEmpty })
                    .keys
                )
            
            return allowedCountryCodes
        }
        
        return []
    }
    
    func simProfilesForCountry(country: Country) -> [PrimeGQL.SimProfileFields] {
        if let regionDetailsList = regions, let regionCodes = countryCodeToRegionCodeMap[country.countryCode] {
            return regionDetailsList
                .filter({ regionCodes.contains($0.region.id) })
                .filter({ $0.simProfiles != nil })
                .map({ $0.simProfiles!.map({ $0.fragments.simProfileFields }) })
                .reduce([], +)
        }
        return []
    }
    
    func getRegionFromCountry(_ country: Country) -> PrimeGQL.RegionDetailsFragment {
        guard let regionCodes = countryCodeToRegionCodeMap[country.countryCode] else {
            fatalError("If there are no region codes for the given country code, our configuration is wrong.")
        }
        
        // TODO: We could make this logic smarter. This selects the region to use in cases for a country has multiple regions to select from.
        guard let region = regions?.first(where: { $0.region.id == regionCodes.first }) else {
            fatalError("If there are no regions for the given region code, our configuration is wrong.")
        }
        
        return region
    }
    
    func allowedCountries(countries: [Country]) -> [String] {
        return Array(Set(allowedCountries()).intersection(countries.map({ $0.countryCode }))).sorted()
    }
    
    func startOnboardingForRegion(_ region: PrimeGQL.RegionDetailsFragment, targetCountry: Country) {
        OstelcoAnalytics.logEvent(.getNewRegionFlowStarted(regionCode: region.region.id, countryCode: targetCountry.countryCode))
        controller.startOnboardingForRegion(region, targetCountry: targetCountry)
    }

}
