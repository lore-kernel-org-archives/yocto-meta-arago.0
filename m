Return-Path: <e-ruei1@ti.com>
Received: from fllnx210.ext.ti.com (fllnx210.ext.ti.com [198.47.19.17])
	by arago-project.org (Postfix) with ESMTPS id 1D34B529AB
	for <meta-arago@arago-project.org>;
	Fri, 16 Feb 2018 20:56:01 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by fllnx210.ext.ti.com (8.15.1/8.15.1) with ESMTP id w1GKtfsP014283
	for <meta-arago@arago-project.org>; Fri, 16 Feb 2018 14:55:41 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ti.com;
	s=ti-com-17Q1; t=1518814541;
	bh=3b5tZTmVvoRLpKSipIF7Uw+qrxyE2097xF6Mv/QZbjQ=;
	h=From:To:Subject:Date:In-Reply-To:References;
	b=i8Wkh4DpBXF+DJWp3WszYGhl5U5KUMQFYX7S5uqaW398RC7xXYZD08CVYlqaUZMGE
	dQINPjEEEy+LjbQS3oUPai/jOVBKL9Y+CgLvV3tUEB3R8N+DE8CrHyJ2b43uLcuA/A
	o63Xxb9SqHDSs9xsZfBqijmFf54e1J8qppCo7los=
Received: from DLEE102.ent.ti.com (dlee102.ent.ti.com [157.170.170.32])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id w1GKtf5U026985
	for <meta-arago@arago-project.org>; Fri, 16 Feb 2018 14:55:41 -0600
Received: from DLEE115.ent.ti.com (157.170.170.26) by DLEE102.ent.ti.com
	(157.170.170.32) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1261.35;
	Fri, 16 Feb 2018 14:55:41 -0600
Received: from dflp33.itg.ti.com (10.64.6.16) by DLEE115.ent.ti.com
	(157.170.170.26) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.1261.35 via Frontend
	Transport; Fri, 16 Feb 2018 14:55:41 -0600
Received: from uda0850410.am.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])
	by dflp33.itg.ti.com (8.14.3/8.13.8) with ESMTP id w1GKtepg017265
	for <meta-arago@arago-project.org>; Fri, 16 Feb 2018 14:55:40 -0600
From: Eric Ruei <e-ruei1@ti.com>
To: <meta-arago@arago-project.org>
Date: Fri, 16 Feb 2018 15:55:34 -0500
Message-ID: <1518814536-42298-3-git-send-email-e-ruei1@ti.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1518814536-42298-1-git-send-email-e-ruei1@ti.com>
References: <1518814536-42298-1-git-send-email-e-ruei1@ti.com>
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: [morty/rocko/master][PATCH v2 2/4] packagegroup-arago-tisdk-matrix: add thermostat demo back to MATRIX_QT_APPS
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
X-List-Received-Date: Fri, 16 Feb 2018 20:56:02 -0000
Content-Type: text/plain

note: The thermostat demo was removed from MATRIX_QT_APPS because it was for
      Qt4 only

Signed-off-by: Eric Ruei <e-ruei1@ti.com>
---
 .../recipes-core/packagegroups/packagegroup-arago-tisdk-matrix.bb     | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-matrix.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-matrix.bb
index 0cae08d..f1c3083 100644
--- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-matrix.bb
+++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-matrix.bb
@@ -1,6 +1,6 @@
 DESCRIPTION = "Task to include Matrix v2"
 LICENSE = "MIT"
-PR = "r68"
+PR = "r69"
 
 PACKAGE_ARCH = "${MACHINE_ARCH}"
 
@@ -31,9 +31,9 @@ MATRIX_COMMON_APPS = "              \
     ${@bb.utils.contains('DISTRO_FEATURES', 'wayland', 'matrix-gui-weston-terminal-demo', '', d)} \
 "
 
-#    matrix-gui-thermostat-demo
 MATRIX_QT_APPS = " \
     matrix-gui-qt5-demos \
+    matrix-gui-thermostat-demo \
 "
 
 MATRIX_TOUCH_APPS = " \
-- 
1.9.1


