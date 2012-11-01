Return-Path: <fcooperjr27@gmail.com>
Received: from mail-ob0-f179.google.com (mail-ob0-f179.google.com
	[209.85.214.179])
	by arago-project.org (Postfix) with ESMTPS id A0B10529A5
	for <meta-arago@arago-project.org>;
	Thu,  1 Nov 2012 18:45:17 +0000 (UTC)
Received: by mail-ob0-f179.google.com with SMTP id lz20so2635972obb.38
	for <meta-arago@arago-project.org>;
	Thu, 01 Nov 2012 11:45:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer;
	bh=0ma7eQwr3Mb/DgU5lW6vp9zrWJNALutufo8EmFEE+P4=;
	b=goJK/cPxmmXjnJfdNiSkHiVrYJfKKW+UpmvLgdQSUKX2zeRcyEgU3NpSRLMzel+M/7
	MxHkn6RjLFaOUwfqRumbH0+JjTDGm3F+0FETFwFE5/HXcVKWk1xEKf+STbR62YfwATRY
	g1Dj32Xg2lcis2up9wFwgJ6D0ln6atCaKe81HD4Mmd0ZNAn+REmWWhxcYVJThiTd2I5W
	HFtkbkjqQnwOra1sZyA8ysxi4UM6o3bqkOXM4GsPIYxeVogy/DjUMf503h1AK3w2QAMp
	ADUQal4OQUFMPvqJ5yS9JcfDRopOgHCYjJtDuJ0PLYppTO2wkdVEFObzSKsSarheP6+q
	CwwQ==
Received: by 10.60.11.105 with SMTP id p9mr30891454oeb.128.1351795517129;
	Thu, 01 Nov 2012 11:45:17 -0700 (PDT)
Received: from localhost.localdomain (dragon.ti.com. [192.94.94.33])
	by mx.google.com with ESMTPS id v6sm5456636oeh.13.2012.11.01.11.45.16
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 01 Nov 2012 11:45:16 -0700 (PDT)
From: "Franklin S. Cooper Jr" <fcooperjr27@gmail.com>
To: meta-arago@arago-project.org
Date: Thu,  1 Nov 2012 13:45:13 -0500
Message-Id: <1351795513-5333-1-git-send-email-fcooper@ti.com>
X-Mailer: git-send-email 1.7.0.4
Cc: "Franklin S. Cooper Jr" <fcooper@ti.com>
Subject: [PATCH] gst-ffmpeg: Select a non GPLv3 license
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
X-List-Received-Date: Thu, 01 Nov 2012 18:45:17 -0000

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


