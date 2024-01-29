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
    data = "d12z4d0z4gotdp.cloudfront.net"
    ttl  = 3600
  }

  # Dev website
  record {
    name = "dev"
    type = "CNAME"
    data = "djcqvov1pxiot.cloudfront.net"
    ttl  = 600
  }

  # AWS ACM validation for CloudFront:
  # - Account: 405129592067 (raise)
  # - Region: us-east-1
  record {
    name = "_7405c4e5c72969f8a1ff5815dac6fa93"
    type = "CNAME"
    data = "_d793ea3e1b8d1678997bbd0be4c1b2a9.mhbtsbpdnt.acm-validations.aws."
  }

  # Google validation, e.g. for search console
  record {
    name = "@"
    type = "TXT"
    data = "google-site-verification=NyNQ0CnbnYG_YMmxGtOXz9kTEz1n_eG6wNcurbFXBDU"
  }

  # Security: MyNCSC validation
  record {
    name = "_asvdns-20507f5b-f636-4d72-96cd-7754b32498aa"
    type = "TXT"
    data = "asvdns_2479101f-779d-40d6-9e78-1c33b7e6a78c"
  }

  # Google Workspace MX records
  # This means people can email us @joinraise.org
  record {
    name = "@"
    type = "MX"
    data = "smtp.google.com"
    priority = 1
  }

  # Email security: limit outbound email
  # This prevents people spoofing our emailing address
  record {
    name = "@"
    type = "TXT"
    data = "v=spf1 include:_spf.google.com ~all"
  }
  record {
    name = "google._domainkey"
    type = "TXT"
    data = "v=DKIM1; k=rsa; p=MIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKCAQEAm3pPyQCUL5S0sn3CpeqU1b7jGg6VCFc9EV+nYZdcTcZoMhZVrZLjlp8slTVjc3PeIklQmgaDEdfZyZ+RIT9BdBIOCx6c9xz/J3T6cqYvC3PlWtAXwAR071eC7bGAQqkDPSspGj47odfeqPTZVGSjDeB9D0lg/ZwcmESCo52nTNe1l38DeKFGNNBbEIB3UIri3cJkMa8OJZabMV/gZN0f7EeiaAYMJqsZiH8o854NJytjrT73weqxEsCr3U2WyJcU+9QqSTviFgt6Wu+VXPS+Nigmk4HKaLOwp7Kb93A8bsBgOH31DultoTGd224tb0djd85QIsmXyrG9Mz0ON7lM9wIDAQAB"
  }
  record {
    name = "_dmarc"
    type = "TXT"
    data = "v=DMARC1; p=reject; rua=mailto:dmarc-rua@dmarc.service.gov.uk;"
  }
  record {
    name = "_smtp._tls"
    type = "TXT"
    data = "v=TLSRPTv1;rua=mailto:tls-rua@mailcheck.service.ncsc.gov.uk"
  }
  record {
    name = "mta-sts"
    type = "CNAME"
    data = "raisenational.github.io"
  }
  record {
    name = "_mta-sts"
    type = "TXT"
    data = "v=STSv1; id=1689199424"
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
    data = "d2wmuv47wx2gpg.cloudfront.net"
    ttl  = 3600
  }

  # Dev website
  record {
    name = "dev"
    type = "CNAME"
    data = "d22z5quw14qs43.cloudfront.net"
    ttl  = 600
  }

  # AWS ACM validation for CloudFront:
  # - Account: 405129592067 (raise)
  # - Region: us-east-1
  record {
    name = "_dbc63cffd885785cdabd7084fa1418fd"
    type = "CNAME"
    data = "_9096b98daa94f3b691e6dca77f263733.mhbtsbpdnt.acm-validations.aws."
  }

  # Google validation, e.g. for search console
  record {
    name = "@"
    type = "TXT"
    data = "google-site-verification=XpHEURdY6mVzaUmnWJt-lXt1N-EqnlmiCHdTw-1ENU8"
  }

  # Security: MyNCSC validation
  record {
    name = "_asvdns-acd9c4b2-d245-4aa1-b854-c5b3b83044fa"
    type = "TXT"
    data = "asvdns_41404c32-829e-4f17-bbe1-1556afefc569"
  }

  # Email security: disable outbound and inbound email
  # This prevents people spoofing our emailing address
  record {
    name = "@"
    type = "TXT"
    data = "v=spf1 -all"
  }
  record {
    name = "*._domainkey"
    type = "TXT"
    data = "v=DKIM1; p="
  }
  record {
    name = "_dmarc"
    type = "TXT"
    data = "v=DMARC1; p=reject; rua=mailto:dmarc-rua@dmarc.service.gov.uk;"
  }
  record {
    name = "@"
    type = "MX"
    data = "."
    priority = 0
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
