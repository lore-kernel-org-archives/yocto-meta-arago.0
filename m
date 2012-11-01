Return-Path: <fcooperjr27@gmail.com>
Received: from mail-oa0-f51.google.com (mail-oa0-f51.google.com
	[209.85.219.51])
	by arago-project.org (Postfix) with ESMTPS id C0F6B529B8
	for <meta-arago@arago-project.org>;
	Thu,  1 Nov 2012 18:38:52 +0000 (UTC)
Received: by mail-oa0-f51.google.com with SMTP id n12so2650442oag.38
	for <meta-arago@arago-project.org>;
	Thu, 01 Nov 2012 11:38:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer;
	bh=USY61uU8HVH6+R//wfNu7Ujwx8t9M7NtKkWkQltWhOA=;
	b=coPGzy8Eq0aUt9bPWrA/MiUM4Lf9ZxTU1zbXz4nzeZqCbtFDWs1Hbt/riWD172larK
	UchzD+VGDr1IqGfK1nUKmXuauPmqhIg1VUDApAoPXGxhe33QvSTlcXaBsQIdBxpOYnS3
	cdwHC9GcqSbkW0/e+rcu9XkvKuq4zqE3ZcgJXgu6qCHAu+LYujXwvOvG2cecN8kEXNHl
	pw2svip12ZbKSR/ZrBESb6r6wM0kEUtGojuFHIkAyToKbQAaMmmCMtp6d0wUkdUCnqUP
	nGKB84LqAlOdRdlz9LOA92bW3zNuBobEasmtjw8IK2pggkmvsyQJBNGtFYO2psJ8Am6d
	lkbQ==
Received: by 10.182.117.74 with SMTP id kc10mr33863301obb.63.1351795132590;
	Thu, 01 Nov 2012 11:38:52 -0700 (PDT)
Received: from localhost.localdomain (dragon.ti.com. [192.94.94.33])
	by mx.google.com with ESMTPS id a7sm6965325obw.6.2012.11.01.11.38.51
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 01 Nov 2012 11:38:51 -0700 (PDT)
From: "Franklin S. Cooper Jr" <fcooperjr27@gmail.com>
To: meta-arago@arago-project.org
Date: Thu,  1 Nov 2012 13:38:48 -0500
Message-Id: <1351795128-4661-1-git-send-email-fcooper@ti.com>
X-Mailer: git-send-email 1.7.0.4
Cc: "Franklin S. Cooper Jr" <fcooper@ti.com>
Subject: [PATCH] arago-amsdk-image: Add task-arago-tisdk-amsdk-sdk-host
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
X-List-Received-Date: Thu, 01 Nov 2012 18:38:53 -0000

* Add amsdk task which pulls in SDK specific scripts, files and applications.

Signed-off-by: Franklin S. Cooper Jr <fcooper@ti.com>
---
 .../recipes-core/images/arago-amsdk-image.bb       |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/meta-arago-distro/recipes-core/images/arago-amsdk-image.bb b/meta-arago-distro/recipes-core/images/arago-amsdk-image.bb
index 6ddcb8b..05778dd 100644
--- a/meta-arago-distro/recipes-core/images/arago-amsdk-image.bb
+++ b/meta-arago-distro/recipes-core/images/arago-amsdk-image.bb
@@ -22,6 +22,7 @@ IMAGE_INSTALL = "\
     task-arago-tisdk-matrix-sdk-host \
     task-arago-tisdk-multimedia-sdk-host \
     task-arago-tisdk-qte-sdk-host \
+    task-arago-tisdk-amsdk-sdk-host \
 "
 
 export IMAGE_BASENAME = "arago-amsdk-image"
-- 
1.7.0.4


