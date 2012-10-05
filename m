Return-Path: <fcooperjr27@gmail.com>
Received: from mail-ob0-f179.google.com (mail-ob0-f179.google.com
	[209.85.214.179])
	by arago-project.org (Postfix) with ESMTPS id 6F536529D2
	for <meta-arago@arago-project.org>;
	Fri,  5 Oct 2012 06:27:55 +0000 (UTC)
Received: by mail-ob0-f179.google.com with SMTP id lz20so1305884obb.38
	for <meta-arago@arago-project.org>;
	Thu, 04 Oct 2012 23:27:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer;
	bh=fovADAoswPn9hrVhk1P9+6mZd50GKEOlUnZEjtfnkXo=;
	b=WxczC/ZreLIHUKnJeXSGQCAQWlBSOd2U6nfXy20mS8PLPzk9RZGY5LUX5KfkAHEp4B
	cWajP2KgQ/fw8xEeeTB21ifw8xy3w9AAa8EMquuoMXnljgA4z81+c50gzvsLADxl721t
	13aU1oUkaI6N46gEpsYKZgU9bN3x1Cttc7eB5r67Qivw9hbf6ahSGUBB0WR0ezi9hRaq
	7xwfnEIg4myiJY4N84ocTNhA3mAsyhHUQcfn35X372XJgcn8i4LxTkoWcqq1jUN0DuiA
	F3RAaeEcXfGC3oZHanHa+ko8eo7Wgk/6leWYmpQ7ukUWI7dr/4RVazJdqTRPLlghBW7L
	QQfw==
Received: by 10.182.147.8 with SMTP id tg8mr6517106obb.21.1349418474932;
	Thu, 04 Oct 2012 23:27:54 -0700 (PDT)
Received: from localhost.localdomain (dragon.ti.com. [192.94.94.33])
	by mx.google.com with ESMTPS id ea6sm8734401obc.9.2012.10.04.23.27.54
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 04 Oct 2012 23:27:54 -0700 (PDT)
From: "Franklin S. Cooper Jr" <fcooperjr27@gmail.com>
To: meta-arago@arago-project.org
Date: Fri,  5 Oct 2012 01:56:15 -0500
Message-Id: <1349420175-22159-1-git-send-email-fcooper@ti.com>
X-Mailer: git-send-email 1.7.0.4
Subject: [PATCH] gst-plugins-bad: Remove gtk+ dependencys
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
X-List-Received-Date: Fri, 05 Oct 2012 06:27:55 -0000

* Disable rsvg and remove dependency to prevent gtk+ from being pulled in.
* Remove the --with-plugins list to ensure all plugins are built.

Signed-off-by: Franklin S. Cooper Jr <fcooper@ti.com>
---
 .../gstreamer/gst-plugins-bad_0.10.23.bbappend     |    8 ++++++++
 1 files changed, 8 insertions(+), 0 deletions(-)
 create mode 100644 meta-arago-distro/recipes-multimedia/gstreamer/gst-plugins-bad_0.10.23.bbappend

diff --git a/meta-arago-distro/recipes-multimedia/gstreamer/gst-plugins-bad_0.10.23.bbappend b/meta-arago-distro/recipes-multimedia/gstreamer/gst-plugins-bad_0.10.23.bbappend
new file mode 100644
index 0000000..52739e4
--- /dev/null
+++ b/meta-arago-distro/recipes-multimedia/gstreamer/gst-plugins-bad_0.10.23.bbappend
@@ -0,0 +1,8 @@
+PR_append = "-arago0"
+
+# Disable rsvg which caused gtk+ to be pulled in
+DEPENDS := "${@oe_filter_out('librsvg','${DEPENDS}', d)}"
+EXTRA_OECONF += "--disable-rsvg"
+
+# Build all the various plugins
+EXTRA_OECONF := "${@oe_filter_out('--with-plugins=musicbrainz,wavpack,ivorbis,mpegvideoparse','${EXTRA_OECONF}', d)}"
-- 
1.7.0.4


