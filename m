Return-Path: <d-senicic1@ti.com>
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
	by arago-project.org (Postfix) with ESMTPS id D91FF529E1
	for <meta-arago@arago-project.org>;
	Tue, 10 Dec 2019 18:36:23 +0000 (UTC)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id xBAIYnSX006002
	for <meta-arago@arago-project.org>; Tue, 10 Dec 2019 12:34:49 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1576002889;
	bh=m9giqwcEa7R4KLGUl25lCNCMBA1Ee9gloI8WWX+CIcs=;
	h=From:To:CC:Subject:Date;
	b=uPhh9xhefAvt+bzYnOcU5brkVB2P1M3Ngv/o4Ka0+kBbmvq0NMkX+7PIynNG6eaKX
	E/90eWcsgXMJQuDb4EkQYExJQ0bx/y09q0H2kfMjdpgDZKH5qxmagAW3EbbRd+kMGt
	GY00Vn6VPvf3aUP0rFK9F3BSh+iYZ4R6Uu3EJRZ8=
Received: from DFLE105.ent.ti.com (dfle105.ent.ti.com [10.64.6.26])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id xBAIYnJB011436
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-arago@arago-project.org>; Tue, 10 Dec 2019 12:34:49 -0600
Received: from DFLE115.ent.ti.com (10.64.6.36) by DFLE105.ent.ti.com
	(10.64.6.26) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3;
	Tue, 10 Dec 2019 12:34:49 -0600
Received: from lelv0327.itg.ti.com (10.180.67.183) by DFLE115.ent.ti.com
	(10.64.6.36) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3 via
	Frontend Transport; Tue, 10 Dec 2019 12:34:49 -0600
Received: from uda0271529a.gt.design.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])
	by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id xBAIYmlU117853;
	Tue, 10 Dec 2019 12:34:48 -0600
From: Djordje Senicic <d-senicic1@ti.com>
To: <meta-arago@arago-project.org>
Date: Tue, 10 Dec 2019 13:32:35 -0500
Message-ID: <20191210183235.8074-1-d-senicic1@ti.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Cc: Djordje Senicic <d-senicic1@ti.com>
Subject: [thud/master][PATCH] matrix-gui-apps-git: Bump SRCREV to latest
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
X-List-Received-Date: Tue, 10 Dec 2019 18:36:24 -0000
Content-Type: text/plain

- Modify TIDL matrix-gui scripts to autodetect (on AM57xx SoC) and use available EVEs and DSPs

Signed-off-by: Djordje Senicic <d-senicic1@ti.com>
---
 meta-arago-extras/recipes-core/matrix/matrix-gui-apps-git.inc | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-arago-extras/recipes-core/matrix/matrix-gui-apps-git.inc b/meta-arago-extras/recipes-core/matrix/matrix-gui-apps-git.inc
index dbf42631..ef4ffd21 100644
--- a/meta-arago-extras/recipes-core/matrix/matrix-gui-apps-git.inc
+++ b/meta-arago-extras/recipes-core/matrix/matrix-gui-apps-git.inc
@@ -4,9 +4,9 @@ LICENSE_CHECKSUM = "LICENSE;md5=6e0ae7214f6c74c149cb25f373057fa9"
 LIC_FILES_CHKSUM := "file://../${LICENSE_CHECKSUM}"
 
 SRC_URI = "git://git.ti.com/matrix-gui-v2/matrix-gui-v2-apps.git;protocol=git;branch=${BRANCH}"
-SRCREV = "f06692ae4d8b8073321bcdb6571a9923b527a093"
+SRCREV = "c062a7a1b465e3a0d2761abff8808606e88619e5"
 BRANCH = "master"
-INC_PR = "r74"
+INC_PR = "r75"
 
 # Pull in the base package for installing matrix applications
 require matrix-gui-apps.inc
-- 
2.17.1


