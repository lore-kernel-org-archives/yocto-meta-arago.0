Return-Path: <e-ruei1@ti.com>
Received: from lelnx193.ext.ti.com (lelnx193.ext.ti.com [198.47.27.77])
	by arago-project.org (Postfix) with ESMTPS id 1067552A99
	for <meta-arago@arago-project.org>;
	Tue,  3 Oct 2017 15:54:20 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by lelnx193.ext.ti.com (8.15.1/8.15.1) with ESMTP id v93FsKVI005806
	for <meta-arago@arago-project.org>; Tue, 3 Oct 2017 10:54:20 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ti.com;
	s=ti-com-17Q1; t=1507046060;
	bh=KZ4j7UH2mIXWNnUie7fGdzeXcbD3MzKz7lGkoCdC64k=;
	h=From:To:Subject:Date:In-Reply-To:References;
	b=cUwg2SZvUpdkG83Q8kI6h39XKJmpeaksWp2yIHA5eWSC8p148D3XS9sEIiRg4VKiQ
	CDYH7rUVQ1DiDDp6B5NeIGyJI81CAb0HCNPcfForWoy77fa2Of9Z38tboqXrQKeVKv
	2lQEqDrWHTeUV0sgllfoyuAbLFnosZ4FY/y1vSJA=
Received: from DFLE109.ent.ti.com (dfle109.ent.ti.com [10.64.6.30])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id v93FsKrM018744
	for <meta-arago@arago-project.org>; Tue, 3 Oct 2017 10:54:20 -0500
Received: from DFLE103.ent.ti.com (10.64.6.24) by DFLE109.ent.ti.com
	(10.64.6.30) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P256) id 15.1.845.34;
	Tue, 3 Oct 2017 10:54:19 -0500
Received: from dlep33.itg.ti.com (157.170.170.75) by DFLE103.ent.ti.com
	(10.64.6.24) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.845.34 via Frontend
	Transport; Tue, 3 Oct 2017 10:54:19 -0500
Received: from uda0850410.am.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])
	by dlep33.itg.ti.com (8.14.3/8.13.8) with ESMTP id v93FsFSJ013524
	for <meta-arago@arago-project.org>; Tue, 3 Oct 2017 10:54:19 -0500
From: Eric Ruei <e-ruei1@ti.com>
To: <meta-arago@arago-project.org>
Date: Tue, 3 Oct 2017 11:54:10 -0400
Message-ID: <1507046051-57949-23-git-send-email-e-ruei1@ti.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1507046051-57949-1-git-send-email-e-ruei1@ti.com>
References: <1507046051-57949-1-git-send-email-e-ruei1@ti.com>
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: [meta-processor-sdk][PATCH v2 22/23] matrix-gui-hmi-demos: remove unsupported HMI demos for X11(xsgx) build
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
X-List-Received-Date: Tue, 03 Oct 2017 15:54:21 -0000
Content-Type: text/plain

X11 build: remove atrix-hmi-demo-evse and matrix-hmi-demo-protection-relays

Signed-off-by: Eric Ruei <e-ruei1@ti.com>
---
 recipes-core/matrix/matrix-gui-hmi-demos_2.0.bb | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)
 mode change 100755 => 100644 recipes-core/matrix/matrix-gui-hmi-demos_2.0.bb

diff --git a/recipes-core/matrix/matrix-gui-hmi-demos_2.0.bb b/recipes-core/matrix/matrix-gui-hmi-demos_2.0.bb
old mode 100755
new mode 100644
index 1ed5a5e..20c0426
--- a/recipes-core/matrix/matrix-gui-hmi-demos_2.0.bb
+++ b/recipes-core/matrix/matrix-gui-hmi-demos_2.0.bb
@@ -15,8 +15,9 @@ HMI_RDEPENDS += "matrix-gui-apps-images matrix-gui-submenus-hmi"
 
 FILES_${PN} += "${MATRIX_BASE_DIR}/*"
 
-PACKAGES = "matrix-hmi-demo-evse \
-	    matrix-hmi-demo-protection-relays\
+
+PACKAGES = "${@bb.utils.contains("MACHINE_FEATURES", "xsgx", '', "matrix-hmi-demo-evse", d)} \
+	    ${@bb.utils.contains("MACHINE_FEATURES", "xsgx", '', "matrix-hmi-demo-protection-relays", d)} \
 "
 
 RDEPENDS_matrix-hmi-demo-evse = " \
-- 
1.9.1


