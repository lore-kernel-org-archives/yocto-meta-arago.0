Return-Path: <denys@ti.com>
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.17])
	by arago-project.org (Postfix) with ESMTPS id 211FA52A40
	for <meta-arago@arago-project.org>;
	Mon,  4 Dec 2017 21:17:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id A597320B21;
	Mon,  4 Dec 2017 21:17:15 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo03-pco.easydns.vpn [127.0.0.1]) (amavisd-new,
	port 10024)
	with ESMTP id j9jx7MRfa3qo; Mon,  4 Dec 2017 21:17:15 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-85-143.washdc.fios.verizon.net
	[100.15.85.143])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 7CD1C207BA;
	Mon,  4 Dec 2017 21:17:14 +0000 (UTC)
Received: from gimli.denix (gimli [192.168.0.6])
	by mail.denix.org (Postfix) with ESMTP id E6869162740;
	Mon,  4 Dec 2017 16:17:13 -0500 (EST)
From: Denys Dmytriyenko <denys@ti.com>
To: meta-arago@arago-project.org
Date: Mon,  4 Dec 2017 16:17:08 -0500
Message-Id: <1512422231-43396-1-git-send-email-denys@ti.com>
X-Mailer: git-send-email 2.7.4
Subject: [master][PATCH 1/4] pybind11: update to 2.2.1
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
X-List-Received-Date: Mon, 04 Dec 2017 21:17:21 -0000

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 meta-arago-extras/recipes-devtools/python/python-pybind11.inc     | 8 ++++----
 .../python/{python-pybind11_1.8.1.bb => python-pybind11_2.2.1.bb} | 0
 .../{python3-pybind11_1.8.1.bb => python3-pybind11_2.2.1.bb}      | 0
 3 files changed, 4 insertions(+), 4 deletions(-)
 rename meta-arago-extras/recipes-devtools/python/{python-pybind11_1.8.1.bb => python-pybind11_2.2.1.bb} (100%)
 rename meta-arago-extras/recipes-devtools/python/{python3-pybind11_1.8.1.bb => python3-pybind11_2.2.1.bb} (100%)

diff --git a/meta-arago-extras/recipes-devtools/python/python-pybind11.inc b/meta-arago-extras/recipes-devtools/python/python-pybind11.inc
index e13f6a5..0f3d3cc 100644
--- a/meta-arago-extras/recipes-devtools/python/python-pybind11.inc
+++ b/meta-arago-extras/recipes-devtools/python/python-pybind11.inc
@@ -1,9 +1,9 @@
 SUMMARY = "Seamless operability between C++11 and Python"
 HOMEPAGE = "https://github.com/wjakob/pybind11"
 LICENSE = "BSD-2-Clause"
-LIC_FILES_CHKSUM = "file://PKG-INFO;md5=1e9383cd3e97753d7dd6067d079519ea"
+LIC_FILES_CHKSUM = "file://PKG-INFO;md5=5399ae4d93a67b891d79b1e1cbfa4593"
 PR = "r0"
 
-SRC_URI = "https://pypi.python.org/packages/89/0b/f3a25633e49be5fae17ed2c7751c8106a08199db70e3c82e8cc043388ba9/pybind11-1.8.1.tar.gz"
-SRC_URI[md5sum] = "67845d8fd89a1c400dc7c61ccdee14d6"
-SRC_URI[sha256sum] = "358d4b7d8c38cd1dde66064178c6bbaaa2c479a44e67e642820fe0f329a4fff8"
+SRC_URI = "https://pypi.python.org/packages/c9/f7/fc9c44bf088d942c71b04646891034036a63e5bd00daff1c9a377e0f5a9f/pybind11-2.2.1.tar.gz"
+SRC_URI[md5sum] = "f454d8991f47befe56d4126df861fc96"
+SRC_URI[sha256sum] = "a96a924fae6e2721efbf24f47561284fd1ea0b655619a8621c4423036183b824"
diff --git a/meta-arago-extras/recipes-devtools/python/python-pybind11_1.8.1.bb b/meta-arago-extras/recipes-devtools/python/python-pybind11_2.2.1.bb
similarity index 100%
rename from meta-arago-extras/recipes-devtools/python/python-pybind11_1.8.1.bb
rename to meta-arago-extras/recipes-devtools/python/python-pybind11_2.2.1.bb
diff --git a/meta-arago-extras/recipes-devtools/python/python3-pybind11_1.8.1.bb b/meta-arago-extras/recipes-devtools/python/python3-pybind11_2.2.1.bb
similarity index 100%
rename from meta-arago-extras/recipes-devtools/python/python3-pybind11_1.8.1.bb
rename to meta-arago-extras/recipes-devtools/python/python3-pybind11_2.2.1.bb
-- 
2.7.4


