Return-Path: <fcooperjr27@gmail.com>
Received: from mail-oa0-f51.google.com (mail-oa0-f51.google.com
	[209.85.219.51])
	by arago-project.org (Postfix) with ESMTPS id B36DD529AD
	for <meta-arago@arago-project.org>;
	Mon,  5 Nov 2012 01:54:00 +0000 (UTC)
Received: by mail-oa0-f51.google.com with SMTP id n12so4861422oag.38
	for <meta-arago@arago-project.org>;
	Sun, 04 Nov 2012 17:54:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	bh=bidHthPxkYk2kMd5XQaQCQkH7bbZXTurimNtxN+P4zQ=;
	b=rboMS63/nTBxyPqHAKdlLaXp+qXgF2bIChzhtysK7hFm8z9qiE1QqVOcHqXILRfq0R
	z1kFuXhAnMdF94Ze6ywYjru6wNfvYLPnt+FeFLkpZe2rpzPkF+tdanIVr92AMfzCEytn
	ZV3CYSTCtu2tz/2slltibhI5BnwbrlkdMyiVOZQvaR5y185/GE4OzrlNhQxyAavYG7sn
	OmdNUctrIpKnGE0tFtu1C2GGTpbJAGMe1s1NUZ0PFfVO1aM3q90KWzE2/5/m1kWab6sm
	Z3jkJvJROhNzgGy6GZAMKfdExdgRoMc9fBieIE7zhodMt+LUfSlAHqWOMTYddk4AbvaD
	l45g==
Received: by 10.182.52.105 with SMTP id s9mr6714746obo.25.1352080440499;
	Sun, 04 Nov 2012 17:54:00 -0800 (PST)
Received: from localhost.localdomain (dragon.ti.com. [192.94.94.33])
	by mx.google.com with ESMTPS id v6sm12820300oeh.13.2012.11.04.17.53.59
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sun, 04 Nov 2012 17:54:00 -0800 (PST)
From: "Franklin S. Cooper Jr" <fcooperjr27@gmail.com>
To: meta-arago@arago-project.org
Date: Sun,  4 Nov 2012 19:53:06 -0600
Message-Id: <1352080417-9792-9-git-send-email-fcooper@ti.com>
X-Mailer: git-send-email 1.7.0.4
In-Reply-To: <1352080417-9792-1-git-send-email-fcooper@ti.com>
References: <1352080417-9792-1-git-send-email-fcooper@ti.com>
Cc: "Franklin S. Cooper Jr" <fcooper@ti.com>
Subject: [PATCH 11/42] board-port-labs: Tweak recipe
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
X-List-Received-Date: Mon, 05 Nov 2012 01:54:01 -0000

* Move the git repositories links from the REPOS variable to the SRC_URI.
* Remove the repos_checkout task. This allows do_fetch to handle the fetching
  which is alot faster since the two repositories do not have to be redownloaded
  every time this recipe is built.

Signed-off-by: Franklin S. Cooper Jr <fcooper@ti.com>
---
 .../board-port-labs/board-port-labs_git.bb         |   29 ++++++++-----------
 1 files changed, 12 insertions(+), 17 deletions(-)

diff --git a/meta-arago-distro/recipes-tisdk/board-port-labs/board-port-labs_git.bb b/meta-arago-distro/recipes-tisdk/board-port-labs/board-port-labs_git.bb
index 97ca84d..d7329cc 100644
--- a/meta-arago-distro/recipes-tisdk/board-port-labs/board-port-labs_git.bb
+++ b/meta-arago-distro/recipes-tisdk/board-port-labs/board-port-labs_git.bb
@@ -3,29 +3,24 @@ HOMEPAGE = "https://gitorious.org/sitara-board-port"
 LICENSE = "GPLv2"
 DEPENDS += "git-native"
 
-SRC_URI = "file://LICENSE"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=d9fb2a547cd8e6bb75c0ecf427a139a9"
+LIC_FILES_CHKSUM = "file://../LICENSE;md5=d9fb2a547cd8e6bb75c0ecf427a139a9"
 
 PACKAGE_ARCH = "all"
+
 CREATE_SRCIPK = "1"
 SRCIPK_INSTALL_DIR = "board-support/board-port-labs"
 
-PR = "r0"
+PR = "r1"
 
-REPOS ?= "git://gitorious.org/sitara-board-port/sitara-board-port-linux.git \
-          git://gitorious.org/sitara-board-port/sitara-board-port-uboot.git \
-         "
+BRANCH = "board-port-05.05.00.00"
 
-S = "${WORKDIR}"
+SRC_URI = "\
+    file://LICENSE \
+    git://gitorious.org/sitara-board-port/sitara-board-port-linux.git;protocol=git;branch=${BRANCH};destsuffix=board-support/sitara-board-port-linux;name=board-support-linux \
+    git://gitorious.org/sitara-board-port/sitara-board-port-uboot.git;protocol=git;branch=${BRANCH};destsuffix=board-support/sitara-board-port-uboot;name=board-support-u-boot \
+"
 
-# Checkout the REPOS before the do_patch task so that it will be done prior
-# to the srcipk being made.
-do_repos_checkout() {
-    cd ${S}
-    for r in ${REPOS}
-    do
-        git clone $r
-    done
-}
+SRCREV_board-support-linux = "eaf6d6b4447b132592896fb87d914d130892cd2e"
+SRCREV_board-support-u-boot = "c817fbabece6218f128dc1ce4410563d503cecae"
 
-addtask repos_checkout after do_fetch before do_patch
+S = "${WORKDIR}/board-support"
-- 
1.7.0.4


