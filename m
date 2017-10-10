Return-Path: <h-gou@ti.com>
Received: from lelnx193.ext.ti.com (lelnx193.ext.ti.com [198.47.27.77])
	by arago-project.org (Postfix) with ESMTPS id 1F5F652A14
	for <meta-arago@arago-project.org>;
	Tue, 10 Oct 2017 16:04:34 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by lelnx193.ext.ti.com (8.15.1/8.15.1) with ESMTP id v9AG4Y8q014717
	for <meta-arago@arago-project.org>; Tue, 10 Oct 2017 11:04:34 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ti.com;
	s=ti-com-17Q1; t=1507651474;
	bh=PXjQXh3zJIHAzSjoXNOC6RZZ0aj6lhQoiyJtYghp6y4=;
	h=From:To:CC:Subject:Date;
	b=Qx9IZaE/FClGqcTBMDBWsFY/e+WCzGiJPWHvIBPbyZYZlPmxSoLTUXnz+N4SLYyj4
	kiU78paAXLKGaXtHCASDYYC+h7OOsgegf+bck3ppe+ZIp10gsatddQ9mGGQVGMJ1Gb
	bM8oLlI+U4rW3CAFeQdNQo2t1kd8oEzVsbqvUqd4=
Received: from DLEE115.ent.ti.com (dlee115.ent.ti.com [157.170.170.26])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id v9AG4XB6006365
	for <meta-arago@arago-project.org>; Tue, 10 Oct 2017 11:04:33 -0500
Received: from DLEE113.ent.ti.com (157.170.170.24) by DLEE115.ent.ti.com
	(157.170.170.26) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P256) id 15.1.845.34;
	Tue, 10 Oct 2017 11:04:33 -0500
Received: from dlep32.itg.ti.com (157.170.170.100) by DLEE113.ent.ti.com
	(157.170.170.24) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.845.34 via Frontend
	Transport; Tue, 10 Oct 2017 11:04:33 -0500
Received: from uda0271529.am.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])
	by dlep32.itg.ti.com (8.14.3/8.13.8) with ESMTP id v9AG4XbJ032687;
	Tue, 10 Oct 2017 11:04:33 -0500
From: Hongmei Gou <a0271529@ti.com>
To: <meta-arago@arago-project.org>
Date: Tue, 10 Oct 2017 12:04:31 -0400
Message-ID: <1507651471-4163-1-git-send-email-a0271529@ti.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Cc: Hongmei Gou <a0271529@ti.com>
Subject: [PATCH] matrix-gui: Bump SRCREV to get the fix for execute-command.sh
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
X-List-Received-Date: Tue, 10 Oct 2017 16:04:34 -0000
Content-Type: text/plain

* Fix for execute-command.sh:
  source /etc/profile.d/*.sh only when they exist

Signed-off-by: Hongmei Gou <a0271529@ti.com>
---
 meta-arago-extras/recipes-core/matrix/matrix-gui_2.0.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-arago-extras/recipes-core/matrix/matrix-gui_2.0.bb b/meta-arago-extras/recipes-core/matrix/matrix-gui_2.0.bb
index 507a98c..2bd0d89 100644
--- a/meta-arago-extras/recipes-core/matrix/matrix-gui_2.0.bb
+++ b/meta-arago-extras/recipes-core/matrix/matrix-gui_2.0.bb
@@ -6,7 +6,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=a886c9ef769b2d8271115d2502512e5d"
 
 SECTION = "multimedia"
 
-PR = "r32"
+PR = "r33"
 
 INITSCRIPT_NAME = "matrix-gui-2.0"
 INITSCRIPT_PARAMS = "defaults 97"
@@ -16,7 +16,7 @@ PACKAGE_ARCH = "${MACHINE_ARCH}"
 inherit update-rc.d
 
 BRANCH ?= "master"
-SRCREV = "621bab39c23ea476ec0b31a7baf86c1bd4f24ec4"
+SRCREV = "9a2d12590102fefc5c29fc9e8d346ce6b0198468"
 
 MATRIX_INITSCRIPT = "${@base_conditional('QT_PROVIDER', 'qt5', bb.utils.contains('DISTRO_FEATURES', 'wayland', 'init', 'init.eglfs', d), 'init', d)}"
 
-- 
1.9.1


