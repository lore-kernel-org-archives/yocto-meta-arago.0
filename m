Return-Path: <mrinmayee@ti.com>
Received: from arroyo.ext.ti.com (arroyo.ext.ti.com [192.94.94.40])
	by arago-project.org (Postfix) with ESMTPS id 2BAA452A69
	for <meta-arago@arago-project.org>;
	Fri, 25 Oct 2013 09:34:28 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by arroyo.ext.ti.com (8.13.7/8.13.7) with ESMTP id r9P9YRcB030706
	for <meta-arago@arago-project.org>; Fri, 25 Oct 2013 04:34:27 -0500
Received: from DFLE72.ent.ti.com (dfle72.ent.ti.com [128.247.5.109])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id r9P9YRA1030271
	for <meta-arago@arago-project.org>; Fri, 25 Oct 2013 04:34:27 -0500
Received: from dflp33.itg.ti.com (10.64.6.16) by DFLE72.ent.ti.com
	(128.247.5.109) with Microsoft SMTP Server id 14.2.342.3;
	Fri, 25 Oct 2013 04:34:27 -0500
Received: from ti.com (ileax41-snat.itg.ti.com [10.172.224.153])	by
	dflp33.itg.ti.com (8.14.3/8.13.8) with ESMTP id r9P9YPOY024775	for
	<meta-arago@arago-project.org>; Fri, 25 Oct 2013 04:34:26 -0500
Date: Fri, 25 Oct 2013 15:04:25 +0530
From: Mrinmayee Hingolikar <mrinmayee@ti.com>
To: <meta-arago@arago-project.org>
Message-ID: <20131025093425.GA20192@ti.com>
MIME-Version: 1.0
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: [PATCH 1/5] multimedia: Add GStreamer multimedia framework.
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
X-List-Received-Date: Fri, 25 Oct 2013 09:34:28 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

This is based on the 0.10.36 version of the GStreamer from Freedesktop.

Signed-off-by: Mrinmayee Hingolikar <mrinmayee@ti.com>
---
 .../gstreamer/gstreamer_0.10.36.bbappend           |   16 ++++++++++++++++
 1 file changed, 16 insertions(+)
 create mode 100644 meta-arago-extras/recipes-multimedia/gstreamer/gstreamer_0.10.36.bbappend

diff --git a/meta-arago-extras/recipes-multimedia/gstreamer/gstreamer_0.10.36.bbappend b/meta-arago-extras/recipes-multimedia/gstreamer/gstreamer_0.10.36.bbappend
new file mode 100644
index 0000000..c8598f8
--- /dev/null
+++ b/meta-arago-extras/recipes-multimedia/gstreamer/gstreamer_0.10.36.bbappend
@@ -0,0 +1,16 @@
+SRC_URI = "git://git.ti.com/glsdk/gstreamer0-10.git;protocol=git"
+SRCREV = "e505f4a2ceee3b0328eb2efddb9ec1281d3fd60a"
+
+LICENSE = "GPLv2"
+LIC_FILES_CHKSUM = "file://COPYING;md5=55ca817ccb7d5b5b66355690e9abc605"
+
+COMPATIBLE_MACHINE = "omap-a15"
+
+PR = "r0"
+
+S = "${WORKDIR}/git"
+
+do_configure_prepend() {
+	git submodule init && git submodule update
+	autopoint -f
+}
-- 
1.7.9.5


