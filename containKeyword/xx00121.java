|    @ServletSecurity((httpMethodConstraints = {
        @HttpMethodConstraint(value = "GET", rolesAllowed = "SSORole"),
        @HttpMethodConstraint(value = "POST", rolesAllowed = "SSORole",
        transportGuarantee = TransportGuarantee.CONFIDENTIAL)
    })
