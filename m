Return-Path: <chase.maupin@ti.com>
Received: from devils.ext.ti.com (devils.ext.ti.com [198.47.26.153])
	by arago-project.org (Postfix) with ESMTPS id 5426D5299F
	for <meta-arago@arago-project.org>;
	Mon, 21 May 2012 19:04:48 +0000 (UTC)
Received: from dlelxv30.itg.ti.com ([172.17.2.17])
	by devils.ext.ti.com (8.13.7/8.13.7) with ESMTP id q4LJ4lLP013099
	for <meta-arago@arago-project.org>; Mon, 21 May 2012 14:04:47 -0500
Received: from DFLE70.ent.ti.com (dfle70.ent.ti.com [128.247.5.40])
	by dlelxv30.itg.ti.com (8.13.8/8.13.8) with ESMTP id q4LJ4lWj001108
	for <meta-arago@arago-project.org>; Mon, 21 May 2012 14:04:47 -0500
Received: from dlelxv23.itg.ti.com (172.17.1.198) by dfle70.ent.ti.com
	(128.247.5.40) with Microsoft SMTP Server id 14.1.323.3;
	Mon, 21 May 2012 14:04:47 -0500
Received: from localhost.localdomain (dbdp20.itg.ti.com [172.24.170.38])	by
	dlelxv23.itg.ti.com (8.13.8/8.13.8) with ESMTP id q4LJ4ig6029693;
	Mon, 21 May 2012 14:04:45 -0500
From: Chase Maupin <Chase.Maupin@ti.com>
To: <meta-arago@arago-project.org>
Date: Mon, 21 May 2012 14:11:48 -0500
Message-ID: <1337627508-2465-1-git-send-email-Chase.Maupin@ti.com>
X-Mailer: git-send-email 1.7.0.4
MIME-Version: 1.0
Subject: [PATCH] matrix-gui-apps-git: update to latest sources
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
X-List-Received-Date: Mon, 21 May 2012 19:04:48 -0000
Content-Type: text/plain

* Update to use the latest sources which bring in fixes for:
    * Adding additional Qt demos
    * Removing unneeded Qt demos that do not display well
    * Improving browser launch script
    * Launch animated tiles full screen
    * Make PRU overview informational
    * Remove windows style line returns
    * Update dhrystone description page
    * Fix camera loopback description
    * Fix multimedia descriptions
    * Fix LCD to DVI issues
    * Update power and clock apps
    * Remove device specifics from oprofile descriptions
* Bump the PR

Signed-off-by: Chase Maupin <Chase.Maupin@ti.com>
---
 .../recipes-core/matrix/matrix-gui-apps-git.inc    |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-arago-extras/recipes-core/matrix/matrix-gui-apps-git.inc b/meta-arago-extras/recipes-core/matrix/matrix-gui-apps-git.inc
index 29b0fb5..3ff593c 100644
--- a/meta-arago-extras/recipes-core/matrix/matrix-gui-apps-git.inc
+++ b/meta-arago-extras/recipes-core/matrix/matrix-gui-apps-git.inc
@@ -2,9 +2,9 @@ LICENSE = "CC-BY-SA"
 LIC_FILES_CHKSUM = "file://../LICENSE;md5=6e0ae7214f6c74c149cb25f373057fa9"
 
 SRC_URI = "git://gitorious.org/matrix-gui-v2/matrix-gui-v2-apps.git;protocol=git;branch=${BRANCH}"
-SRCREV = "de6618b7ee3d6b0957bad2c8b8310a5869ad169e"
+SRCREV = "473600c0a938446bc1d8a3d1f4ddf8027369efe7"
 BRANCH = "master"
-INC_PR = "r1"
+INC_PR = "r2"
 
 # Pull in the base package for installing matrix applications
 require matrix-gui-apps.inc
-- 
1.7.0.4


