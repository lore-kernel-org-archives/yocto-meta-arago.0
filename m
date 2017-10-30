Return-Path: <karthik.ramanan@ti.com>
Received: from fllnx210.ext.ti.com (fllnx210.ext.ti.com [198.47.19.17])
	by arago-project.org (Postfix) with ESMTPS id EDF9C52A73
	for <meta-arago@arago-project.org>;
	Mon, 30 Oct 2017 06:24:23 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by fllnx210.ext.ti.com (8.15.1/8.15.1) with ESMTP id v9U6ONsm009089
	for <meta-arago@arago-project.org>; Mon, 30 Oct 2017 01:24:23 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ti.com;
	s=ti-com-17Q1; t=1509344663;
	bh=OnSNzwNDkRk1o2SzDpxl7LjdvDuwasRIEEqzKbdHEQI=;
	h=From:To:CC:Subject:Date;
	b=i6m7HqmZZB1O1Xbeclne/v49FFqVF+9zNWZfQHHxn0Ab/6LGq/+9o17CL8Xg7donu
	ZrGXZHAxCUjcQUVqAX6FhEpPIiBM5C54wL0b8sfPucT4/Q1DdzOMV+F7QmgZfKl81t
	kor4/1mWJFv/u+kHOpACb65QXjbVuLGXq2CgsWK8=
Received: from DFLE114.ent.ti.com (dfle114.ent.ti.com [10.64.6.35])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id v9U6ONuX022445
	for <meta-arago@arago-project.org>; Mon, 30 Oct 2017 01:24:23 -0500
Received: from DFLE109.ent.ti.com (10.64.6.30) by DFLE114.ent.ti.com
	(10.64.6.35) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P256) id 15.1.845.34;
	Mon, 30 Oct 2017 01:24:23 -0500
Received: from dflp32.itg.ti.com (10.64.6.15) by DFLE109.ent.ti.com
	(10.64.6.30) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.845.34 via Frontend
	Transport; Mon, 30 Oct 2017 01:24:23 -0500
Received: from swubn03.india.ti.com (ileax41-snat.itg.ti.com [10.172.224.153])
	by dflp32.itg.ti.com (8.14.3/8.13.8) with ESMTP id v9U6OL9Y008551;
	Mon, 30 Oct 2017 01:24:22 -0500
From: Karthik Ramanan <a0393906@ti.com>
To: <meta-arago@arago-project.org>
Date: Mon, 30 Oct 2017 11:54:19 +0530
Message-ID: <1509344659-103084-1-git-send-email-a0393906@ti.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: [krogoth] kmscube: Update SRCREV for Jitter fix
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
X-List-Received-Date: Mon, 30 Oct 2017 06:24:28 -0000
Content-Type: text/plain

This patch is introduces pageflip for all displays in modeset
and thus solving the jitter issue

Signed-off-by: Karthik Ramanan <a0393906@ti.com>
---
 meta-arago-extras/recipes-graphics/kmscube/kmscube_1.0.0.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-arago-extras/recipes-graphics/kmscube/kmscube_1.0.0.bb b/meta-arago-extras/recipes-graphics/kmscube/kmscube_1.0.0.bb
index 742d242..e5ef85b 100644
--- a/meta-arago-extras/recipes-graphics/kmscube/kmscube_1.0.0.bb
+++ b/meta-arago-extras/recipes-graphics/kmscube/kmscube_1.0.0.bb
@@ -10,8 +10,8 @@ PACKAGE_ARCH = "${MACHINE_ARCH}"
 
 inherit autotools pkgconfig
 
-PR = "r6"
-SRCREV = "24e94f583119896b3ab8ecc7b35c7de3160dcb1f"
+PR = "r8"
+SRCREV = "3e9807ddcf2b4e8ccf711cdaf851752ec40d7904"
 
 SRC_URI = "git://git.ti.com/glsdk/kmscube.git;protocol=git"
 
-- 
1.9.1


