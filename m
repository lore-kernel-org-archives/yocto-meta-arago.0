Return-Path: <denis@denix.org>
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.17])
	by arago-project.org (Postfix) with ESMTPS id C187452A7D
	for <meta-arago@arago-project.org>;
	Thu,  6 Oct 2016 19:34:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id A5BE1208FE;
	Thu,  6 Oct 2016 19:34:42 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo03-pco.easydns.vpn [127.0.0.1]) (amavisd-new,
	port 10024)
	with ESMTP id YhEIIj0vR7R7; Thu,  6 Oct 2016 19:34:42 +0000 (UTC)
Received: from gandalf.denix.org (pool-100-15-106-107.washdc.fios.verizon.net
	[100.15.106.107])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 50941202B9;
	Thu,  6 Oct 2016 19:34:41 +0000 (UTC)
Received: from sam.denix (sam [192.168.0.5])
	by gandalf.denix.org (Postfix) with ESMTP id 56798162152;
	Thu,  6 Oct 2016 15:34:40 -0400 (EDT)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-arago@arago-project.org
Date: Thu,  6 Oct 2016 15:34:36 -0400
Message-Id: <1475782479-31904-1-git-send-email-denis@denix.org>
X-Mailer: git-send-email 2.7.4
Subject: [PATCH 1/4] python-pybind11: add pybind11 for operability between C++11 and Python
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
X-List-Received-Date: Thu, 06 Oct 2016 19:34:48 -0000

From: Denys Dmytriyenko <denys@ti.com>

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 meta-arago-extras/recipes-devtools/python/python-pybind11.inc    | 9 +++++++++
 .../recipes-devtools/python/python-pybind11_1.8.1.bb             | 2 ++
 .../recipes-devtools/python/python3-pybind11_1.8.1.bb            | 2 ++
 3 files changed, 13 insertions(+)
 create mode 100644 meta-arago-extras/recipes-devtools/python/python-pybind11.inc
 create mode 100644 meta-arago-extras/recipes-devtools/python/python-pybind11_1.8.1.bb
 create mode 100644 meta-arago-extras/recipes-devtools/python/python3-pybind11_1.8.1.bb

diff --git a/meta-arago-extras/recipes-devtools/python/python-pybind11.inc b/meta-arago-extras/recipes-devtools/python/python-pybind11.inc
new file mode 100644
index 0000000..e13f6a5
--- /dev/null
+++ b/meta-arago-extras/recipes-devtools/python/python-pybind11.inc
@@ -0,0 +1,9 @@
+SUMMARY = "Seamless operability between C++11 and Python"
+HOMEPAGE = "https://github.com/wjakob/pybind11"
+LICENSE = "BSD-2-Clause"
+LIC_FILES_CHKSUM = "file://PKG-INFO;md5=1e9383cd3e97753d7dd6067d079519ea"
+PR = "r0"
+
+SRC_URI = "https://pypi.python.org/packages/89/0b/f3a25633e49be5fae17ed2c7751c8106a08199db70e3c82e8cc043388ba9/pybind11-1.8.1.tar.gz"
+SRC_URI[md5sum] = "67845d8fd89a1c400dc7c61ccdee14d6"
+SRC_URI[sha256sum] = "358d4b7d8c38cd1dde66064178c6bbaaa2c479a44e67e642820fe0f329a4fff8"
diff --git a/meta-arago-extras/recipes-devtools/python/python-pybind11_1.8.1.bb b/meta-arago-extras/recipes-devtools/python/python-pybind11_1.8.1.bb
new file mode 100644
index 0000000..e567430
--- /dev/null
+++ b/meta-arago-extras/recipes-devtools/python/python-pybind11_1.8.1.bb
@@ -0,0 +1,2 @@
+inherit pypi setuptools
+require python-pybind11.inc
diff --git a/meta-arago-extras/recipes-devtools/python/python3-pybind11_1.8.1.bb b/meta-arago-extras/recipes-devtools/python/python3-pybind11_1.8.1.bb
new file mode 100644
index 0000000..355e284
--- /dev/null
+++ b/meta-arago-extras/recipes-devtools/python/python3-pybind11_1.8.1.bb
@@ -0,0 +1,2 @@
+inherit pypi setuptools3
+require python-pybind11.inc
-- 
2.7.4


