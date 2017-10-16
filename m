Return-Path: <karthik.ramanan@ti.com>
Received: from lelnx194.ext.ti.com (lelnx194.ext.ti.com [198.47.27.80])
	by arago-project.org (Postfix) with ESMTPS id C795D5299D
	for <meta-arago@arago-project.org>;
	Mon, 16 Oct 2017 11:02:44 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by lelnx194.ext.ti.com (8.15.1/8.15.1) with ESMTP id v9GB2iLW001907
	for <meta-arago@arago-project.org>; Mon, 16 Oct 2017 06:02:44 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ti.com;
	s=ti-com-17Q1; t=1508151764;
	bh=1aXRF7tvU4SIC8QwgKgrNoexDApIevMK6/7xLSeBCcc=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=e0PzR6ST0CCRfY+8QgHf0RzzXdeY1uKH1W0vtb4i/QtaW1n/CYqoG2bzwET5Wsg8A
	PCc+Z5I9+pEZrXex7mTJ29Blioizo+rIyaO58YcqTaWCh+cNTfElhTSmAil1ZECov0
	pS6B/+984KF4kdWETr0t6CMiqm8sTedeFuhXwo1U=
Received: from DLEE112.ent.ti.com (dlee112.ent.ti.com [157.170.170.23])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id v9GB2i3I025662
	for <meta-arago@arago-project.org>; Mon, 16 Oct 2017 06:02:44 -0500
Received: from DLEE109.ent.ti.com (157.170.170.41) by DLEE112.ent.ti.com
	(157.170.170.23) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P256) id 15.1.845.34;
	Mon, 16 Oct 2017 06:02:44 -0500
Received: from dflp32.itg.ti.com (10.64.6.15) by DLEE109.ent.ti.com
	(157.170.170.41) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.845.34 via Frontend
	Transport; Mon, 16 Oct 2017 06:02:44 -0500
Received: from swubn03.india.ti.com (ileax41-snat.itg.ti.com [10.172.224.153])
	by dflp32.itg.ti.com (8.14.3/8.13.8) with ESMTP id v9GB2f9B030238;
	Mon, 16 Oct 2017 06:02:43 -0500
From: Karthik Ramanan <a0393906@ti.com>
To: <meta-arago@arago-project.org>
Date: Mon, 16 Oct 2017 16:32:39 +0530
Message-ID: <1508151759-180195-2-git-send-email-a0393906@ti.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1508151759-180195-1-git-send-email-a0393906@ti.com>
References: <1508151759-180195-1-git-send-email-a0393906@ti.com>
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: [morty 2/2] packagegroup-*-graphics: Add util-scripts into the image
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
X-List-Received-Date: Mon, 16 Oct 2017 11:02:45 -0000
Content-Type: text/plain

From meta-arago/krogoth
commit c655e22f3f2029831cc4c8942605c85aae8c0569

Signed-off-by: Karthik Ramanan <a0393906@ti.com>
---
 .../packagegroups/packagegroup-arago-tisdk-graphics.bb         | 10 +++++++++-
 1 file changed, 9 insertions(+), 1 deletion(-)

diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-graphics.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-graphics.bb
index b19e759..b19f6ba 100644
--- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-graphics.bb
+++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-graphics.bb
@@ -1,6 +1,6 @@
 DESCRIPTION = "Task to install graphics binaries"
 LICENSE = "MIT"
-PR = "r17"
+PR = "r18"
 
 inherit packagegroup
 
@@ -21,6 +21,13 @@ GRAPHICS_RDEPENDS = "\
     ti-sgx-ddk-um \
 "
 
+GRAPHICS_DISPLAY_UTILS = "\
+"
+
+GRAPHICS_DISPLAY_UTILS_append_omap-a15  = "\
+    glsdk-util-scripts \
+"
+
 GRAPHICS_RDEPENDS_append_omap-a15 = "\
     ti-gc320-tests \
     ti-gc320-driver \
@@ -30,4 +37,5 @@ GRAPHICS_RDEPENDS_append_omap-a15 = "\
 RDEPENDS_${PN} = "\
     ${@bb.utils.contains('DISTRO_FEATURES', 'wayland', "${GRAPHICS_WAYLAND}", '', d)} \
     ${GRAPHICS_RDEPENDS} \
+    ${GRAPHICS_DISPLAY_UTILS} \
 "
-- 
1.9.1


