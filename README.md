Running `gen_bad_cert` will generate a "bad SSL certificate" with SAN entry without a matching DNS entry.

Caution, running `gen_bad_cert` will remove and regenerate the foo.bar.com key, cert and csr.
