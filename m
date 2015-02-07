Return-Path: <fcooper@ti.com>
Received: from arroyo.ext.ti.com (arroyo.ext.ti.com [192.94.94.40])
	by arago-project.org (Postfix) with ESMTPS id 2F24452099
	for <meta-arago@arago-project.org>;
	Sat,  7 Feb 2015 23:53:06 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by arroyo.ext.ti.com (8.13.7/8.13.7) with ESMTP id t17Nr5Kw031750
	for <meta-arago@arago-project.org>; Sat, 7 Feb 2015 17:53:05 -0600
Received: from DLEE70.ent.ti.com (dlemailx.itg.ti.com [157.170.170.113])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id t17Nr48N015370
	for <meta-arago@arago-project.org>; Sat, 7 Feb 2015 17:53:04 -0600
Received: from dflp33.itg.ti.com (10.64.6.16) by DLEE70.ent.ti.com
	(157.170.170.113) with Microsoft SMTP Server id 14.3.224.2;
	Sat, 7 Feb 2015 17:53:04 -0600
Received: from dbdmail01.india.ti.com (dbdmail01.india.ti.com
	[172.24.162.206])	by dflp33.itg.ti.com (8.14.3/8.13.8) with ESMTP id
	t17Nr3vO012140;	Sat, 7 Feb 2015 17:53:03 -0600
Received: from sdit-build02.dal.design.ti.com (sdit-build02.dal.design.ti.com
	[10.247.66.5])	by dbdmail01.india.ti.com (8.14.3/8.14.3/SuSE Linux
	0.8) with ESMTP id t17NqxIb010769;	Sun, 8 Feb 2015 05:23:01 +0530
From: "Franklin S. Cooper Jr" <fcooper@ti.com>
To: <meta-arago@arago-project.org>
Date: Sat, 7 Feb 2015 17:52:50 -0600
Message-ID: <1423353177-8325-2-git-send-email-fcooper@ti.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <1423353177-8325-1-git-send-email-fcooper@ti.com>
References: <1423353177-8325-1-git-send-email-fcooper@ti.com>
MIME-Version: 1.0
Cc: "Franklin S. Cooper Jr" <fcooper@ti.com>
Subject: [PATCH 2/9 v2] gadget-init: Remove COMPATIBLE_MACHINE
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
X-List-Received-Date: Sat, 07 Feb 2015 23:53:06 -0000
Content-Type: text/plain

From: "Franklin S. Cooper Jr" <fcooper@ti.com>

* There is really nothing machine specific about this recipe.
* Since this script is useful for am437x SK remove the compat field.

Signed-off-by: Franklin S. Cooper Jr <fcooper@ti.com>
---
v2 changes:
None
 .../recipes-tisdk/gadget-init/gadget-init.bb       |    5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/meta-arago-distro/recipes-tisdk/gadget-init/gadget-init.bb b/meta-arago-distro/recipes-tisdk/gadget-init/gadget-init.bb
index 3f69c53..b13befe 100644
--- a/meta-arago-distro/recipes-tisdk/gadget-init/gadget-init.bb
+++ b/meta-arago-distro/recipes-tisdk/gadget-init/gadget-init.bb
@@ -3,10 +3,7 @@ DESCRIPTION = "Scripts to initialize usb gadgets"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://${COREBASE}/LICENSE;md5=4d92cd373abda3937c2bc47fbc49d690"
 
-COMPATIBLE_MACHINE = "ti33x"
-PACKAGE_ARCH = "${MACHINE_ARCH}"
-
-PR = "r2"
+PR = "r3"
 
 SRC_URI = "file://init"
 
-- 
1.7.9.5


