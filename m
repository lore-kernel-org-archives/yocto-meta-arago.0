Return-Path: <karthik.ramanan@ti.com>
Received: from lelnx193.ext.ti.com (lelnx193.ext.ti.com [198.47.27.77])
	by arago-project.org (Postfix) with ESMTPS id C212952A4E
	for <meta-arago@arago-project.org>;
	Fri, 22 Jun 2018 05:18:00 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by lelnx193.ext.ti.com (8.15.1/8.15.1) with ESMTP id w5M5Hsdh005900
	for <meta-arago@arago-project.org>; Fri, 22 Jun 2018 00:17:54 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1529644674;
	bh=GR/x9MTkJNmsWJyvxpcfCoezSZnmT8s2bjfYRQ7kpOE=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=pPGm5oKo+p166iCIVzhmzS50f0rcLbBMZ+/Suxga52c62FejSqAvBzMQ/hLtvkbEf
	3GkCRrQgxgi8sprU180tfY5SYzjN7jylWRM5hDIvJ/mTn0suig04SBV/tf9UumL70O
	LvbRqqWYd0WY3aljmoGU6+ny9GDVvVHVLIoP+/wI=
Received: from DLEE108.ent.ti.com (dlee108.ent.ti.com [157.170.170.38])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id w5M5HsoM006176
	for <meta-arago@arago-project.org>; Fri, 22 Jun 2018 00:17:54 -0500
Received: from DLEE107.ent.ti.com (157.170.170.37) by DLEE108.ent.ti.com
	(157.170.170.38) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1466.3;
	Fri, 22 Jun 2018 00:17:54 -0500
Received: from dflp32.itg.ti.com (10.64.6.15) by DLEE107.ent.ti.com
	(157.170.170.37) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.1466.3 via Frontend
	Transport; Fri, 22 Jun 2018 00:17:54 -0500
Received: from swubn03.india.ti.com (ileax41-snat.itg.ti.com [10.172.224.153])
	by dflp32.itg.ti.com (8.14.3/8.13.8) with ESMTP id w5M5HoGT013342;
	Fri, 22 Jun 2018 00:17:53 -0500
From: Karthik Ramanan <a0393906@ti.com>
To: <meta-arago@arago-project.org>
Date: Fri, 22 Jun 2018 10:47:48 +0530
Message-ID: <1529644668-63037-3-git-send-email-a0393906@ti.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1529644668-63037-1-git-send-email-a0393906@ti.com>
References: <1529644668-63037-1-git-send-email-a0393906@ti.com>
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: [rocko 3/3] packagegroup*-graphics: Enable wayland-ivi-extension
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
X-List-Received-Date: Fri, 22 Jun 2018 05:18:02 -0000
Content-Type: text/plain

Signed-off-by: Karthik Ramanan <a0393906@ti.com>
---
 .../recipes-core/packagegroups/packagegroup-arago-tisdk-graphics.bb     | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-graphics.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-graphics.bb
index 8029665..75cd9bc 100644
--- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-graphics.bb
+++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-graphics.bb
@@ -4,11 +4,11 @@ PR = "r20"
 
 inherit packagegroup
 
-#    wayland-ivi-extension
 GRAPHICS_WAYLAND = "\
     weston \
     weston-init \
     weston-examples \
+    wayland-ivi-extension \
 "
 
 GRAPHICS_WAYLAND_append_omap-a15 = "\
-- 
1.9.1


