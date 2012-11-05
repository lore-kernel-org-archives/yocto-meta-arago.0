Return-Path: <fcooperjr27@gmail.com>
Received: from mail-oa0-f51.google.com (mail-oa0-f51.google.com
	[209.85.219.51])
	by arago-project.org (Postfix) with ESMTPS id A6C715208C
	for <meta-arago@arago-project.org>;
	Mon,  5 Nov 2012 01:54:04 +0000 (UTC)
Received: by mail-oa0-f51.google.com with SMTP id n12so4861422oag.38
	for <meta-arago@arago-project.org>;
	Sun, 04 Nov 2012 17:54:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	bh=qC+ll/NjpcC/T39MZV4vGZBcI0Vw8bKEedLPK3oMzZM=;
	b=VDot9J0pIOTX0QZJ6Lg2HDBbIE4oD/FRoa+hmNidA85mZcwBOtzMSa1UUe+SJKvnmG
	3Xw7TTUzjsVTlwQ4Qxxs1ixj+RrmBPtkL/pghJI3UdXNUAq2bBaTXNG8BoPXUWDliOw6
	11n0M7TpJFxPZyQockv7n8CaoSLjUbJz/ZGfDf/jHzav7Ql82q2aea16flnDHjC4xI/K
	PxY04IK3bS1OuqRMJEQlK4PodxUwKpgcU9lyPSt85VohF/4Y1qSUsjAFsYdR3TnaFFWB
	sJZMvvPs7stQ83sihfgzbja4chihz51lLQD7HYL0odtBjEPTE2iDUmUWGw8TpTEOZREl
	95Qg==
Received: by 10.60.172.48 with SMTP id az16mr6565724oec.64.1352080444441;
	Sun, 04 Nov 2012 17:54:04 -0800 (PST)
Received: from localhost.localdomain (dragon.ti.com. [192.94.94.33])
	by mx.google.com with ESMTPS id v6sm12820300oeh.13.2012.11.04.17.54.03
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sun, 04 Nov 2012 17:54:04 -0800 (PST)
From: "Franklin S. Cooper Jr" <fcooperjr27@gmail.com>
To: meta-arago@arago-project.org
Date: Sun,  4 Nov 2012 19:53:09 -0600
Message-Id: <1352080417-9792-12-git-send-email-fcooper@ti.com>
X-Mailer: git-send-email 1.7.0.4
In-Reply-To: <1352080417-9792-1-git-send-email-fcooper@ti.com>
References: <1352080417-9792-1-git-send-email-fcooper@ti.com>
Cc: "Franklin S. Cooper Jr" <fcooper@ti.com>
Subject: [PATCH 14/42] arago-tisdk-image: Add task-arago-tisdk-amsdk
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
X-List-Received-Date: Mon, 05 Nov 2012 01:54:05 -0000

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


