Return-Path: <fcooperjr27@gmail.com>
Received: from mail-ob0-f179.google.com (mail-ob0-f179.google.com
	[209.85.214.179])
	by arago-project.org (Postfix) with ESMTPS id B5A5952A99
	for <meta-arago@arago-project.org>;
	Fri,  5 Oct 2012 06:26:59 +0000 (UTC)
Received: by mail-ob0-f179.google.com with SMTP id lz20so1305447obb.38
	for <meta-arago@arago-project.org>;
	Thu, 04 Oct 2012 23:26:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer;
	bh=tBGoU+U9rOueKcbbUmRpDJsHWe6R+OQgYXjjS48dL10=;
	b=qrPZW05rIAdADz9vyuJ7ufMESni4FNbV2J/od7pVTQ1DtWxOxsv/MwYjOceFhnN6qQ
	aHYKXoZkm35SBSOferfDy7NJ1QhrM+5iP+kX8gN0wO14HurwqxeLqofWYmmulq+u70Hu
	euCRc4lGkjiSx2aqsrrQtlxcb3ISAX2fs2KXnv1cluuuvTAnST/dv2rIcmqkStXK4mdJ
	XpRwo3dmFkcYet7gwRWj2r5TwVDEVu/Ersxyb00MWGQbs+US8gpyK/r3VLcUXX/RFgHR
	hpWfQaSyZ1bt92VQalCRPIunhvhFGvoguaVufNLQml6puOR9VvHfkRF0pWt7q/+VbH13
	iMOg==
Received: by 10.60.19.37 with SMTP id b5mr6550589oee.16.1349418419093;
	Thu, 04 Oct 2012 23:26:59 -0700 (PDT)
Received: from localhost.localdomain (dragon.ti.com. [192.94.94.33])
	by mx.google.com with ESMTPS id x1sm6801401oef.8.2012.10.04.23.26.58
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 04 Oct 2012 23:26:58 -0700 (PDT)
From: "Franklin S. Cooper Jr" <fcooperjr27@gmail.com>
To: meta-arago@arago-project.org
Date: Fri,  5 Oct 2012 01:55:20 -0500
Message-Id: <1349420120-22075-1-git-send-email-fcooper@ti.com>
X-Mailer: git-send-email 1.7.0.4
Subject: [PATCH] gst-plugins-good: Remove gtk dependency
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
X-List-Received-Date: Fri, 05 Oct 2012 06:27:00 -0000

* This mimics the patch "gst-plugins-good: disable (uninstalled) examples"
  that has been applied to oe-core master branch. This patch can be removed
  once the patch mentioned above has been applied to the denzil branch.

Signed-off-by: Franklin S. Cooper Jr <fcooper@ti.com>
---
 .../gstreamer/gst-plugins-good_0.10.31.bbappend    |   12 ++++++++++++
 1 files changed, 12 insertions(+), 0 deletions(-)
 create mode 100644 meta-arago-distro/recipes-multimedia/gstreamer/gst-plugins-good_0.10.31.bbappend

diff --git a/meta-arago-distro/recipes-multimedia/gstreamer/gst-plugins-good_0.10.31.bbappend b/meta-arago-distro/recipes-multimedia/gstreamer/gst-plugins-good_0.10.31.bbappend
new file mode 100644
index 0000000..6f2a76c
--- /dev/null
+++ b/meta-arago-distro/recipes-multimedia/gstreamer/gst-plugins-good_0.10.31.bbappend
@@ -0,0 +1,12 @@
+PR_append = "-arago0"
+
+# The below changes are meant to mimic the patch
+# "gst-plugins-good: disable (uninstalled) examples" commit
+# eef5cca4f364545759d8cf624f38e3cd6e8fd295 The patch mentioned above has
+# already been applied to master and has been requested to be pulled into
+# denzil. The below changes can be removed once that patch has been applied
+# to the denzil branch
+
+DEPENDS := "${@oe_filter_out('gtk+','${DEPENDS}', d)}"
+
+EXTRA_OECONF += "--disable-examples"
-- 
1.7.0.4


