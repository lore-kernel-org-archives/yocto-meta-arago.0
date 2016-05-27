Return-Path: <j-stiffler@ti.com>
Received: from bear.ext.ti.com (bear.ext.ti.com [198.47.19.11])
	by arago-project.org (Postfix) with ESMTPS id 8FCBB52AC6
	for <meta-arago@arago-project.org>;
	Fri, 27 May 2016 13:18:02 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by bear.ext.ti.com (8.13.7/8.13.7) with ESMTP id u4RDI2vT020135
	for <meta-arago@arago-project.org>; Fri, 27 May 2016 08:18:02 -0500
Received: from DFLE73.ent.ti.com (dfle73.ent.ti.com [128.247.5.110])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id u4RDI2wi017086
	for <meta-arago@arago-project.org>; Fri, 27 May 2016 08:18:02 -0500
Received: from dflp32.itg.ti.com (10.64.6.15) by DFLE73.ent.ti.com
	(128.247.5.110) with Microsoft SMTP Server id 14.3.294.0;
	Fri, 27 May 2016 08:18:02 -0500
Received: from udd0866934.am.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])	by dflp32.itg.ti.com (8.14.3/8.13.8) with ESMTP id
	u4RDI1Ck027612;	Fri, 27 May 2016 08:18:01 -0500
From: Jacob Stiffler <j-stiffler@ti.com>
To: <meta-arago@arago-project.org>
Date: Fri, 27 May 2016 09:17:51 -0400
Message-ID: <1464355073-24441-3-git-send-email-j-stiffler@ti.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1464355073-24441-1-git-send-email-j-stiffler@ti.com>
References: <1464355073-24441-1-git-send-email-j-stiffler@ti.com>
MIME-Version: 1.0
Subject: [PATCH 2/4] python-pytools: add version 2016.2.1
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
X-List-Received-Date: Fri, 27 May 2016 13:18:03 -0000
Content-Type: text/plain

* Unfortunately the standard pypi SRC_URI is not available, so use
  link from pypi homepage

Signed-off-by: Jacob Stiffler <j-stiffler@ti.com>
---
 .../recipes-devtools/python/python-pytools_2016.2.1.bb  | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)
 create mode 100644 meta-arago-extras/recipes-devtools/python/python-pytools_2016.2.1.bb

diff --git a/meta-arago-extras/recipes-devtools/python/python-pytools_2016.2.1.bb b/meta-arago-extras/recipes-devtools/python/python-pytools_2016.2.1.bb
new file mode 100644
index 0000000..fb597d4
--- /dev/null
+++ b/meta-arago-extras/recipes-devtools/python/python-pytools_2016.2.1.bb
@@ -0,0 +1,17 @@
+SUMMARY = "A collection of tools for Python"
+LICENSE = "MIT"
+LIC_FILES_CHKSUM = "file://MANIFEST.in;md5=d41d8cd98f00b204e9800998ecf8427e"
+
+RDEPENDS_${PN} = " python-decorator \
+                   python-appdirs \
+                   python-six \
+                   python-numpy \
+"
+
+SRC_URI[md5sum] = "452dfa3023733a675cc1bee91c536cbd"
+SRC_URI[sha256sum] = "8939d4a81e17ca30968126e9614100ab38df926b251b96a0b4736234195cca19"
+
+inherit pypi setuptools
+
+# Standard pypi SRC_URI is not available at this time
+SRC_URI = "https://pypi.python.org/packages/1a/1e/ce42d53bad97ad16732c8d9ac1dd6ed22a906ea07f291df5f6f90a6c7a2a/pytools-2016.2.1.tar.gz"
-- 
2.7.4


