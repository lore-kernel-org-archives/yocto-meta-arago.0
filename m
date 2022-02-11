Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
 by mx.groups.io with SMTP id smtpd.web10.6593.1644583096595115820
 for <meta-arago@lists.yoctoproject.org>;
 Fri, 11 Feb 2022 04:38:17 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=qRMjIeHr;
 spf=pass (domain: ti.com, ip: 198.47.23.249, mailfrom: reatmon@ti.com)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 21BCcEYx059526;
	Fri, 11 Feb 2022 06:38:14 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1644583094;
	bh=8W3V2+ulvkgSqXVt+ZZuhpemexH8Kh5E/kvSRNJYxOI=;
	h=From:To:Subject:Date:In-Reply-To:References;
	b=qRMjIeHr92n5B90V7IayzmRLIMk90EBw+GUGRr2/xW51cj93O05AB/PSGZLdwh2rm
	 YZmbNbHKluxYTa461opb4Q+fUxZ2ZQuA7u06C4js5sSDlpYnSixyexOPp4J57s76jp
	 tc1Swe9ibD0wqthsAyn4Ivw0H8g1ldxfsOW8jplw=
Received: from DLEE113.ent.ti.com (dlee113.ent.ti.com [157.170.170.24])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 21BCcEUK106703
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Fri, 11 Feb 2022 06:38:14 -0600
Received: from DLEE114.ent.ti.com (157.170.170.25) by DLEE113.ent.ti.com
 (157.170.170.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14; Fri, 11
 Feb 2022 06:38:14 -0600
Received: from fllv0040.itg.ti.com (10.64.41.20) by DLEE114.ent.ti.com
 (157.170.170.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14 via
 Frontend Transport; Fri, 11 Feb 2022 06:38:14 -0600
Received: from uda0214219 (ileax41-snat.itg.ti.com [10.172.224.153])
	by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 21BCcETS046912;
	Fri, 11 Feb 2022 06:38:14 -0600
Received: from reatmon by uda0214219 with local (Exim 4.90_1)
	(envelope-from <reatmon@ti.com>)
	id 1nIVBm-0003Cr-Ei; Fri, 11 Feb 2022 06:38:14 -0600
From: "Ryan Eatmon" <reatmon@ti.com>
To: Yogesh Siraswar <yogeshs@ti.com>, Praneeth Bajjuri <praneeth@ti.com>,
        Denys Dmytriyenko <denys@konsulko.com>,
        <meta-arago@lists.yoctoproject.org>
Subject: [meta-arago][dunfell][PATCH 2/3] Revert "packagegroup-arago-base: add docker runtime to the base and default rootfs"
Date: Fri, 11 Feb 2022 06:38:13 -0600
Message-ID: <20220211123814.12258-3-reatmon@ti.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20220211123814.12258-1-reatmon@ti.com>
References: <20220211123814.12258-1-reatmon@ti.com>
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Content-Type: text/plain

This reverts commit 41ca001c2934042cd17c2857a8d925633339371f.

These patches add to the size of the base image.  We have plans on
reworking the images and will reapply this patch at that time.
---
 .../recipes-core/packagegroups/packagegroup-arago-base.bb        | 1 -
 1 file changed, 1 deletion(-)

diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-base.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-base.bb
index 22842108..2ebe5f96 100644
--- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-base.bb
+++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-base.bb
@@ -36,7 +36,6 @@ ARAGO_EXTRA = "\
     kms++ \
     kms++-python \
     can-utils \
-    docker \
 "
 
 ARAGO_EXTRA_append_keystone = "\
-- 
2.17.1

