Return-Path: <fcooperjr27@gmail.com>
Received: from mail-ob0-f179.google.com (mail-ob0-f179.google.com
	[209.85.214.179])
	by arago-project.org (Postfix) with ESMTPS id D2196529A5
	for <meta-arago@arago-project.org>;
	Thu,  1 Nov 2012 18:46:59 +0000 (UTC)
Received: by mail-ob0-f179.google.com with SMTP id lz20so2638100obb.38
	for <meta-arago@arago-project.org>;
	Thu, 01 Nov 2012 11:46:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer;
	bh=T5B1nGtV+cZIk+D/UBMolUL7xkTsKgY1qhxLSNePyb8=;
	b=GVcz/oW+8UvBKVVv9tLq4KG8JE7z1bF7EMJ0k+MuHoi7nyPO1PdJPWCiXUGAOL7OnK
	YqtxzKzQw8ytGa0oT9V4ESER8Rrs62pz41iV1WFg9lDJTi/dieMWhPTAQRQenaTM8R/x
	4GIO3rpWDYsA8oh0H1mXguvnigiht/46IXamR2+0Wk2r5hIPB8v9jYgYDQYYjLxFx+np
	BkPnZ9GMKOCscwpKIKe1maB3BNul0ksTsDsqXv4nBXKDvskCtM2xGbbx4ipomrY3TuTg
	1U+t+p00mALFcVdnkGKOOHCWnglhqi+GeMWxwBq7fvPVcQWhYQBaXate10bYloPW391L
	Xuwg==
Received: by 10.60.172.171 with SMTP id bd11mr36304335oec.4.1351795619313;
	Thu, 01 Nov 2012 11:46:59 -0700 (PDT)
Received: from localhost.localdomain (dragon.ti.com. [192.94.94.33])
	by mx.google.com with ESMTPS id m8sm5472025oeb.3.2012.11.01.11.46.58
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 01 Nov 2012 11:46:58 -0700 (PDT)
From: "Franklin S. Cooper Jr" <fcooperjr27@gmail.com>
To: meta-arago@arago-project.org
Date: Thu,  1 Nov 2012 13:46:55 -0500
Message-Id: <1351795615-5639-1-git-send-email-fcooper@ti.com>
X-Mailer: git-send-email 1.7.0.4
Cc: "Franklin S. Cooper Jr" <fcooper@ti.com>
Subject: [PATCH] qt4-embedded: Introduce arago-qt4.inc file
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
X-List-Received-Date: Thu, 01 Nov 2012 18:47:00 -0000

* Some settings and patches are required for both qt4-embedded and
  qt4-embedded-gles. Splitting these common changes in a include file.

Signed-off-by: Franklin S. Cooper Jr <fcooper@ti.com>
---
 meta-arago-distro/recipes-qt/qt4/arago-qt4.inc     |    8 ++++++++
 .../recipes-qt/qt4/qt4-embedded_4.8.0.bbappend     |    6 ++----
 2 files changed, 10 insertions(+), 4 deletions(-)
 create mode 100644 meta-arago-distro/recipes-qt/qt4/arago-qt4.inc

diff --git a/meta-arago-distro/recipes-qt/qt4/arago-qt4.inc b/meta-arago-distro/recipes-qt/qt4/arago-qt4.inc
new file mode 100644
index 0000000..a447fa4
--- /dev/null
+++ b/meta-arago-distro/recipes-qt/qt4/arago-qt4.inc
@@ -0,0 +1,8 @@
+# Common file for patches or tweaks that are needed by qt4-embedded and
+# qt4-embedded-gles
+
+PR := "${PR}-arago1"
+
+# Qt/E from Nokia is dual-licensed (LGPLv2.1 or GPLv3)
+# For our distribution purposes we only use LGPLv2.1
+LICENSE = "LGPLv2.1"
diff --git a/meta-arago-distro/recipes-qt/qt4/qt4-embedded_4.8.0.bbappend b/meta-arago-distro/recipes-qt/qt4/qt4-embedded_4.8.0.bbappend
index 462a746..f9e5810 100644
--- a/meta-arago-distro/recipes-qt/qt4/qt4-embedded_4.8.0.bbappend
+++ b/meta-arago-distro/recipes-qt/qt4/qt4-embedded_4.8.0.bbappend
@@ -1,5 +1,3 @@
-# Qt/E from Nokia is dual-licensed (LGPLv2.1 or GPLv3)
-# For our distribution purposes we only use LGPLv2.1
-LICENSE = "LGPLv2.1"
+require arago-qt4.inc
 
-PR_append = "-arago1"
+PR := "${PR}.0"
-- 
1.7.0.4


