Return-Path: <grygorii.strashko@ti.com>
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
	by arago-project.org (Postfix) with ESMTP id 343E352A31
	for <meta-arago@arago-project.org>;
	Sat, 29 May 2021 11:55:21 +0000 (UTC)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 14TBtxEj091857
	for <meta-arago@arago-project.org>; Sat, 29 May 2021 06:55:59 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1622289359;
	bh=xMkya6/v5He1evweTm8jP45yjtw40p+GK7NZxNIh1Tg=;
	h=From:To:CC:Subject:Date;
	b=S1EU3Hu+gH+NQeBLK+sqJIDWKrxGAMeZriQNfMfLtqAdH3rrZNhOPDXLeMfigaakh
	452dI/nDJO0OODV8zaiSO0NATILq8hG9ZKQfST0cSzX410jFfbc2G+DhVE2Rb0PCK2
	Prt8elcgcZv4xnoLl68z08jF/rXn1a8LcGrvZ1EQ=
Received: from DLEE109.ent.ti.com (dlee109.ent.ti.com [157.170.170.41])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 14TBtxOu050633
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-arago@arago-project.org>; Sat, 29 May 2021 06:55:59 -0500
Received: from DLEE103.ent.ti.com (157.170.170.33) by DLEE109.ent.ti.com
	(157.170.170.41) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2;
	Sat, 29 May 2021 06:55:58 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DLEE103.ent.ti.com
	(157.170.170.33) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2 via
	Frontend Transport; Sat, 29 May 2021 06:55:58 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
	by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 14TBtwSO070714;
	Sat, 29 May 2021 06:55:58 -0500
From: Grygorii Strashko <grygorii.strashko@ti.com>
To: <meta-arago@arago-project.org>, Praneeth Bajjuri <praneeth@ti.com>
Date: Sat, 29 May 2021 14:55:56 +0300
Message-ID: <20210529115556.18515-1-grygorii.strashko@ti.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Cc: Aswath Govindraju <a-govindraju@ti.com>, Lokesh Vutla <lokeshvutla@ti.com>
Subject: [PATCH] packagegroup-arago-base: add libgpiod
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
X-List-Received-Date: Sat, 29 May 2021 11:55:21 -0000
Content-Type: text/plain

The legacy sysfs based GPIO interface is marked as deprecated,
so add libgpiod and libgpiod-tools to the base package group to
enable access to the new chardev based interface.

Signed-off-by: Grygorii Strashko <grygorii.strashko@ti.com>
---
 .../recipes-core/packagegroups/packagegroup-arago-base.bb       | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-base.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-base.bb
index ac871426..2ebe5f96 100644
--- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-base.bb
+++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-base.bb
@@ -22,6 +22,8 @@ ARAGO_BASE = "\
     bash \
     opkg-bash-completion \
     udev-extraconf \
+    libgpiod \
+    libgpiod-tools \
 "
 
 # these require meta-openembedded/meta-oe layer
-- 
2.17.1


