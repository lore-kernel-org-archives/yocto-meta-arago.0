Return-Path: <denys@ti.com>
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
	by arago-project.org (Postfix) with ESMTPS id C6CD9529E3
	for <meta-arago@arago-project.org>;
	Tue, 17 Mar 2020 20:13:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 8A11240C34;
	Tue, 17 Mar 2020 20:11:47 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new,
	port 10024)
	with ESMTP id 9a_rxbJrPAef; Tue, 17 Mar 2020 20:11:47 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-86-127.washdc.fios.verizon.net
	[100.15.86.127])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 7000E40C0A;
	Tue, 17 Mar 2020 20:11:46 +0000 (UTC)
Received: from gimli.denix (unknown [192.168.30.6])
	by mail.denix.org (Postfix) with ESMTP id D827B1711D9;
	Tue, 17 Mar 2020 16:11:44 -0400 (EDT)
From: Denys Dmytriyenko <denys@ti.com>
To: meta-arago@arago-project.org
Date: Tue, 17 Mar 2020 16:11:37 -0400
Message-Id: <1584475904-3730-2-git-send-email-denys@ti.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1584475904-3730-1-git-send-email-denys@ti.com>
References: <1584475904-3730-1-git-send-email-denys@ti.com>
Subject: [master][PATCH 2/9] python: drop Python2 code
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
X-List-Received-Date: Tue, 17 Mar 2020 20:13:55 -0000

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 .../python-numpy/python-numpy_1.16.3.bb            | 10 ----------
 .../python/python-appdirs_1.4.0.bb                 |  8 --------
 .../recipes-devtools/python/python-mako.inc        | 15 --------------
 .../recipes-devtools/python/python-mako_1.0.4.bb   | 17 ----------------
 .../recipes-devtools/python/python-pyelftools.inc  | 14 -------------
 .../python/python-pyelftools_0.25.bb               |  2 --
 .../python/python-pyopencl_2016.1.bb               | 23 ----------------------
 .../python/python-pytools_2016.2.1.bb              | 17 ----------------
 .../python/python3-pyelftools_0.25.bb              |  2 --
 9 files changed, 108 deletions(-)
 delete mode 100644 meta-arago-distro/recipes-devtools/python-numpy/python-numpy_1.16.3.bb
 delete mode 100644 meta-arago-extras/recipes-devtools/python/python-appdirs_1.4.0.bb
 delete mode 100644 meta-arago-extras/recipes-devtools/python/python-mako.inc
 delete mode 100644 meta-arago-extras/recipes-devtools/python/python-mako_1.0.4.bb
 delete mode 100644 meta-arago-extras/recipes-devtools/python/python-pyelftools.inc
 delete mode 100644 meta-arago-extras/recipes-devtools/python/python-pyelftools_0.25.bb
 delete mode 100644 meta-arago-extras/recipes-devtools/python/python-pyopencl_2016.1.bb
 delete mode 100644 meta-arago-extras/recipes-devtools/python/python-pytools_2016.2.1.bb
 delete mode 100644 meta-arago-extras/recipes-devtools/python/python3-pyelftools_0.25.bb

diff --git a/meta-arago-distro/recipes-devtools/python-numpy/python-numpy_1.16.3.bb b/meta-arago-distro/recipes-devtools/python-numpy/python-numpy_1.16.3.bb
deleted file mode 100644
index a1133da..0000000
--- a/meta-arago-distro/recipes-devtools/python-numpy/python-numpy_1.16.3.bb
+++ /dev/null
@@ -1,10 +0,0 @@
-inherit setuptools
-require python-numpy.inc
-
-RDEPENDS_${PN}_class-target_append = " \
-    ${PYTHON_PN}-subprocess \
-"
-
-do_install_append(){
-        rm ${D}/${bindir}/f2py
-}
diff --git a/meta-arago-extras/recipes-devtools/python/python-appdirs_1.4.0.bb b/meta-arago-extras/recipes-devtools/python/python-appdirs_1.4.0.bb
deleted file mode 100644
index fdea221..0000000
--- a/meta-arago-extras/recipes-devtools/python/python-appdirs_1.4.0.bb
+++ /dev/null
@@ -1,8 +0,0 @@
-SUMMARY = "A small Python module for determining appropriate + platform-specific dirs, e.g. a "user data dir"."
-LICENSE = "MIT"
-LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=31625363c45eb0c67c630a2f73e438e4"
-
-SRC_URI[md5sum] = "1d17b4c9694ab84794e228f28dc3275b"
-SRC_URI[sha256sum] = "8fc245efb4387a4e3e0ac8ebcc704582df7d72ff6a42a53f5600bbb18fdaadc5"
-
-inherit pypi setuptools
diff --git a/meta-arago-extras/recipes-devtools/python/python-mako.inc b/meta-arago-extras/recipes-devtools/python/python-mako.inc
deleted file mode 100644
index 85ec217..0000000
--- a/meta-arago-extras/recipes-devtools/python/python-mako.inc
+++ /dev/null
@@ -1,15 +0,0 @@
-SUMMARY = "Templating library for Python"
-SECTION = "devel/python"
-LICENSE = "MIT"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=1bb21fa2d2f7a534c884b990430a6863"
-
-SRC_URI = "https://files.pythonhosted.org/packages/source/M/Mako/Mako-${PV}.tar.gz"
-
-SRC_URI[md5sum] = "c5fc31a323dd4990683d2f2da02d4e20"
-SRC_URI[sha256sum] = "fed99dbe4d0ddb27a33ee4910d8708aca9ef1fe854e668387a9ab9a90cbf9059"
-
-UPSTREAM_CHECK_URI = "https://pypi.python.org/pypi/mako/"
-UPSTREAM_CHECK_REGEX = "/Mako/(?P<pver>(\d+[\.\-_]*)+)"
-
-S = "${WORKDIR}/Mako-${PV}"
-
diff --git a/meta-arago-extras/recipes-devtools/python/python-mako_1.0.4.bb b/meta-arago-extras/recipes-devtools/python/python-mako_1.0.4.bb
deleted file mode 100644
index 230044e..0000000
--- a/meta-arago-extras/recipes-devtools/python/python-mako_1.0.4.bb
+++ /dev/null
@@ -1,17 +0,0 @@
-require python-mako.inc
-
-inherit setuptools
-
-RDEPENDS_${PN} = "python-threading \
-                  python-netclient \
-                  python-html \
-"
-RDEPENDS_${PN}_class-native = ""
-
-BBCLASSEXTEND = "native nativesdk"
-
-# The same utility is packaged in python3-mako, so it would conflict
-do_install_append() {
-    rm -f ${D}${bindir}/mako-render
-    rmdir ${D}${bindir}
-}
diff --git a/meta-arago-extras/recipes-devtools/python/python-pyelftools.inc b/meta-arago-extras/recipes-devtools/python/python-pyelftools.inc
deleted file mode 100644
index d53a22f..0000000
--- a/meta-arago-extras/recipes-devtools/python/python-pyelftools.inc
+++ /dev/null
@@ -1,14 +0,0 @@
-SUMMARY = "Parsing ELF and DWARF in Python"
-DESCRIPTION = "Pure-Python library for parsing and analyzing ELF files and DWARF debugging information"
-HOMEPAGE = "https://github.com/eliben/pyelftools"
-LICENSE = "PD"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=5ce2a2b07fca326bc7c146d10105ccfc"
-
-PYPI_PACKAGE = "pyelftools"
-
-inherit pypi
-
-SRC_URI[md5sum] = "c5629b9a5d19c82107a946cce52eeec2"
-SRC_URI[sha256sum] = "89c6da6f56280c37a5ff33468591ba9a124e17d71fe42de971818cbff46c1b24"
-
-BBCLASSEXTEND = "native nativesdk"
diff --git a/meta-arago-extras/recipes-devtools/python/python-pyelftools_0.25.bb b/meta-arago-extras/recipes-devtools/python/python-pyelftools_0.25.bb
deleted file mode 100644
index de42025..0000000
--- a/meta-arago-extras/recipes-devtools/python/python-pyelftools_0.25.bb
+++ /dev/null
@@ -1,2 +0,0 @@
-inherit setuptools
-require python-pyelftools.inc
diff --git a/meta-arago-extras/recipes-devtools/python/python-pyopencl_2016.1.bb b/meta-arago-extras/recipes-devtools/python/python-pyopencl_2016.1.bb
deleted file mode 100644
index 9917ede..0000000
--- a/meta-arago-extras/recipes-devtools/python/python-pyopencl_2016.1.bb
+++ /dev/null
@@ -1,23 +0,0 @@
-SUMMARY = "OpenCL Integration for Python"
-LICENSE = "MIT"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=2379446cdcffbf1c63a87311b816a656"
-
-DEPENDS = " python-cffi-native python-numpy-native opencl"
-RDEPENDS_${PN} = " opencl-runtime \
-                   python-numpy \
-                   python-pytest \
-                   python-pytools \
-                   python-decorator \
-                   python-cffi \
-                   python-appdirs \
-                   python-six \
-                   python-mako \
-"
-
-SRC_URI[md5sum] = "0c8a33b6a6b427bcd9c5966da461d9c6"
-SRC_URI[sha256sum] = "54b6e8ad02dc437807739bd53e43851efe979bd51ec87996e44b94ab67238297"
-
-inherit pypi setuptools
-
-# Standard pypi SRC_URI is not available at this time
-SRC_URI = "https://pypi.python.org/packages/cb/4e/fcb45db7d3005f5646f28a3de2a2f8e60a6e4b629f02bbb331320778f3a1/pyopencl-2016.1.tar.gz"
diff --git a/meta-arago-extras/recipes-devtools/python/python-pytools_2016.2.1.bb b/meta-arago-extras/recipes-devtools/python/python-pytools_2016.2.1.bb
deleted file mode 100644
index fb597d4..0000000
--- a/meta-arago-extras/recipes-devtools/python/python-pytools_2016.2.1.bb
+++ /dev/null
@@ -1,17 +0,0 @@
-SUMMARY = "A collection of tools for Python"
-LICENSE = "MIT"
-LIC_FILES_CHKSUM = "file://MANIFEST.in;md5=d41d8cd98f00b204e9800998ecf8427e"
-
-RDEPENDS_${PN} = " python-decorator \
-                   python-appdirs \
-                   python-six \
-                   python-numpy \
-"
-
-SRC_URI[md5sum] = "452dfa3023733a675cc1bee91c536cbd"
-SRC_URI[sha256sum] = "8939d4a81e17ca30968126e9614100ab38df926b251b96a0b4736234195cca19"
-
-inherit pypi setuptools
-
-# Standard pypi SRC_URI is not available at this time
-SRC_URI = "https://pypi.python.org/packages/1a/1e/ce42d53bad97ad16732c8d9ac1dd6ed22a906ea07f291df5f6f90a6c7a2a/pytools-2016.2.1.tar.gz"
diff --git a/meta-arago-extras/recipes-devtools/python/python3-pyelftools_0.25.bb b/meta-arago-extras/recipes-devtools/python/python3-pyelftools_0.25.bb
deleted file mode 100644
index 56eb8c4..0000000
--- a/meta-arago-extras/recipes-devtools/python/python3-pyelftools_0.25.bb
+++ /dev/null
@@ -1,2 +0,0 @@
-inherit setuptools3
-require python-pyelftools.inc
-- 
2.7.4


