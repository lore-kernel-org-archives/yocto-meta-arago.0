Return-Path: <a0273011@sdit-build02.dal.design.ti.com>
Received: from bear.ext.ti.com (bear.ext.ti.com [192.94.94.41])
	by arago-project.org (Postfix) with ESMTPS id A502352A4B
	for <meta-arago@arago-project.org>;
	Wed, 22 Aug 2012 01:21:49 +0000 (UTC)
Received: from dlelxv30.itg.ti.com ([172.17.2.17])
	by bear.ext.ti.com (8.13.7/8.13.7) with ESMTP id q7M1Lm3c025435
	for <meta-arago@arago-project.org>; Tue, 21 Aug 2012 20:21:48 -0500
Received: from DLEE74.ent.ti.com (dlee74.ent.ti.com [157.170.170.8])
	by dlelxv30.itg.ti.com (8.13.8/8.13.8) with ESMTP id q7M1LmkU014319
	for <meta-arago@arago-project.org>; Tue, 21 Aug 2012 20:21:48 -0500
Received: from dlelxv22.itg.ti.com (172.17.1.197) by DLEE74.ent.ti.com
	(157.170.170.8) with Microsoft SMTP Server id 14.1.323.3;
	Tue, 21 Aug 2012 20:21:47 -0500
Received: from sdit-build02.dal.design.ti.com (sdit-build02.dal.design.ti.com
	[10.247.66.5])	by dlelxv22.itg.ti.com (8.13.8/8.13.8) with ESMTP id
	q7M1LmKi000741;	Tue, 21 Aug 2012 20:21:48 -0500
Received: from a0273011 by sdit-build02.dal.design.ti.com with local (Exim
	4.71)	(envelope-from <a0273011@sdit-build02.dal.design.ti.com>)	id
	1T3zpH-0001gW-0q; Tue, 21 Aug 2012 20:33:43 -0500
From: Franklin S Cooper Jr <fcooper@ti.com>
To: <meta-arago@arago-project.org>
Date: Tue, 21 Aug 2012 20:33:39 -0500
Message-ID: <1345599219-5897-1-git-send-email-fcooper@ti.com>
X-Mailer: git-send-email 1.7.0.4
MIME-Version: 1.0
Cc: Franklin S Cooper Jr <fcooper@ti.com>
Subject: [meta-arago-extras][PATCH] matrix-gui-apps-git.inc: Tweak LICENSE settings
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
X-List-Received-Date: Wed, 22 Aug 2012 01:21:49 -0000
Content-Type: text/plain

* For some Matrix v2 apps that use the same default LICENSE file, the path to
  the LICENSE file is different.
* Add a new variable to store the LICENSE information which allows needed
  recipes to override the path to the LICENSE file without having to duplicate
  the LICENSE checksum value.

Signed-off-by: Franklin S Cooper Jr <fcooper@ti.com>
---
 .../recipes-core/matrix/matrix-gui-apps-git.inc    |    6 ++++--
 1 files changed, 4 insertions(+), 2 deletions(-)

diff --git a/meta-arago-extras/recipes-core/matrix/matrix-gui-apps-git.inc b/meta-arago-extras/recipes-core/matrix/matrix-gui-apps-git.inc
index 6503fad..ca5f69d 100644
--- a/meta-arago-extras/recipes-core/matrix/matrix-gui-apps-git.inc
+++ b/meta-arago-extras/recipes-core/matrix/matrix-gui-apps-git.inc
@@ -1,10 +1,12 @@
 LICENSE = "CC-BY-SA"
-LIC_FILES_CHKSUM = "file://../LICENSE;md5=6e0ae7214f6c74c149cb25f373057fa9"
+#By default all Matrix v2 applications use the same license.
+LICENSE_CHECKSUM = "LICENSE;md5=6e0ae7214f6c74c149cb25f373057fa9"
+LIC_FILES_CHKSUM := "file://../${LICENSE_CHECKSUM}"
 
 SRC_URI = "git://gitorious.org/matrix-gui-v2/matrix-gui-v2-apps.git;protocol=git;branch=${BRANCH}"
 SRCREV = "cf78c056a48573600438535adb31b4415377bc00"
 BRANCH = "master"
-INC_PR = "r3"
+INC_PR = "r4"
 
 # Pull in the base package for installing matrix applications
 require matrix-gui-apps.inc
-- 
1.7.0.4


