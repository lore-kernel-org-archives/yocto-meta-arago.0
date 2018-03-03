Return-Path: <e-ruei1@ti.com>
Received: from fllnx210.ext.ti.com (fllnx210.ext.ti.com [198.47.19.17])
	by arago-project.org (Postfix) with ESMTPS id D006452A69
	for <meta-arago@arago-project.org>;
	Sat,  3 Mar 2018 19:31:40 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by fllnx210.ext.ti.com (8.15.1/8.15.1) with ESMTP id w23JV2A1021305
	for <meta-arago@arago-project.org>; Sat, 3 Mar 2018 13:31:02 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ti.com;
	s=ti-com-17Q1; t=1520105462;
	bh=3b5tZTmVvoRLpKSipIF7Uw+qrxyE2097xF6Mv/QZbjQ=;
	h=From:To:Subject:Date:In-Reply-To:References;
	b=vNXikLLxjNoNCKfhM6JP1/bfXnH+enGIy3XKsLL8T6XqnsdYfMq9XKO74dNuzwsvY
	wWyhIwJHFDOZd6fWOgG6NpPqGacfG/jKOe7mZzKsWgguUDjY7YjT/+GKqDMA2dUE1L
	bJHIA/fBSF7juT3BRg8L0jmDa5G1OJH36semq4wc=
Received: from DLEE101.ent.ti.com (dlee101.ent.ti.com [157.170.170.31])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id w23JV2Pb021072
	for <meta-arago@arago-project.org>; Sat, 3 Mar 2018 13:31:02 -0600
Received: from DLEE100.ent.ti.com (157.170.170.30) by DLEE101.ent.ti.com
	(157.170.170.31) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1261.35;
	Sat, 3 Mar 2018 13:31:01 -0600
Received: from dflp32.itg.ti.com (10.64.6.15) by DLEE100.ent.ti.com
	(157.170.170.30) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.1261.35 via Frontend
	Transport; Sat, 3 Mar 2018 13:31:01 -0600
Received: from uda0850410.am.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])
	by dflp32.itg.ti.com (8.14.3/8.13.8) with ESMTP id w23JV07Z019492
	for <meta-arago@arago-project.org>; Sat, 3 Mar 2018 13:31:01 -0600
From: Eric Ruei <e-ruei1@ti.com>
To: <meta-arago@arago-project.org>
Date: Sat, 3 Mar 2018 14:30:53 -0500
Message-ID: <1520105455-43017-3-git-send-email-e-ruei1@ti.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1520105455-43017-1-git-send-email-e-ruei1@ti.com>
References: <1520105455-43017-1-git-send-email-e-ruei1@ti.com>
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: [morty/rocko/master][PATCH v4 2/4] packagegroup-arago-tisdk-matrix: add thermostat demo back to MATRIX_QT_APPS
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


