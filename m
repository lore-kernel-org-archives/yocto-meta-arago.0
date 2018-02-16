Return-Path: <e-ruei1@ti.com>
Received: from fllnx209.ext.ti.com (fllnx209.ext.ti.com [198.47.19.16])
	by arago-project.org (Postfix) with ESMTPS id 8C1E6529EE
	for <meta-arago@arago-project.org>;
	Fri, 16 Feb 2018 20:56:01 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by fllnx209.ext.ti.com (8.15.1/8.15.1) with ESMTP id w1GKtfVj028737
	for <meta-arago@arago-project.org>; Fri, 16 Feb 2018 14:55:41 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ti.com;
	s=ti-com-17Q1; t=1518814541;
	bh=704QxCiZC0+WdVDDAKb+2DRjlQtSGNsbiLM7Ug0RNqc=;
	h=From:To:Subject:Date:In-Reply-To:References;
	b=GFxGrDgazB1CBShjQe4dlmkF5xq7tR3Pg9optzfysNxL5HEOivr56N5q026s25IvM
	zViW1+2E8/LckoLE2Na1PfyX4l2Lw/pRRw61kTFOJu4xpWUFXxr0j5/sxEMj7OG9pI
	9OwiNs7mMV8mcXUx/95iwFkd7szY+ys47zOzeQvg=
Received: from DLEE101.ent.ti.com (dlee101.ent.ti.com [157.170.170.31])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id w1GKtfLe027000
	for <meta-arago@arago-project.org>; Fri, 16 Feb 2018 14:55:41 -0600
Received: from DLEE107.ent.ti.com (157.170.170.37) by DLEE101.ent.ti.com
	(157.170.170.31) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1261.35;
	Fri, 16 Feb 2018 14:55:41 -0600
Received: from dflp33.itg.ti.com (10.64.6.16) by DLEE107.ent.ti.com
	(157.170.170.37) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.1261.35 via Frontend
	Transport; Fri, 16 Feb 2018 14:55:41 -0600
Received: from uda0850410.am.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])
	by dflp33.itg.ti.com (8.14.3/8.13.8) with ESMTP id w1GKtepi017265
	for <meta-arago@arago-project.org>; Fri, 16 Feb 2018 14:55:41 -0600
From: Eric Ruei <e-ruei1@ti.com>
To: <meta-arago@arago-project.org>
Date: Fri, 16 Feb 2018 15:55:36 -0500
Message-ID: <1518814536-42298-5-git-send-email-e-ruei1@ti.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1518814536-42298-1-git-send-email-e-ruei1@ti.com>
References: <1518814536-42298-1-git-send-email-e-ruei1@ti.com>
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: [morty/rocko/master][PATCH v2 4/4] ti-tisdk-makefile: add qt-tstat to MAKEFILES_MATRIX_GUI unconditionally
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

qt-tstat has been enhanced to support both Qt4 and Qt5

Signed-off-by: Eric Ruei <e-ruei1@ti.com>
---
 .../recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile_1.0.bb          | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile_1.0.bb b/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile_1.0.bb
index 29e74b0..0f7670c 100644
--- a/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile_1.0.bb
+++ b/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile_1.0.bb
@@ -50,11 +50,11 @@ SRC_URI = "\
     file://Makefile_barcode-roi \
 "
 
-PR = "r84"
+PR = "r85"
 
 MAKEFILES_MATRIX_GUI = "matrix-gui-browser \
                         refresh-screen \
-                        ${@base_conditional('QT_PROVIDER', 'qt5', '', 'qt-tstat', d)} \
+                        qt-tstat \
 "
 
 MAKEFILES_MATRIX_GUI_keystone = ""
-- 
1.9.1


