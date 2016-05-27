Return-Path: <j-stiffler@ti.com>
Received: from comal.ext.ti.com (comal.ext.ti.com [198.47.26.152])
	by arago-project.org (Postfix) with ESMTPS id 260F052AC7
	for <meta-arago@arago-project.org>;
	Fri, 27 May 2016 13:18:03 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by comal.ext.ti.com (8.13.7/8.13.7) with ESMTP id u4RDI2ui032315
	for <meta-arago@arago-project.org>; Fri, 27 May 2016 08:18:02 -0500
Received: from DFLE73.ent.ti.com (dfle73.ent.ti.com [128.247.5.110])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id u4RDI29X028693
	for <meta-arago@arago-project.org>; Fri, 27 May 2016 08:18:02 -0500
Received: from dflp32.itg.ti.com (10.64.6.15) by DFLE73.ent.ti.com
	(128.247.5.110) with Microsoft SMTP Server id 14.3.294.0;
	Fri, 27 May 2016 08:18:02 -0500
Received: from udd0866934.am.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])	by dflp32.itg.ti.com (8.14.3/8.13.8) with ESMTP id
	u4RDI1Cl027612;	Fri, 27 May 2016 08:18:02 -0500
From: Jacob Stiffler <j-stiffler@ti.com>
To: <meta-arago@arago-project.org>
Date: Fri, 27 May 2016 09:17:52 -0400
Message-ID: <1464355073-24441-4-git-send-email-j-stiffler@ti.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1464355073-24441-1-git-send-email-j-stiffler@ti.com>
References: <1464355073-24441-1-git-send-email-j-stiffler@ti.com>
MIME-Version: 1.0
Subject: [PATCH 3/4] python-pyopencl: add version 2016.1
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
 .../python/python-pyopencl_2016.1.bb               | 23 ++++++++++++++++++++++
 1 file changed, 23 insertions(+)
 create mode 100644 meta-arago-extras/recipes-devtools/python/python-pyopencl_2016.1.bb

diff --git a/meta-arago-extras/recipes-devtools/python/python-pyopencl_2016.1.bb b/meta-arago-extras/recipes-devtools/python/python-pyopencl_2016.1.bb
new file mode 100644
index 0000000..9917ede
--- /dev/null
+++ b/meta-arago-extras/recipes-devtools/python/python-pyopencl_2016.1.bb
@@ -0,0 +1,23 @@
+SUMMARY = "OpenCL Integration for Python"
+LICENSE = "MIT"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=2379446cdcffbf1c63a87311b816a656"
+
+DEPENDS = " python-cffi-native python-numpy-native opencl"
+RDEPENDS_${PN} = " opencl-runtime \
+                   python-numpy \
+                   python-pytest \
+                   python-pytools \
+                   python-decorator \
+                   python-cffi \
+                   python-appdirs \
+                   python-six \
+                   python-mako \
+"
+
+SRC_URI[md5sum] = "0c8a33b6a6b427bcd9c5966da461d9c6"
+SRC_URI[sha256sum] = "54b6e8ad02dc437807739bd53e43851efe979bd51ec87996e44b94ab67238297"
+
+inherit pypi setuptools
+
+# Standard pypi SRC_URI is not available at this time
+SRC_URI = "https://pypi.python.org/packages/cb/4e/fcb45db7d3005f5646f28a3de2a2f8e60a6e4b629f02bbb331320778f3a1/pyopencl-2016.1.tar.gz"
-- 
2.7.4


