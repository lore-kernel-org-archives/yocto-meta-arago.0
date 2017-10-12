Return-Path: <denis@denix.org>
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.17])
	by arago-project.org (Postfix) with ESMTPS id 55CD952093
	for <meta-arago@arago-project.org>;
	Thu, 12 Oct 2017 21:28:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 98EE220B0E;
	Thu, 12 Oct 2017 21:28:19 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo03-pco.easydns.vpn [127.0.0.1]) (amavisd-new,
	port 10024)
	with ESMTP id yHWeKxH3NDdz; Thu, 12 Oct 2017 21:28:19 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-85-143.washdc.fios.verizon.net
	[100.15.85.143])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 8204620B10;
	Thu, 12 Oct 2017 21:28:17 +0000 (UTC)
Received: from gimli.denix (gimli [192.168.0.6])
	by mail.denix.org (Postfix) with ESMTP id 04EA21626F2;
	Thu, 12 Oct 2017 17:28:16 -0400 (EDT)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-arago@arago-project.org
Date: Thu, 12 Oct 2017 17:28:11 -0400
Message-Id: <1507843693-2615-7-git-send-email-denis@denix.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1507843693-2615-1-git-send-email-denis@denix.org>
References: <1507843693-2615-1-git-send-email-denis@denix.org>
Subject: [master][PATCH 7/9] python-mako: overlay old python2.7 version locally for opencl
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
X-List-Received-Date: Thu, 12 Oct 2017 21:28:20 -0000

From: Denys Dmytriyenko <denys@ti.com>

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 .../recipes-devtools/python/python-mako.inc             | 15 +++++++++++++++
 .../recipes-devtools/python/python-mako_1.0.4.bb        | 17 +++++++++++++++++
 2 files changed, 32 insertions(+)
 create mode 100644 meta-arago-extras/recipes-devtools/python/python-mako.inc
 create mode 100644 meta-arago-extras/recipes-devtools/python/python-mako_1.0.4.bb

diff --git a/meta-arago-extras/recipes-devtools/python/python-mako.inc b/meta-arago-extras/recipes-devtools/python/python-mako.inc
new file mode 100644
index 0000000..85ec217
--- /dev/null
+++ b/meta-arago-extras/recipes-devtools/python/python-mako.inc
@@ -0,0 +1,15 @@
+SUMMARY = "Templating library for Python"
+SECTION = "devel/python"
+LICENSE = "MIT"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=1bb21fa2d2f7a534c884b990430a6863"
+
+SRC_URI = "https://files.pythonhosted.org/packages/source/M/Mako/Mako-${PV}.tar.gz"
+
+SRC_URI[md5sum] = "c5fc31a323dd4990683d2f2da02d4e20"
+SRC_URI[sha256sum] = "fed99dbe4d0ddb27a33ee4910d8708aca9ef1fe854e668387a9ab9a90cbf9059"
+
+UPSTREAM_CHECK_URI = "https://pypi.python.org/pypi/mako/"
+UPSTREAM_CHECK_REGEX = "/Mako/(?P<pver>(\d+[\.\-_]*)+)"
+
+S = "${WORKDIR}/Mako-${PV}"
+
diff --git a/meta-arago-extras/recipes-devtools/python/python-mako_1.0.4.bb b/meta-arago-extras/recipes-devtools/python/python-mako_1.0.4.bb
new file mode 100644
index 0000000..230044e
--- /dev/null
+++ b/meta-arago-extras/recipes-devtools/python/python-mako_1.0.4.bb
@@ -0,0 +1,17 @@
+require python-mako.inc
+
+inherit setuptools
+
+RDEPENDS_${PN} = "python-threading \
+                  python-netclient \
+                  python-html \
+"
+RDEPENDS_${PN}_class-native = ""
+
+BBCLASSEXTEND = "native nativesdk"
+
+# The same utility is packaged in python3-mako, so it would conflict
+do_install_append() {
+    rm -f ${D}${bindir}/mako-render
+    rmdir ${D}${bindir}
+}
-- 
2.7.4


