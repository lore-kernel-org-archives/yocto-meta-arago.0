Return-Path: <fcooperjr27@gmail.com>
Received: from mail-ob0-f170.google.com (mail-ob0-f170.google.com
	[209.85.214.170])
	by arago-project.org (Postfix) with ESMTPS id AF6A952AEA
	for <meta-arago@arago-project.org>;
	Fri, 25 Jan 2013 21:58:43 +0000 (UTC)
Received: by mail-ob0-f170.google.com with SMTP id wp18so1055398obc.29
	for <meta-arago@arago-project.org>;
	Fri, 25 Jan 2013 13:58:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:from:to:cc:subject:date:message-id:x-mailer:in-reply-to
	:references; bh=yIOgElJx+c4N/vmI08CrATq8L0m5fieLLMPut2HWa/o=;
	b=qxu9RR4R2y4LqFNIXCVAZjWHOhBEdUZzp/kzuhfltBkj0sO3EOyeySKvR89APOzvgG
	o7Zf2EIFWBGNtDk8wnDO/V69G3aXeIm/fPV1xFkfbcNmKBoKuY4v3egkWEyZtnNpyrGc
	aF4gfseqJjrHWfygzHVRztPlIQGvgyhrl3eWQJt1Zq9hGqgaAxLrCnBi4T2tKa0rVSZd
	9VObQVhDvMS0j6ZBUcU9nWys6u9u76AYq6H6rJ3kFncSHZO4r5cQBwnQlMgzsRaxnFe5
	rwu51EXMv7V2S4PR/Zfcnz5H4S5DRhF4TBlzGU3Wegcv7gAsVJsLULQTpSFj004pYkSz
	Vl+A==
X-Received: by 10.60.31.8 with SMTP id w8mr5839694oeh.55.1359151122708;
	Fri, 25 Jan 2013 13:58:42 -0800 (PST)
Received: from localhost.localdomain (dragon.ti.com. [192.94.94.33])
	by mx.google.com with ESMTPS id y4sm1625632oea.7.2013.01.25.13.58.41
	(version=TLSv1 cipher=RC4-SHA bits=128/128);
	Fri, 25 Jan 2013 13:58:41 -0800 (PST)
From: fcooperjr27@gmail.com
To: meta-arago@arago-project.org
Date: Fri, 25 Jan 2013 15:54:05 -0600
Message-Id: <1359150851-23602-24-git-send-email-fcooper@ti.com>
X-Mailer: git-send-email 1.7.0.4
In-Reply-To: <1359150851-23602-1-git-send-email-fcooper@ti.com>
References: <1359150851-23602-1-git-send-email-fcooper@ti.com>
Cc: "Franklin S. Cooper Jr" <fcooper@ti.com>
Subject: [PATCH 25/31] Revert "board-port-labs: Tweak recipe"
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
X-List-Received-Date: Fri, 25 Jan 2013 21:58:44 -0000

From: Franklin S. Cooper Jr <fcooper@ti.com>

This reverts commit 11cb4e96977ff094a1f2e622b6e8ef10182fa85f.

Need to go back to the old version due to issues with packaging .git
repositories
---
 .../board-port-labs/board-port-labs_git.bb         |   29 +++++++++++--------
 1 files changed, 17 insertions(+), 12 deletions(-)

diff --git a/meta-arago-distro/recipes-tisdk/board-port-labs/board-port-labs_git.bb b/meta-arago-distro/recipes-tisdk/board-port-labs/board-port-labs_git.bb
index d7329cc..2c75c65 100644
--- a/meta-arago-distro/recipes-tisdk/board-port-labs/board-port-labs_git.bb
+++ b/meta-arago-distro/recipes-tisdk/board-port-labs/board-port-labs_git.bb
@@ -3,24 +3,29 @@ HOMEPAGE = "https://gitorious.org/sitara-board-port"
 LICENSE = "GPLv2"
 DEPENDS += "git-native"
 
-LIC_FILES_CHKSUM = "file://../LICENSE;md5=d9fb2a547cd8e6bb75c0ecf427a139a9"
+SRC_URI = "file://LICENSE"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=d9fb2a547cd8e6bb75c0ecf427a139a9"
 
 PACKAGE_ARCH = "all"
-
 CREATE_SRCIPK = "1"
 SRCIPK_INSTALL_DIR = "board-support/board-port-labs"
 
-PR = "r1"
+PR = "r2"
 
-BRANCH = "board-port-05.05.00.00"
+REPOS ?= "git://gitorious.org/sitara-board-port/sitara-board-port-linux.git \
+          git://gitorious.org/sitara-board-port/sitara-board-port-uboot.git \
+         "
 
-SRC_URI = "\
-    file://LICENSE \
-    git://gitorious.org/sitara-board-port/sitara-board-port-linux.git;protocol=git;branch=${BRANCH};destsuffix=board-support/sitara-board-port-linux;name=board-support-linux \
-    git://gitorious.org/sitara-board-port/sitara-board-port-uboot.git;protocol=git;branch=${BRANCH};destsuffix=board-support/sitara-board-port-uboot;name=board-support-u-boot \
-"
+S = "${WORKDIR}"
 
-SRCREV_board-support-linux = "eaf6d6b4447b132592896fb87d914d130892cd2e"
-SRCREV_board-support-u-boot = "c817fbabece6218f128dc1ce4410563d503cecae"
+# Checkout the REPOS before the do_patch task so that it will be done prior
+# to the srcipk being made.
+do_repos_checkout() {
+    cd ${S}
+    for r in ${REPOS}
+    do
+        git clone $r
+    done
+}
 
-S = "${WORKDIR}/board-support"
+addtask repos_checkout after do_fetch before do_patch
-- 
1.7.0.4


