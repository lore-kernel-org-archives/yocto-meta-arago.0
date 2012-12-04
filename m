Return-Path: <fcooperjr27@gmail.com>
Received: from mail-oa0-f51.google.com (mail-oa0-f51.google.com
	[209.85.219.51])
	by arago-project.org (Postfix) with ESMTPS id 8BAC45298B
	for <meta-arago@arago-project.org>;
	Tue,  4 Dec 2012 06:49:50 +0000 (UTC)
Received: by mail-oa0-f51.google.com with SMTP id n12so3372887oag.38
	for <meta-arago@arago-project.org>;
	Mon, 03 Dec 2012 22:49:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	bh=wOHmlJ2DBA4OyPkg4nBIogjzCu7drAS9Ia++BA0r2ho=;
	b=lKARoFIIdGS6KJUu5QhVm3YHLLDqap1exjzvyZsHZ1hYw8c/uJPy8hJz61jP5BrYnQ
	2vMn5ibMMtwgp5A75dbKjjWwvL/KKDaqjeiVVEIIrCXAPp+T+7TCLYVGrVtdl1lXcnny
	euHEvztTKUMxzrH1/SGMEHwfY96/u5gssVxRaXZYu7+fpmhK8g/OjVIxEi7LBoztv1Z5
	kU7jXRAlJ+ybLVSbFOK0aXfVZiIkhs/GpO6RFdhWdmd9CMjCzoLnu4jSW0be6OosTyum
	vyRR0Nckf3+adDeeET7mOdJOsUPOTMNBU7s3ukUuIha/pwJZC5I5kx5J2KejXo1Ed7kD
	shcA==
Received: by 10.182.227.5 with SMTP id rw5mr6753447obc.47.1354603789652;
	Mon, 03 Dec 2012 22:49:49 -0800 (PST)
Received: from localhost.localdomain (dragon.ti.com. [192.94.94.33])
	by mx.google.com with ESMTPS id h13sm291623obp.2.2012.12.03.22.49.48
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 03 Dec 2012 22:49:49 -0800 (PST)
From: "Franklin S. Cooper Jr" <fcooperjr27@gmail.com>
To: meta-arago@arago-project.org
Date: Tue,  4 Dec 2012 00:48:55 -0600
Message-Id: <1354603735-14377-2-git-send-email-fcooper@ti.com>
X-Mailer: git-send-email 1.7.0.4
In-Reply-To: <1354603735-14377-1-git-send-email-fcooper@ti.com>
References: <1354603735-14377-1-git-send-email-fcooper@ti.com>
Cc: "Franklin S. Cooper Jr" <fcooper@ti.com>
Subject: [for-comment][PATCH 2/2] board-port-labs: Add support for do_change_origin
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
X-List-Received-Date: Tue, 04 Dec 2012 06:49:51 -0000

* Add support for do_change_origin.
* Checkout the latest SDK board-port branch

Signed-off-by: Franklin S. Cooper Jr <fcooper@ti.com>
---
 .../board-port-labs/board-port-labs_git.bb         |   20 +++++++++++++++++---
 1 files changed, 17 insertions(+), 3 deletions(-)

diff --git a/meta-arago-distro/recipes-tisdk/board-port-labs/board-port-labs_git.bb b/meta-arago-distro/recipes-tisdk/board-port-labs/board-port-labs_git.bb
index d7329cc..b98e6dd 100644
--- a/meta-arago-distro/recipes-tisdk/board-port-labs/board-port-labs_git.bb
+++ b/meta-arago-distro/recipes-tisdk/board-port-labs/board-port-labs_git.bb
@@ -10,17 +10,31 @@ PACKAGE_ARCH = "all"
 CREATE_SRCIPK = "1"
 SRCIPK_INSTALL_DIR = "board-support/board-port-labs"
 
-PR = "r1"
+PR = "r2"
 
 BRANCH = "board-port-05.05.00.00"
+LINUX_DIRECTORY = "sitara-board-port-linux"
+U-BOOT_DIRECTORY = "sitara-board-port-u-boot"
 
 SRC_URI = "\
     file://LICENSE \
-    git://gitorious.org/sitara-board-port/sitara-board-port-linux.git;protocol=git;branch=${BRANCH};destsuffix=board-support/sitara-board-port-linux;name=board-support-linux \
-    git://gitorious.org/sitara-board-port/sitara-board-port-uboot.git;protocol=git;branch=${BRANCH};destsuffix=board-support/sitara-board-port-uboot;name=board-support-u-boot \
+    git://gitorious.org/sitara-board-port/sitara-board-port-linux.git;protocol=git;branch=${BRANCH};destsuffix=board-support/${LINUX_DIRECTORY};name=board-support-linux \
+    git://gitorious.org/sitara-board-port/sitara-board-port-uboot.git;protocol=git;branch=${BRANCH};destsuffix=board-support/${U-BOOT_DIRECTORY};name=board-support-u-boot \
 "
 
 SRCREV_board-support-linux = "eaf6d6b4447b132592896fb87d914d130892cd2e"
 SRCREV_board-support-u-boot = "c817fbabece6218f128dc1ce4410563d503cecae"
 
 S = "${WORKDIR}/board-support"
+
+# Do not create a SDK branch
+CREATE_SDK_BRANCH = "0"
+
+do_change_origin() {
+   sdk_tweaks "${S}/${LINUX_DIRECTORY}"
+   cd ${S}/${LINUX_DIRECTORY}; git checkout ${BRANCH}
+
+   sdk_tweaks "${S}/${U-BOOT_DIRECTORY}"
+   cd ${S}/${U-BOOT_DIRECTORY} ; git checkout ${BRANCH}
+}
+
-- 
1.7.0.4


