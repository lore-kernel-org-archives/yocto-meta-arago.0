Return-Path: <fcooperjr27@gmail.com>
Received: from mail-ob0-f179.google.com (mail-ob0-f179.google.com
	[209.85.214.179])
	by arago-project.org (Postfix) with ESMTPS id E5AAB529A5
	for <meta-arago@arago-project.org>;
	Thu,  1 Nov 2012 18:39:33 +0000 (UTC)
Received: by mail-ob0-f179.google.com with SMTP id lz20so2630528obb.38
	for <meta-arago@arago-project.org>;
	Thu, 01 Nov 2012 11:39:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer;
	bh=qC+ll/NjpcC/T39MZV4vGZBcI0Vw8bKEedLPK3oMzZM=;
	b=c1lPWCQjnnEZuJTByNVqQl4s1hApG6Nj+EFhHPHt7xSHLa5APhoxAXyl8BRlFfrO43
	a11Q3xpMRB5vgC/55doYo71cDQrI0bw6y9cShX0ZcbhC/TsoSnkOe6dQv74iULvq3Kff
	IcRGrSlQWFpQZVA3KsbBGBF0ONBUklK6VCWFUH/Iw6I/6tU0vhnfQ6N7XD8Wbzul6Dwh
	dc41sRfrQ2c0kLPN+g5Z3sihAGTBUQ1gD7nSDz6+MjXhKSAHYyOItuODY6U8NR/wAds0
	m+bbM5oQW+LdOSBNiklc+jyknfb5wra822GSG9+ngsWfi4DqjuswFMvwudR7RuKVKsVi
	/72Q==
Received: by 10.60.30.100 with SMTP id r4mr35800929oeh.121.1351795173458;
	Thu, 01 Nov 2012 11:39:33 -0700 (PDT)
Received: from localhost.localdomain (dragon.ti.com. [192.94.94.33])
	by mx.google.com with ESMTPS id hc1sm6966140obc.7.2012.11.01.11.39.32
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 01 Nov 2012 11:39:33 -0700 (PDT)
From: "Franklin S. Cooper Jr" <fcooperjr27@gmail.com>
To: meta-arago@arago-project.org
Date: Thu,  1 Nov 2012 13:39:28 -0500
Message-Id: <1351795168-4726-1-git-send-email-fcooper@ti.com>
X-Mailer: git-send-email 1.7.0.4
Cc: "Franklin S. Cooper Jr" <fcooper@ti.com>
Subject: [PATCH] arago-tisdk-image: Add task-arago-tisdk-amsdk
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
X-List-Received-Date: Thu, 01 Nov 2012 18:39:34 -0000

* Add amsdk task which pulls in SDK specific scripts and files.

Signed-off-by: Franklin S. Cooper Jr <fcooper@ti.com>
---
 .../recipes-core/images/arago-tisdk-image.bb       |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/meta-arago-distro/recipes-core/images/arago-tisdk-image.bb b/meta-arago-distro/recipes-core/images/arago-tisdk-image.bb
index 9e1eaea..970e7a9 100644
--- a/meta-arago-distro/recipes-core/images/arago-tisdk-image.bb
+++ b/meta-arago-distro/recipes-core/images/arago-tisdk-image.bb
@@ -14,6 +14,7 @@ IMAGE_INSTALL += "\
     task-arago-tisdk-crypto \
     task-arago-tisdk-matrix \
     task-arago-tisdk-multimedia \
+    task-arago-tisdk-amsdk \
 "
 
 export IMAGE_BASENAME = "tisdk-rootfs"
-- 
1.7.0.4


