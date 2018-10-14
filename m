Return-Path: <denys@ti.com>
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.17])
	by arago-project.org (Postfix) with ESMTPS id CD04A5296D
	for <meta-arago@arago-project.org>;
	Sun, 14 Oct 2018 20:03:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id EAEF720CEF;
	Sun, 14 Oct 2018 20:03:13 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo03-pco.easydns.vpn [127.0.0.1]) (amavisd-new,
	port 10024)
	with ESMTP id 1OcEhgrfESYe; Sun, 14 Oct 2018 20:03:13 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-91-218.washdc.fios.verizon.net
	[100.15.91.218])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id A8F7D20CE1;
	Sun, 14 Oct 2018 20:03:12 +0000 (UTC)
Received: from gimli.denix (gimli [192.168.0.6])
	by mail.denix.org (Postfix) with ESMTP id 3434E164768;
	Sun, 14 Oct 2018 16:03:12 -0400 (EDT)
From: Denys Dmytriyenko <denys@ti.com>
To: meta-arago@arago-project.org
Date: Sun, 14 Oct 2018 16:03:06 -0400
Message-Id: <1539547389-5881-3-git-send-email-denys@ti.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1539547389-5881-1-git-send-email-denys@ti.com>
References: <1539547389-5881-1-git-send-email-denys@ti.com>
Subject: [master][PATCH 3/6] openssl: rename bbappends to openssl10*
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
X-List-Received-Date: Sun, 14 Oct 2018 20:03:23 -0000

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 .../0001-Add-AF_ALG-interface-support-to-OpenSSL.patch                    | 0
 .../0001-cryptodev-Fix-issue-with-signature-generation.patch              | 0
 .../0002-Modify-eng_cryptodev.c-to-make-SHA1-and-MD5-work-wit.patch       | 0
 .../0002-cryptodev-allow-copying-EVP-contexts.patch                       | 0
 .../openssl/{openssl => openssl10}/0004-Sample-AF_ALG-openssl.cnf.patch   | 0
 .../0009-eng_cryptodev-Add-SHA224-initialization-to-cryptodev.patch       | 0
 .../0011-cryptodev-Add-AES-CBC-CTR-modes-for-128-192-256-bit-.patch       | 0
 .../openssl/{openssl_%.bbappend => openssl10_%.bbappend}                  | 0
 8 files changed, 0 insertions(+), 0 deletions(-)
 rename meta-arago-distro/recipes-connectivity/openssl/{openssl => openssl10}/0001-Add-AF_ALG-interface-support-to-OpenSSL.patch (100%)
 rename meta-arago-distro/recipes-connectivity/openssl/{openssl => openssl10}/0001-cryptodev-Fix-issue-with-signature-generation.patch (100%)
 rename meta-arago-distro/recipes-connectivity/openssl/{openssl => openssl10}/0002-Modify-eng_cryptodev.c-to-make-SHA1-and-MD5-work-wit.patch (100%)
 rename meta-arago-distro/recipes-connectivity/openssl/{openssl => openssl10}/0002-cryptodev-allow-copying-EVP-contexts.patch (100%)
 rename meta-arago-distro/recipes-connectivity/openssl/{openssl => openssl10}/0004-Sample-AF_ALG-openssl.cnf.patch (100%)
 rename meta-arago-distro/recipes-connectivity/openssl/{openssl => openssl10}/0009-eng_cryptodev-Add-SHA224-initialization-to-cryptodev.patch (100%)
 rename meta-arago-distro/recipes-connectivity/openssl/{openssl => openssl10}/0011-cryptodev-Add-AES-CBC-CTR-modes-for-128-192-256-bit-.patch (100%)
 rename meta-arago-distro/recipes-connectivity/openssl/{openssl_%.bbappend => openssl10_%.bbappend} (100%)

diff --git a/meta-arago-distro/recipes-connectivity/openssl/openssl/0001-Add-AF_ALG-interface-support-to-OpenSSL.patch b/meta-arago-distro/recipes-connectivity/openssl/openssl10/0001-Add-AF_ALG-interface-support-to-OpenSSL.patch
similarity index 100%
rename from meta-arago-distro/recipes-connectivity/openssl/openssl/0001-Add-AF_ALG-interface-support-to-OpenSSL.patch
rename to meta-arago-distro/recipes-connectivity/openssl/openssl10/0001-Add-AF_ALG-interface-support-to-OpenSSL.patch
diff --git a/meta-arago-distro/recipes-connectivity/openssl/openssl/0001-cryptodev-Fix-issue-with-signature-generation.patch b/meta-arago-distro/recipes-connectivity/openssl/openssl10/0001-cryptodev-Fix-issue-with-signature-generation.patch
similarity index 100%
rename from meta-arago-distro/recipes-connectivity/openssl/openssl/0001-cryptodev-Fix-issue-with-signature-generation.patch
rename to meta-arago-distro/recipes-connectivity/openssl/openssl10/0001-cryptodev-Fix-issue-with-signature-generation.patch
diff --git a/meta-arago-distro/recipes-connectivity/openssl/openssl/0002-Modify-eng_cryptodev.c-to-make-SHA1-and-MD5-work-wit.patch b/meta-arago-distro/recipes-connectivity/openssl/openssl10/0002-Modify-eng_cryptodev.c-to-make-SHA1-and-MD5-work-wit.patch
similarity index 100%
rename from meta-arago-distro/recipes-connectivity/openssl/openssl/0002-Modify-eng_cryptodev.c-to-make-SHA1-and-MD5-work-wit.patch
rename to meta-arago-distro/recipes-connectivity/openssl/openssl10/0002-Modify-eng_cryptodev.c-to-make-SHA1-and-MD5-work-wit.patch
diff --git a/meta-arago-distro/recipes-connectivity/openssl/openssl/0002-cryptodev-allow-copying-EVP-contexts.patch b/meta-arago-distro/recipes-connectivity/openssl/openssl10/0002-cryptodev-allow-copying-EVP-contexts.patch
similarity index 100%
rename from meta-arago-distro/recipes-connectivity/openssl/openssl/0002-cryptodev-allow-copying-EVP-contexts.patch
rename to meta-arago-distro/recipes-connectivity/openssl/openssl10/0002-cryptodev-allow-copying-EVP-contexts.patch
diff --git a/meta-arago-distro/recipes-connectivity/openssl/openssl/0004-Sample-AF_ALG-openssl.cnf.patch b/meta-arago-distro/recipes-connectivity/openssl/openssl10/0004-Sample-AF_ALG-openssl.cnf.patch
similarity index 100%
rename from meta-arago-distro/recipes-connectivity/openssl/openssl/0004-Sample-AF_ALG-openssl.cnf.patch
rename to meta-arago-distro/recipes-connectivity/openssl/openssl10/0004-Sample-AF_ALG-openssl.cnf.patch
diff --git a/meta-arago-distro/recipes-connectivity/openssl/openssl/0009-eng_cryptodev-Add-SHA224-initialization-to-cryptodev.patch b/meta-arago-distro/recipes-connectivity/openssl/openssl10/0009-eng_cryptodev-Add-SHA224-initialization-to-cryptodev.patch
similarity index 100%
rename from meta-arago-distro/recipes-connectivity/openssl/openssl/0009-eng_cryptodev-Add-SHA224-initialization-to-cryptodev.patch
rename to meta-arago-distro/recipes-connectivity/openssl/openssl10/0009-eng_cryptodev-Add-SHA224-initialization-to-cryptodev.patch
diff --git a/meta-arago-distro/recipes-connectivity/openssl/openssl/0011-cryptodev-Add-AES-CBC-CTR-modes-for-128-192-256-bit-.patch b/meta-arago-distro/recipes-connectivity/openssl/openssl10/0011-cryptodev-Add-AES-CBC-CTR-modes-for-128-192-256-bit-.patch
similarity index 100%
rename from meta-arago-distro/recipes-connectivity/openssl/openssl/0011-cryptodev-Add-AES-CBC-CTR-modes-for-128-192-256-bit-.patch
rename to meta-arago-distro/recipes-connectivity/openssl/openssl10/0011-cryptodev-Add-AES-CBC-CTR-modes-for-128-192-256-bit-.patch
diff --git a/meta-arago-distro/recipes-connectivity/openssl/openssl_%.bbappend b/meta-arago-distro/recipes-connectivity/openssl/openssl10_%.bbappend
similarity index 100%
rename from meta-arago-distro/recipes-connectivity/openssl/openssl_%.bbappend
rename to meta-arago-distro/recipes-connectivity/openssl/openssl10_%.bbappend
-- 
2.7.4


