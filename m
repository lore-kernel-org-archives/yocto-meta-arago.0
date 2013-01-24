Return-Path: <fcooperjr27@gmail.com>
Received: from mail-ob0-f180.google.com (mail-ob0-f180.google.com
	[209.85.214.180])
	by arago-project.org (Postfix) with ESMTPS id 8CBC752A57
	for <meta-arago@arago-project.org>;
	Thu, 24 Jan 2013 14:21:34 +0000 (UTC)
Received: by mail-ob0-f180.google.com with SMTP id wd20so9756667obb.11
	for <meta-arago@arago-project.org>;
	Thu, 24 Jan 2013 06:21:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:from:to:cc:subject:date:message-id:x-mailer:in-reply-to
	:references; bh=7Sn5YVfJKmXeVKHicxer/Y518r6ZX6NHwMTYsdoifJY=;
	b=bdgKDRTpnHXT0IvB40xycKwyvaCa0Axar5PNwCP/SEc5hmibsZ7g3VLS7oMlPXgD3T
	3gLUFif9+gDdseMzKVzbbXXulfvMNuvxD85lrkF5233DkiZZXKpQbsj0+yQH6FQMZ64U
	NSYdFYMDVY78FxIlAFGEVIHbxNhH68beBXyyXgxKi+8CkRdyCdg9Jmvb0wa8fbLqHvY8
	Csnf5Kbo19gEvH0x/Zrz/rsLACDy4we4BQJ37fsZn8DjKhTwwONcUBZWIHtiqbD3Ocis
	IAocHqVPgW2cmp3uv7KkXHeXn4jeO8Ypeec0rGHwIwsXSVgLkAeT7nNBD0ZCOq51sZnr
	UDWA==
X-Received: by 10.60.0.136 with SMTP id 8mr1586654oee.35.1359037293884;
	Thu, 24 Jan 2013 06:21:33 -0800 (PST)
Received: from localhost.localdomain (dragon.ti.com. [192.94.94.33])
	by mx.google.com with ESMTPS id yn8sm18069853obb.12.2013.01.24.06.21.32
	(version=TLSv1 cipher=RC4-SHA bits=128/128);
	Thu, 24 Jan 2013 06:21:32 -0800 (PST)
From: "Franklin S. Cooper Jr" <fcooperjr27@gmail.com>
To: meta-arago@arago-project.org
Date: Thu, 24 Jan 2013 08:21:08 -0600
Message-Id: <1359037281-12610-3-git-send-email-fcooper@ti.com>
X-Mailer: git-send-email 1.7.0.4
In-Reply-To: <1359037281-12610-1-git-send-email-fcooper@ti.com>
References: <1359037281-12610-1-git-send-email-fcooper@ti.com>
Cc: "Franklin S. Cooper Jr" <fcooper@ti.com>
Subject: [PATCH 34/47] gst-plugins-bad: Disable any feature based on mpeg2 or mp3
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
X-List-Received-Date: Thu, 24 Jan 2013 14:21:34 -0000

Signed-off-by: Franklin S. Cooper Jr <fcooper@ti.com>
---
 .../gstreamer/gst-plugins-bad_0.10.23.bbappend     |    8 +++++++-
 1 files changed, 7 insertions(+), 1 deletions(-)

diff --git a/meta-arago-distro/recipes-multimedia/gstreamer/gst-plugins-bad_0.10.23.bbappend b/meta-arago-distro/recipes-multimedia/gstreamer/gst-plugins-bad_0.10.23.bbappend
index 8b1e588..8ae8050 100644
--- a/meta-arago-distro/recipes-multimedia/gstreamer/gst-plugins-bad_0.10.23.bbappend
+++ b/meta-arago-distro/recipes-multimedia/gstreamer/gst-plugins-bad_0.10.23.bbappend
@@ -1,4 +1,4 @@
-PR_append = "-arago2"
+PR_append = "-arago3"
 
 # look for files in this layer first
 FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"
@@ -16,3 +16,9 @@ SRC_URI += "file://0001-gstfbdevsink-Fix-depth-value-for-GST_VIDEO_CAPS_RGB_.pat
 # Add faad has a dependency to insure gst-plugins-bad-faad is built.
 DEPENDS += "faad2"
 RDEPENDS_${PN}-faad += "libfaad"
+
+# Disable features that have potential commercial licensing restrictions
+EXTRA_OECONF += "\
+    --disable-mpeg2enc \
+    --disable-acm \
+"
-- 
1.7.0.4


