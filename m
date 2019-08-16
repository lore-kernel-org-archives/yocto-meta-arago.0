Return-Path: <e-ruei1@ti.com>
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
	by arago-project.org (Postfix) with ESMTPS id 786BB520C0
	for <meta-arago@arago-project.org>;
	Fri, 16 Aug 2019 18:25:15 +0000 (UTC)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id x7GIOHLr002126
	for <meta-arago@arago-project.org>; Fri, 16 Aug 2019 13:24:17 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1565979857;
	bh=Ctr97USnJILP71nqsJwmTVyNjqNVk6ajUdEjVAOwm1I=;
	h=From:To:Subject:Date;
	b=B2CDCeDq/sZaXf/0DnghaUnrjfrlcQKOPTPKP7kCxwKLpfgVKZJlOm71AGiw41vDm
	6+is47jsLnFNBTTZCtUfvwQqduLRbbIKkdunZVWXjk63bzw0oL1AB0thzKxWSoRlwn
	LL+pXfjvpfxonfqXWE4J7En80L9La1aX6BSWm4UA=
Received: from DLEE106.ent.ti.com (dlee106.ent.ti.com [157.170.170.36])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x7GIOHEr002867
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-arago@arago-project.org>; Fri, 16 Aug 2019 13:24:17 -0500
Received: from DLEE113.ent.ti.com (157.170.170.24) by DLEE106.ent.ti.com
	(157.170.170.36) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5;
	Fri, 16 Aug 2019 13:24:16 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DLEE113.ent.ti.com
	(157.170.170.24) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
	Frontend Transport; Fri, 16 Aug 2019 13:24:16 -0500
Received: from UDA0850410.gt.design.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])
	by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id x7GIOGn9093817
	for <meta-arago@arago-project.org>; Fri, 16 Aug 2019 13:24:16 -0500
From: Eric Ruei <e-ruei1@ti.com>
To: <meta-arago@arago-project.org>
Date: Fri, 16 Aug 2019 14:23:05 -0400
Message-ID: <20190816182305.51342-1-e-ruei1@ti.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: [PATCH] dual-camera-demo: bump SRCREV to pick up the fix of text truncation
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
X-List-Received-Date: Fri, 16 Aug 2019 18:25:15 -0000
Content-Type: text/plain

- fix text truncation on LCD

Signed-off-by: Eric Ruei <e-ruei1@ti.com>
---
 .../dual-camera-demo/dual-camera-demo_1.0.bb                  | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-arago-extras/recipes-multimedia/dual-camera-demo/dual-camera-demo_1.0.bb b/meta-arago-extras/recipes-multimedia/dual-camera-demo/dual-camera-demo_1.0.bb
index 5a2ce2d7..66746793 100644
--- a/meta-arago-extras/recipes-multimedia/dual-camera-demo/dual-camera-demo_1.0.bb
+++ b/meta-arago-extras/recipes-multimedia/dual-camera-demo/dual-camera-demo_1.0.bb
@@ -7,10 +7,10 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=c7ca707704d3354a64feeb4f19f52eb5"
 DEPENDS += "libdrm cmem"
 require recipes-core/matrix/matrix-gui-paths.inc
 
-PR = "r19"
+PR = "r20"
 
 BRANCH = "master"
-SRCREV = "b335bdf26b00f6294bcf4807e9022c2c435855b7"
+SRCREV = "3188b1eacb14dda0dcf3a58877962d86687b6d20"
 
 SRC_URI = "git://git.ti.com/sitara-linux/dual-camera-demo.git;protocol=git;branch=${BRANCH} \
            file://desc_dual-camera.html \
-- 
2.17.1


