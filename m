Return-Path: <e-ruei1@ti.com>
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
	by arago-project.org (Postfix) with ESMTPS id CAF5252A7F
	for <meta-arago@arago-project.org>;
	Wed, 29 Aug 2018 15:03:33 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id w7TF3Pxh052868
	for <meta-arago@arago-project.org>; Wed, 29 Aug 2018 10:03:25 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1535555005;
	bh=/GLQuFNS20jOHUAHwct7NbqV0sHh8inGzTvSZnNhMnU=;
	h=From:To:Subject:Date:In-Reply-To:References;
	b=Y5/q5IRjS2KoWs2wGR5CJ5AKC+h/2w2GqTqYBuwAWuf1fHcrxzIvjPXHYGKjiVKL/
	mnZ5Jsyw16PkAZNPnDkyyjSBBKiHuAoi2pohG77KKFkAtgJFWAW/RRyb0XkTA/Wnpa
	+1ez48ewIyt1bhj9Xnm4036ON5Bd0rBIAZ2Qb0gk=
Received: from DFLE101.ent.ti.com (dfle101.ent.ti.com [10.64.6.22])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id w7TF3POQ007465
	for <meta-arago@arago-project.org>; Wed, 29 Aug 2018 10:03:25 -0500
Received: from DFLE101.ent.ti.com (10.64.6.22) by DFLE101.ent.ti.com
	(10.64.6.22) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1466.3;
	Wed, 29 Aug 2018 10:03:25 -0500
Received: from dlep33.itg.ti.com (157.170.170.75) by DFLE101.ent.ti.com
	(10.64.6.22) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.1466.3 via Frontend
	Transport; Wed, 29 Aug 2018 10:03:25 -0500
Received: from uda0850410.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])
	by dlep33.itg.ti.com (8.14.3/8.13.8) with ESMTP id w7TF3OiV028516
	for <meta-arago@arago-project.org>; Wed, 29 Aug 2018 10:03:25 -0500
From: Eric Ruei <e-ruei1@ti.com>
To: <meta-arago@arago-project.org>
Date: Wed, 29 Aug 2018 11:03:16 -0400
Message-ID: <1535555000-25564-4-git-send-email-e-ruei1@ti.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1535555000-25564-1-git-send-email-e-ruei1@ti.com>
References: <1535555000-25564-1-git-send-email-e-ruei1@ti.com>
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: [PATCH 3/7] packagegroup-arago-tisdk-qte: replace qtwebengine examples with qtwebkit ones for k3 devices
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
X-List-Received-Date: Wed, 29 Aug 2018 15:03:35 -0000
Content-Type: text/plain

Note: qtwebengine-based browser does not work on k3 devices

Signed-off-by: Eric Ruei <e-ruei1@ti.com>
---
 .../recipes-core/packagegroups/packagegroup-arago-tisdk-qte.bb | 10 +++++++++-
 1 file changed, 9 insertions(+), 1 deletion(-)

diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-qte.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-qte.bb
index 4215653..e383ef4 100644
--- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-qte.bb
+++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-qte.bb
@@ -1,6 +1,6 @@
 DESCRIPTION = "Task to add Qt embedded related packages"
 LICENSE = "MIT"
-PR = "r18"
+PR = "r19"
 
 PACKAGE_ARCH = "${MACHINE_ARCH}"
 
@@ -27,6 +27,14 @@ QT5_DEMOS = "\
     qtwebengine-examples \
 "
 
+QT5_DEMOS_append_k3 = " qtwebkit-examples-examples"
+
+QT5_DEMOS_remove_k3 = "\
+    qtwebbrowser \
+    qtwebbrowser-examples \
+    qtwebengine-examples \
+"
+
 QT_DEMOS = "\
     qt-tstat \
 "
-- 
1.9.1


