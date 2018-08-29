Return-Path: <e-ruei1@ti.com>
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
	by arago-project.org (Postfix) with ESMTPS id 12E3F52A76
	for <meta-arago@arago-project.org>;
	Wed, 29 Aug 2018 15:03:33 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id w7TF3PrB039399
	for <meta-arago@arago-project.org>; Wed, 29 Aug 2018 10:03:25 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1535555005;
	bh=gYsULohxle4EYrtYWpsy5/YLXeZ5Pq/fni7KzJZZk1Q=;
	h=From:To:Subject:Date:In-Reply-To:References;
	b=uoIS4M1ft61wz7QTuNpRdXlYI7pjtZWy+YgZ/HYx2IsmvaVZDaa1cwtvBlp6GX38T
	UVmwreUl+DeMR4xfVAkk1h+7xyA3ygtWGetjUlkSZI3BYvYUQQhk4QTBWpHNz8T6hD
	TdXG/Tde23VE/CezGp65Rv8d67CNhtDxsuBSg1OM=
Received: from DFLE102.ent.ti.com (dfle102.ent.ti.com [10.64.6.23])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id w7TF3PYM024358
	for <meta-arago@arago-project.org>; Wed, 29 Aug 2018 10:03:25 -0500
Received: from DFLE110.ent.ti.com (10.64.6.31) by DFLE102.ent.ti.com
	(10.64.6.23) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1466.3;
	Wed, 29 Aug 2018 10:03:24 -0500
Received: from dlep33.itg.ti.com (157.170.170.75) by DFLE110.ent.ti.com
	(10.64.6.31) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.1466.3 via Frontend
	Transport; Wed, 29 Aug 2018 10:03:24 -0500
Received: from uda0850410.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])
	by dlep33.itg.ti.com (8.14.3/8.13.8) with ESMTP id w7TF3OiT028516
	for <meta-arago@arago-project.org>; Wed, 29 Aug 2018 10:03:24 -0500
From: Eric Ruei <e-ruei1@ti.com>
To: <meta-arago@arago-project.org>
Date: Wed, 29 Aug 2018 11:03:14 -0400
Message-ID: <1535555000-25564-2-git-send-email-e-ruei1@ti.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1535555000-25564-1-git-send-email-e-ruei1@ti.com>
References: <1535555000-25564-1-git-send-email-e-ruei1@ti.com>
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: [PATCH 1/7] packagegroup-arago-qte: replace qtwebengine with qtwebkit for k3 devices
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
X-List-Received-Date: Wed, 29 Aug 2018 15:03:34 -0000
Content-Type: text/plain

Note: qtwebengine does not work on K3 devices

Signed-off-by: Eric Ruei <e-ruei1@ti.com>
---
 .../recipes-core/packagegroups/packagegroup-arago-qte.bb         | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-qte.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-qte.bb
index d9486a3..a03f283 100644
--- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-qte.bb
+++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-qte.bb
@@ -1,6 +1,6 @@
 DESCRIPTION = "Task to add Qt embedded related packages"
 LICENSE = "MIT"
-PR = "r13"
+PR = "r14"
 
 PACKAGE_ARCH = "${MACHINE_ARCH}"
 
@@ -46,6 +46,13 @@ QT5_ESSENTIALS = "\
     qtconnectivity-qmlplugins \
 "
 
+QT5_ESSENTIALS_append_k3 = "\
+    qtwebkit-qmlplugins \
+"
+QT5_ESSENTIALS_remove_k3 = "\
+    qtwebengine-qmlplugins \
+"
+
 RDEPENDS_${PN} = "\
     ${@base_conditional('QT_PROVIDER', 'qt5', "${QT5_ESSENTIALS}", "${QT4_ESSENTIALS}", d)} \
 "
-- 
1.9.1


