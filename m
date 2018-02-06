Return-Path: <e-ruei1@ti.com>
Received: from lelnx194.ext.ti.com (lelnx194.ext.ti.com [198.47.27.80])
	by arago-project.org (Postfix) with ESMTPS id 85FED529E1
	for <meta-arago@arago-project.org>;
	Tue,  6 Feb 2018 20:16:03 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by lelnx194.ext.ti.com (8.15.1/8.15.1) with ESMTP id w16KFuQG027932
	for <meta-arago@arago-project.org>; Tue, 6 Feb 2018 14:15:56 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ti.com;
	s=ti-com-17Q1; t=1517948156;
	bh=704QxCiZC0+WdVDDAKb+2DRjlQtSGNsbiLM7Ug0RNqc=;
	h=From:To:Subject:Date:In-Reply-To:References;
	b=j/dMNvXRR2gFhHCVZmswbIaQAG+4hZlI51pNrHvKcisfbP6+I7T+yABguN38cRlBO
	L4FUpocy2JuDLyzjJB0K0vXydxpcZj96jAV12a17YU1W05XMqRGcYOZpOrBu4fothE
	EufEPPmr0ZFj65LN1JDWhWSOMvZRHZa24cbTkDjg=
Received: from DFLE101.ent.ti.com (dfle101.ent.ti.com [10.64.6.22])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id w16KFu7g003780
	for <meta-arago@arago-project.org>; Tue, 6 Feb 2018 14:15:56 -0600
Received: from DFLE109.ent.ti.com (10.64.6.30) by DFLE101.ent.ti.com
	(10.64.6.22) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1261.35;
	Tue, 6 Feb 2018 14:15:56 -0600
Received: from dlep33.itg.ti.com (157.170.170.75) by DFLE109.ent.ti.com
	(10.64.6.30) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.1261.35 via Frontend
	Transport; Tue, 6 Feb 2018 14:15:56 -0600
Received: from uda0850410.am.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])
	by dlep33.itg.ti.com (8.14.3/8.13.8) with ESMTP id w16KFtSa029875
	for <meta-arago@arago-project.org>; Tue, 6 Feb 2018 14:15:56 -0600
From: Eric Ruei <e-ruei1@ti.com>
To: <meta-arago@arago-project.org>
Date: Tue, 6 Feb 2018 15:15:49 -0500
Message-ID: <1517948150-41783-4-git-send-email-e-ruei1@ti.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1517948150-41783-1-git-send-email-e-ruei1@ti.com>
References: <1517948150-41783-1-git-send-email-e-ruei1@ti.com>
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: [morty/master][PATCH 3/4] ti-tisdk-makefile: add qt-tstat to MAKEFILES_MATRIX_GUI unconditionally
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


