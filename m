Return-Path: <e-ruei1@ti.com>
Received: from lelnx194.ext.ti.com (lelnx194.ext.ti.com [198.47.27.80])
	by arago-project.org (Postfix) with ESMTPS id 2F9E052976
	for <meta-arago@arago-project.org>;
	Wed, 28 Feb 2018 18:41:39 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by lelnx194.ext.ti.com (8.15.1/8.15.1) with ESMTP id w1SIf4vB017876
	for <meta-arago@arago-project.org>; Wed, 28 Feb 2018 12:41:04 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ti.com;
	s=ti-com-17Q1; t=1519843264;
	bh=3b5tZTmVvoRLpKSipIF7Uw+qrxyE2097xF6Mv/QZbjQ=;
	h=From:To:Subject:Date:In-Reply-To:References;
	b=Yrwe8Lyhutye69TeNmb+UR+l7jdycDVLH/9g1YRdaYn/ut+nFJmJjuec4P1E91VFF
	IvAXBXUPcbdyrW8gVg2XeOW3aFSSU/DKACHDlqDjkGSDtLDs9SrRDtMwj7DLCz874s
	p7rWdSfGhfAHXSqVd1AlappZjw8W6sGwlzWcjJ/w=
Received: from DFLE100.ent.ti.com (dfle100.ent.ti.com [10.64.6.21])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id w1SIf4wl012540
	for <meta-arago@arago-project.org>; Wed, 28 Feb 2018 12:41:04 -0600
Received: from DFLE101.ent.ti.com (10.64.6.22) by DFLE100.ent.ti.com
	(10.64.6.21) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1261.35;
	Wed, 28 Feb 2018 12:41:04 -0600
Received: from dflp33.itg.ti.com (10.64.6.16) by DFLE101.ent.ti.com
	(10.64.6.22) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.1261.35 via Frontend
	Transport; Wed, 28 Feb 2018 12:41:04 -0600
Received: from uda0850410.am.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])
	by dflp33.itg.ti.com (8.14.3/8.13.8) with ESMTP id w1SIf3H5030624
	for <meta-arago@arago-project.org>; Wed, 28 Feb 2018 12:41:04 -0600
From: Eric Ruei <e-ruei1@ti.com>
To: <meta-arago@arago-project.org>
Date: Wed, 28 Feb 2018 13:40:58 -0500
Message-ID: <1519843260-55405-3-git-send-email-e-ruei1@ti.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1519843260-55405-1-git-send-email-e-ruei1@ti.com>
References: <1519843260-55405-1-git-send-email-e-ruei1@ti.com>
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: [morty/rocko/master][PATCH v3 2/4] packagegroup-arago-tisdk-matrix: add thermostat demo back to MATRIX_QT_APPS
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
X-List-Received-Date: Wed, 28 Feb 2018 18:41:39 -0000
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


