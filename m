Return-Path: <mrinmayee@ti.com>
Received: from devils.ext.ti.com (devils.ext.ti.com [198.47.26.153])
	by arago-project.org (Postfix) with ESMTPS id CD31152A69
	for <meta-arago@arago-project.org>;
	Fri, 25 Oct 2013 09:35:25 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by devils.ext.ti.com (8.13.7/8.13.7) with ESMTP id r9P9ZOP0027539
	for <meta-arago@arago-project.org>; Fri, 25 Oct 2013 04:35:24 -0500
Received: from DLEE71.ent.ti.com (dlee71.ent.ti.com [157.170.170.114])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id r9P9ZOqN002020
	for <meta-arago@arago-project.org>; Fri, 25 Oct 2013 04:35:24 -0500
Received: from dlep33.itg.ti.com (157.170.170.75) by DLEE71.ent.ti.com
	(157.170.170.114) with Microsoft SMTP Server id 14.2.342.3;
	Fri, 25 Oct 2013 04:35:24 -0500
Received: from ti.com (ileax41-snat.itg.ti.com [10.172.224.153])	by
	dlep33.itg.ti.com (8.14.3/8.13.8) with ESMTP id r9P9ZNGO001040	for
	<meta-arago@arago-project.org>; Fri, 25 Oct 2013 04:35:23 -0500
Date: Fri, 25 Oct 2013 15:05:22 +0530
From: Mrinmayee Hingolikar <mrinmayee@ti.com>
To: <meta-arago@arago-project.org>
Message-ID: <20131025093522.GA20276@ti.com>
MIME-Version: 1.0
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: [PATCH 4/5] multimedia: GStreamer bad plugins
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
X-List-Received-Date: Fri, 25 Oct 2013 09:35:27 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

Signed-off-by: Mrinmayee Hingolikar <mrinmayee@ti.com>
---
 .../gstreamer/gst-plugins-bad_0.10.23.bbappend     |   25 ++++++++++++++++++++
 1 file changed, 25 insertions(+)
 create mode 100644 meta-arago-extras/recipes-multimedia/gstreamer/gst-plugins-bad_0.10.23.bbappend

diff --git a/meta-arago-extras/recipes-multimedia/gstreamer/gst-plugins-bad_0.10.23.bbappend b/meta-arago-extras/recipes-multimedia/gstreamer/gst-plugins-bad_0.10.23.bbappend
new file mode 100644
index 0000000..67e9be8
--- /dev/null
+++ b/meta-arago-extras/recipes-multimedia/gstreamer/gst-plugins-bad_0.10.23.bbappend
@@ -0,0 +1,25 @@
+SRC_URI = "git://git.ti.com/glsdk/gst-plugins-bad0-10.git;protocol=git"
+
+SRCREV = "8997db5920f8e2b8106c2e9301be9493064795ed"
+
+LICENSE = "GPLv2"
+LIC_FILES_CHKSUM = "file://COPYING;md5=0636e73ff0215e8d672dc4c32c317bb3"
+
+DEPENDS += "omap5-sgx-ddk-um-linux libdce"
+
+PR = "r0"
+
+COMPATIBLE_MACHINE = "omap-a15"
+
+S = "${WORKDIR}/git"
+
+EXTRA_OECONF += " --disable-pvr"
+
+do_configure_prepend() {
+	git submodule init && git submodule update
+	autopoint -f
+}
+
+FILES_${PN} += "\
+                ${libdir}/*.so \
+                ${libdir}/gstreamer-0.10/*"
-- 
1.7.9.5


