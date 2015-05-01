Return-Path: <hzhang@ti.com>
Received: from comal.ext.ti.com (comal.ext.ti.com [198.47.26.152])
	by arago-project.org (Postfix) with ESMTPS id 0EBEE52AC2
	for <meta-arago@arago-project.org>;
	Fri,  1 May 2015 14:06:16 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by comal.ext.ti.com (8.13.7/8.13.7) with ESMTP id t41E6Fer018178
	for <meta-arago@arago-project.org>; Fri, 1 May 2015 09:06:15 -0500
Received: from DLEE71.ent.ti.com (dlee71.ent.ti.com [157.170.170.114])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id t41E6E8u025288
	for <meta-arago@arago-project.org>; Fri, 1 May 2015 09:06:14 -0500
Received: from dflp33.itg.ti.com (10.64.6.16) by DLEE71.ent.ti.com
	(157.170.170.114) with Microsoft SMTP Server id 14.3.224.2;
	Fri, 1 May 2015 09:06:13 -0500
Received: from ares-ubuntu (ileax41-snat.itg.ti.com [10.172.224.153])	by
	dflp33.itg.ti.com (8.14.3/8.13.8) with ESMTP id t41E6Drp015619;
	Fri, 1 May 2015 09:06:13 -0500
Received: from a0868496 by ares-ubuntu with local (Exim 4.76)	(envelope-from
	<hzhang@ti.com>)	id 1YoBa1-0008Rp-I7; Fri, 01 May 2015 10:06:13 -0400
From: <hzhang@ti.com>
To: <meta-arago@arago-project.org>
Date: Fri, 1 May 2015 10:06:12 -0400
Message-ID: <1430489172-32443-1-git-send-email-hzhang@ti.com>
X-Mailer: git-send-email 1.7.9.5
MIME-Version: 1.0
Subject: [PATCH] matrix-gui-apps: update SRCREV in matrix-gui-apps.inc
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
X-List-Received-Date: Fri, 01 May 2015 14:06:16 -0000
Content-Type: text/plain

From: Hao Zhang <hzhang@ti.com>

Update SRCREV of matrix-gui-v2-apps.git to fix UBI read/write error in
Keystone EEPROM/Flash utility demos.

Signed-off-by: Hao Zhang <hzhang@ti.com>
---
 .../recipes-core/matrix/matrix-gui-apps-git.inc    |    4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-arago-extras/recipes-core/matrix/matrix-gui-apps-git.inc b/meta-arago-extras/recipes-core/matrix/matrix-gui-apps-git.inc
index ab566c9..a353ac3 100644
--- a/meta-arago-extras/recipes-core/matrix/matrix-gui-apps-git.inc
+++ b/meta-arago-extras/recipes-core/matrix/matrix-gui-apps-git.inc
@@ -6,9 +6,9 @@ LIC_FILES_CHKSUM := "file://../${LICENSE_CHECKSUM}"
 DEPENDS += "ca-certificates-native"
 
 SRC_URI = "git://git.ti.com/matrix-gui-v2/matrix-gui-v2-apps.git;protocol=git;branch=${BRANCH}"
-SRCREV = "0b159d3e832b8d7d9ab46cdfbeef870c48476efc"
+SRCREV = "ca4dbaae465eca86e244f521b1b1eb79b81573f3"
 BRANCH = "master"
-INC_PR = "r33"
+INC_PR = "r34"
 
 
 # Pull in the base package for installing matrix applications
-- 
1.7.9.5


