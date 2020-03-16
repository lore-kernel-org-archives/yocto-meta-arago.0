Return-Path: <denys@ti.com>
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
	by arago-project.org (Postfix) with ESMTPS id 2E5FF529AD
	for <meta-arago@arago-project.org>;
	Mon, 16 Mar 2020 15:35:19 +0000 (UTC)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 02GFXCNK092647
	for <meta-arago@arago-project.org>; Mon, 16 Mar 2020 10:33:12 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1584372792;
	bh=EsxF6lMT2cyjHzBiTXBwOIkLt89NrWQJFM07PLdWqm8=;
	h=From:To:CC:Subject:Date;
	b=ot9JiIPkOHkau+zCLDQCQxxwquHBvhoinBp/iL+DMtxPb7VQYwGJnkW90MAlAjq2k
	bzJT/5z34m+wa9JfFNavGuXbtsVs/ETZUdfApFzUXY5evb3paDR8w6lCYrTMoZ9Ana
	5jYq2vaSJdX0VDM2Dcn1Gen9coPDhjX2ANC69Bi8=
Received: from DFLE109.ent.ti.com (dfle109.ent.ti.com [10.64.6.30])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 02GFXCIa041415
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-arago@arago-project.org>; Mon, 16 Mar 2020 10:33:12 -0500
Received: from DFLE113.ent.ti.com (10.64.6.34) by DFLE109.ent.ti.com
	(10.64.6.30) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3;
	Mon, 16 Mar 2020 10:33:11 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DFLE113.ent.ti.com
	(10.64.6.34) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3 via
	Frontend Transport; Mon, 16 Mar 2020 10:33:11 -0500
Received: from puget.gt.design.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])
	by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 02GFXB3g125563;
	Mon, 16 Mar 2020 10:33:11 -0500
From: Denys Dmytriyenko <denys@ti.com>
To: <meta-arago@arago-project.org>
Date: Mon, 16 Mar 2020 15:11:08 +0000
Message-ID: <20200316151108.11026-1-denys@ti.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: [zeus/master][PATCH] packagegroups: move thttpd from console to misc group
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
X-List-Received-Date: Mon, 16 Mar 2020 15:35:19 -0000
Content-Type: text/plain

With this, thttpd will not be in default rootfs

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 .../recipes-core/packagegroups/packagegroup-arago-console.bb     | 1 -
 .../recipes-core/packagegroups/packagegroup-arago-misc.bb        | 1 +
 2 files changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-console.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-console.bb
index c3c2a2cb..5c348fa6 100644
--- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-console.bb
+++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-console.bb
@@ -63,7 +63,6 @@ ARAGO_SDK_PREREQ = "\
     jpeg \
     jpeg-tools \
     freetype \
-    thttpd \
     "
 
 ARAGO_CONSOLE = "\
diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-misc.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-misc.bb
index 091d728f..997192ef 100644
--- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-misc.bb
+++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-misc.bb
@@ -8,4 +8,5 @@ RDEPENDS_${PN} = "\
     nano \
     mc \
     rsync \
+    thttpd \
 "
-- 
2.17.1


