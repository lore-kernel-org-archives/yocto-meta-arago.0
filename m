Return-Path: <e-ruei1@ti.com>
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
	by arago-project.org (Postfix) with ESMTPS id 222F252986
	for <meta-arago@arago-project.org>;
	Mon,  9 Dec 2019 14:12:19 +0000 (UTC)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id xB9EAjmg004494
	for <meta-arago@arago-project.org>; Mon, 9 Dec 2019 08:10:45 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1575900645;
	bh=IAZMwxTTDV49cLnwQf8T1EQuf9bhio8SqsAfXpBdQ24=;
	h=From:To:Subject:Date;
	b=t33mddb6nj8SnbvWIVjkqt7+DFcF0Ind0i9ccx0sXr/oF5ULnM0gV6XY+l/Q0x5lF
	Wim+D/WqXjfZFV2oFqAe6V5j36wOcXFBt4iL92xHYEl6mRrCdBvWF8XorR/azmaMvR
	0AwSUSid0Ac6NgavqSe0NwgMl8LG11gDZCeWM32Y=
Received: from DLEE115.ent.ti.com (dlee115.ent.ti.com [157.170.170.26])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id xB9EAjsg026962
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-arago@arago-project.org>; Mon, 9 Dec 2019 08:10:45 -0600
Received: from DLEE100.ent.ti.com (157.170.170.30) by DLEE115.ent.ti.com
	(157.170.170.26) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3;
	Mon, 9 Dec 2019 08:10:44 -0600
Received: from fllv0040.itg.ti.com (10.64.41.20) by DLEE100.ent.ti.com
	(157.170.170.30) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3 via
	Frontend Transport; Mon, 9 Dec 2019 08:10:44 -0600
Received: from UDA0850410.gt.design.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])
	by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id xB9EAiCv009458
	for <meta-arago@arago-project.org>; Mon, 9 Dec 2019 08:10:44 -0600
From: Eric Ruei <e-ruei1@ti.com>
To: <meta-arago@arago-project.org>
Date: Mon, 9 Dec 2019 09:09:51 -0500
Message-ID: <20191209140951.15445-1-e-ruei1@ti.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: [meta-processor-sdk][PATCH] packagegroup-arago-tisdk-multimedia: remove chromium-wayland
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
X-List-Received-Date: Mon, 09 Dec 2019 14:12:20 -0000
Content-Type: text/plain

chromium-wayland has been renamed to chromium-ozone-wayland and included at
packagegroup-arago-tisdk-graphics.

Signed-off-by: Eric Ruei <e-ruei1@ti.com>
---
 .../packagegroup-arago-tisdk-multimedia.bbappend       | 10 +---------
 1 file changed, 1 insertion(+), 9 deletions(-)

diff --git a/recipes-core/packagegroups/packagegroup-arago-tisdk-multimedia.bbappend b/recipes-core/packagegroups/packagegroup-arago-tisdk-multimedia.bbappend
index c48ba85..42e8e33 100644
--- a/recipes-core/packagegroups/packagegroup-arago-tisdk-multimedia.bbappend
+++ b/recipes-core/packagegroups/packagegroup-arago-tisdk-multimedia.bbappend
@@ -1,14 +1,6 @@
-PR_append = ".tisdk3"
+PR_append = ".tisdk4"
 
 MULTIMEDIA_append_omap-a15 = " \
-    ${@['','chromium-wayland'][bb.utils.contains('MACHINE_FEATURES', 'gpu', True, False, d) and bb.utils.contains('DISTRO_FEATURES', 'wayland', True, False, d)]} \
     ${@bb.utils.contains('MACHINE_FEATURES', 'gpu', 'video-graphics-test', '', d)} \
 "
 
-MULTIMEDIA_append_ti43x = " \
-    ${@['','chromium-wayland'][bb.utils.contains('MACHINE_FEATURES', 'gpu', True, False, d) and bb.utils.contains('DISTRO_FEATURES', 'wayland', True, False, d)]} \
-"
-
-MULTIMEDIA_append_ti33x = " \
-    ${@['','chromium-wayland'][bb.utils.contains('MACHINE_FEATURES', 'gpu', True, False, d) and bb.utils.contains('DISTRO_FEATURES', 'wayland', True, False, d)]} \
-"
-- 
2.17.1


