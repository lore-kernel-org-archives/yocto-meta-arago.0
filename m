Return-Path: <denys@ti.com>
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
	by arago-project.org (Postfix) with ESMTPS id 4F92252980
	for <meta-arago@arago-project.org>;
	Tue, 23 Jul 2019 21:27:52 +0000 (UTC)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id x6NLR0nt104948
	for <meta-arago@arago-project.org>; Tue, 23 Jul 2019 16:27:00 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1563917220;
	bh=xFJxRxGY1vqhNQ+8oLoVAFpQfmPdmG5yE3VMZokBVhA=;
	h=From:To:CC:Subject:Date;
	b=ccvRQRN6UtpmE/I+Cb/7EXHOA6QXgh+dVEoZ7M5ezvOi+KnExdkO8As3UhHd6arBr
	+ygdo/FLMTdl7fPYlRK6QLTFQgyVLUIisSdT0AX1FtxnPR2nM7nb+kH4YIV1LogX0k
	ThhB5T9kFqP2EqGCQ9+zD+m9jO/IW76a59nyLJ6Y=
Received: from DFLE115.ent.ti.com (dfle115.ent.ti.com [10.64.6.36])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x6NLR08W076184
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-arago@arago-project.org>; Tue, 23 Jul 2019 16:27:00 -0500
Received: from DFLE111.ent.ti.com (10.64.6.32) by DFLE115.ent.ti.com
	(10.64.6.36) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5;
	Tue, 23 Jul 2019 16:26:59 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DFLE111.ent.ti.com
	(10.64.6.32) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
	Frontend Transport; Tue, 23 Jul 2019 16:26:59 -0500
Received: from puget.gt.design.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])
	by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id x6NLQxB8085986;
	Tue, 23 Jul 2019 16:26:59 -0500
From: Denys Dmytriyenko <denys@ti.com>
To: <meta-arago@arago-project.org>
Date: Tue, 23 Jul 2019 21:13:37 +0000
Message-ID: <20190723211338.6729-1-denys@ti.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: [thud/master][PATCH 1/2] python-pyelftools: add pyelftools Python module
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
X-List-Received-Date: Tue, 23 Jul 2019 21:27:53 -0000
Content-Type: text/plain

https://github.com/eliben/pyelftools
pyelftools is a pure-Python library for parsing and analyzing ELF files and
DWARF debugging information.

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 .../recipes-devtools/python/python-pyelftools.inc  | 14 ++++++++++++++
 .../python/python-pyelftools_0.25.bb               |  2 ++
 .../python/python3-pyelftools_0.25.bb              |  2 ++
 3 files changed, 18 insertions(+)
 create mode 100644 meta-arago-extras/recipes-devtools/python/python-pyelftools.inc
 create mode 100644 meta-arago-extras/recipes-devtools/python/python-pyelftools_0.25.bb
 create mode 100644 meta-arago-extras/recipes-devtools/python/python3-pyelftools_0.25.bb

diff --git a/meta-arago-extras/recipes-devtools/python/python-pyelftools.inc b/meta-arago-extras/recipes-devtools/python/python-pyelftools.inc
new file mode 100644
index 00000000..d53a22f7
--- /dev/null
+++ b/meta-arago-extras/recipes-devtools/python/python-pyelftools.inc
@@ -0,0 +1,14 @@
+SUMMARY = "Parsing ELF and DWARF in Python"
+DESCRIPTION = "Pure-Python library for parsing and analyzing ELF files and DWARF debugging information"
+HOMEPAGE = "https://github.com/eliben/pyelftools"
+LICENSE = "PD"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=5ce2a2b07fca326bc7c146d10105ccfc"
+
+PYPI_PACKAGE = "pyelftools"
+
+inherit pypi
+
+SRC_URI[md5sum] = "c5629b9a5d19c82107a946cce52eeec2"
+SRC_URI[sha256sum] = "89c6da6f56280c37a5ff33468591ba9a124e17d71fe42de971818cbff46c1b24"
+
+BBCLASSEXTEND = "native nativesdk"
diff --git a/meta-arago-extras/recipes-devtools/python/python-pyelftools_0.25.bb b/meta-arago-extras/recipes-devtools/python/python-pyelftools_0.25.bb
new file mode 100644
index 00000000..de420250
--- /dev/null
+++ b/meta-arago-extras/recipes-devtools/python/python-pyelftools_0.25.bb
@@ -0,0 +1,2 @@
+inherit setuptools
+require python-pyelftools.inc
diff --git a/meta-arago-extras/recipes-devtools/python/python3-pyelftools_0.25.bb b/meta-arago-extras/recipes-devtools/python/python3-pyelftools_0.25.bb
new file mode 100644
index 00000000..56eb8c4c
--- /dev/null
+++ b/meta-arago-extras/recipes-devtools/python/python3-pyelftools_0.25.bb
@@ -0,0 +1,2 @@
+inherit setuptools3
+require python-pyelftools.inc
-- 
2.17.1


