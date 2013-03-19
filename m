Return-Path: <chase.maupin@ti.com>
Received: from comal.ext.ti.com (comal.ext.ti.com [198.47.26.152])
	by arago-project.org (Postfix) with ESMTPS id 427F35203A
	for <meta-arago@arago-project.org>;
	Tue, 19 Mar 2013 15:14:11 +0000 (UTC)
Received: from dbdp20.itg.ti.com ([172.24.170.38])
	by comal.ext.ti.com (8.13.7/8.13.7) with ESMTP id r2JFE9Ii020718
	for <meta-arago@arago-project.org>; Tue, 19 Mar 2013 10:14:10 -0500
Received: from DBDE70.ent.ti.com (localhost [127.0.0.1])
	by dbdp20.itg.ti.com (8.13.8/8.13.8) with ESMTP id r2JFE8Lv005759
	for <meta-arago@arago-project.org>;
	Tue, 19 Mar 2013 20:44:08 +0530 (IST)
Received: from dbdp32.itg.ti.com (172.24.170.251) by dbde70.ent.ti.com
	(172.24.170.148) with Microsoft SMTP Server id 14.1.323.3;
	Tue, 19 Mar 2013 20:44:08 +0530
Received: from localhost.localdomain (dbdp20.itg.ti.com [172.24.170.38])	by
	dbdp32.itg.ti.com (8.13.8/8.13.8) with ESMTP id r2JFE4lO023952;
	Tue, 19 Mar 2013 20:44:07 +0530
From: Chase Maupin <Chase.Maupin@ti.com>
To: <meta-arago@arago-project.org>
Date: Tue, 19 Mar 2013 10:13:57 -0500
Message-ID: <1363706042-10182-2-git-send-email-Chase.Maupin@ti.com>
X-Mailer: git-send-email 1.7.0.4
In-Reply-To: <1363706042-10182-1-git-send-email-Chase.Maupin@ti.com>
References: <1363706042-10182-1-git-send-email-Chase.Maupin@ti.com>
MIME-Version: 1.0
Subject: [PATCH 2/7] ti-tisdk-makefile: Add omap5 support
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
X-List-Received-Date: Tue, 19 Mar 2013 15:14:11 -0000
Content-Type: text/plain

* Add support for omap5 devices using the omap-a15 SOC_FAMILY

Signed-off-by: Chase Maupin <Chase.Maupin@ti.com>
---
 .../ti-tisdk-makefile/ti-tisdk-makefile_1.0.bb     |    5 ++++-
 1 files changed, 4 insertions(+), 1 deletions(-)

diff --git a/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile_1.0.bb b/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile_1.0.bb
index 99e0484..cd43481 100644
--- a/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile_1.0.bb
+++ b/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile_1.0.bb
@@ -30,7 +30,7 @@ SRC_URI = "\
     file://Makefile_wireless \
 "
 
-PR = "r5"
+PR = "r6"
 
 MAKEFILES_COMMON = "linux \
                     matrix-gui \
@@ -56,6 +56,9 @@ MAKEFILES_am3517-evm += "av-examples \
 MAKEFILES_ti33x += "u-boot-spl \
                     quick-playground wireless \
 "
+MAKEFILES_omap-a15 += "u-boot-spl \
+                    quick-playground \
+"
 MAKEFILES_am180x-evm += "pru \
                          u-boot-legacy \
                          wireless \
-- 
1.7.0.4


