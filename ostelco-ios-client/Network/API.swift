//  This file was automatically generated and should not be edited.

import Apollo

/// PrimeGQL namespace
public enum PrimeGQL {
  public enum SimProfileStatus: RawRepresentable, Equatable, Hashable, Apollo.JSONDecodable, Apollo.JSONEncodable {
    public typealias RawValue = String
    case notReady
    case availableForDownload
    case downloaded
    case installed
    case enabled
    /// Auto generated constant for unknown enum values
    case __unknown(RawValue)

    public init?(rawValue: RawValue) {
      switch rawValue {
        case "NOT_READY": self = .notReady
        case "AVAILABLE_FOR_DOWNLOAD": self = .availableForDownload
        case "DOWNLOADED": self = .downloaded
        case "INSTALLED": self = .installed
        case "ENABLED": self = .enabled
        default: self = .__unknown(rawValue)
      }
    }

    public var rawValue: RawValue {
      switch self {
        case .notReady: return "NOT_READY"
        case .availableForDownload: return "AVAILABLE_FOR_DOWNLOAD"
        case .downloaded: return "DOWNLOADED"
        case .installed: return "INSTALLED"
        case .enabled: return "ENABLED"
        case .__unknown(let value): return value
      }
    }

    public static func == (lhs: SimProfileStatus, rhs: SimProfileStatus) -> Bool {
      switch (lhs, rhs) {
        case (.notReady, .notReady): return true
        case (.availableForDownload, .availableForDownload): return true
        case (.downloaded, .downloaded): return true
        case (.installed, .installed): return true
        case (.enabled, .enabled): return true
        case (.__unknown(let lhsValue), .__unknown(let rhsValue)): return lhsValue == rhsValue
        default: return false
      }
    }
  }

  public enum CustomerRegionStatus: RawRepresentable, Equatable, Hashable, Apollo.JSONDecodable, Apollo.JSONEncodable {
    public typealias RawValue = String
    case pending
    case approved
    case available
    /// Auto generated constant for unknown enum values
    case __unknown(RawValue)

    public init?(rawValue: RawValue) {
      switch rawValue {
        case "PENDING": self = .pending
        case "APPROVED": self = .approved
        case "AVAILABLE": self = .available
        default: self = .__unknown(rawValue)
      }
    }

    public var rawValue: RawValue {
      switch self {
        case .pending: return "PENDING"
        case .approved: return "APPROVED"
        case .available: return "AVAILABLE"
        case .__unknown(let value): return value
      }
    }

    public static func == (lhs: CustomerRegionStatus, rhs: CustomerRegionStatus) -> Bool {
      switch (lhs, rhs) {
        case (.pending, .pending): return true
        case (.approved, .approved): return true
        case (.available, .available): return true
        case (.__unknown(let lhsValue), .__unknown(let rhsValue)): return lhsValue == rhsValue
        default: return false
      }
    }
  }

  public enum KycStatus: RawRepresentable, Equatable, Hashable, Apollo.JSONDecodable, Apollo.JSONEncodable {
    public typealias RawValue = String
    case pending
    case rejected
    case approved
    /// Auto generated constant for unknown enum values
    case __unknown(RawValue)

    public init?(rawValue: RawValue) {
      switch rawValue {
        case "PENDING": self = .pending
        case "REJECTED": self = .rejected
        case "APPROVED": self = .approved
        default: self = .__unknown(rawValue)
      }
    }

    public var rawValue: RawValue {
      switch self {
        case .pending: return "PENDING"
        case .rejected: return "REJECTED"
        case .approved: return "APPROVED"
        case .__unknown(let value): return value
      }
    }

    public static func == (lhs: KycStatus, rhs: KycStatus) -> Bool {
      switch (lhs, rhs) {
        case (.pending, .pending): return true
        case (.rejected, .rejected): return true
        case (.approved, .approved): return true
        case (.__unknown(let lhsValue), .__unknown(let rhsValue)): return lhsValue == rhsValue
        default: return false
      }
    }
  }

  public final class RegionsQuery: GraphQLQuery {
    public let operationDefinition =
      "query Regions($countryCode: String = null) {\n  context {\n    __typename\n    regions(regionCode: $countryCode) {\n      __typename\n      ...regionDetailsFragment\n    }\n  }\n}"

    public var queryDocument: String { return operationDefinition.appending(RegionDetailsFragment.fragmentDefinition).appending(SimProfileFields.fragmentDefinition) }

    public var countryCode: String?

    public init(countryCode: String? = nil) {
      self.countryCode = countryCode
    }

    public var variables: GraphQLMap? {
      return ["countryCode": countryCode]
    }

    public struct Data: GraphQLSelectionSet {
      public static let possibleTypes = ["QueryType"]

      public static let selections: [GraphQLSelection] = [
        GraphQLField("context", type: .nonNull(.object(Context.selections))),
      ]

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public init(context: Context) {
        self.init(unsafeResultMap: ["__typename": "QueryType", "context": context.resultMap])
      }

      public var context: Context {
        get {
          return Context(unsafeResultMap: resultMap["context"]! as! ResultMap)
        }
        set {
          resultMap.updateValue(newValue.resultMap, forKey: "context")
        }
      }

      public struct Context: GraphQLSelectionSet {
        public static let possibleTypes = ["Context"]

        public static let selections: [GraphQLSelection] = [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("regions", arguments: ["regionCode": GraphQLVariable("countryCode")], type: .nonNull(.list(.nonNull(.object(Region.selections))))),
        ]

        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public init(regions: [Region]) {
          self.init(unsafeResultMap: ["__typename": "Context", "regions": regions.map { (value: Region) -> ResultMap in value.resultMap }])
        }

        public var __typename: String {
          get {
            return resultMap["__typename"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "__typename")
          }
        }

        public var regions: [Region] {
          get {
            return (resultMap["regions"] as! [ResultMap]).map { (value: ResultMap) -> Region in Region(unsafeResultMap: value) }
          }
          set {
            resultMap.updateValue(newValue.map { (value: Region) -> ResultMap in value.resultMap }, forKey: "regions")
          }
        }

        public struct Region: GraphQLSelectionSet {
          public static let possibleTypes = ["RegionDetails"]

          public static let selections: [GraphQLSelection] = [
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLFragmentSpread(RegionDetailsFragment.self),
          ]

          public private(set) var resultMap: ResultMap

          public init(unsafeResultMap: ResultMap) {
            self.resultMap = unsafeResultMap
          }

          public var __typename: String {
            get {
              return resultMap["__typename"]! as! String
            }
            set {
              resultMap.updateValue(newValue, forKey: "__typename")
            }
          }

          public var fragments: Fragments {
            get {
              return Fragments(unsafeResultMap: resultMap)
            }
            set {
              resultMap += newValue.resultMap
            }
          }

          public struct Fragments {
            public private(set) var resultMap: ResultMap

            public init(unsafeResultMap: ResultMap) {
              self.resultMap = unsafeResultMap
            }

            public var regionDetailsFragment: RegionDetailsFragment {
              get {
                return RegionDetailsFragment(unsafeResultMap: resultMap)
              }
              set {
                resultMap += newValue.resultMap
              }
            }
          }
        }
      }
    }
  }

  public final class ProductsQuery: GraphQLQuery {
    public let operationDefinition =
      "query Products {\n  context {\n    __typename\n    products {\n      __typename\n      ...productFragment\n    }\n  }\n}"

    public var queryDocument: String { return operationDefinition.appending(ProductFragment.fragmentDefinition) }

    public init() {
    }

    public struct Data: GraphQLSelectionSet {
      public static let possibleTypes = ["QueryType"]

      public static let selections: [GraphQLSelection] = [
        GraphQLField("context", type: .nonNull(.object(Context.selections))),
      ]

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public init(context: Context) {
        self.init(unsafeResultMap: ["__typename": "QueryType", "context": context.resultMap])
      }

      public var context: Context {
        get {
          return Context(unsafeResultMap: resultMap["context"]! as! ResultMap)
        }
        set {
          resultMap.updateValue(newValue.resultMap, forKey: "context")
        }
      }

      public struct Context: GraphQLSelectionSet {
        public static let possibleTypes = ["Context"]

        public static let selections: [GraphQLSelection] = [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("products", type: .nonNull(.list(.nonNull(.object(Product.selections))))),
        ]

        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public init(products: [Product]) {
          self.init(unsafeResultMap: ["__typename": "Context", "products": products.map { (value: Product) -> ResultMap in value.resultMap }])
        }

        public var __typename: String {
          get {
            return resultMap["__typename"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "__typename")
          }
        }

        public var products: [Product] {
          get {
            return (resultMap["products"] as! [ResultMap]).map { (value: ResultMap) -> Product in Product(unsafeResultMap: value) }
          }
          set {
            resultMap.updateValue(newValue.map { (value: Product) -> ResultMap in value.resultMap }, forKey: "products")
          }
        }

        public struct Product: GraphQLSelectionSet {
          public static let possibleTypes = ["Product"]

          public static let selections: [GraphQLSelection] = [
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLFragmentSpread(ProductFragment.self),
          ]

          public private(set) var resultMap: ResultMap

          public init(unsafeResultMap: ResultMap) {
            self.resultMap = unsafeResultMap
          }

          public var __typename: String {
            get {
              return resultMap["__typename"]! as! String
            }
            set {
              resultMap.updateValue(newValue, forKey: "__typename")
            }
          }

          public var fragments: Fragments {
            get {
              return Fragments(unsafeResultMap: resultMap)
            }
            set {
              resultMap += newValue.resultMap
            }
          }

          public struct Fragments {
            public private(set) var resultMap: ResultMap

            public init(unsafeResultMap: ResultMap) {
              self.resultMap = unsafeResultMap
            }

            public var productFragment: ProductFragment {
              get {
                return ProductFragment(unsafeResultMap: resultMap)
              }
              set {
                resultMap += newValue.resultMap
              }
            }
          }
        }
      }
    }
  }

  public final class SimProfilesForRegionQuery: GraphQLQuery {
    public let operationDefinition =
      "query SimProfilesForRegion($countryCode: String!) {\n  context {\n    __typename\n    regions(regionCode: $countryCode) {\n      __typename\n      simProfiles {\n        __typename\n        ...simProfileFields\n      }\n    }\n  }\n}"

    public var queryDocument: String { return operationDefinition.appending(SimProfileFields.fragmentDefinition) }

    public var countryCode: String

    public init(countryCode: String) {
      self.countryCode = countryCode
    }

    public var variables: GraphQLMap? {
      return ["countryCode": countryCode]
    }

    public struct Data: GraphQLSelectionSet {
      public static let possibleTypes = ["QueryType"]

      public static let selections: [GraphQLSelection] = [
        GraphQLField("context", type: .nonNull(.object(Context.selections))),
      ]

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public init(context: Context) {
        self.init(unsafeResultMap: ["__typename": "QueryType", "context": context.resultMap])
      }

      public var context: Context {
        get {
          return Context(unsafeResultMap: resultMap["context"]! as! ResultMap)
        }
        set {
          resultMap.updateValue(newValue.resultMap, forKey: "context")
        }
      }

      public struct Context: GraphQLSelectionSet {
        public static let possibleTypes = ["Context"]

        public static let selections: [GraphQLSelection] = [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("regions", arguments: ["regionCode": GraphQLVariable("countryCode")], type: .nonNull(.list(.nonNull(.object(Region.selections))))),
        ]

        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public init(regions: [Region]) {
          self.init(unsafeResultMap: ["__typename": "Context", "regions": regions.map { (value: Region) -> ResultMap in value.resultMap }])
        }

        public var __typename: String {
          get {
            return resultMap["__typename"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "__typename")
          }
        }

        public var regions: [Region] {
          get {
            return (resultMap["regions"] as! [ResultMap]).map { (value: ResultMap) -> Region in Region(unsafeResultMap: value) }
          }
          set {
            resultMap.updateValue(newValue.map { (value: Region) -> ResultMap in value.resultMap }, forKey: "regions")
          }
        }

        public struct Region: GraphQLSelectionSet {
          public static let possibleTypes = ["RegionDetails"]

          public static let selections: [GraphQLSelection] = [
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLField("simProfiles", type: .list(.nonNull(.object(SimProfile.selections)))),
          ]

          public private(set) var resultMap: ResultMap

          public init(unsafeResultMap: ResultMap) {
            self.resultMap = unsafeResultMap
          }

          public init(simProfiles: [SimProfile]? = nil) {
            self.init(unsafeResultMap: ["__typename": "RegionDetails", "simProfiles": simProfiles.flatMap { (value: [SimProfile]) -> [ResultMap] in value.map { (value: SimProfile) -> ResultMap in value.resultMap } }])
          }

          public var __typename: String {
            get {
              return resultMap["__typename"]! as! String
            }
            set {
              resultMap.updateValue(newValue, forKey: "__typename")
            }
          }

          public var simProfiles: [SimProfile]? {
            get {
              return (resultMap["simProfiles"] as? [ResultMap]).flatMap { (value: [ResultMap]) -> [SimProfile] in value.map { (value: ResultMap) -> SimProfile in SimProfile(unsafeResultMap: value) } }
            }
            set {
              resultMap.updateValue(newValue.flatMap { (value: [SimProfile]) -> [ResultMap] in value.map { (value: SimProfile) -> ResultMap in value.resultMap } }, forKey: "simProfiles")
            }
          }

          public struct SimProfile: GraphQLSelectionSet {
            public static let possibleTypes = ["SimProfile"]

            public static let selections: [GraphQLSelection] = [
              GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
              GraphQLFragmentSpread(SimProfileFields.self),
            ]

            public private(set) var resultMap: ResultMap

            public init(unsafeResultMap: ResultMap) {
              self.resultMap = unsafeResultMap
            }

            public init(eSimActivationCode: String, alias: String, iccId: String, status: SimProfileStatus, installedReportedByAppOn: String? = nil) {
              self.init(unsafeResultMap: ["__typename": "SimProfile", "eSimActivationCode": eSimActivationCode, "alias": alias, "iccId": iccId, "status": status, "installedReportedByAppOn": installedReportedByAppOn])
            }

            public var __typename: String {
              get {
                return resultMap["__typename"]! as! String
              }
              set {
                resultMap.updateValue(newValue, forKey: "__typename")
              }
            }

            public var fragments: Fragments {
              get {
                return Fragments(unsafeResultMap: resultMap)
              }
              set {
                resultMap += newValue.resultMap
              }
            }

            public struct Fragments {
              public private(set) var resultMap: ResultMap

              public init(unsafeResultMap: ResultMap) {
                self.resultMap = unsafeResultMap
              }

              public var simProfileFields: SimProfileFields {
                get {
                  return SimProfileFields(unsafeResultMap: resultMap)
                }
                set {
                  resultMap += newValue.resultMap
                }
              }
            }
          }
        }
      }
    }
  }

  public final class ContextQuery: GraphQLQuery {
    public let operationDefinition =
      "query Context {\n  context {\n    __typename\n    customer {\n      __typename\n      id\n      contactEmail\n      nickname\n      referralId\n      analyticsId\n    }\n    regions {\n      __typename\n      ...regionDetailsFragment\n    }\n  }\n}"

    public var queryDocument: String { return operationDefinition.appending(RegionDetailsFragment.fragmentDefinition).appending(SimProfileFields.fragmentDefinition) }

    public init() {
    }

    public struct Data: GraphQLSelectionSet {
      public static let possibleTypes = ["QueryType"]

      public static let selections: [GraphQLSelection] = [
        GraphQLField("context", type: .nonNull(.object(Context.selections))),
      ]

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public init(context: Context) {
        self.init(unsafeResultMap: ["__typename": "QueryType", "context": context.resultMap])
      }

      public var context: Context {
        get {
          return Context(unsafeResultMap: resultMap["context"]! as! ResultMap)
        }
        set {
          resultMap.updateValue(newValue.resultMap, forKey: "context")
        }
      }

      public struct Context: GraphQLSelectionSet {
        public static let possibleTypes = ["Context"]

        public static let selections: [GraphQLSelection] = [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("customer", type: .object(Customer.selections)),
          GraphQLField("regions", type: .nonNull(.list(.nonNull(.object(Region.selections))))),
        ]

        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public init(customer: Customer? = nil, regions: [Region]) {
          self.init(unsafeResultMap: ["__typename": "Context", "customer": customer.flatMap { (value: Customer) -> ResultMap in value.resultMap }, "regions": regions.map { (value: Region) -> ResultMap in value.resultMap }])
        }

        public var __typename: String {
          get {
            return resultMap["__typename"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "__typename")
          }
        }

        public var customer: Customer? {
          get {
            return (resultMap["customer"] as? ResultMap).flatMap { Customer(unsafeResultMap: $0) }
          }
          set {
            resultMap.updateValue(newValue?.resultMap, forKey: "customer")
          }
        }

        public var regions: [Region] {
          get {
            return (resultMap["regions"] as! [ResultMap]).map { (value: ResultMap) -> Region in Region(unsafeResultMap: value) }
          }
          set {
            resultMap.updateValue(newValue.map { (value: Region) -> ResultMap in value.resultMap }, forKey: "regions")
          }
        }

        public struct Customer: GraphQLSelectionSet {
          public static let possibleTypes = ["Customer"]

          public static let selections: [GraphQLSelection] = [
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLField("id", type: .nonNull(.scalar(String.self))),
            GraphQLField("contactEmail", type: .nonNull(.scalar(String.self))),
            GraphQLField("nickname", type: .nonNull(.scalar(String.self))),
            GraphQLField("referralId", type: .nonNull(.scalar(String.self))),
            GraphQLField("analyticsId", type: .nonNull(.scalar(String.self))),
          ]

          public private(set) var resultMap: ResultMap

          public init(unsafeResultMap: ResultMap) {
            self.resultMap = unsafeResultMap
          }

          public init(id: String, contactEmail: String, nickname: String, referralId: String, analyticsId: String) {
            self.init(unsafeResultMap: ["__typename": "Customer", "id": id, "contactEmail": contactEmail, "nickname": nickname, "referralId": referralId, "analyticsId": analyticsId])
          }

          public var __typename: String {
            get {
              return resultMap["__typename"]! as! String
            }
            set {
              resultMap.updateValue(newValue, forKey: "__typename")
            }
          }

          public var id: String {
            get {
              return resultMap["id"]! as! String
            }
            set {
              resultMap.updateValue(newValue, forKey: "id")
            }
          }

          public var contactEmail: String {
            get {
              return resultMap["contactEmail"]! as! String
            }
            set {
              resultMap.updateValue(newValue, forKey: "contactEmail")
            }
          }

          public var nickname: String {
            get {
              return resultMap["nickname"]! as! String
            }
            set {
              resultMap.updateValue(newValue, forKey: "nickname")
            }
          }

          public var referralId: String {
            get {
              return resultMap["referralId"]! as! String
            }
            set {
              resultMap.updateValue(newValue, forKey: "referralId")
            }
          }

          public var analyticsId: String {
            get {
              return resultMap["analyticsId"]! as! String
            }
            set {
              resultMap.updateValue(newValue, forKey: "analyticsId")
            }
          }
        }

        public struct Region: GraphQLSelectionSet {
          public static let possibleTypes = ["RegionDetails"]

          public static let selections: [GraphQLSelection] = [
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLFragmentSpread(RegionDetailsFragment.self),
          ]

          public private(set) var resultMap: ResultMap

          public init(unsafeResultMap: ResultMap) {
            self.resultMap = unsafeResultMap
          }

          public var __typename: String {
            get {
              return resultMap["__typename"]! as! String
            }
            set {
              resultMap.updateValue(newValue, forKey: "__typename")
            }
          }

          public var fragments: Fragments {
            get {
              return Fragments(unsafeResultMap: resultMap)
            }
            set {
              resultMap += newValue.resultMap
            }
          }

          public struct Fragments {
            public private(set) var resultMap: ResultMap

            public init(unsafeResultMap: ResultMap) {
              self.resultMap = unsafeResultMap
            }

            public var regionDetailsFragment: RegionDetailsFragment {
              get {
                return RegionDetailsFragment(unsafeResultMap: resultMap)
              }
              set {
                resultMap += newValue.resultMap
              }
            }
          }
        }
      }
    }
  }

  public final class PurchasesQuery: GraphQLQuery {
    public let operationDefinition =
      "query Purchases {\n  context {\n    __typename\n    purchases {\n      __typename\n      id\n      product {\n        __typename\n        ...productFragment\n      }\n      timestamp\n    }\n  }\n}"

    public var queryDocument: String { return operationDefinition.appending(ProductFragment.fragmentDefinition) }

    public init() {
    }

    public struct Data: GraphQLSelectionSet {
      public static let possibleTypes = ["QueryType"]

      public static let selections: [GraphQLSelection] = [
        GraphQLField("context", type: .nonNull(.object(Context.selections))),
      ]

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public init(context: Context) {
        self.init(unsafeResultMap: ["__typename": "QueryType", "context": context.resultMap])
      }

      public var context: Context {
        get {
          return Context(unsafeResultMap: resultMap["context"]! as! ResultMap)
        }
        set {
          resultMap.updateValue(newValue.resultMap, forKey: "context")
        }
      }

      public struct Context: GraphQLSelectionSet {
        public static let possibleTypes = ["Context"]

        public static let selections: [GraphQLSelection] = [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("purchases", type: .nonNull(.list(.nonNull(.object(Purchase.selections))))),
        ]

        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public init(purchases: [Purchase]) {
          self.init(unsafeResultMap: ["__typename": "Context", "purchases": purchases.map { (value: Purchase) -> ResultMap in value.resultMap }])
        }

        public var __typename: String {
          get {
            return resultMap["__typename"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "__typename")
          }
        }

        public var purchases: [Purchase] {
          get {
            return (resultMap["purchases"] as! [ResultMap]).map { (value: ResultMap) -> Purchase in Purchase(unsafeResultMap: value) }
          }
          set {
            resultMap.updateValue(newValue.map { (value: Purchase) -> ResultMap in value.resultMap }, forKey: "purchases")
          }
        }

        public struct Purchase: GraphQLSelectionSet {
          public static let possibleTypes = ["Purchase"]

          public static let selections: [GraphQLSelection] = [
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLField("id", type: .nonNull(.scalar(String.self))),
            GraphQLField("product", type: .nonNull(.object(Product.selections))),
            GraphQLField("timestamp", type: .nonNull(.scalar(Long.self))),
          ]

          public private(set) var resultMap: ResultMap

          public init(unsafeResultMap: ResultMap) {
            self.resultMap = unsafeResultMap
          }

          public init(id: String, product: Product, timestamp: Long) {
            self.init(unsafeResultMap: ["__typename": "Purchase", "id": id, "product": product.resultMap, "timestamp": timestamp])
          }

          public var __typename: String {
            get {
              return resultMap["__typename"]! as! String
            }
            set {
              resultMap.updateValue(newValue, forKey: "__typename")
            }
          }

          public var id: String {
            get {
              return resultMap["id"]! as! String
            }
            set {
              resultMap.updateValue(newValue, forKey: "id")
            }
          }

          public var product: Product {
            get {
              return Product(unsafeResultMap: resultMap["product"]! as! ResultMap)
            }
            set {
              resultMap.updateValue(newValue.resultMap, forKey: "product")
            }
          }

          public var timestamp: Long {
            get {
              return resultMap["timestamp"]! as! Long
            }
            set {
              resultMap.updateValue(newValue, forKey: "timestamp")
            }
          }

          public struct Product: GraphQLSelectionSet {
            public static let possibleTypes = ["Product"]

            public static let selections: [GraphQLSelection] = [
              GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
              GraphQLFragmentSpread(ProductFragment.self),
            ]

            public private(set) var resultMap: ResultMap

            public init(unsafeResultMap: ResultMap) {
              self.resultMap = unsafeResultMap
            }

            public var __typename: String {
              get {
                return resultMap["__typename"]! as! String
              }
              set {
                resultMap.updateValue(newValue, forKey: "__typename")
              }
            }

            public var fragments: Fragments {
              get {
                return Fragments(unsafeResultMap: resultMap)
              }
              set {
                resultMap += newValue.resultMap
              }
            }

            public struct Fragments {
              public private(set) var resultMap: ResultMap

              public init(unsafeResultMap: ResultMap) {
                self.resultMap = unsafeResultMap
              }

              public var productFragment: ProductFragment {
                get {
                  return ProductFragment(unsafeResultMap: resultMap)
                }
                set {
                  resultMap += newValue.resultMap
                }
              }
            }
          }
        }
      }
    }
  }

  public final class BundlesQuery: GraphQLQuery {
    public let operationDefinition =
      "query Bundles {\n  context {\n    __typename\n    bundles {\n      __typename\n      id\n      balance\n    }\n  }\n}"

    public init() {
    }

    public struct Data: GraphQLSelectionSet {
      public static let possibleTypes = ["QueryType"]

      public static let selections: [GraphQLSelection] = [
        GraphQLField("context", type: .nonNull(.object(Context.selections))),
      ]

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public init(context: Context) {
        self.init(unsafeResultMap: ["__typename": "QueryType", "context": context.resultMap])
      }

      public var context: Context {
        get {
          return Context(unsafeResultMap: resultMap["context"]! as! ResultMap)
        }
        set {
          resultMap.updateValue(newValue.resultMap, forKey: "context")
        }
      }

      public struct Context: GraphQLSelectionSet {
        public static let possibleTypes = ["Context"]

        public static let selections: [GraphQLSelection] = [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("bundles", type: .nonNull(.list(.nonNull(.object(Bundle.selections))))),
        ]

        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public init(bundles: [Bundle]) {
          self.init(unsafeResultMap: ["__typename": "Context", "bundles": bundles.map { (value: Bundle) -> ResultMap in value.resultMap }])
        }

        public var __typename: String {
          get {
            return resultMap["__typename"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "__typename")
          }
        }

        public var bundles: [Bundle] {
          get {
            return (resultMap["bundles"] as! [ResultMap]).map { (value: ResultMap) -> Bundle in Bundle(unsafeResultMap: value) }
          }
          set {
            resultMap.updateValue(newValue.map { (value: Bundle) -> ResultMap in value.resultMap }, forKey: "bundles")
          }
        }

        public struct Bundle: GraphQLSelectionSet {
          public static let possibleTypes = ["Bundle"]

          public static let selections: [GraphQLSelection] = [
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLField("id", type: .nonNull(.scalar(String.self))),
            GraphQLField("balance", type: .nonNull(.scalar(Long.self))),
          ]

          public private(set) var resultMap: ResultMap

          public init(unsafeResultMap: ResultMap) {
            self.resultMap = unsafeResultMap
          }

          public init(id: String, balance: Long) {
            self.init(unsafeResultMap: ["__typename": "Bundle", "id": id, "balance": balance])
          }

          public var __typename: String {
            get {
              return resultMap["__typename"]! as! String
            }
            set {
              resultMap.updateValue(newValue, forKey: "__typename")
            }
          }

          public var id: String {
            get {
              return resultMap["id"]! as! String
            }
            set {
              resultMap.updateValue(newValue, forKey: "id")
            }
          }

          public var balance: Long {
            get {
              return resultMap["balance"]! as! Long
            }
            set {
              resultMap.updateValue(newValue, forKey: "balance")
            }
          }
        }
      }
    }
  }

  public struct ProductFragment: GraphQLFragment {
    public static let fragmentDefinition =
      "fragment productFragment on Product {\n  __typename\n  sku\n  price {\n    __typename\n    amount\n    currency\n  }\n  presentation {\n    __typename\n    payeeLabel\n    priceLabel\n    productLabel\n    subTotal\n    subTotalLabel\n    tax\n    taxLabel\n  }\n  properties {\n    __typename\n    productClass\n  }\n}"

    public static let possibleTypes = ["Product"]

    public static let selections: [GraphQLSelection] = [
      GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
      GraphQLField("sku", type: .nonNull(.scalar(String.self))),
      GraphQLField("price", type: .nonNull(.object(Price.selections))),
      GraphQLField("presentation", type: .nonNull(.object(Presentation.selections))),
      GraphQLField("properties", type: .nonNull(.object(Property.selections))),
    ]

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(sku: String, price: Price, presentation: Presentation, properties: Property) {
      self.init(unsafeResultMap: ["__typename": "Product", "sku": sku, "price": price.resultMap, "presentation": presentation.resultMap, "properties": properties.resultMap])
    }

    public var __typename: String {
      get {
        return resultMap["__typename"]! as! String
      }
      set {
        resultMap.updateValue(newValue, forKey: "__typename")
      }
    }

    public var sku: String {
      get {
        return resultMap["sku"]! as! String
      }
      set {
        resultMap.updateValue(newValue, forKey: "sku")
      }
    }

    public var price: Price {
      get {
        return Price(unsafeResultMap: resultMap["price"]! as! ResultMap)
      }
      set {
        resultMap.updateValue(newValue.resultMap, forKey: "price")
      }
    }

    public var presentation: Presentation {
      get {
        return Presentation(unsafeResultMap: resultMap["presentation"]! as! ResultMap)
      }
      set {
        resultMap.updateValue(newValue.resultMap, forKey: "presentation")
      }
    }

    public var properties: Property {
      get {
        return Property(unsafeResultMap: resultMap["properties"]! as! ResultMap)
      }
      set {
        resultMap.updateValue(newValue.resultMap, forKey: "properties")
      }
    }

    public struct Price: GraphQLSelectionSet {
      public static let possibleTypes = ["Price"]

      public static let selections: [GraphQLSelection] = [
        GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
        GraphQLField("amount", type: .nonNull(.scalar(Int.self))),
        GraphQLField("currency", type: .nonNull(.scalar(String.self))),
      ]

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public init(amount: Int, currency: String) {
        self.init(unsafeResultMap: ["__typename": "Price", "amount": amount, "currency": currency])
      }

      public var __typename: String {
        get {
          return resultMap["__typename"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "__typename")
        }
      }

      public var amount: Int {
        get {
          return resultMap["amount"]! as! Int
        }
        set {
          resultMap.updateValue(newValue, forKey: "amount")
        }
      }

      public var currency: String {
        get {
          return resultMap["currency"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "currency")
        }
      }
    }

    public struct Presentation: GraphQLSelectionSet {
      public static let possibleTypes = ["Presentation"]

      public static let selections: [GraphQLSelection] = [
        GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
        GraphQLField("payeeLabel", type: .scalar(String.self)),
        GraphQLField("priceLabel", type: .nonNull(.scalar(String.self))),
        GraphQLField("productLabel", type: .nonNull(.scalar(String.self))),
        GraphQLField("subTotal", type: .scalar(String.self)),
        GraphQLField("subTotalLabel", type: .scalar(String.self)),
        GraphQLField("tax", type: .scalar(String.self)),
        GraphQLField("taxLabel", type: .scalar(String.self)),
      ]

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public init(payeeLabel: String? = nil, priceLabel: String, productLabel: String, subTotal: String? = nil, subTotalLabel: String? = nil, tax: String? = nil, taxLabel: String? = nil) {
        self.init(unsafeResultMap: ["__typename": "Presentation", "payeeLabel": payeeLabel, "priceLabel": priceLabel, "productLabel": productLabel, "subTotal": subTotal, "subTotalLabel": subTotalLabel, "tax": tax, "taxLabel": taxLabel])
      }

      public var __typename: String {
        get {
          return resultMap["__typename"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "__typename")
        }
      }

      public var payeeLabel: String? {
        get {
          return resultMap["payeeLabel"] as? String
        }
        set {
          resultMap.updateValue(newValue, forKey: "payeeLabel")
        }
      }

      public var priceLabel: String {
        get {
          return resultMap["priceLabel"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "priceLabel")
        }
      }

      public var productLabel: String {
        get {
          return resultMap["productLabel"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "productLabel")
        }
      }

      public var subTotal: String? {
        get {
          return resultMap["subTotal"] as? String
        }
        set {
          resultMap.updateValue(newValue, forKey: "subTotal")
        }
      }

      public var subTotalLabel: String? {
        get {
          return resultMap["subTotalLabel"] as? String
        }
        set {
          resultMap.updateValue(newValue, forKey: "subTotalLabel")
        }
      }

      public var tax: String? {
        get {
          return resultMap["tax"] as? String
        }
        set {
          resultMap.updateValue(newValue, forKey: "tax")
        }
      }

      public var taxLabel: String? {
        get {
          return resultMap["taxLabel"] as? String
        }
        set {
          resultMap.updateValue(newValue, forKey: "taxLabel")
        }
      }
    }

    public struct Property: GraphQLSelectionSet {
      public static let possibleTypes = ["Properties"]

      public static let selections: [GraphQLSelection] = [
        GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
        GraphQLField("productClass", type: .scalar(String.self)),
      ]

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public init(productClass: String? = nil) {
        self.init(unsafeResultMap: ["__typename": "Properties", "productClass": productClass])
      }

      public var __typename: String {
        get {
          return resultMap["__typename"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "__typename")
        }
      }

      public var productClass: String? {
        get {
          return resultMap["productClass"] as? String
        }
        set {
          resultMap.updateValue(newValue, forKey: "productClass")
        }
      }
    }
  }

  public struct SimProfileFields: GraphQLFragment {
    public static let fragmentDefinition =
      "fragment simProfileFields on SimProfile {\n  __typename\n  eSimActivationCode\n  alias\n  iccId\n  status\n  installedReportedByAppOn\n}"

    public static let possibleTypes = ["SimProfile"]

    public static let selections: [GraphQLSelection] = [
      GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
      GraphQLField("eSimActivationCode", type: .nonNull(.scalar(String.self))),
      GraphQLField("alias", type: .nonNull(.scalar(String.self))),
      GraphQLField("iccId", type: .nonNull(.scalar(String.self))),
      GraphQLField("status", type: .nonNull(.scalar(SimProfileStatus.self))),
      GraphQLField("installedReportedByAppOn", type: .scalar(String.self)),
    ]

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(eSimActivationCode: String, alias: String, iccId: String, status: SimProfileStatus, installedReportedByAppOn: String? = nil) {
      self.init(unsafeResultMap: ["__typename": "SimProfile", "eSimActivationCode": eSimActivationCode, "alias": alias, "iccId": iccId, "status": status, "installedReportedByAppOn": installedReportedByAppOn])
    }

    public var __typename: String {
      get {
        return resultMap["__typename"]! as! String
      }
      set {
        resultMap.updateValue(newValue, forKey: "__typename")
      }
    }

    public var eSimActivationCode: String {
      get {
        return resultMap["eSimActivationCode"]! as! String
      }
      set {
        resultMap.updateValue(newValue, forKey: "eSimActivationCode")
      }
    }

    public var alias: String {
      get {
        return resultMap["alias"]! as! String
      }
      set {
        resultMap.updateValue(newValue, forKey: "alias")
      }
    }

    public var iccId: String {
      get {
        return resultMap["iccId"]! as! String
      }
      set {
        resultMap.updateValue(newValue, forKey: "iccId")
      }
    }

    public var status: SimProfileStatus {
      get {
        return resultMap["status"]! as! SimProfileStatus
      }
      set {
        resultMap.updateValue(newValue, forKey: "status")
      }
    }

    public var installedReportedByAppOn: String? {
      get {
        return resultMap["installedReportedByAppOn"] as? String
      }
      set {
        resultMap.updateValue(newValue, forKey: "installedReportedByAppOn")
      }
    }
  }

  public struct RegionDetailsFragment: GraphQLFragment {
    public static let fragmentDefinition =
      "fragment regionDetailsFragment on RegionDetails {\n  __typename\n  region {\n    __typename\n    id\n    name\n  }\n  status\n  kycStatusMap {\n    __typename\n    JUMIO\n    MY_INFO\n    NRIC_FIN\n    ADDRESS\n  }\n  simProfiles {\n    __typename\n    ...simProfileFields\n  }\n}"

    public static let possibleTypes = ["RegionDetails"]

    public static let selections: [GraphQLSelection] = [
      GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
      GraphQLField("region", type: .nonNull(.object(Region.selections))),
      GraphQLField("status", type: .nonNull(.scalar(CustomerRegionStatus.self))),
      GraphQLField("kycStatusMap", type: .nonNull(.object(KycStatusMap.selections))),
      GraphQLField("simProfiles", type: .list(.nonNull(.object(SimProfile.selections)))),
    ]

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(region: Region, status: CustomerRegionStatus, kycStatusMap: KycStatusMap, simProfiles: [SimProfile]? = nil) {
      self.init(unsafeResultMap: ["__typename": "RegionDetails", "region": region.resultMap, "status": status, "kycStatusMap": kycStatusMap.resultMap, "simProfiles": simProfiles.flatMap { (value: [SimProfile]) -> [ResultMap] in value.map { (value: SimProfile) -> ResultMap in value.resultMap } }])
    }

    public var __typename: String {
      get {
        return resultMap["__typename"]! as! String
      }
      set {
        resultMap.updateValue(newValue, forKey: "__typename")
      }
    }

    public var region: Region {
      get {
        return Region(unsafeResultMap: resultMap["region"]! as! ResultMap)
      }
      set {
        resultMap.updateValue(newValue.resultMap, forKey: "region")
      }
    }

    public var status: CustomerRegionStatus {
      get {
        return resultMap["status"]! as! CustomerRegionStatus
      }
      set {
        resultMap.updateValue(newValue, forKey: "status")
      }
    }

    public var kycStatusMap: KycStatusMap {
      get {
        return KycStatusMap(unsafeResultMap: resultMap["kycStatusMap"]! as! ResultMap)
      }
      set {
        resultMap.updateValue(newValue.resultMap, forKey: "kycStatusMap")
      }
    }

    public var simProfiles: [SimProfile]? {
      get {
        return (resultMap["simProfiles"] as? [ResultMap]).flatMap { (value: [ResultMap]) -> [SimProfile] in value.map { (value: ResultMap) -> SimProfile in SimProfile(unsafeResultMap: value) } }
      }
      set {
        resultMap.updateValue(newValue.flatMap { (value: [SimProfile]) -> [ResultMap] in value.map { (value: SimProfile) -> ResultMap in value.resultMap } }, forKey: "simProfiles")
      }
    }

    public struct Region: GraphQLSelectionSet {
      public static let possibleTypes = ["Region"]

      public static let selections: [GraphQLSelection] = [
        GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
        GraphQLField("id", type: .nonNull(.scalar(String.self))),
        GraphQLField("name", type: .nonNull(.scalar(String.self))),
      ]

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public init(id: String, name: String) {
        self.init(unsafeResultMap: ["__typename": "Region", "id": id, "name": name])
      }

      public var __typename: String {
        get {
          return resultMap["__typename"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "__typename")
        }
      }

      public var id: String {
        get {
          return resultMap["id"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "id")
        }
      }

      public var name: String {
        get {
          return resultMap["name"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "name")
        }
      }
    }

    public struct KycStatusMap: GraphQLSelectionSet {
      public static let possibleTypes = ["KycStatusMap"]

      public static let selections: [GraphQLSelection] = [
        GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
        GraphQLField("JUMIO", type: .scalar(KycStatus.self)),
        GraphQLField("MY_INFO", type: .scalar(KycStatus.self)),
        GraphQLField("NRIC_FIN", type: .scalar(KycStatus.self)),
        GraphQLField("ADDRESS", type: .scalar(KycStatus.self)),
      ]

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public init(jumio: KycStatus? = nil, myInfo: KycStatus? = nil, nricFin: KycStatus? = nil, address: KycStatus? = nil) {
        self.init(unsafeResultMap: ["__typename": "KycStatusMap", "JUMIO": jumio, "MY_INFO": myInfo, "NRIC_FIN": nricFin, "ADDRESS": address])
      }

      public var __typename: String {
        get {
          return resultMap["__typename"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "__typename")
        }
      }

      public var jumio: KycStatus? {
        get {
          return resultMap["JUMIO"] as? KycStatus
        }
        set {
          resultMap.updateValue(newValue, forKey: "JUMIO")
        }
      }

      public var myInfo: KycStatus? {
        get {
          return resultMap["MY_INFO"] as? KycStatus
        }
        set {
          resultMap.updateValue(newValue, forKey: "MY_INFO")
        }
      }

      public var nricFin: KycStatus? {
        get {
          return resultMap["NRIC_FIN"] as? KycStatus
        }
        set {
          resultMap.updateValue(newValue, forKey: "NRIC_FIN")
        }
      }

      public var address: KycStatus? {
        get {
          return resultMap["ADDRESS"] as? KycStatus
        }
        set {
          resultMap.updateValue(newValue, forKey: "ADDRESS")
        }
      }
    }

    public struct SimProfile: GraphQLSelectionSet {
      public static let possibleTypes = ["SimProfile"]

      public static let selections: [GraphQLSelection] = [
        GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
        GraphQLFragmentSpread(SimProfileFields.self),
      ]

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public init(eSimActivationCode: String, alias: String, iccId: String, status: SimProfileStatus, installedReportedByAppOn: String? = nil) {
        self.init(unsafeResultMap: ["__typename": "SimProfile", "eSimActivationCode": eSimActivationCode, "alias": alias, "iccId": iccId, "status": status, "installedReportedByAppOn": installedReportedByAppOn])
      }

      public var __typename: String {
        get {
          return resultMap["__typename"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "__typename")
        }
      }

      public var fragments: Fragments {
        get {
          return Fragments(unsafeResultMap: resultMap)
        }
        set {
          resultMap += newValue.resultMap
        }
      }

      public struct Fragments {
        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public var simProfileFields: SimProfileFields {
          get {
            return SimProfileFields(unsafeResultMap: resultMap)
          }
          set {
            resultMap += newValue.resultMap
          }
        }
      }
    }
  }
}