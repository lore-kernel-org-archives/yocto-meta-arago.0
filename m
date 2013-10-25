Return-Path: <mrinmayee@ti.com>
Received: from bear.ext.ti.com (bear.ext.ti.com [192.94.94.41])
	by arago-project.org (Postfix) with ESMTPS id 7669352A7D
	for <meta-arago@arago-project.org>;
	Fri, 25 Oct 2013 09:35:42 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by bear.ext.ti.com (8.13.7/8.13.7) with ESMTP id r9P9ZfQk007053
	for <meta-arago@arago-project.org>; Fri, 25 Oct 2013 04:35:41 -0500
Received: from DLEE71.ent.ti.com (dlee71.ent.ti.com [157.170.170.114])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id r9P9ZfUf003116
	for <meta-arago@arago-project.org>; Fri, 25 Oct 2013 04:35:41 -0500
Received: from dlep33.itg.ti.com (157.170.170.75) by DLEE71.ent.ti.com
	(157.170.170.114) with Microsoft SMTP Server id 14.2.342.3;
	Fri, 25 Oct 2013 04:35:40 -0500
Received: from ti.com (ileax41-snat.itg.ti.com [10.172.224.153])	by
	dlep33.itg.ti.com (8.14.3/8.13.8) with ESMTP id r9P9ZdkX001387	for
	<meta-arago@arago-project.org>; Fri, 25 Oct 2013 04:35:40 -0500
Date: Fri, 25 Oct 2013 15:05:39 +0530
From: Mrinmayee Hingolikar <mrinmayee@ti.com>
To: <meta-arago@arago-project.org>
Message-ID: <20131025093539.GA20301@ti.com>
MIME-Version: 1.0
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: [PATCH 5/5] multimedia: GStreamer ugly plugins.
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
X-List-Received-Date: Fri, 25 Oct 2013 09:35:43 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

Adding a new recipe for 0.10.18 version of the ugly plugins.

Signed-off-by: Mrinmayee Hingolikar <mrinmayee@ti.com>
---
 .../gstreamer/gst-plugins-ugly_0.10.18.bb          |   23 ++++++++++++++++++++
 1 file changed, 23 insertions(+)
 create mode 100644 meta-arago-extras/recipes-multimedia/gstreamer/gst-plugins-ugly_0.10.18.bb

diff --git a/meta-arago-extras/recipes-multimedia/gstreamer/gst-plugins-ugly_0.10.18.bb b/meta-arago-extras/recipes-multimedia/gstreamer/gst-plugins-ugly_0.10.18.bb
new file mode 100644
index 0000000..a80a2db
--- /dev/null
+++ b/meta-arago-extras/recipes-multimedia/gstreamer/gst-plugins-ugly_0.10.18.bb
@@ -0,0 +1,23 @@
+require recipes-multimedia/gstreamer/gst-plugins.inc
+
+LICENSE = "GPLv2+ & LGPLv2.1+ & LGPLv2+"
+LICENSE_FLAGS = "commercial"
+LIC_FILES_CHKSUM = "file://COPYING;md5=a6f89e2100d9b6cdffcea4f398e37343"
+
+SRC_URI = "git://git.ti.com/glsdk/gst-plugins-ugly0-10.git;protocol=git"
+SRCREV = "863d08791774bdfb96ba4c0e46d0098f6a329c03"
+
+DEPENDS += "gst-plugins-base libid3tag libmad mpeg2dec liba52 lame"
+PR = "r0"
+
+S = "${WORKDIR}/git"
+
+inherit gettext
+
+do_configure() {
+     ./autogen.sh --host=arm-linux --disable-gtk-doc --with-libtool-sysroot=${STAGING_DIR_TARGET} --prefix=/usr 
+}
+
+FILES_${PN} += "\
+                ${libdir}/*.so \
+                ${libdir}/gstreamer-0.10/*"
-- 
1.7.9.5


