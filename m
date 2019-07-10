Return-Path: <e-ruei1@ti.com>
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
	by arago-project.org (Postfix) with ESMTPS id C169652976
	for <meta-arago@arago-project.org>;
	Wed, 10 Jul 2019 17:57:33 +0000 (UTC)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id x6AHuk08054907
	for <meta-arago@arago-project.org>; Wed, 10 Jul 2019 12:56:46 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1562781406;
	bh=Dn3MmuvE2uPNwWm6+OULiLuU6vTboWTtc5wXmJdf/rM=;
	h=From:To:Subject:Date:In-Reply-To:References;
	b=TdRtCUWYk5+l6YSSlhdW3TZ2Wbjg9BFiCvSRQwDVS4P4IySN688FR/f+aaAYrYEqZ
	l3naEN8XJaMHMIDytoZzNd15yf//f4NN02ohnDIhMvjqTv6Gw5nYU6M7GztKrAfx6U
	7RF/1dCUEopQdwTDKWwoxLlpOU/DfjGJcFuUZUz8=
Received: from DFLE114.ent.ti.com (dfle114.ent.ti.com [10.64.6.35])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x6AHukfS078899
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-arago@arago-project.org>; Wed, 10 Jul 2019 12:56:46 -0500
Received: from DFLE115.ent.ti.com (10.64.6.36) by DFLE114.ent.ti.com
	(10.64.6.35) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5;
	Wed, 10 Jul 2019 12:56:45 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DFLE115.ent.ti.com
	(10.64.6.36) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
	Frontend Transport; Wed, 10 Jul 2019 12:56:45 -0500
Received: from UDA0850410.gt.design.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])
	by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id x6AHuiqd090359
	for <meta-arago@arago-project.org>; Wed, 10 Jul 2019 12:56:45 -0500
From: Eric Ruei <e-ruei1@ti.com>
To: <meta-arago@arago-project.org>
Date: Wed, 10 Jul 2019 13:55:45 -0400
Message-ID: <20190710175545.20003-2-e-ruei1@ti.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190710175545.20003-1-e-ruei1@ti.com>
References: <20190710175545.20003-1-e-ruei1@ti.com>
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: [PATCH 2/2] Re-enable wayland-ivi-entension
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
X-List-Received-Date: Wed, 10 Jul 2019 17:57:34 -0000
Content-Type: text/plain

The wayland-ivi-extension has been upgraded to 2.2.0 to be compatible with
weston 5.0.0 and therefore can be re-enabled.


Signed-off-by: Eric Ruei <e-ruei1@ti.com>
---
 .../packagegroups/packagegroup-arago-tisdk-graphics.bb          | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-graphics.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-graphics.bb
index cb7f68bc..003a9d9b 100644
--- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-graphics.bb
+++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-graphics.bb
@@ -4,11 +4,11 @@ PR = "r23"
 
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
2.17.1


