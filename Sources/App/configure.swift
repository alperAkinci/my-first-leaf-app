import Vapor
import Leaf

/// Called before your application initializes.
public func configure(_ config: inout Config, _ env: inout Environment, _ services: inout Services) throws {

    /// Register routes to the router
    let router = EngineRouter.default()
    try routes(router)
    services.register(router, as: Router.self)

    /// Register leaf
    let leafProvider = LeafProvider()
    try services.register(leafProvider)

    config.prefer(LeafRenderer.self, for: ViewRenderer.self)
}
