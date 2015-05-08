class UrlMappings {

	static mappings = {
        "/$controller/$action?/$id?(.$format)?"{
            constraints {
                // apply constraints here
            }
        }

       // "/"(view:"/index")
      "/"(controller:"Wallet")
       //"/"(controller:"User")
        "500"(view:'/error')
	}
}
