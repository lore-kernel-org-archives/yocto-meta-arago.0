Return-Path: <fcooperjr27@gmail.com>
Received: from mail-ob0-f169.google.com (mail-ob0-f169.google.com
	[209.85.214.169])
	by arago-project.org (Postfix) with ESMTPS id AD3F052A80
	for <meta-arago@arago-project.org>;
	Mon, 28 Jan 2013 17:26:09 +0000 (UTC)
Received: by mail-ob0-f169.google.com with SMTP id ta14so3060124obb.14
	for <meta-arago@arago-project.org>;
	Mon, 28 Jan 2013 09:26:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:from:to:cc:subject:date:message-id:x-mailer:in-reply-to
	:references; bh=1dc1+HfeqfYawL96J0J426gTPnrKiznr+A3pO5mByMs=;
	b=LnoVWkzCMbcd2XVN2DrZbPowHWAe65sFZkvEUl5dA7R9P1F74Mq2O7NdkDDDm4/DJw
	bFEZ1DGiBtzxLy2cAdSCuIvnlPtJigP8nZD0OY68wnHsFooyMKmfiJHt3mvyjSFsCUub
	1UIORhdbQ3gqJ5HTTIes8tAti4pgnouMqH2Tr+Pz6RJl1JFsX6fafxdlQIQfUzKiIcTB
	tfgIUPP0SN6kdp+yByF1Rc4xQkoNRNMyUCk6kSIds5Z2crIn2c25ltZqoxOShbd0Oqaa
	Yf3LSJozTQVFrjjZJWSUk7asdyYgilk9mt9EWzuuQO5ltKhKpK78bNMXgDhHw0hmK4cp
	f0GA==
X-Received: by 10.60.18.232 with SMTP id z8mr11642250oed.11.1359393969253;
	Mon, 28 Jan 2013 09:26:09 -0800 (PST)
Received: from localhost.localdomain (dragon.ti.com. [192.94.94.33])
	by mx.google.com with ESMTPS id m3sm8149180obm.21.2013.01.28.09.26.07
	(version=TLSv1 cipher=RC4-SHA bits=128/128);
	Mon, 28 Jan 2013 09:26:08 -0800 (PST)
From: fcooperjr27@gmail.com
To: meta-arago@arago-project.org
Date: Mon, 28 Jan 2013 11:25:17 -0600
Message-Id: <1359393932-31361-17-git-send-email-fcooper@ti.com>
X-Mailer: git-send-email 1.7.0.4
In-Reply-To: <1359393932-31361-1-git-send-email-fcooper@ti.com>
References: <1359393932-31361-1-git-send-email-fcooper@ti.com>
Cc: "Franklin S. Cooper Jr" <fcooper@ti.com>
Subject: [PATCH 17/32] wl1271-demo_git: Add obex-client to the runtime dependencies list
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
X-List-Received-Date: Mon, 28 Jan 2013 17:26:10 -0000

From: Franklin S. Cooper Jr <fcooper@ti.com>

* Obex-client is required for the BT_FTP_Push.sh script to run. Adding it as
  an runtime dependency to insure that it is pulled in.

Signed-off-by: Franklin S. Cooper Jr <fcooper@ti.com>
---
 .../wl12xx-demo/wl1271-demo_git.bb                 |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-arago-extras/recipes-connectivity/wl12xx-demo/wl1271-demo_git.bb b/meta-arago-extras/recipes-connectivity/wl12xx-demo/wl1271-demo_git.bb
index d2eb063..32eb0f6 100644
--- a/meta-arago-extras/recipes-connectivity/wl12xx-demo/wl1271-demo_git.bb
+++ b/meta-arago-extras/recipes-connectivity/wl12xx-demo/wl1271-demo_git.bb
@@ -4,12 +4,12 @@ LICENSE = "BSD"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=bb965abb1955d78452750ca40717999c"
 
 DEPENDS += "openobex"
-RDEPENDS_${PN} += "bluez4 openobex ussp-push obexftp bluez-hcidump"
+RDEPENDS_${PN} += "bluez4 openobex ussp-push obexftp bluez-hcidump obex-client"
 
 PACKAGE_ARCH = "${MACHINE_ARCH}"
 PACKAGE_STRIP = "no"
 
-PR = "r2+gitr${SRCREV}"
+PR = "r3+gitr${SRCREV}"
 
 BRANCH = "wl12xx"
 SRCREV = "7736f86b8c157ffc3e2a0b9e55a97c093faae14e"
-- 
1.7.0.4


