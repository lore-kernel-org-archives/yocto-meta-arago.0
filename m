Return-Path: <e-ruei1@ti.com>
Received: from lelnx193.ext.ti.com (lelnx193.ext.ti.com [198.47.27.77])
	by arago-project.org (Postfix) with ESMTPS id 2311752A71
	for <meta-arago@arago-project.org>;
	Sat,  3 Mar 2018 19:31:41 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by lelnx193.ext.ti.com (8.15.1/8.15.1) with ESMTP id w23JV2d7003355
	for <meta-arago@arago-project.org>; Sat, 3 Mar 2018 13:31:02 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ti.com;
	s=ti-com-17Q1; t=1520105462;
	bh=ThVSbBY+wQquwWh6yrAG8GS9rQZLGL4L2aoGYbvn2w8=;
	h=From:To:Subject:Date:In-Reply-To:References;
	b=C80VejWHI0LoN+Cndr3tUmNaTmjNa8AoiOCUrX3AZ7GFXw9wMFkpUeZdIKBh74kKF
	p4xLZ4O1OMp9xHdwsP4ne/x5aPECUsr0U84WCGzXagFbEi90lSMXamHO2y5g8Zb8NT
	BW6dLMB9Fm8rIiNZA14hswS7BedUEBHjqIbPp/6A=
Received: from DFLE105.ent.ti.com (dfle105.ent.ti.com [10.64.6.26])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id w23JV2xp021122
	for <meta-arago@arago-project.org>; Sat, 3 Mar 2018 13:31:02 -0600
Received: from DFLE111.ent.ti.com (10.64.6.32) by DFLE105.ent.ti.com
	(10.64.6.26) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1261.35;
	Sat, 3 Mar 2018 13:31:01 -0600
Received: from dflp32.itg.ti.com (10.64.6.15) by DFLE111.ent.ti.com
	(10.64.6.32) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.1261.35 via Frontend
	Transport; Sat, 3 Mar 2018 13:31:01 -0600
Received: from uda0850410.am.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])
	by dflp32.itg.ti.com (8.14.3/8.13.8) with ESMTP id w23JV07a019492
	for <meta-arago@arago-project.org>; Sat, 3 Mar 2018 13:31:01 -0600
From: Eric Ruei <e-ruei1@ti.com>
To: <meta-arago@arago-project.org>
Date: Sat, 3 Mar 2018 14:30:54 -0500
Message-ID: <1520105455-43017-4-git-send-email-e-ruei1@ti.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1520105455-43017-1-git-send-email-e-ruei1@ti.com>
References: <1520105455-43017-1-git-send-email-e-ruei1@ti.com>
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: [morty/rocko/master][PATCH v4 3/4] packagegroup-arago-tisdk-qte(-sdk-host): move qt-tstat to QT_DEMOS
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
X-List-Received-Date: Sat, 03 Mar 2018 19:31:42 -0000
Content-Type: text/plain

qt-tstat has been enhanced to support both Qt4 and Qt5

Signed-off-by: Eric Ruei <e-ruei1@ti.com>
---
 .../packagegroups/packagegroup-arago-tisdk-qte-sdk-host.bb           | 5 ++---
 .../recipes-core/packagegroups/packagegroup-arago-tisdk-qte.bb       | 5 ++---
 2 files changed, 4 insertions(+), 6 deletions(-)

diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-qte-sdk-host.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-qte-sdk-host.bb
index 5d596f8..1cef6bb 100644
--- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-qte-sdk-host.bb
+++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-qte-sdk-host.bb
@@ -1,6 +1,6 @@
 DESCRIPTION = "Task to add Qt embedded related sources into the sdk"
 LICENSE = "MIT"
-PR = "r7"
+PR = "r8"
 
 PACKAGE_ARCH = "${MACHINE_ARCH}"
 
@@ -8,12 +8,11 @@ inherit packagegroup
 
 QT4_DEMOS = "\
     ${@base_conditional('ARAGO_QT_PROVIDER', 'qt4-embedded-gles', 'quick-playground-src', '', d)} \
-    qt-tstat-src \
 "
 
 QT_DEMOS = "\
+    qt-tstat-src \
 "
-#    qt-tstat-src 
 
 RDEPENDS_${PN} = "\
     ${@base_conditional('QT_PROVIDER', 'qt5', '', "${QT4_DEMOS}", d)} \
diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-qte.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-qte.bb
index f6f7468..4215653 100644
--- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-qte.bb
+++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-qte.bb
@@ -1,6 +1,6 @@
 DESCRIPTION = "Task to add Qt embedded related packages"
 LICENSE = "MIT"
-PR = "r17"
+PR = "r18"
 
 PACKAGE_ARCH = "${MACHINE_ARCH}"
 
@@ -10,7 +10,6 @@ QT4_DEMOS = "\
     qt4-embedded-examples \
     qt4-embedded-demos \
     ${@base_conditional('ARAGO_QT_PROVIDER', 'qt4-embedded-gles', 'quick-playground', '', d)} \
-    qt-tstat \
 "
 
 QT5_DEMOS = "\
@@ -29,8 +28,8 @@ QT5_DEMOS = "\
 "
 
 QT_DEMOS = "\
+    qt-tstat \
 "
-#    qt-tstat 
 
 RDEPENDS_${PN} = "\
     packagegroup-arago-qte \
-- 
1.9.1


