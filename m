Return-Path: <mrinmayee@ti.com>
Received: from devils.ext.ti.com (devils.ext.ti.com [198.47.26.153])
	by arago-project.org (Postfix) with ESMTPS id CCB2252A69
	for <meta-arago@arago-project.org>;
	Fri, 25 Oct 2013 09:34:50 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by devils.ext.ti.com (8.13.7/8.13.7) with ESMTP id r9P9Yncj027031
	for <meta-arago@arago-project.org>; Fri, 25 Oct 2013 04:34:49 -0500
Received: from DLEE71.ent.ti.com (dlee71.ent.ti.com [157.170.170.114])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id r9P9Ynmq031661
	for <meta-arago@arago-project.org>; Fri, 25 Oct 2013 04:34:49 -0500
Received: from dflp33.itg.ti.com (10.64.6.16) by DLEE71.ent.ti.com
	(157.170.170.114) with Microsoft SMTP Server id 14.2.342.3;
	Fri, 25 Oct 2013 04:34:49 -0500
Received: from ti.com (ileax41-snat.itg.ti.com [10.172.224.153])	by
	dflp33.itg.ti.com (8.14.3/8.13.8) with ESMTP id r9P9Ylla025237	for
	<meta-arago@arago-project.org>; Fri, 25 Oct 2013 04:34:48 -0500
Date: Fri, 25 Oct 2013 15:04:47 +0530
From: Mrinmayee Hingolikar <mrinmayee@ti.com>
To: <meta-arago@arago-project.org>
Message-ID: <20131025093447.GA20219@ti.com>
MIME-Version: 1.0
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: [PATCH 2/5] multimedia: GStreamer base plugins
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
X-List-Received-Date: Fri, 25 Oct 2013 09:34:51 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

Signed-off-by: Mrinmayee Hingolikar <mrinmayee@ti.com>
---
 .../gstreamer/gst-plugins-base_0.10.36.bbappend    |   22 ++++++++++++++++++++
 1 file changed, 22 insertions(+)
 create mode 100644 meta-arago-extras/recipes-multimedia/gstreamer/gst-plugins-base_0.10.36.bbappend

diff --git a/meta-arago-extras/recipes-multimedia/gstreamer/gst-plugins-base_0.10.36.bbappend b/meta-arago-extras/recipes-multimedia/gstreamer/gst-plugins-base_0.10.36.bbappend
new file mode 100644
index 0000000..734ef6d
--- /dev/null
+++ b/meta-arago-extras/recipes-multimedia/gstreamer/gst-plugins-base_0.10.36.bbappend
@@ -0,0 +1,22 @@
+SRC_URI = "git://git.ti.com/glsdk/gst-plugins-base0-10.git;protocol=git"
+SRCREV = "21305017f6095ad6e9b1a8f1006ee5be780b21f8"
+
+LICENSE = "GPLv2"
+LIC_FILES_CHKSUM = "file://COPYING;md5=0636e73ff0215e8d672dc4c32c317bb3"
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
+EXTRA_OECONF +="--disable-ivorbis "
+
+FILES_${PN} += "\
+                ${libdir}/*.so \
+                ${libdir}/gstreamer-0.10/*"
-- 
1.7.9.5


