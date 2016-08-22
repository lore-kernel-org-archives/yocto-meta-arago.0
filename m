Return-Path: <e-ruei1@ti.com>
Received: from comal.ext.ti.com (comal.ext.ti.com [198.47.26.152])
	by arago-project.org (Postfix) with ESMTPS id 6F19352A82
	for <meta-arago@arago-project.org>;
	Mon, 22 Aug 2016 20:26:42 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by comal.ext.ti.com (8.13.7/8.13.7) with ESMTP id u7MKQgLi021795
	for <meta-arago@arago-project.org>; Mon, 22 Aug 2016 15:26:42 -0500
Received: from DFLE73.ent.ti.com (dfle73.ent.ti.com [128.247.5.110])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id u7MKQfnx013290
	for <meta-arago@arago-project.org>; Mon, 22 Aug 2016 15:26:41 -0500
Received: from dflp32.itg.ti.com (10.64.6.15) by DFLE73.ent.ti.com
	(128.247.5.110) with Microsoft SMTP Server id 14.3.294.0;
	Mon, 22 Aug 2016 15:26:40 -0500
Received: from uda0850410.am.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])	by dflp32.itg.ti.com (8.14.3/8.13.8) with ESMTP id
	u7MKQatp027787	for <meta-arago@arago-project.org>;
	Mon, 22 Aug 2016 15:26:40 -0500
From: Eric Ruei <e-ruei1@ti.com>
To: <meta-arago@arago-project.org>
Date: Mon, 22 Aug 2016 16:19:09 -0400
Message-ID: <1471897150-34179-5-git-send-email-e-ruei1@ti.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1471897150-34179-1-git-send-email-e-ruei1@ti.com>
References: <1471897150-34179-1-git-send-email-e-ruei1@ti.com>
MIME-Version: 1.0
Subject: [PATCH 4/5] matrix-gui-apps-git: bump SRCREV to pick up the touch demos
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
X-List-Received-Date: Mon, 22 Aug 2016 20:26:43 -0000
Content-Type: text/plain

Signed-off-by: Eric Ruei <e-ruei1@ti.com>
---
 meta-arago-extras/recipes-core/matrix/matrix-gui-apps-git.inc | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-arago-extras/recipes-core/matrix/matrix-gui-apps-git.inc b/meta-arago-extras/recipes-core/matrix/matrix-gui-apps-git.inc
index 3641a50..3592cd4 100644
--- a/meta-arago-extras/recipes-core/matrix/matrix-gui-apps-git.inc
+++ b/meta-arago-extras/recipes-core/matrix/matrix-gui-apps-git.inc
@@ -4,9 +4,9 @@ LICENSE_CHECKSUM = "LICENSE;md5=6e0ae7214f6c74c149cb25f373057fa9"
 LIC_FILES_CHKSUM := "file://../${LICENSE_CHECKSUM}"
 
 SRC_URI = "git://git.ti.com/matrix-gui-v2/matrix-gui-v2-apps.git;protocol=git;branch=${BRANCH}"
-SRCREV = "a51c0d791e5b15452196f6903ef077401738e631"
+SRCREV = "e6651c1a79b5949817b09e06cc36d828fed8ff3e"
 BRANCH = "master"
-INC_PR = "r41"
+INC_PR = "r42"
 
 # Pull in the base package for installing matrix applications
 require matrix-gui-apps.inc
-- 
1.9.1


