Return-Path: <fcooperjr27@gmail.com>
Received: from mail-ob0-f179.google.com (mail-ob0-f179.google.com
	[209.85.214.179])
	by arago-project.org (Postfix) with ESMTPS id BA160529B9
	for <meta-arago@arago-project.org>;
	Wed,  5 Sep 2012 21:16:15 +0000 (UTC)
Received: by obbeh20 with SMTP id eh20so1118711obb.38
	for <meta-arago@arago-project.org>;
	Wed, 05 Sep 2012 14:16:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer;
	bh=YN+DvptRRJ84rpzAdF8WO8VNK8oGTP//VagljCv3yV8=;
	b=TDwsXG/0JLDZkeKOA34PloqQmfb7jTQ0+XxtapPh2EoPpuR7mp6qFtTfi9NgKeabXK
	030ASoIFBl2OncSTho5j5N+xB+6gUlto41GU7k+0webxkw/buEIkUh8jTYCwhYKqh7F5
	obu8cA0pqCyEmEwrycBypyJ5sfDBOkrZBmwfNdATK/Z2u8ZpGH3q3jiGYXgpBFhAbbCn
	sKB7Qxgs/4dstnWCp1FTtd5jIso1h6as+Guz7DS5PDeZQvVLuqhBYHC4F3cM3a4oKRFy
	9d1h7+Re4ZnfUt+Wmsg4m20wk0kDGImZQRAiSmifq8NCrJ+JbIIA+FLD5Lgt+ieelELM
	QZBQ==
Received: by 10.182.177.7 with SMTP id cm7mr18204931obc.17.1346879774708;
	Wed, 05 Sep 2012 14:16:14 -0700 (PDT)
Received: from localhost.localdomain (dragon.ti.com. [192.94.94.33])
	by mx.google.com with ESMTPS id hz6sm118726obb.1.2012.09.05.14.16.12
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 05 Sep 2012 14:16:13 -0700 (PDT)
From: "Franklin S. Cooper Jr" <fcooperjr27@gmail.com>
To: meta-arago@arago-project.org
Date: Wed,  5 Sep 2012 16:33:36 -0500
Message-Id: <1346880816-18125-1-git-send-email-fcooper27jr@gmail.com>
X-Mailer: git-send-email 1.7.0.4
Cc: "Franklin S. Cooper Jr" <fcooper27jr@gmail.com>
Subject: [meta-arago-distro][PATCH] task-arago-base: Add back devmem2 and tcpdump
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
X-List-Received-Date: Wed, 05 Sep 2012 21:16:16 -0000

* meta-oe is now a required layer for meta-arago. Add back devmem2
  and tcpdump.

Signed-off-by: Franklin S. Cooper Jr <fcooper27jr@gmail.com>
---
 .../recipes-core/tasks/task-arago-base.bb          |    8 ++------
 1 files changed, 2 insertions(+), 6 deletions(-)

diff --git a/meta-arago-distro/recipes-core/tasks/task-arago-base.bb b/meta-arago-distro/recipes-core/tasks/task-arago-base.bb
index aca86c4..e7de773 100644
--- a/meta-arago-distro/recipes-core/tasks/task-arago-base.bb
+++ b/meta-arago-distro/recipes-core/tasks/task-arago-base.bb
@@ -1,7 +1,7 @@
 DESCRIPTION = "Basic task to get a device booting"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://${COREBASE}/meta/COPYING.MIT;md5=3da9cfbcb788c80a0384361b4de20420"
-PR = "r0"
+PR = "r1"
 
 inherit task
 
@@ -15,12 +15,8 @@ ARAGO_BASE = "\
     mtd-utils \
     curl \
     initscript-telnetd \
-    ethtool \
-    "
-
-# these require meta-openembedded/meta-oe layer
-ARAGO_EXTRA = "\
     devmem2 \
+    ethtool \
     tcpdump \
     "
 
-- 
1.7.0.4


