Return-Path: <manishalocal@uda0393239>
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
	by arago-project.org (Postfix) with ESMTPS id 1B70052A75
	for <meta-arago@arago-project.org>;
	Fri, 14 Dec 2018 22:45:03 +0000 (UTC)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id wBEMipPR102985
	for <meta-arago@arago-project.org>; Fri, 14 Dec 2018 16:44:51 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1544827491;
	bh=tIT4gX6CMbkeC6QD8WwUTjOEL/IAlMf1v2DJ2ABJkiI=;
	h=From:To:CC:Subject:Date;
	b=r+RVZMYeqvbjgXwZETlwUwJWwDWaAPIgGjU5e5Bdk0bcZUldBj3SwCRff1uMrJ42x
	pH3o1BFD2xP6+Ek4n7sQiDd2DSu5iMAAgOgi5o4O+lb1RCKF/qmUCeMaR4FNlTKd2g
	sySE+YWulGSYO3POIIRaHdqMEOgol14iOiaqMqjA=
Received: from DLEE112.ent.ti.com (dlee112.ent.ti.com [157.170.170.23])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id wBEMipQa031975
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-arago@arago-project.org>; Fri, 14 Dec 2018 16:44:51 -0600
Received: from DLEE103.ent.ti.com (157.170.170.33) by DLEE112.ent.ti.com
	(157.170.170.23) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1591.10;
	Fri, 14 Dec 2018 16:44:51 -0600
Received: from dflp33.itg.ti.com (10.64.6.16) by DLEE103.ent.ti.com
	(157.170.170.33) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.1591.10 via Frontend
	Transport; Fri, 14 Dec 2018 16:44:51 -0600
Received: from uda0393239 (ileax41-snat.itg.ti.com [10.172.224.153])
	by dflp33.itg.ti.com (8.14.3/8.13.8) with ESMTP id wBEMipnq007403;
	Fri, 14 Dec 2018 16:44:51 -0600
Received: from manishalocal by uda0393239 with local (Exim 4.82)
	(envelope-from <manishalocal@uda0393239>)
	id 1gXwCQ-0004xG-Sc; Fri, 14 Dec 2018 16:44:50 -0600
From: Manisha Agrawal <manisha.agrawal@ti.com>
To: <meta-arago@arago-project.org>
Date: Fri, 14 Dec 2018 16:44:46 -0600
Message-ID: <20181214224449.19010-1-manisha.agrawal@ti.com>
X-Mailer: git-send-email 2.13.0
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: [master/rocko-next-rel][PATCH v2 1/4] packagegroup-arago-tisdk-hmi-sdk-host : add mmwavegesture-hmi demo
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
X-List-Received-Date: Fri, 14 Dec 2018 22:45:03 -0000
Content-Type: text/plain

Signed-off-by: Manisha Agrawal <manisha.agrawal@ti.com>
---
 .../packagegroups/packagegroup-arago-tisdk-hmi-sdk-host.bb            | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-hmi-sdk-host.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-hmi-sdk-host.bb
index dd3407d6..1399690b 100644
--- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-hmi-sdk-host.bb
+++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-hmi-sdk-host.bb
@@ -10,20 +10,24 @@ HMI = ""
 
 HMI_append_ti43x = " \
     evse-hmi-src \
+    mmwavegesture-hmi-src \
 "
 
 HMI_append_ti33x = " \
     evse-hmi-src \
     protection-relays-hmi-src \
+    mmwavegesture-hmi-src \
 "
 
 
 HMI_append_omap-a15 = " \
     evse-hmi-src \
+    mmwavegesture-hmi-src \
 "
 
 HMI_append_k3 = " \
     evse-hmi-src \
+    mmwavegesture-hmi-src \
 "
 
 RDEPENDS_${PN} = "\
-- 
2.13.0


