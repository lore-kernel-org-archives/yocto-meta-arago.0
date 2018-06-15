Return-Path: <e-ruei1@ti.com>
Received: from fllnx210.ext.ti.com (fllnx210.ext.ti.com [198.47.19.17])
	by arago-project.org (Postfix) with ESMTPS id 05F8252987
	for <meta-arago@arago-project.org>;
	Fri, 15 Jun 2018 18:17:43 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by fllnx210.ext.ti.com (8.15.1/8.15.1) with ESMTP id w5FIHcU4003216
	for <meta-arago@arago-project.org>; Fri, 15 Jun 2018 13:17:38 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1529086658;
	bh=SZ3n/Y48BJTGYIhmQWocV5UmlxFw0y+4XHJoD9tWhQ4=;
	h=From:To:Subject:Date;
	b=iQNMN5pcjqrrqHEBg/L9rcU8sJ8B1YFaKbwnl2MguxF0ABxtSuC96ZhNwsp5KirOP
	hOTgGAEdbvC3AyYqSD/Wms4Bj6I81Lebd8WOFKAAYFZYV19hhdTDjc0/jrsmhDuPF+
	0JB4D+E6+TmdFT6YO5c9vRiazsqD/4Y4GELIAMAs=
Received: from DLEE109.ent.ti.com (dlee109.ent.ti.com [157.170.170.41])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id w5FIHcUw023925
	for <meta-arago@arago-project.org>; Fri, 15 Jun 2018 13:17:38 -0500
Received: from DLEE103.ent.ti.com (157.170.170.33) by DLEE109.ent.ti.com
	(157.170.170.41) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1466.3;
	Fri, 15 Jun 2018 13:17:37 -0500
Received: from dlep32.itg.ti.com (157.170.170.100) by DLEE103.ent.ti.com
	(157.170.170.33) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.1466.3 via Frontend
	Transport; Fri, 15 Jun 2018 13:17:37 -0500
Received: from uda0850410.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])
	by dlep32.itg.ti.com (8.14.3/8.13.8) with ESMTP id w5FIHbmF010244
	for <meta-arago@arago-project.org>; Fri, 15 Jun 2018 13:17:37 -0500
From: Eric Ruei <e-ruei1@ti.com>
To: <meta-arago@arago-project.org>
Date: Fri, 15 Jun 2018 14:17:02 -0400
Message-ID: <1529086622-44160-1-git-send-email-e-ruei1@ti.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: [meta-processor-sdk][PATCH] packagegroup-arago-tisdk-multimedia-sdk-host: re-enable video-graphics-test source
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
X-List-Received-Date: Fri, 15 Jun 2018 18:17:44 -0000
Content-Type: text/plain

Signed-off-by: Eric Ruei <e-ruei1@ti.com>
---
 .../packagegroups/packagegroup-arago-tisdk-multimedia-sdk-host.bbappend | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/recipes-core/packagegroups/packagegroup-arago-tisdk-multimedia-sdk-host.bbappend b/recipes-core/packagegroups/packagegroup-arago-tisdk-multimedia-sdk-host.bbappend
index 34656e4..d832f6f 100644
--- a/recipes-core/packagegroups/packagegroup-arago-tisdk-multimedia-sdk-host.bbappend
+++ b/recipes-core/packagegroups/packagegroup-arago-tisdk-multimedia-sdk-host.bbappend
@@ -1,3 +1,3 @@
 PR_append = ".tisdk0"
 
-#MULTIMEDIA_append_omap-a15 = " video-graphics-test-src"
+MULTIMEDIA_append_omap-a15 = " video-graphics-test-src"
-- 
1.9.1


