Return-Path: <mrinmayee@ti.com>
Received: from arroyo.ext.ti.com (arroyo.ext.ti.com [192.94.94.40])
	by arago-project.org (Postfix) with ESMTPS id 4139F52A69
	for <meta-arago@arago-project.org>;
	Fri, 25 Oct 2013 09:35:11 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by arroyo.ext.ti.com (8.13.7/8.13.7) with ESMTP id r9P9ZAnq031841
	for <meta-arago@arago-project.org>; Fri, 25 Oct 2013 04:35:10 -0500
Received: from DLEE70.ent.ti.com (dlee70.ent.ti.com [157.170.170.113])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id r9P9ZAab000893
	for <meta-arago@arago-project.org>; Fri, 25 Oct 2013 04:35:10 -0500
Received: from dflp33.itg.ti.com (10.64.6.16) by DLEE70.ent.ti.com
	(157.170.170.113) with Microsoft SMTP Server id 14.2.342.3;
	Fri, 25 Oct 2013 04:35:10 -0500
Received: from ti.com (ileax41-snat.itg.ti.com [10.172.224.153])	by
	dflp33.itg.ti.com (8.14.3/8.13.8) with ESMTP id r9P9Z824025848	for
	<meta-arago@arago-project.org>; Fri, 25 Oct 2013 04:35:09 -0500
Date: Fri, 25 Oct 2013 15:05:08 +0530
From: Mrinmayee Hingolikar <mrinmayee@ti.com>
To: <meta-arago@arago-project.org>
Message-ID: <20131025093508.GA20249@ti.com>
MIME-Version: 1.0
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: [PATCH 3/5] multimedia: GStreamer good plugins
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
X-List-Received-Date: Fri, 25 Oct 2013 09:35:12 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

Signed-off-by: Mrinmayee Hingolikar <mrinmayee@ti.com>
---
 .../gstreamer/gst-plugins-good_0.10.31.bbappend    |   20 ++++++++++++++++++++
 1 file changed, 20 insertions(+)
 create mode 100644 meta-arago-extras/recipes-multimedia/gstreamer/gst-plugins-good_0.10.31.bbappend

diff --git a/meta-arago-extras/recipes-multimedia/gstreamer/gst-plugins-good_0.10.31.bbappend b/meta-arago-extras/recipes-multimedia/gstreamer/gst-plugins-good_0.10.31.bbappend
new file mode 100644
index 0000000..d13cdc4
--- /dev/null
+++ b/meta-arago-extras/recipes-multimedia/gstreamer/gst-plugins-good_0.10.31.bbappend
@@ -0,0 +1,20 @@
+SRC_URI = "git://git.ti.com/glsdk/gst-plugins-good0-10.git;protocol=git"
+SRCREV = "733289614c50ff4e490d5a37ec4af3a540d1dfb9"
+
+LICENSE = "LGPLv2.1"
+LIC_FILES_CHKSUM = "file://COPYING;md5=a6f89e2100d9b6cdffcea4f398e37343"
+
+PR = "r0"
+
+COMPATIBLE_MACHINE = "omap-a15"
+
+S = "${WORKDIR}/git"
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


