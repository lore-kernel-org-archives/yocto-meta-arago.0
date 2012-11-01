Return-Path: <fcooperjr27@gmail.com>
Received: from mail-ob0-f179.google.com (mail-ob0-f179.google.com
	[209.85.214.179])
	by arago-project.org (Postfix) with ESMTPS id E13DA529A5
	for <meta-arago@arago-project.org>;
	Thu,  1 Nov 2012 18:45:45 +0000 (UTC)
Received: by mail-ob0-f179.google.com with SMTP id lz20so2635972obb.38
	for <meta-arago@arago-project.org>;
	Thu, 01 Nov 2012 11:45:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer;
	bh=8lFNVaegeJgVMt/jUmbLe96f7DjNGnELmHJKrZp2UOY=;
	b=P/G8NHevEertZWyw/vGPTFTpTI475hphBto/zQwUMvZqg0u9EoysMcAp7rNXQeTBk8
	cwdOii2+mZTV069YzbuwUvGIAldjfKZgQ7irSR3J+uz4jUuPQa84sLqJgtMW9CJj+qaz
	vzxOe6O9agLXeiiEeQEqXkg5m1nR1jkTOwwNgl0avBAzxNOzVczZDVs9dYRPTUhJAhtI
	0J2JkYcM3dwzAL0emBP5mhAnThQRX/NJgrR39d8m3t6Qj0sPMV32vyt0AhO9bS/Q1VKj
	DUXekr5IymDpxS9sDF8cugpsCCPVhyuL+E5UEdZQ3L7gLHqoB0J5IF/zL1mjivvpUgt6
	h02A==
Received: by 10.60.32.243 with SMTP id m19mr36235922oei.21.1351795545688;
	Thu, 01 Nov 2012 11:45:45 -0700 (PDT)
Received: from localhost.localdomain (dragon.ti.com. [192.94.94.33])
	by mx.google.com with ESMTPS id b5sm6964789obd.18.2012.11.01.11.45.44
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 01 Nov 2012 11:45:45 -0700 (PDT)
From: "Franklin S. Cooper Jr" <fcooperjr27@gmail.com>
To: meta-arago@arago-project.org
Date: Thu,  1 Nov 2012 13:45:42 -0500
Message-Id: <1351795542-5398-1-git-send-email-fcooper@ti.com>
X-Mailer: git-send-email 1.7.0.4
Cc: "Franklin S. Cooper Jr" <fcooper@ti.com>
Subject: [PATCH] qt4-tools-nativesdk: Select LGPLv2.1 license
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
X-List-Received-Date: Thu, 01 Nov 2012 18:45:46 -0000

* Qt/E gives a choice of LGPLv2.1 or GPLv3. Selecting the LGPLv2.1 license.

Signed-off-by: Franklin S. Cooper Jr <fcooper@ti.com>
---
 .../qt4/qt4-tools-nativesdk_4.8.0.bbappend         |    6 +++++-
 1 files changed, 5 insertions(+), 1 deletions(-)

diff --git a/meta-arago-distro/recipes-qt/qt4/qt4-tools-nativesdk_4.8.0.bbappend b/meta-arago-distro/recipes-qt/qt4/qt4-tools-nativesdk_4.8.0.bbappend
index f40b683..2c50d35 100644
--- a/meta-arago-distro/recipes-qt/qt4/qt4-tools-nativesdk_4.8.0.bbappend
+++ b/meta-arago-distro/recipes-qt/qt4/qt4-tools-nativesdk_4.8.0.bbappend
@@ -1,3 +1,7 @@
-PR_append = "-arago0"
+PR_append = "-arago1"
+
+# Qt/E from Nokia is dual-licensed (LGPLv2.1 or GPLv3)
+# For our distribution purposes we only use LGPLv2.1
+LICENSE = "LGPLv2.1"
 
 DEPENDS := "${@oe_filter_out('libx11-nativesdk', '${DEPENDS}', d)}"
-- 
1.7.0.4


