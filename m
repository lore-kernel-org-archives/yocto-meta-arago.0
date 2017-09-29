Return-Path: <e-ruei1@ti.com>
Received: from lelnx194.ext.ti.com (lelnx194.ext.ti.com [198.47.27.80])
	by arago-project.org (Postfix) with ESMTPS id 03A6A52AF7
	for <meta-arago@arago-project.org>;
	Fri, 29 Sep 2017 18:23:37 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by lelnx194.ext.ti.com (8.15.1/8.15.1) with ESMTP id v8TINbG7007562
	for <meta-arago@arago-project.org>; Fri, 29 Sep 2017 13:23:37 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ti.com;
	s=ti-com-17Q1; t=1506709417;
	bh=KZ4j7UH2mIXWNnUie7fGdzeXcbD3MzKz7lGkoCdC64k=;
	h=From:To:Subject:Date:In-Reply-To:References;
	b=xf/eqtZ8PYZoyznOHn4KDTJQg2Y+YyySfXRUsLR3k3UPny0PBrLbGUFnmspXidmGE
	c9qawA3FekgnFfBK3YtkBOTcoINfasxy/IuMdDGOLPn9BT8qsV5P0foN2yYcU+9w1y
	vANeXOnvCLenScV5MALzC6JLCyaCwAWLNr6BI9Xo=
Received: from DLEE100.ent.ti.com (dlee100.ent.ti.com [157.170.170.30])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id v8TINbp4010458
	for <meta-arago@arago-project.org>; Fri, 29 Sep 2017 13:23:37 -0500
Received: from DLEE107.ent.ti.com (157.170.170.37) by DLEE100.ent.ti.com
	(157.170.170.30) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P256) id 15.1.845.34;
	Fri, 29 Sep 2017 13:23:37 -0500
Received: from dflp32.itg.ti.com (10.64.6.15) by DLEE107.ent.ti.com
	(157.170.170.37) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.845.34 via Frontend
	Transport; Fri, 29 Sep 2017 13:23:37 -0500
Received: from uda0850410.am.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])
	by dflp32.itg.ti.com (8.14.3/8.13.8) with ESMTP id v8TINW8l006890
	for <meta-arago@arago-project.org>; Fri, 29 Sep 2017 13:23:37 -0500
From: Eric Ruei <e-ruei1@ti.com>
To: <meta-arago@arago-project.org>
Date: Fri, 29 Sep 2017 14:23:26 -0400
Message-ID: <1506709407-16448-23-git-send-email-e-ruei1@ti.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1506709407-16448-1-git-send-email-e-ruei1@ti.com>
References: <1506709407-16448-1-git-send-email-e-ruei1@ti.com>
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: [meta-processor-sdk][morty-x11-experimental][PATCH 22/ matrix-gui-hmi-demos: remove unsupported HMI demos for X11(xsgx) build
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
X-List-Received-Date: Fri, 29 Sep 2017 18:23:43 -0000
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


