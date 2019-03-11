Return-Path: <j-stiffler@ti.com>
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
	by arago-project.org (Postfix) with ESMTPS id 6B022529C7
	for <meta-arago@arago-project.org>;
	Mon, 11 Mar 2019 15:52:21 +0000 (UTC)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id x2BFqCPX087335
	for <meta-arago@arago-project.org>; Mon, 11 Mar 2019 10:52:12 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1552319532;
	bh=+mwvNwxKVXZ6tPHqeZmyvZ1Ftu3UmOBwVjzIFYw+K0U=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=a+6NgXDgbpUoXqOm5mzD7PFgPEXUIMgOocHGxcMD6ci/I/bo7G/xOUNP9+Y7kt3ro
	hzi0vsjUeehzNrxB2hDwGKLeCaaLOfAbW5v2ga2jRVd8/0EqgdZf0ze2Tn2K/Pgk8R
	p3KFjrsrrjzVCky4Fp+WusGQmLsYNeAfREQJXi54=
Received: from DFLE112.ent.ti.com (dfle112.ent.ti.com [10.64.6.33])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x2BFqCmu117684
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-arago@arago-project.org>; Mon, 11 Mar 2019 10:52:12 -0500
Received: from DFLE101.ent.ti.com (10.64.6.22) by DFLE112.ent.ti.com
	(10.64.6.33) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1591.10;
	Mon, 11 Mar 2019 10:52:11 -0500
Received: from dlep32.itg.ti.com (157.170.170.100) by DFLE101.ent.ti.com
	(10.64.6.22) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.1591.10 via Frontend
	Transport; Mon, 11 Mar 2019 10:52:11 -0500
Received: from udd0866934.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])
	by dlep32.itg.ti.com (8.14.3/8.13.8) with ESMTP id x2BFq67I031358;
	Mon, 11 Mar 2019 10:52:11 -0500
From: Jacob Stiffler <j-stiffler@ti.com>
To: <meta-arago@arago-project.org>
Date: Mon, 11 Mar 2019 11:39:47 -0400
Message-ID: <1552318790-23095-2-git-send-email-j-stiffler@ti.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1552318790-23095-1-git-send-email-j-stiffler@ti.com>
References: <1552318790-23095-1-git-send-email-j-stiffler@ti.com>
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: [rocko][PATCH 1/4] mbedtls: upgrade to 2.13.0
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
X-List-Received-Date: Mon, 11 Mar 2019 15:52:21 -0000
Content-Type: text/plain

* Back-port from meta-oe/thud (bce1210d2ebeb0ae92464352ec4a8216e11d9615)
* This version is needed to enable encryption in open62541

Signed-off-by: Jacob Stiffler <j-stiffler@ti.com>
---
 .../recipes-connectivity/mbedtls/mbedtls_2.13.0.bb | 42 ++++++++++++++++++++++
 1 file changed, 42 insertions(+)
 create mode 100644 meta-arago-distro/recipes-connectivity/mbedtls/mbedtls_2.13.0.bb

diff --git a/meta-arago-distro/recipes-connectivity/mbedtls/mbedtls_2.13.0.bb b/meta-arago-distro/recipes-connectivity/mbedtls/mbedtls_2.13.0.bb
new file mode 100644
index 0000000..ff3f7f0
--- /dev/null
+++ b/meta-arago-distro/recipes-connectivity/mbedtls/mbedtls_2.13.0.bb
@@ -0,0 +1,42 @@
+SUMMARY = "Lightweight crypto and SSL/TLS library"
+DESCRIPTION = "mbedtls is a lean open source crypto library          \
+for providing SSL and TLS support in your programs. It offers        \
+an intuitive API and documented header files, so you can actually    \
+understand what the code does. It features:                          \
+                                                                     \
+ - Symmetric algorithms, like AES, Blowfish, Triple-DES, DES, ARC4,  \
+   Camellia and XTEA                                                 \
+ - Hash algorithms, like SHA-1, SHA-2, RIPEMD-160 and MD5            \
+ - Entropy pool and random generators, like CTR-DRBG and HMAC-DRBG   \
+ - Public key algorithms, like RSA, Elliptic Curves, Diffie-Hellman, \
+   ECDSA and ECDH                                                    \
+ - SSL v3 and TLS 1.0, 1.1 and 1.2                                   \
+ - Abstraction layers for ciphers, hashes, public key operations,    \
+   platform abstraction and threading                                \
+"
+
+HOMEPAGE = "https://tls.mbed.org/"
+
+LICENSE = "Apache-2.0"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=302d50a6369f5f22efdb674db908167a"
+
+SECTION = "libs"
+
+SRC_URI = "https://tls.mbed.org/download/mbedtls-${PV}-apache.tgz"
+
+SRC_URI[md5sum] = "659d96bb03012ca6db414a9137fcdbd6"
+SRC_URI[sha256sum] = "593b4e4d2e1629fc407ab4750d69fa309a0ddb66565dc3deb5b60eddbdeb06da"
+
+inherit cmake
+
+PACKAGECONFIG ??= "shared-libs programs"
+PACKAGECONFIG[shared-libs] = "-DUSE_SHARED_MBEDTLS_LIBRARY=ON,-USE_SHARED_MBEDTLS_LIBRARY=OFF"
+PACKAGECONFIG[programs] = "-DENABLE_PROGRAMS=ON,-DENABLE_PROGRAMS=OFF"
+
+EXTRA_OECMAKE = "-DENABLE_TESTING=OFF -DLIB_INSTALL_DIR:STRING=${libdir}"
+
+PROVIDES += "polarssl"
+RPROVIDES_${PN} = "polarssl"
+
+PACKAGES =+ "${PN}-programs"
+FILES_${PN}-programs = "${bindir}/"
-- 
2.7.4


