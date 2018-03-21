Return-Path: <m-radhakrishnan2@ti.com>
Received: from lelnx194.ext.ti.com (lelnx194.ext.ti.com [198.47.27.80])
	by arago-project.org (Postfix) with ESMTPS id 41629529A2
	for <meta-arago@arago-project.org>;
	Wed, 21 Mar 2018 16:51:09 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by lelnx194.ext.ti.com (8.15.1/8.15.1) with ESMTP id w2LGp8Tl015798
	for <meta-arago@arago-project.org>; Wed, 21 Mar 2018 11:51:08 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ti.com;
	s=ti-com-17Q1; t=1521651068;
	bh=Klki+unZBvnbzxyGXLk8+9wX9C3Z2QHk+p3Tq0uOCvQ=;
	h=From:To:Subject:Date;
	b=pyVkFezGUz+89Fhu3mJ6J5vjgffd0d/6vkOrsg4kee7wybSjjrM/4A/KviVptRNJk
	EFOeb0FWyfPMAAFxQ5lfVEFX0YdMkQzBxd2ZbHRMjwpYjIuO40BV8+0unI+TusCdy8
	FurLSeOWH01aB7HR5Z/LTo+zpNXQCOn1a0k06fhQ=
Received: from DFLE103.ent.ti.com (dfle103.ent.ti.com [10.64.6.24])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id w2LGp8A3025631
	for <meta-arago@arago-project.org>; Wed, 21 Mar 2018 11:51:08 -0500
Received: from DFLE104.ent.ti.com (10.64.6.25) by DFLE103.ent.ti.com
	(10.64.6.24) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1261.35;
	Wed, 21 Mar 2018 11:51:08 -0500
Received: from dflp33.itg.ti.com (10.64.6.16) by DFLE104.ent.ti.com
	(10.64.6.25) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.1261.35 via Frontend
	Transport; Wed, 21 Mar 2018 11:51:08 -0500
Received: from uda0875154a.am.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])
	by dflp33.itg.ti.com (8.14.3/8.13.8) with ESMTP id w2LGp80D007296
	for <meta-arago@arago-project.org>; Wed, 21 Mar 2018 11:51:08 -0500
From: Mahesh Radhakrishnan <m-radhakrishnan2@ti.com>
To: <meta-arago@arago-project.org>
Date: Wed, 21 Mar 2018 12:51:07 -0400
Message-ID: <1521651067-38510-1-git-send-email-m-radhakrishnan2@ti.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: [morty][meta-processor-sdk][PATCH] starterware: SRCREV bump to 02.01.01.06A
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
X-List-Received-Date: Wed, 21 Mar 2018 16:51:09 -0000
Content-Type: text/plain

Signed-off-by: Mahesh Radhakrishnan <m-radhakrishnan2@ti.com>
---
 recipes-bsp/starterware/starterware-02.01.01.06.inc | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/recipes-bsp/starterware/starterware-02.01.01.06.inc b/recipes-bsp/starterware/starterware-02.01.01.06.inc
index fac8920..e3c7895 100644
--- a/recipes-bsp/starterware/starterware-02.01.01.06.inc
+++ b/recipes-bsp/starterware/starterware-02.01.01.06.inc
@@ -1,5 +1,5 @@
-# Below commit ID corresponds to "DEV.STARTERWARE.PROCSDK.02.01.01.06"
-STARTERWARE_SRCREV = "2e3662586b03e29228c55090f324b60a9c2ecc81"
+# Below commit ID corresponds to "DEV.STARTERWARE.PROCSDK.02.01.01.06A"
+STARTERWARE_SRCREV = "d2e9e7cce2f3f2f6bff592f670cc0d97a3ce95d7"
 
-PV = "02.01.01.06"
+PV = "02.01.01.06A"
 INC_PR = "r0"
-- 
1.9.1


