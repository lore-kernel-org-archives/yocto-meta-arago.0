Return-Path: <fcooper@ti.com>
Received: from arroyo.ext.ti.com (arroyo.ext.ti.com [192.94.94.40])
	by arago-project.org (Postfix) with ESMTPS id 938C0529DD
	for <meta-arago@arago-project.org>;
	Tue, 13 Jan 2015 21:26:35 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by arroyo.ext.ti.com (8.13.7/8.13.7) with ESMTP id t0DLQZIT013342
	for <meta-arago@arago-project.org>; Tue, 13 Jan 2015 15:26:35 -0600
Received: from DFLE72.ent.ti.com (dfle72.ent.ti.com [128.247.5.109])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id t0DLQZHQ001477
	for <meta-arago@arago-project.org>; Tue, 13 Jan 2015 15:26:35 -0600
Received: from dflp33.itg.ti.com (10.64.6.16) by DFLE72.ent.ti.com
	(128.247.5.109) with Microsoft SMTP Server id 14.3.174.1;
	Tue, 13 Jan 2015 15:26:34 -0600
Received: from dbdmail01.india.ti.com (dbdmail01.india.ti.com
	[172.24.162.206])	by dflp33.itg.ti.com (8.14.3/8.13.8) with ESMTP id
	t0DLQXan011909;	Tue, 13 Jan 2015 15:26:34 -0600
Received: from sdit-build02.dal.design.ti.com (sdit-build02.dal.design.ti.com
	[10.247.66.5])	by dbdmail01.india.ti.com (8.14.3/8.14.3/SuSE Linux
	0.8) with ESMTP id t0DLQRbm027265;	Wed, 14 Jan 2015 02:56:32 +0530
From: "Franklin S. Cooper Jr" <fcooper@ti.com>
To: <meta-arago@arago-project.org>
Date: Tue, 13 Jan 2015 15:26:25 -0600
Message-ID: <1421184385-21751-4-git-send-email-fcooper@ti.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <1421184385-21751-1-git-send-email-fcooper@ti.com>
References: <1421184385-21751-1-git-send-email-fcooper@ti.com>
MIME-Version: 1.0
Cc: "Franklin S. Cooper Jr" <fcooper@ti.com>
Subject: [PATCH 4/4] packagegroup-arago-tisdk-qte-sdk-host: Add tstat when Qt 4 is being used.
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
X-List-Received-Date: Tue, 13 Jan 2015 21:26:35 -0000
Content-Type: text/plain

From: "Franklin S. Cooper Jr" <fcooper@ti.com>

* Thermostat application still need to be fixed for Qt 5 but until then include
  for Qt 4 based filesystems.

Signed-off-by: Franklin S. Cooper Jr <fcooper@ti.com>
---
 .../packagegroup-arago-tisdk-qte-sdk-host.bb       |    3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-qte-sdk-host.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-qte-sdk-host.bb
index 1f541cc..b6ddb32 100644
--- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-qte-sdk-host.bb
+++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-qte-sdk-host.bb
@@ -1,6 +1,6 @@
 DESCRIPTION = "Task to add Qt embedded related sources into the sdk"
 LICENSE = "MIT"
-PR = "r5"
+PR = "r6"
 
 inherit packagegroup
 
@@ -8,6 +8,7 @@ PACKAGE_ARCH = "${MACHINE_ARCH}"
 
 QT4_DEMOS = "\
     ${@base_conditional('ARAGO_QT_PROVIDER', 'qt4-embedded-gles', 'quick-playground-src', '', d)} \
+    qt-tstat-src \
 "
 
 QT_DEMOS = "\
-- 
1.7.9.5


