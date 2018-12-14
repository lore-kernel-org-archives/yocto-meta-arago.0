Return-Path: <manishalocal@uda0393239>
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
	by arago-project.org (Postfix) with ESMTPS id 0FC6352991
	for <meta-arago@arago-project.org>;
	Fri, 14 Dec 2018 20:23:17 +0000 (UTC)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id wBEKN5dv059837
	for <meta-arago@arago-project.org>; Fri, 14 Dec 2018 14:23:05 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1544818985;
	bh=tIT4gX6CMbkeC6QD8WwUTjOEL/IAlMf1v2DJ2ABJkiI=;
	h=From:To:CC:Subject:Date;
	b=lHyTNOe15LUop/19lfxbxN6GlnC3icMlSvkSBX1lSFvy2YHVflnZsA8SkRlkETWyK
	RJFW3ZwUQ6mHZdafCdTTAX+kRbVPN6tQl3SqFBUyhNwPYSGFjifm/q9B90cLH8sFRk
	1Oz5Tc3fZfXuTUqKc563jbOerMcwvWYVaiJQfYLc=
Received: from DFLE113.ent.ti.com (dfle113.ent.ti.com [10.64.6.34])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id wBEKN5mb021709
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-arago@arago-project.org>; Fri, 14 Dec 2018 14:23:05 -0600
Received: from DFLE105.ent.ti.com (10.64.6.26) by DFLE113.ent.ti.com
	(10.64.6.34) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1591.10;
	Fri, 14 Dec 2018 14:23:04 -0600
Received: from dlep32.itg.ti.com (157.170.170.100) by DFLE105.ent.ti.com
	(10.64.6.26) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.1591.10 via Frontend
	Transport; Fri, 14 Dec 2018 14:23:04 -0600
Received: from uda0393239 (ileax41-snat.itg.ti.com [10.172.224.153])
	by dlep32.itg.ti.com (8.14.3/8.13.8) with ESMTP id wBEKN454023075;
	Fri, 14 Dec 2018 14:23:04 -0600
Received: from manishalocal by uda0393239 with local (Exim 4.82)
	(envelope-from <manishalocal@uda0393239>)
	id 1gXtzE-000474-KP; Fri, 14 Dec 2018 14:23:04 -0600
From: Manisha Agrawal <manisha.agrawal@ti.com>
To: <meta-arago@arago-project.org>
Date: Fri, 14 Dec 2018 14:23:02 -0600
Message-ID: <20181214202302.15774-1-manisha.agrawal@ti.com>
X-Mailer: git-send-email 2.13.0
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: [master][PATCH v1] packagegroup-arago-tisdk-hmi-sdk-host : add mmwavegesture-hmi demo
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
X-List-Received-Date: Fri, 14 Dec 2018 20:23:23 -0000
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


