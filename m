Return-Path: <e-ruei1@ti.com>
Received: from lelnx193.ext.ti.com (lelnx193.ext.ti.com [198.47.27.77])
	by arago-project.org (Postfix) with ESMTPS id 1A3E452993
	for <meta-arago@arago-project.org>;
	Tue,  6 Feb 2018 20:16:03 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by lelnx193.ext.ti.com (8.15.1/8.15.1) with ESMTP id w16KFufe003481
	for <meta-arago@arago-project.org>; Tue, 6 Feb 2018 14:15:56 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ti.com;
	s=ti-com-17Q1; t=1517948156;
	bh=3b5tZTmVvoRLpKSipIF7Uw+qrxyE2097xF6Mv/QZbjQ=;
	h=From:To:Subject:Date:In-Reply-To:References;
	b=LCOb/Cyu+lEAFlmqTjYkmSVlbtesajwgp/+tI6v4oZ+60+fkS96DBppnY73zV+hAH
	XwtkmQGpWN5X25qE6ZgR4u//IyETg9uDW14+GNaBMPjuOTBTJlxOn/TF4arY6lgIye
	Wibu7ikYY4rSyhwqBjRDCcvxTFbWc4WK6cq4FtQg=
Received: from DFLE111.ent.ti.com (dfle111.ent.ti.com [10.64.6.32])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id w16KFuDg025439
	for <meta-arago@arago-project.org>; Tue, 6 Feb 2018 14:15:56 -0600
Received: from DFLE103.ent.ti.com (10.64.6.24) by DFLE111.ent.ti.com
	(10.64.6.32) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1261.35;
	Tue, 6 Feb 2018 14:15:55 -0600
Received: from dlep33.itg.ti.com (157.170.170.75) by DFLE103.ent.ti.com
	(10.64.6.24) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.1261.35 via Frontend
	Transport; Tue, 6 Feb 2018 14:15:55 -0600
Received: from uda0850410.am.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])
	by dlep33.itg.ti.com (8.14.3/8.13.8) with ESMTP id w16KFtSY029875
	for <meta-arago@arago-project.org>; Tue, 6 Feb 2018 14:15:55 -0600
From: Eric Ruei <e-ruei1@ti.com>
To: <meta-arago@arago-project.org>
Date: Tue, 6 Feb 2018 15:15:47 -0500
Message-ID: <1517948150-41783-2-git-send-email-e-ruei1@ti.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1517948150-41783-1-git-send-email-e-ruei1@ti.com>
References: <1517948150-41783-1-git-send-email-e-ruei1@ti.com>
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: [morty/master][PATCH 1/4] packagegroup-arago-tisdk-matrix: add thermostat demo back to MATRIX_QT_APPS
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
X-List-Received-Date: Tue, 06 Feb 2018 20:16:04 -0000
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


