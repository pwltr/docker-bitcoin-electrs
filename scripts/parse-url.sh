# Inspired by: https://gist.github.com/joshisa/297b0bc1ec0dcdda0d1625029711fa24
# Referenced and tweaked from http://stackoverflow.com/questions/6174220/parse-url-in-shell-script#6174447

set -euo pipefail

parse_uri() {
    url="$1"

    protocol=$(echo "${url%%:*}")

    if [[ "$protocol" != "bitcoin" ]]; then
        echo 'not a BIP21 URI.'
        exit
    fi

    # Remove the protocol
    url_no_protocol=$(echo "${url/$protocol/}" | cut -d":" -f2-)

    address=$(echo "$url_no_protocol" | grep "?" | cut -d"/" -f1 | rev | cut -d"?" -f2- | rev)
    amount=$(echo "$url_no_protocol" | cut -d'?' -f 2 | cut -d'=' -f 2 | cut -d'&' -f 1)

    # echo 'someletters?amount=moreleters.ext&asdasd' | cut -d'?' -f 2 | cut -d'=' -f 2 | cut -d'&' -f 1

    # if [ -n "$pass" ]; then
    # user=$(echo "$userpass" | grep ":" | cut -d":" -f1)
    # fi

    echo "url: $url"
    echo "  address: $address"
    echo "  amount: $amount"
}