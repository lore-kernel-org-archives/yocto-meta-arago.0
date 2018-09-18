Return-Path: <j-stiffler@ti.com>
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
	by arago-project.org (Postfix) with ESMTPS id 8B8A2529A0
	for <meta-arago@arago-project.org>;
	Tue, 18 Sep 2018 17:57:52 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id w8IHviDC030522
	for <meta-arago@arago-project.org>; Tue, 18 Sep 2018 12:57:44 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1537293464;
	bh=bhs24Zxwc8MTMBr6NwwkkIvRUvEUjOv77Sq0OWBdr/c=;
	h=From:To:CC:Subject:Date;
	b=uKAEGwbjYcRJfqDtDq9kvNlwICU5ZVXOojn6QHismDeJ8C2f3FYZVc1CGPcuAX+fE
	kKLkJtgfKY5jvWUa0MaYMhMoetNH2P3UiVMQv6abV0J7AZebb+ysV/Bjb7i95s/q54
	iMtz464nRHll5cot8YbMPRXW3jwqMnsyjhpnD7nM=
Received: from DFLE108.ent.ti.com (dfle108.ent.ti.com [10.64.6.29])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id w8IHvipP026982
	for <meta-arago@arago-project.org>; Tue, 18 Sep 2018 12:57:44 -0500
Received: from DFLE105.ent.ti.com (10.64.6.26) by DFLE108.ent.ti.com
	(10.64.6.29) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1466.3;
	Tue, 18 Sep 2018 12:57:44 -0500
Received: from dlep32.itg.ti.com (157.170.170.100) by DFLE105.ent.ti.com
	(10.64.6.26) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.1466.3 via Frontend
	Transport; Tue, 18 Sep 2018 12:57:44 -0500
Received: from udd0866934.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])
	by dlep32.itg.ti.com (8.14.3/8.13.8) with ESMTP id w8IHvhN2004673;
	Tue, 18 Sep 2018 12:57:43 -0500
From: Jacob Stiffler <j-stiffler@ti.com>
To: <meta-arago@arago-project.org>
Date: Tue, 18 Sep 2018 13:45:12 -0400
Message-ID: <1537292712-26890-1-git-send-email-j-stiffler@ti.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: [rocko/master][PATCH] packagegroup-arago-tisdk-matrix: k3: remove PM demos
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
X-List-Received-Date: Tue, 18 Sep 2018 17:57:52 -0000
Content-Type: text/plain

* The scaling governor is  not supported on k3

Signed-off-by: Jacob Stiffler <j-stiffler@ti.com>
---
 .../recipes-core/packagegroups/packagegroup-arago-tisdk-matrix.bb   | 6 +-----
 1 file changed, 1 insertion(+), 5 deletions(-)

diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-matrix.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-matrix.bb
index 919bd41..cf91688 100644
--- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-matrix.bb
+++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-matrix.bb
@@ -1,6 +1,6 @@
 DESCRIPTION = "Task to include Matrix v2"
 LICENSE = "MIT"
-PR = "r73"
+PR = "r74"
 
 PACKAGE_ARCH = "${MACHINE_ARCH}"
 
@@ -147,10 +147,6 @@ MATRIX_APPS_append_k3 = "           \
     matrix-multimedia-demo-mpeg4aacdec \
     matrix-multimedia-demo-mpeg4dec \
                                     \
-    matrix-gui-generic-pm           \
-    matrix-gui-clocks               \
-    matrix-gui-pm-demos-governor    \
-                                    \
     matrix-hmi-demo-evse            \
                                     \
     ${MATRIX_OPENCV_ARM_ONLY_APPS}  \
-- 
2.7.4


