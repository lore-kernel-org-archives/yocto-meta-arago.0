Return-Path: <karthik.ramanan@ti.com>
Received: from lelnx194.ext.ti.com (lelnx194.ext.ti.com [198.47.27.80])
	by arago-project.org (Postfix) with ESMTPS id 99945520E3
	for <meta-arago@arago-project.org>;
	Thu, 20 Apr 2017 16:14:32 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by lelnx194.ext.ti.com (8.15.1/8.15.1) with ESMTP id v3KGEWgI011648
	for <meta-arago@arago-project.org>; Thu, 20 Apr 2017 11:14:32 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ti.com;
	s=ti-com-17Q1; t=1492704872;
	bh=Yq566DA+ZhQB/jh7xgMwjdFGH87iR1jdN2a6T8wow00=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=SYVHaa3Gkysd7DdApkd2iI+WITXmAizCcnrwo84G/vpfn7ATZx0S8wRWckF8MOyQl
	uRqeS4iaiK4l+xCGBdLUyyvh/eC9Ia0zBMAkRVhdhPKc/SSQ+eBXKIyvoePjZJMdn5
	E1oEYRFhybNFKCMze5ui333h8iRYeNzYwSZZPdN4=
Received: from DLEE71.ent.ti.com (dlee71.ent.ti.com [157.170.170.114])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id v3KGEWH9011393
	for <meta-arago@arago-project.org>; Thu, 20 Apr 2017 11:14:32 -0500
Received: from dflp32.itg.ti.com (10.64.6.15) by DLEE71.ent.ti.com
	(157.170.170.114) with Microsoft SMTP Server id 14.3.294.0;
	Thu, 20 Apr 2017 11:14:32 -0500
Received: from swubn03.india.ti.com (ileax41-snat.itg.ti.com [10.172.224.153])
	by dflp32.itg.ti.com (8.14.3/8.13.8) with ESMTP id v3KGERKJ000659;
	Thu, 20 Apr 2017 11:14:31 -0500
From: Karthik Ramanan <a0393906@ti.com>
To: <meta-arago@arago-project.org>
Date: Thu, 20 Apr 2017 21:44:23 +0530
Message-ID: <1492704863-125562-2-git-send-email-a0393906@ti.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1492704863-125562-1-git-send-email-a0393906@ti.com>
References: <1492704863-125562-1-git-send-email-a0393906@ti.com>
MIME-Version: 1.0
Subject: [morty 2/2] packagegroup*-graphics: Add wayland-ivi-extension
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
X-List-Received-Date: Thu, 20 Apr 2017 16:14:32 -0000
Content-Type: text/plain

Signed-off-by: Karthik Ramanan <a0393906@ti.com>
---
 .../recipes-core/packagegroups/packagegroup-arago-tisdk-graphics.bb      | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-graphics.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-graphics.bb
index 250a2f7..5dae1b5 100644
--- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-graphics.bb
+++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-graphics.bb
@@ -8,6 +8,7 @@ GRAPHICS_WESTON = "\
     weston \
     weston-init \
     weston-examples \
+    wayland-ivi-extension \
 "
 
 GRAPHICS_RDEPENDS = "\
-- 
1.9.1


