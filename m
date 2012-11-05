Return-Path: <fcooperjr27@gmail.com>
Received: from mail-oa0-f51.google.com (mail-oa0-f51.google.com
	[209.85.219.51])
	by arago-project.org (Postfix) with ESMTPS id 3332A5208C
	for <meta-arago@arago-project.org>;
	Mon,  5 Nov 2012 01:54:38 +0000 (UTC)
Received: by mail-oa0-f51.google.com with SMTP id n12so4861422oag.38
	for <meta-arago@arago-project.org>;
	Sun, 04 Nov 2012 17:54:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	bh=v2dlsaYkIULeH/RsvEf1zirJIpWHoa0vGoKr56bT+JQ=;
	b=La8JGcu5hGEXTBop2O3A+MeYrIX38IckrdSywJYCepUVz5vmHlVJxJn59RZLRxoREu
	Zb5KNE350GNSYmzWQaloTR++9sSfbSWJ6SC4bB4WgEU48XBz+vtb41F0DaYIG47WdKnE
	IZdyb9ukw4T6tUa7Hs3otcfA1osTa/lNcflZGWI+ATvcSkIJ59DAl8zhahW3qMSd3rfL
	DyYviLrPLh/EgUzL6T82o28ccp+ziuuJ9KYjtWhqNdm5zWWF5k3aLg4e7cHxjo5rdHmZ
	8CjlGmcry7ETojXsIzNN/pq1Cj8HXWRQYEe3MrUTxziX3wFG30+Pgo2EJejM1QayO5Ql
	XJkQ==
Received: by 10.60.7.106 with SMTP id i10mr6572245oea.5.1352080477926;
	Sun, 04 Nov 2012 17:54:37 -0800 (PST)
Received: from localhost.localdomain (dragon.ti.com. [192.94.94.33])
	by mx.google.com with ESMTPS id v6sm12820300oeh.13.2012.11.04.17.54.37
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sun, 04 Nov 2012 17:54:37 -0800 (PST)
From: "Franklin S. Cooper Jr" <fcooperjr27@gmail.com>
To: meta-arago@arago-project.org
Date: Sun,  4 Nov 2012 19:53:37 -0600
Message-Id: <1352080417-9792-40-git-send-email-fcooper@ti.com>
X-Mailer: git-send-email 1.7.0.4
In-Reply-To: <1352080417-9792-1-git-send-email-fcooper@ti.com>
References: <1352080417-9792-1-git-send-email-fcooper@ti.com>
Cc: "Franklin S. Cooper Jr" <fcooper@ti.com>
Subject: [PATCH 42/42] ti-tisdk-makefile: Use ARMPKGARCH variable
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
X-List-Received-Date: Mon, 05 Nov 2012 01:54:39 -0000

* The variable BASE_PACKAGE_ARCH no longer exist.
* Use ARMPKGARCH instead to provide ARM architecture version information

Signed-off-by: Franklin S. Cooper Jr <fcooper@ti.com>
---
 .../ti-tisdk-makefile/ti-tisdk-makefile_1.0.bb     |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile_1.0.bb b/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile_1.0.bb
index 2dece10..6208f21 100644
--- a/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile_1.0.bb
+++ b/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile_1.0.bb
@@ -29,7 +29,7 @@ SRC_URI = "\
     file://Makefile_wireless \
 "
 
-PR = "r0"
+PR = "r1"
 
 MAKEFILES_COMMON = "linux \
                     matrix-gui \
@@ -102,7 +102,7 @@ do_install () {
 
     # fixup Rules.make values
     sed -i -e "s/__PLATFORM__/${MACHINE}/" ${D}/Rules.make
-    sed -i -e "s/__ARCH__/${BASE_PACKAGE_ARCH}/" ${D}/Rules.make
+    sed -i -e "s/__ARCH__/${ARMPKGARCH}/" ${D}/Rules.make
     sed -i -e "s/__UBOOT_MACHINE__/${UBOOT_MACHINE}/" ${D}/Rules.make
 
 }
-- 
1.7.0.4


