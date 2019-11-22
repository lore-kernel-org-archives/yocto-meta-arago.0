Return-Path: <hnagalla@gmail.com>
Received: from mail-oi1-f193.google.com (mail-oi1-f193.google.com
	[209.85.167.193])
	by arago-project.org (Postfix) with ESMTPS id 6A6EE52A31
	for <meta-arago@arago-project.org>;
	Fri, 22 Nov 2019 15:02:27 +0000 (UTC)
Received: by mail-oi1-f193.google.com with SMTP id s71so6684472oih.11
	for <meta-arago@arago-project.org>;
	Fri, 22 Nov 2019 07:00:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=pvxmc7AD64N+lOtUR/u0b32Fyi/KLHAkJsuMLCmsdHw=;
	b=jAhZiyZESVzsQT+kZQk9PZK1FJB1q1Wj+yPgp+hxAzZm/F0wvnPc8C1O17M0NEgL0e
	Nmt2mjZj18EfgpLqL+mafQFZNF00POhHEu9TwwwVno0WDNTjcztCnc2JHGpmZrWlihcl
	H1s8AgfcoI6fKt36z84+7y2IzqArTKBLprFPzLl3VYFtLHAijsgHU8/Eqv+ELLlLP2T8
	BJxmErVphIZhOyBpgSc47752q1to8tfNwrrRoi93nrl/6t0L7HRjmcDjT6mxpffWOa6S
	nCLNSu21NjPNlaaf/55OKlFFCIGH4poYZIUc9VNLfdVHcJteAiom5vaQw1d8o6x55jo+
	p+SA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=pvxmc7AD64N+lOtUR/u0b32Fyi/KLHAkJsuMLCmsdHw=;
	b=keOV7HI3/1e5CGWJ0z/oTtTWyNRFn5hkPeoFGWC0hBsESbHKOWJPQ4NE3e/sUl+KPJ
	IqLZKKl5Z0LdQWf4kE856vQOwHwoj59W3nJ9/NlVa0rxRbcDP1gqXPw90KbMO3bN127E
	E79yrrsCHy0++DKN09qkVycZ9jf8LltVtSuPWF1iex7tI8A0pt1skjJC1TJ8UKf7CBbU
	9lqVO9XLONB2Kb6GbPcCLd7B3Ibbvba0KQop6+4R7unpR68K47dJjxUPz09LHQG0OJWi
	+ajXrH3t6Z59WuBTA7vpztFnkPDmFiyGSvOK4Fv1lFxMWiqXRyBCyLrWqFJajEaB92FJ
	/QAw==
X-Gm-Message-State: APjAAAVt0xozMCNFSGZmU2/rL6pPkVHSxZx63s/A0UQ3/4B0CqSQuIAj
	QvN4O5UzlqdLq9jAB79NYrW+WY80PNs=
X-Google-Smtp-Source: APXvYqyoM6fruhhbWwMK/TZp1Uo5SmpFiWUfnOWnus1y2ndEuXyoGLv0G3gEk9NoLdsCyNJ139OEmg==
X-Received: by 2002:aca:b6c3:: with SMTP id
	g186mr12985482oif.173.1574434859056; 
	Fri, 22 Nov 2019 07:00:59 -0800 (PST)
Received: from hari-Latitude-E6430.utdallas.edu
	(cpe-76-184-237-208.tx.res.rr.com. [76.184.237.208])
	by smtp.gmail.com with ESMTPSA id
	o203sm2109024oia.4.2019.11.22.07.00.57
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Fri, 22 Nov 2019 07:00:58 -0800 (PST)
From: Hari Nagalla <hnagalla@gmail.com>
To: meta-arago@arago-project.org
Date: Fri, 22 Nov 2019 09:00:30 -0600
Message-Id: <20191122150031.2588-3-hnagalla@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191122150031.2588-1-hnagalla@gmail.com>
References: <20191122150031.2588-1-hnagalla@gmail.com>
Subject: [ 2/3] Fix openssl1.1 build errors
X-BeenThere: meta-arago@arago-project.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Arago metadata layer for TI SDKs - OE-Core/Yocto compatible
	<meta-arago.arago-project.org>
List-Unsubscribe: <http://arago-project.org/cgi-bin/mailman/options/meta-arago>, 
	<mailto:meta-arago-request@arago-project.org?subject=unsubscribe>
List-Archive: <http://arago-project.org/pipermail/meta-arago>
List-Post: <mailto:meta-arago@arago-project.org>
List-Help: <mailto:meta-arago-request@arago-project.org?subject=help>
List-Subscribe: <http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago>, 
	<mailto:meta-arago-request@arago-project.org?subject=subscribe>
X-List-Received-Date: Fri, 22 Nov 2019 15:02:29 -0000

---
 .../wpa-supplicant/crypto_openssl.patch       | 127 ++++++++++++++++++
 1 file changed, 127 insertions(+)
 create mode 100644 meta-arago-extras/recipes-connectivity/wpa-supplicant/wpa-supplicant/crypto_openssl.patch

diff --git a/meta-arago-extras/recipes-connectivity/wpa-supplicant/wpa-supplicant/crypto_openssl.patch b/meta-arago-extras/recipes-connectivity/wpa-supplicant/wpa-supplicant/crypto_openssl.patch
new file mode 100644
index 00000000..650f5c19
--- /dev/null
+++ b/meta-arago-extras/recipes-connectivity/wpa-supplicant/wpa-supplicant/crypto_openssl.patch
@@ -0,0 +1,127 @@
+--- a/src/crypto/crypto_openssl.c	2019-11-09 06:46:42.112779317 -0600
++++ b/src/crypto/crypto_openssl.c.new	2019-11-09 13:16:57.560629882 -0600
+@@ -602,11 +602,15 @@
+ 
+ void * dh5_init(struct wpabuf **priv, struct wpabuf **publ)
+ {
++#if OPENSSL_VERSION_NUMBER < 0x10100000L || \
++	(defined(LIBRESSL_VERSION_NUMBER) && \
++	 LIBRESSL_VERSION_NUMBER < 0x20700000L)
+ 	DH *dh;
+ 	struct wpabuf *pubkey = NULL, *privkey = NULL;
+ 	size_t publen, privlen;
+ 
+ 	*priv = NULL;
++	wpabuf_free(*publ);
+ 	*publ = NULL;
+ 
+ 	dh = DH_new();
+@@ -645,11 +649,65 @@
+ 	wpabuf_clear_free(privkey);
+ 	DH_free(dh);
+ 	return NULL;
++#else
++	DH *dh;
++	struct wpabuf *pubkey = NULL, *privkey = NULL;
++	size_t publen, privlen;
++	BIGNUM *p = NULL, *g;
++	const BIGNUM *priv_key = NULL, *pub_key = NULL;
++
++	*priv = NULL;
++	wpabuf_free(*publ);
++	*publ = NULL;
++
++	dh = DH_new();
++	if (dh == NULL)
++		return NULL;
++
++	g = BN_new();
++	p = get_group5_prime();
++	if (!g || BN_set_word(g, 2) != 1 || !p ||
++	    DH_set0_pqg(dh, p, NULL, g) != 1)
++		goto err;
++	p = NULL;
++	g = NULL;
++
++	if (DH_generate_key(dh) != 1)
++		goto err;
++
++	DH_get0_key(dh, &pub_key, &priv_key);
++	publen = BN_num_bytes(pub_key);
++	pubkey = wpabuf_alloc(publen);
++	if (!pubkey)
++		goto err;
++	privlen = BN_num_bytes(priv_key);
++	privkey = wpabuf_alloc(privlen);
++	if (!privkey)
++		goto err;
++
++	BN_bn2bin(pub_key, wpabuf_put(pubkey, publen));
++	BN_bn2bin(priv_key, wpabuf_put(privkey, privlen));
++
++	*priv = privkey;
++	*publ = pubkey;
++	return dh;
++
++err:
++	BN_free(p);
++	BN_free(g);
++	wpabuf_clear_free(pubkey);
++	wpabuf_clear_free(privkey);
++	DH_free(dh);
++	return NULL;
++#endif
+ }
+ 
+ 
+ void * dh5_init_fixed(const struct wpabuf *priv, const struct wpabuf *publ)
+ {
++#if OPENSSL_VERSION_NUMBER < 0x10100000L || \
++	(defined(LIBRESSL_VERSION_NUMBER) && \
++	 LIBRESSL_VERSION_NUMBER < 0x20700000L)
+ 	DH *dh;
+ 
+ 	dh = DH_new();
+@@ -680,6 +738,42 @@
+ err:
+ 	DH_free(dh);
+ 	return NULL;
++#else
++	DH *dh;
++	BIGNUM *p = NULL, *g, *priv_key = NULL, *pub_key = NULL;
++
++	dh = DH_new();
++	if (dh == NULL)
++		return NULL;
++
++	g = BN_new();
++	p = get_group5_prime();
++	if (!g || BN_set_word(g, 2) != 1 || !p ||
++	    DH_set0_pqg(dh, p, NULL, g) != 1)
++		goto err;
++	p = NULL;
++	g = NULL;
++
++	priv_key = BN_bin2bn(wpabuf_head(priv), wpabuf_len(priv), NULL);
++	pub_key = BN_bin2bn(wpabuf_head(publ), wpabuf_len(publ), NULL);
++	if (!priv_key || !pub_key || DH_set0_key(dh, pub_key, priv_key) != 1)
++		goto err;
++	pub_key = NULL;
++	priv_key = NULL;
++
++	if (DH_generate_key(dh) != 1)
++		goto err;
++
++	return dh;
++
++err:
++	BN_free(p);
++	BN_free(g);
++	BN_free(pub_key);
++	BN_clear_free(priv_key);
++	DH_free(dh);
++	return NULL;
++#endif
+ }
+ 
+ 
-- 
2.17.1


