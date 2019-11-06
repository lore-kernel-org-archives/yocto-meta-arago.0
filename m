Return-Path: <e-ruei1@ti.com>
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
	by arago-project.org (Postfix) with ESMTPS id 3A78D529DE
	for <meta-arago@arago-project.org>;
	Wed,  6 Nov 2019 19:39:22 +0000 (UTC)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id xA6Jbv6E077857
	for <meta-arago@arago-project.org>; Wed, 6 Nov 2019 13:37:57 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1573069077;
	bh=Ml9qLYdz3uKywyumQ4jhewOX23eooHyAIeV3iMWFMjI=;
	h=From:To:Subject:Date;
	b=eXfDJ67S+kGuiWcqyPxD4BGn+YKhU9wAhfxEPdjMGFHYmoM9iweOlHFYVIfOKDnTc
	3s0L9+ALEAo1uZgZdBo/DyxD1xMausv6JrULsnm3PDmfuTD2OfV2ICkzcnH97emfMX
	Bii3ZEKuZXHgaW8MvuODPhQZ1qMdNZCAHg6IMKTY=
Received: from DLEE104.ent.ti.com (dlee104.ent.ti.com [157.170.170.34])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id xA6JbvZf073512
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-arago@arago-project.org>; Wed, 6 Nov 2019 13:37:57 -0600
Received: from DLEE111.ent.ti.com (157.170.170.22) by DLEE104.ent.ti.com
	(157.170.170.34) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3;
	Wed, 6 Nov 2019 13:37:42 -0600
Received: from fllv0040.itg.ti.com (10.64.41.20) by DLEE111.ent.ti.com
	(157.170.170.22) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3 via
	Frontend Transport; Wed, 6 Nov 2019 13:37:42 -0600
Received: from UDA0850410.gt.design.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])
	by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id xA6JbvIi090712
	for <meta-arago@arago-project.org>; Wed, 6 Nov 2019 13:37:57 -0600
From: Eric Ruei <e-ruei1@ti.com>
To: <meta-arago@arago-project.org>
Date: Wed, 6 Nov 2019 14:37:50 -0500
Message-ID: <20191106193750.5295-1-e-ruei1@ti.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: [thud/master][PATCH] point-cloud-viewer: bump SRCREV to pick up the latest
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
X-List-Received-Date: Wed, 06 Nov 2019 19:39:22 -0000
Content-Type: text/plain

* point-cloud-viewer: rebuild against the Mesa-based EGL

Signed-off-by: Eric Ruei <e-ruei1@ti.com>
---
 .../recipes-apps/point-cloud-viewer/point-cloud-viewer_git.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-arago-extras/recipes-apps/point-cloud-viewer/point-cloud-viewer_git.bb b/meta-arago-extras/recipes-apps/point-cloud-viewer/point-cloud-viewer_git.bb
index c448f501..8afd6c9e 100644
--- a/meta-arago-extras/recipes-apps/point-cloud-viewer/point-cloud-viewer_git.bb
+++ b/meta-arago-extras/recipes-apps/point-cloud-viewer/point-cloud-viewer_git.bb
@@ -11,9 +11,9 @@ BRANCH = "master"
 
 SRC_URI = "git://git.ti.com/processor-sdk/point-cloud-viewer.git;protocol=git;branch=${BRANCH}"
 
-SRCREV = "c4800b186744e9379c798299c5caa67f6a4468f0"
+SRCREV = "f0af54e63a6c802b4f8f0657873e74f1cb486e86"
 
-PV = "2.1"
+PV = "2.2"
 
 S = "${WORKDIR}/git"
 
-- 
2.17.1


