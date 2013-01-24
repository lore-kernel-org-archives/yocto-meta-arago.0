Return-Path: <fcooperjr27@gmail.com>
Received: from mail-oa0-f45.google.com (mail-oa0-f45.google.com
	[209.85.219.45])
	by arago-project.org (Postfix) with ESMTPS id BA2B252AA7
	for <meta-arago@arago-project.org>;
	Thu, 24 Jan 2013 14:21:41 +0000 (UTC)
Received: by mail-oa0-f45.google.com with SMTP id m1so236383oag.4
	for <meta-arago@arago-project.org>;
	Thu, 24 Jan 2013 06:21:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:from:to:cc:subject:date:message-id:x-mailer:in-reply-to
	:references; bh=0V8v7UnMbxxDNkWpkDv/FPjNVvcu6cSy+Uo7d2BrkY8=;
	b=sJATc7BabpPJ+4cubRvtIsi9hl68GaeeJjGE5ptWHQgNIcUTo6IG0I9mCHM7zrzr8g
	pX3nLqk3dvkydV1tRP4J2UEr5WVT16ta+OJ9RJAGb0sNS3F5yZOrs7Bn63Is/CO3w9Cq
	YUGJq/PBV/g7vvTs28I5abNqTX0My9NCMT8oCvKLZIl9Kg05JlKTUzqo6cdgIFwmbuHX
	f3WDLdkX6XRFwjIKX9LaPWNw7lSJdrp232pCmqYjo76EVi25bGrCc40bSCedzKhE7pIL
	OH3L4OIKGCiPYvtTJYYUG/1D+7IyNh6slpr6hs3z7Xvw5jbdBIR7WmfMq70OVjI3fg6c
	pRag==
X-Received: by 10.60.169.76 with SMTP id ac12mr1506017oec.137.1359037301201;
	Thu, 24 Jan 2013 06:21:41 -0800 (PST)
Received: from localhost.localdomain (dragon.ti.com. [192.94.94.33])
	by mx.google.com with ESMTPS id yn8sm18069853obb.12.2013.01.24.06.21.39
	(version=TLSv1 cipher=RC4-SHA bits=128/128);
	Thu, 24 Jan 2013 06:21:40 -0800 (PST)
From: "Franklin S. Cooper Jr" <fcooperjr27@gmail.com>
To: meta-arago@arago-project.org
Date: Thu, 24 Jan 2013 08:21:12 -0600
Message-Id: <1359037281-12610-7-git-send-email-fcooper@ti.com>
X-Mailer: git-send-email 1.7.0.4
In-Reply-To: <1359037281-12610-1-git-send-email-fcooper@ti.com>
References: <1359037281-12610-1-git-send-email-fcooper@ti.com>
Cc: "Franklin S. Cooper Jr" <fcooper@ti.com>
Subject: [PATCH 38/47] tisdk-rootfs-image: Build on top of arago-base-tisdk-image
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
X-List-Received-Date: Thu, 24 Jan 2013 14:21:41 -0000

* Tisdk-rootfs-image builds on top of arago-base-tisdk-image.
* Require arago-base-tisdk-image.bb instead of arago-image.inc

Signed-off-by: Franklin S. Cooper Jr <fcooper@ti.com>
---
 .../recipes-core/images/tisdk-rootfs-image.bb      |    5 +----
 1 files changed, 1 insertions(+), 4 deletions(-)

diff --git a/meta-arago-distro/recipes-core/images/tisdk-rootfs-image.bb b/meta-arago-distro/recipes-core/images/tisdk-rootfs-image.bb
index 368ee51..35236ff 100644
--- a/meta-arago-distro/recipes-core/images/tisdk-rootfs-image.bb
+++ b/meta-arago-distro/recipes-core/images/tisdk-rootfs-image.bb
@@ -1,13 +1,10 @@
 # Arago TI SDK filesystem image
 COMPATIBLE_MACHINE = "omap3|omapl138|ti33x"
 
-require arago-image.inc
+require arago-base-tisdk-image.bb
 
 IMAGE_INSTALL += "\
-    task-arago-base \
-    task-arago-console \
     task-arago-test \
-    task-arago-base-tisdk \
     task-arago-tisdk-graphics \
     task-arago-tisdk-qte \
     task-arago-tisdk-addons \
-- 
1.7.0.4


