Return-Path: <fcooperjr27@gmail.com>
Received: from mail-oa0-f51.google.com (mail-oa0-f51.google.com
	[209.85.219.51])
	by arago-project.org (Postfix) with ESMTPS id C16C452A00
	for <meta-arago@arago-project.org>;
	Fri,  5 Oct 2012 21:07:13 +0000 (UTC)
Received: by mail-oa0-f51.google.com with SMTP id n12so2060239oag.38
	for <meta-arago@arago-project.org>;
	Fri, 05 Oct 2012 14:07:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer;
	bh=8ojttpWoOwyXo1/9lvWlKwR5F+MolOAM/eHqCJrDLV4=;
	b=cVgZJzXiSQDU4TnTTM4QKoZGUtdrDXR1eK7Tqs6OWSYNAtANsfN5fqqQx6knlKUBCc
	LBxyHRjW/Sw3BEXDuqct/DhzB+wUlQoOKF6nk22LK9OJiE9NyFhrDLqjaaAdxeJRpXXa
	0Oi8AY8HsM0EXIgv+9wCJbGuwk3Yh2YzZoqf51ng/qm1sG5UPQWI6074FDtaLe6mVh7b
	3/gp0Qb1o4efsqAj1dGWyesdPXU3GPswKNxDG+UGQ2xAXrtWhYTBEjcwFQH7vHUFpYrw
	Qd1AbZiNpGx2gIgfg02XleK7+JK2wAA7510o9qotZRlONw2oc2HY89S5zOLNq5ZDsoUQ
	IpfQ==
Received: by 10.60.172.201 with SMTP id be9mr7962670oec.141.1349471232979;
	Fri, 05 Oct 2012 14:07:12 -0700 (PDT)
Received: from localhost.localdomain (dragon.ti.com. [192.94.94.33])
	by mx.google.com with ESMTPS id hz6sm10435809obb.1.2012.10.05.14.07.11
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 05 Oct 2012 14:07:12 -0700 (PDT)
From: "Franklin S. Cooper Jr" <fcooperjr27@gmail.com>
To: meta-arago@arago-project.org
Date: Fri,  5 Oct 2012 16:35:44 -0500
Message-Id: <1349472944-1681-1-git-send-email-fcooper@ti.com>
X-Mailer: git-send-email 1.7.0.4
Subject: [PATCH v2] gst-plugins-bad: Remove gtk+ dependencys
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
X-List-Received-Date: Fri, 05 Oct 2012 21:07:14 -0000

* Disable rsvg and remove dependency to prevent gtk+ from being pulled in.
* Remove the --with-plugins list to ensure all plugins are built. Previously
  fbdevsink was not being built which is needed by the gstreamer demos in the
  SDK.

Signed-off-by: Franklin S. Cooper Jr <fcooper@ti.com>
---
Version 2 changes:
Add additional detailed comments to the recipe and commit message.

 .../gstreamer/gst-plugins-bad_0.10.23.bbappend     |    9 +++++++++
 1 files changed, 9 insertions(+), 0 deletions(-)
 create mode 100644 meta-arago-distro/recipes-multimedia/gstreamer/gst-plugins-bad_0.10.23.bbappend

diff --git a/meta-arago-distro/recipes-multimedia/gstreamer/gst-plugins-bad_0.10.23.bbappend b/meta-arago-distro/recipes-multimedia/gstreamer/gst-plugins-bad_0.10.23.bbappend
new file mode 100644
index 0000000..74c822c
--- /dev/null
+++ b/meta-arago-distro/recipes-multimedia/gstreamer/gst-plugins-bad_0.10.23.bbappend
@@ -0,0 +1,9 @@
+PR_append = "-arago0"
+
+# Disable rsvg which caused gtk+ to be pulled in
+DEPENDS := "${@oe_filter_out('librsvg','${DEPENDS}', d)}"
+EXTRA_OECONF += "--disable-rsvg"
+
+# Remove the restriction of which plugins are built. Previously fbdevsink
+# was not built which is needed by the gstreamer demos included in the SDK.
+EXTRA_OECONF := "${@oe_filter_out('--with-plugins=musicbrainz,wavpack,ivorbis,mpegvideoparse','${EXTRA_OECONF}', d)}"
-- 
1.7.0.4


