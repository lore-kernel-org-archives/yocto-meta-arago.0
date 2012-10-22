Return-Path: <chase.maupin@ti.com>
Received: from arroyo.ext.ti.com (arroyo.ext.ti.com [192.94.94.40])
	by arago-project.org (Postfix) with ESMTPS id 8D090529F2
	for <meta-arago@arago-project.org>;
	Mon, 22 Oct 2012 21:46:31 +0000 (UTC)
Received: from dbdp20.itg.ti.com ([172.24.170.38])
	by arroyo.ext.ti.com (8.13.7/8.13.7) with ESMTP id q9MLkTqW014609
	for <meta-arago@arago-project.org>; Mon, 22 Oct 2012 16:46:30 -0500
Received: from DBDE70.ent.ti.com (localhost [127.0.0.1])
	by dbdp20.itg.ti.com (8.13.8/8.13.8) with ESMTP id q9MLkTvv016841
	for <meta-arago@arago-project.org>;
	Tue, 23 Oct 2012 03:16:29 +0530 (IST)
Received: from dbdp32.itg.ti.com (172.24.170.251) by dbde70.ent.ti.com
	(172.24.170.148) with Microsoft SMTP Server id 14.1.323.3;
	Tue, 23 Oct 2012 03:16:28 +0530
Received: from localhost.localdomain (dbdp20.itg.ti.com [172.24.170.38])	by
	dbdp32.itg.ti.com (8.13.8/8.13.8) with ESMTP id q9MLkPiR027983;
	Tue, 23 Oct 2012 03:16:28 +0530
From: Chase Maupin <Chase.Maupin@ti.com>
To: <meta-arago@arago-project.org>
Date: Mon, 22 Oct 2012 16:46:24 -0500
Message-ID: <1350942384-27039-2-git-send-email-Chase.Maupin@ti.com>
X-Mailer: git-send-email 1.7.0.4
In-Reply-To: <1350942384-27039-1-git-send-email-Chase.Maupin@ti.com>
References: <1350942384-27039-1-git-send-email-Chase.Maupin@ti.com>
MIME-Version: 1.0
Subject: [PATCH 2/2] arago-base-tisdk-image: inherit remove-net-rules
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
X-List-Received-Date: Mon, 22 Oct 2012 21:46:31 -0000
Content-Type: text/plain

* Inherit the remove-net-rules class to allow moving this image
  from device to device.
* Use new name of remove-net-rules rather than tisdk-image

Signed-off-by: Chase Maupin <Chase.Maupin@ti.com>
---
 .../recipes-core/images/arago-base-tisdk-image.bb  |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/meta-arago-distro/recipes-core/images/arago-base-tisdk-image.bb b/meta-arago-distro/recipes-core/images/arago-base-tisdk-image.bb
index b4bf3c9..da66fc2 100644
--- a/meta-arago-distro/recipes-core/images/arago-base-tisdk-image.bb
+++ b/meta-arago-distro/recipes-core/images/arago-base-tisdk-image.bb
@@ -2,7 +2,7 @@
 # gives you an image with Qt/E and other common packages shared by all TI SDKs.
 
 require arago-image.inc
-#inherit tisdk-image
+inherit remove-net-rules
 
 COMPATIBLE_MACHINE = "omap3|ti816x|dm365|omapl138|ti814x|omap4|ti33x"
 
-- 
1.7.0.4


