
(setq tramp-default-proxies-alist nil)

(add-to-list 'tramp-default-proxies-alist
	     '("nimbus2.securesites.net" nil "/ssh:root@nm.vwh.net:"))


(add-to-list 'tramp-default-proxies-alist
	     '("txn95.boca95-verio.com" nil "/ssh:t.brannon@jump0.wh.verio.net:"))

(add-to-list 'tramp-default-proxies-alist
	     '("app95a.boca95-verio.com" nil "/ssh:root@txn95.boca95-verio.com:"))

(add-to-list 'tramp-default-proxies-alist
	     '("zuul.boca.verio.net" nil "/ssh:t.brannon@jump0.wh.verio.net:"))

(add-to-list 'tramp-default-proxies-alist
	     '("dev2.boca.verio.net" nil "/ssh:tbrannon@zuul.boca.verio.net:"))

(add-to-list 'tramp-default-proxies-alist
	     '("aim.boca.verio.net" nil "/ssh:tbrannon@dev2.boca.verio.net:"))

(add-to-list 'tramp-default-proxies-alist
	     '("afm.boca.verio.net" nil "/ssh:root@aim.boca.verio.net:"))

(add-to-list 'tramp-default-proxies-alist
	     '("alm.boca.verio.net" nil "/ssh:root@afm.boca.verio.net:"))

;(add-to-list 'tramp-default-proxies-alist
;	     '("boca95-verio.com" nil "/scp:t.brannon@jump0.wh.verio.net:"))

;(setq tramp-verbose 6)

(setq password-cache-expiry nil)
