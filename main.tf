resource "godaddy_domain_record" "joinraise-org" {
  domain = "joinraise.org"

  # Zone Apex points at Naked SSL account
  #
  # To configure, login at https://www.nakedssl.com/
  # with username raisenational@gmail.com
  #
  # We do this because we host our website with CloudFront
  # which requires a redirect via CNAME unless you use
  # Route53. GoDaddy doesn't support domain forwarding with
  # SSL, so we use this service just to redirect visitors
  # joinraise.org -> www.joinraise.org
  record {
    name = "@"
    type = "A"
    data = "18.198.121.102"
    ttl  = 3600
  }

  # Production website
  record {
    name = "www"
    type = "CNAME"
    data = "d359ysn69p1ty6.cloudfront.net"
    ttl  = 3600
  }

  # Dev website
  record {
    name = "dev"
    type = "CNAME"
    data = "d3hl9a8m5rqrdy.cloudfront.net"
    ttl  = 600
  }

  # AWS ACM validation for CloudFront:
  # - Account: 338337944728 (domdomegg)
  # - Region: us-east-1
  record {
    name = "_c14065ed8a00d1508bfe69997ed45e55"
    type = "CNAME"
    data = "_0b7ffa93ee2382d3cf7a4bdd044b33b6.ljbhxbcwgb.acm-validations.aws"
  }

  # Google Workspace MX records
  # This means people can email us @joinraise.org
  record {
    name = "@"
    type = "MX"
    data = "smtp.google.com"
    priority = 1
  }
  record {
    name = "@"
    type = "MX"
    data = "fem2pule6spinj2gicz3vridom2nmedct2m5umbddh57k6wpqnlq.mx-verification.google.com"
    priority = 15
  }

  # Comment to redirect people from the GoDaddy console to here
  record {
    name = "_comment"
    type = "TXT"
    data = "Don't make edits in GoDaddy! See https://github.com/raisenational/domains"
  }

  # Add metadata with change metadata, to help with debugging and auditing
  record {
    name = "_lastUpdated"
    type = "TXT"
    data = formatdate("YYYY-MM-DD HH:mm", timestamp())
  }
}

resource "godaddy_domain_record" "mayweekalternative-org-uk" {
  domain = "mayweekalternative.org.uk"

  # Zone Apex points at Naked SSL account
  #
  # To configure, login at https://www.nakedssl.com/
  # with username domdomegg@gmail.com
  #
  # We do this because we host our website with CloudFront
  # which requires a redirect via CNAME unless you use
  # Route53. GoDaddy doesn't support domain forwarding with
  # SSL, so we use this service just to redirect visitors
  # mayweekalternative.org.uk -> www.mayweekalternative.org.uk
  record {
    name = "@"
    type = "A"
    data = "18.198.121.102"
    ttl  = 3600
  }

  # Production website
  record {
    name = "www"
    type = "CNAME"
    data = "d2mkoxujy60d5n.cloudfront.net"
    ttl  = 3600
  }

  # Dev website
  record {
    name = "dev"
    type = "CNAME"
    data = "d3urq55vsmb356.cloudfront.net"
    ttl  = 600
  }

  # AWS ACM validation for CloudFront:
  # - Account: 338337944728 (domdomegg)
  # - Region: us-east-1
  record {
    name = "_73e048653da53f2b94edb503e509e0f3"
    type = "CNAME"
    data = "_763a5da41bfef5c66348c70ffb215e58.dsrmygwdhx.acm-validations.aws"
  }

  # Comment to redirect people from the GoDaddy console to here
  record {
    name = "_comment"
    type = "TXT"
    data = "Don't make edits in GoDaddy! See https://github.com/raisenational/domains"
  }

  # Add metadata with change metadata, to help with debugging and auditing
  record {
    name = "_lastUpdated"
    type = "TXT"
    data = formatdate("YYYY-MM-DD HH:mm", timestamp())
  }
}
