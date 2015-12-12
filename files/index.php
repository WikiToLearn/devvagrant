function FindProxyForURL(url, host) {
    if (dnsDomainIs(host, ".tuttorotto.biz"))
        return "PROXY <?php echo $_SERVER['SERVER_NAME']; ?>:3128";
    return "DIRECT";
}
