Return-Path: <fcooperjr27@gmail.com>
Received: from mail-oa0-f51.google.com (mail-oa0-f51.google.com
	[209.85.219.51])
	by arago-project.org (Postfix) with ESMTPS id 40BAA52988
	for <meta-arago@arago-project.org>;
	Tue, 13 Nov 2012 00:42:38 +0000 (UTC)
Received: by mail-oa0-f51.google.com with SMTP id n12so6297643oag.38
	for <meta-arago@arago-project.org>;
	Mon, 12 Nov 2012 16:42:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer;
	bh=RKrK/Hl1VecGeO1RN4s+EW5om3Kl0VExy3H+J69I5wY=;
	b=vkT0jWyoh64fSZ4Ndzgnt6MZ4GrpVuHux8N+DXe8Ys8TQRRjfblkGTW49vM0u/o8c7
	enuKYjIA1NDo2dqwSI/qdjfY8eJZoV7F0gxKrEoq8wPJ01MAXA2Gm7tcM4uL84X4/O8P
	KRMz36x87mQGfX99UFgX8THzX+Cm/UFo/yeMpKKaHCyxe7n8reHyRhdQoUtgmM8GP8lc
	avI/6UoGePErVijO6+b0Lb3BZOijY7/YjyzwF2HJKKoVx2959ZRlwONpVW31X+vYP2Tn
	NmAFeb7LZF40BFBIsBuBDq5E1QzbV2IcW2QiV8SYuk/73SHGsDk3WDk3/O7NKf2sTynb
	g8Yg==
Received: by 10.60.169.134 with SMTP id ae6mr16097059oec.32.1352767357704;
	Mon, 12 Nov 2012 16:42:37 -0800 (PST)
Received: from localhost.localdomain (dragon.ti.com. [192.94.94.33])
	by mx.google.com with ESMTPS id el2sm790484obc.9.2012.11.12.16.42.36
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 12 Nov 2012 16:42:36 -0800 (PST)
From: "Franklin S. Cooper Jr" <fcooperjr27@gmail.com>
To: meta-arago@arago-project.org
Date: Mon, 12 Nov 2012 18:42:31 -0600
Message-Id: <1352767351-15946-1-git-send-email-fcooper@ti.com>
X-Mailer: git-send-email 1.7.0.4
Cc: "Franklin S. Cooper Jr" <fcooper@ti.com>
Subject: [PATCH] qt-tstat:Update Thermostat sources
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
X-List-Received-Date: Tue, 13 Nov 2012 00:42:38 -0000

* Update to the latest Qt thermostat demo sources*
* This update removes unnecessary debug information.
* Removes unneeded .pro.user file.

Signed-off-by: Franklin S. Cooper Jr <fcooper@ti.com>
---
 .../recipes-qt/qt-apps/qt-tstat_2.0.bb             |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-arago-extras/recipes-qt/qt-apps/qt-tstat_2.0.bb b/meta-arago-extras/recipes-qt/qt-apps/qt-tstat_2.0.bb
index d44eb58..143d0a2 100644
--- a/meta-arago-extras/recipes-qt/qt-apps/qt-tstat_2.0.bb
+++ b/meta-arago-extras/recipes-qt/qt-apps/qt-tstat_2.0.bb
@@ -10,10 +10,10 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=93a105adb99011afa5baee932b560714 \
 
 require recipes-core/matrix/matrix-gui-paths.inc
 
-PR = "r0"
+PR = "r1"
 
 BRANCH ?= "master"
-SRCREV = "2f461242d469871538e6cd05e887457674347e8f"
+SRCREV = "429c802ea04c41f7b29efb89642828091fb83f9b"
 
 SRC_URI = "git://gitorious.org/thermostat-demo/thermostat-demo.git;protocol=git"
 
-- 
1.7.0.4


