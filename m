Return-Path: <x0038811@ti.com>
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
	by arago-project.org (Postfix) with ESMTPS id 45042520E2
	for <meta-arago@arago-project.org>;
	Mon,  9 Dec 2019 05:14:23 +0000 (UTC)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id xB95CnGI126812
	for <meta-arago@arago-project.org>; Sun, 8 Dec 2019 23:12:49 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1575868369;
	bh=PkQ1sRhFhaRlc9pIEu2sTvPylBEtIHsTuAY0qTECVwo=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=Brsm5Cb8eQgiUR+bjDMAh1HWpcvyHg8CwGDeByqmSIzZwC05HVUOVObop41A/n1lX
	BEiAEYy/oMrnptbgZyeLbzNAoShBrC77L5P6e50o/k6vLYaWSByFW2ZDJYBEBtHOLZ
	wifSb8790jbj2Gb01i+sbu1BbSxAbHQR9Tkn73Lw=
Received: from DFLE105.ent.ti.com (dfle105.ent.ti.com [10.64.6.26])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id xB95CnJa063320
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-arago@arago-project.org>; Sun, 8 Dec 2019 23:12:49 -0600
Received: from DFLE111.ent.ti.com (10.64.6.32) by DFLE105.ent.ti.com
	(10.64.6.26) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3;
	Sun, 8 Dec 2019 23:12:49 -0600
Received: from fllv0039.itg.ti.com (10.64.41.19) by DFLE111.ent.ti.com
	(10.64.6.32) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3 via
	Frontend Transport; Sun, 8 Dec 2019 23:12:48 -0600
Received: from udx0038811.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])
	by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id xB95Cjuv121595;
	Sun, 8 Dec 2019 23:12:48 -0600
From: Ramprasad N <x0038811@ti.com>
To: <meta-arago@arago-project.org>
Date: Mon, 9 Dec 2019 10:42:44 +0530
Message-ID: <1575868364-11275-2-git-send-email-x0038811@ti.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1575868364-11275-1-git-send-email-x0038811@ti.com>
References: <1575868364-11275-1-git-send-email-x0038811@ti.com>
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: [thud/master 1/1] kmscube: Update SRCREV for connector-ID fix
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
X-List-Received-Date: Mon, 09 Dec 2019 05:14:23 -0000
Content-Type: text/plain

KmsCube executed with connector-id as argument
resulted in SEgmentation fault due to previous commit's
one change.

Add : after c in argument list as fix

Signed-off-by: Ramprasad N <x0038811@ti.com>
---
 meta-arago-extras/recipes-graphics/kmscube/kmscube_1.0.0.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-arago-extras/recipes-graphics/kmscube/kmscube_1.0.0.bb b/meta-arago-extras/recipes-graphics/kmscube/kmscube_1.0.0.bb
index 2b305e7..782d21a 100644
--- a/meta-arago-extras/recipes-graphics/kmscube/kmscube_1.0.0.bb
+++ b/meta-arago-extras/recipes-graphics/kmscube/kmscube_1.0.0.bb
@@ -10,8 +10,8 @@ PACKAGE_ARCH = "${MACHINE_ARCH}"
 
 inherit autotools pkgconfig
 
-PR = "r13"
-SRCREV = "456cabc661caac5c60729751d45efd668faa8e97"
+PR = "r14"
+SRCREV = "7bc7ff6c4ead19761003ed4a08d00ce64effe38b"
 
 SRC_URI = "git://git.ti.com/glsdk/kmscube.git;protocol=git"
 
-- 
1.9.1


