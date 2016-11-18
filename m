Return-Path: <e-ruei1@ti.com>
Received: from lelnx194.ext.ti.com (lelnx194.ext.ti.com [198.47.27.80])
	by arago-project.org (Postfix) with ESMTPS id C2C0D52ACD
	for <meta-arago@arago-project.org>;
	Fri, 18 Nov 2016 18:46:04 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by lelnx194.ext.ti.com (8.15.1/8.15.1) with ESMTP id uAIIk4Nu026826
	for <meta-arago@arago-project.org>; Fri, 18 Nov 2016 12:46:04 -0600
Received: from DFLE73.ent.ti.com (dfle73.ent.ti.com [128.247.5.110])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id uAIIk490009168
	for <meta-arago@arago-project.org>; Fri, 18 Nov 2016 12:46:04 -0600
Received: from dflp32.itg.ti.com (10.64.6.15) by DFLE73.ent.ti.com
	(128.247.5.110) with Microsoft SMTP Server id 14.3.294.0;
	Fri, 18 Nov 2016 12:46:04 -0600
Received: from uda0850410.am.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])	by dflp32.itg.ti.com (8.14.3/8.13.8) with ESMTP id
	uAIIk3Cd017375	for <meta-arago@arago-project.org>;
	Fri, 18 Nov 2016 12:46:04 -0600
From: Eric Ruei <e-ruei1@ti.com>
To: <meta-arago@arago-project.org>
Date: Fri, 18 Nov 2016 13:45:58 -0500
Message-ID: <1479494759-57664-3-git-send-email-e-ruei1@ti.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1479494759-57664-1-git-send-email-e-ruei1@ti.com>
References: <1479494759-57664-1-git-send-email-e-ruei1@ti.com>
MIME-Version: 1.0
Subject: [PATCH 2/3] packagegroup-arago-tisdk-qte: Add QtWebengine examples to Qt5 demos
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
X-List-Received-Date: Fri, 18 Nov 2016 18:46:05 -0000
Content-Type: text/plain

Signed-off-by: Eric Ruei <e-ruei1@ti.com>
---
 .../recipes-core/packagegroups/packagegroup-arago-tisdk-qte.bb         | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-qte.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-qte.bb
index 6dd58ae..1df51e7 100644
--- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-qte.bb
+++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-qte.bb
@@ -1,6 +1,6 @@
 DESCRIPTION = "Task to add Qt embedded related packages"
 LICENSE = "MIT"
-PR = "r14"
+PR = "r15"
 
 PACKAGE_ARCH = "${MACHINE_ARCH}"
 
@@ -24,6 +24,7 @@ QT5_DEMOS = "\
     ${@bb.utils.contains('DISTRO_FEATURES', 'wayland', 'qtwayland-examples', '', d)} \
     qtwebkit-examples-examples \
     qtquick1-examples \
+    qtwebengine-examples \
 "
 
 QT_DEMOS = "\
-- 
1.9.1


