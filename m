Return-Path: <fcooperjr27@gmail.com>
Received: from mail-ob0-f179.google.com (mail-ob0-f179.google.com
	[209.85.214.179])
	by arago-project.org (Postfix) with ESMTPS id 00CB95208C
	for <meta-arago@arago-project.org>;
	Mon,  5 Nov 2012 01:54:14 +0000 (UTC)
Received: by mail-ob0-f179.google.com with SMTP id lz20so4802582obb.38
	for <meta-arago@arago-project.org>;
	Sun, 04 Nov 2012 17:54:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	bh=0ma7eQwr3Mb/DgU5lW6vp9zrWJNALutufo8EmFEE+P4=;
	b=OJRSax3b3g1ayAOdE+Ppo+e760w0bo4zM/PE4XJz4bXYpi/ktq6UAPDHaQGGFa4swq
	RWsWeWM4wgfzA4Su0EvhxgVb6AAYIHDEEsR/EHnuAaKhZvDI9AE3c5pDddEd4YJEyjap
	3pMBELG60+m4dTP/xBONaopnWF22F93KuarQeJosufy6wLutRxqp8VaBBKcJDCylkI9A
	Tu/2nNtCQpltQxTkUXPO2Bx26lJhw0sV15p4gxYhobq+CK9IC6A+hgVFIYEKBET25Kb7
	VhVcCGiKiPAdHGZh0liALinzqBv3noAhJhbSjo93P1XjnYtOVuOCwFf3Nu+T8H0J5Fwx
	hysQ==
Received: by 10.60.27.161 with SMTP id u1mr1523708oeg.27.1352080454711;
	Sun, 04 Nov 2012 17:54:14 -0800 (PST)
Received: from localhost.localdomain (dragon.ti.com. [192.94.94.33])
	by mx.google.com with ESMTPS id v6sm12820300oeh.13.2012.11.04.17.54.13
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sun, 04 Nov 2012 17:54:14 -0800 (PST)
From: "Franklin S. Cooper Jr" <fcooperjr27@gmail.com>
To: meta-arago@arago-project.org
Date: Sun,  4 Nov 2012 19:53:19 -0600
Message-Id: <1352080417-9792-22-git-send-email-fcooper@ti.com>
X-Mailer: git-send-email 1.7.0.4
In-Reply-To: <1352080417-9792-1-git-send-email-fcooper@ti.com>
References: <1352080417-9792-1-git-send-email-fcooper@ti.com>
Cc: "Franklin S. Cooper Jr" <fcooper@ti.com>
Subject: [PATCH 24/42] gst-ffmpeg: Select a non GPLv3 license
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
X-List-Received-Date: Mon, 05 Nov 2012 01:54:15 -0000

* Gst-ffmpeg has two license selection options. Selecting non GPLv3 license.

Signed-off-by: Franklin S. Cooper Jr <fcooper@ti.com>
---
 .../gst-ffmpeg/gst-ffmpeg_0.10.13.bbappend         |    5 +++++
 1 files changed, 5 insertions(+), 0 deletions(-)
 create mode 100644 meta-arago-distro/recipes-multimedia/gst-ffmpeg/gst-ffmpeg_0.10.13.bbappend

diff --git a/meta-arago-distro/recipes-multimedia/gst-ffmpeg/gst-ffmpeg_0.10.13.bbappend b/meta-arago-distro/recipes-multimedia/gst-ffmpeg/gst-ffmpeg_0.10.13.bbappend
new file mode 100644
index 0000000..ca5a52a
--- /dev/null
+++ b/meta-arago-distro/recipes-multimedia/gst-ffmpeg/gst-ffmpeg_0.10.13.bbappend
@@ -0,0 +1,5 @@
+PR_append = "-arago0"
+
+# Select the non GPLv3 license option for distribution of this plugin with our
+# SDK
+LICENSE = "GPLv2+ & LGPLv2+ & (GPLv2+ & LGPLv2.1+)"
-- 
1.7.0.4


