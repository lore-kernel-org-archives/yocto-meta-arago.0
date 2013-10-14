Return-Path: <chase.maupin@ti.com>
Received: from devils.ext.ti.com (devils.ext.ti.com [198.47.26.153])
	by arago-project.org (Postfix) with ESMTPS id 865505299B
	for <meta-arago@arago-project.org>;
	Mon, 14 Oct 2013 19:40:09 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by devils.ext.ti.com (8.13.7/8.13.7) with ESMTP id r9EJe8Il019320
	for <meta-arago@arago-project.org>; Mon, 14 Oct 2013 14:40:08 -0500
Received: from DLEE70.ent.ti.com (dlee70.ent.ti.com [157.170.170.113])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id r9EJe8HQ020739
	for <meta-arago@arago-project.org>; Mon, 14 Oct 2013 14:40:08 -0500
Received: from dflp32.itg.ti.com (10.64.6.15) by DLEE70.ent.ti.com
	(157.170.170.113) with Microsoft SMTP Server id 14.2.342.3;
	Mon, 14 Oct 2013 14:40:08 -0500
Received: from localhost.localdomain (dbdp20.itg.ti.com [172.24.170.38])	by
	dflp32.itg.ti.com (8.14.3/8.13.8) with ESMTP id r9EJe33k012256;
	Mon, 14 Oct 2013 14:40:07 -0500
From: Chase Maupin <Chase.Maupin@ti.com>
To: <meta-arago@arago-project.org>
Date: Mon, 14 Oct 2013 15:29:22 -0500
Message-ID: <1381782564-11190-2-git-send-email-Chase.Maupin@ti.com>
X-Mailer: git-send-email 1.7.0.4
In-Reply-To: <1381782564-11190-1-git-send-email-Chase.Maupin@ti.com>
References: <1381782564-11190-1-git-send-email-Chase.Maupin@ti.com>
MIME-Version: 1.0
Subject: [PATCHv2 2/4] ti-tisdk-makefile: Add AM437x support
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
X-List-Received-Date: Mon, 14 Oct 2013 19:40:09 -0000
Content-Type: text/plain

Signed-off-by: Chase Maupin <Chase.Maupin@ti.com>
---
* Updated in version 2:
    * Added the ti-crypto-examples Makefile targets

---
 .../ti-tisdk-makefile/ti-tisdk-makefile_1.0.bb     |    6 +++++-
 1 files changed, 5 insertions(+), 1 deletions(-)

diff --git a/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile_1.0.bb b/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile_1.0.bb
index e0aea9a..263492d 100644
--- a/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile_1.0.bb
+++ b/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile_1.0.bb
@@ -33,7 +33,7 @@ SRC_URI = "\
     file://Makefile_oprofile-example \
 "
 
-PR = "r13"
+PR = "r14"
 
 MAKEFILES_COMMON = "linux \
                     matrix-gui \
@@ -66,6 +66,10 @@ MAKEFILES_append_ti33x = " u-boot-spl \
                            wireless \
                            ti-crypto-examples \
 "
+MAKEFILES_append_ti43x = " u-boot-spl \
+                           ${QUICK_PLAYGROUND} \
+                           ti-crypto-examples \
+"
 MAKEFILES_append_omap-a15 = " u-boot-spl \
                               ${QUICK_PLAYGROUND} \
                               omapconf \
-- 
1.7.0.4


