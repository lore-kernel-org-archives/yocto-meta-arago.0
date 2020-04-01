Return-Path: <denis@denix.org>
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
	by arago-project.org (Postfix) with ESMTPS id A824E52A05
	for <meta-arago@arago-project.org>;
	Wed,  1 Apr 2020 23:25:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 6716840B30;
	Wed,  1 Apr 2020 23:23:06 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new,
	port 10024)
	with ESMTP id 0zLwkN3K8jNM; Wed,  1 Apr 2020 23:23:06 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-86-127.washdc.fios.verizon.net
	[100.15.86.127])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 4F3FD409AA;
	Wed,  1 Apr 2020 23:23:05 +0000 (UTC)
Received: from gimli.denix (unknown [192.168.30.6])
	by mail.denix.org (Postfix) with ESMTP id EB0831718E5;
	Wed,  1 Apr 2020 19:23:04 -0400 (EDT)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-arago@arago-project.org
Date: Wed,  1 Apr 2020 19:23:04 -0400
Message-Id: <1585783384-35101-1-git-send-email-denis@denix.org>
X-Mailer: git-send-email 2.7.4
Subject: [master][PATCH] python: remove upstreamed pycryptodomex
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
X-List-Received-Date: Wed, 01 Apr 2020 23:25:19 -0000

From: Denys Dmytriyenko <denys@ti.com>

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 .../python/python-pycryptodomex.inc                | 29 ----------------------
 .../python/python3-pycryptodomex_3.9.4.bb          |  2 --
 2 files changed, 31 deletions(-)
 delete mode 100644 meta-arago-distro/recipes-devtools/python/python-pycryptodomex.inc
 delete mode 100644 meta-arago-distro/recipes-devtools/python/python3-pycryptodomex_3.9.4.bb

diff --git a/meta-arago-distro/recipes-devtools/python/python-pycryptodomex.inc b/meta-arago-distro/recipes-devtools/python/python-pycryptodomex.inc
deleted file mode 100644
index d00a076..0000000
--- a/meta-arago-distro/recipes-devtools/python/python-pycryptodomex.inc
+++ /dev/null
@@ -1,29 +0,0 @@
-SUMMARY = "Cryptographic library for Python"
-DESCRIPTION = "PyCryptodome is a self-contained Python package of low-level\
- cryptographic primitives."
-HOMEPAGE = "http://www.pycryptodome.org"
-LICENSE = "PD & BSD-2-Clause"
-LIC_FILES_CHKSUM = "file://LICENSE.rst;md5=6dc0e2a13d2f25d6f123c434b761faba"
-
-SRC_URI[md5sum] = "46ba513d95b6e323734074d960a7d57b"
-SRC_URI[sha256sum] = "22d970cee5c096b9123415e183ae03702b2cd4d3ba3f0ced25c4e1aba3967167"
-
-inherit pypi
-
-RDEPENDS_${PN} += " \
-    ${PYTHON_PN}-io \
-    ${PYTHON_PN}-math \
-"
-
-RDEPENDS_${PN}-tests += " \
-    ${PYTHON_PN}-unittest \
-"
-
-PACKAGES =+ "${PN}-tests"
-
-FILES_${PN}-tests += " \
-    ${PYTHON_SITEPACKAGES_DIR}/Cryptodome/SelfTest/ \
-    ${PYTHON_SITEPACKAGES_DIR}/Cryptodome/SelfTest/__pycache__/ \
-"
-
-BBCLASSEXTEND = "native nativesdk"
diff --git a/meta-arago-distro/recipes-devtools/python/python3-pycryptodomex_3.9.4.bb b/meta-arago-distro/recipes-devtools/python/python3-pycryptodomex_3.9.4.bb
deleted file mode 100644
index be66430..0000000
--- a/meta-arago-distro/recipes-devtools/python/python3-pycryptodomex_3.9.4.bb
+++ /dev/null
@@ -1,2 +0,0 @@
-require python-pycryptodomex.inc
-inherit setuptools3
-- 
2.7.4


