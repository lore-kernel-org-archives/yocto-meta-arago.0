Return-Path: <nikhil.nd@ti.com>
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
	by arago-project.org (Postfix) with ESMTP id 37B7052A70
	for <meta-arago@arago-project.org>;
	Wed, 10 Mar 2021 20:00:48 +0000 (UTC)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 12AK13ZT087656
	for <meta-arago@arago-project.org>; Wed, 10 Mar 2021 14:01:03 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1615406463;
	bh=L/ev64p9K3EUXSnbSOoY/8F2OxR5NSppWig+sI7EEoA=;
	h=From:To:CC:Subject:Date;
	b=hdHrTBoCeewDKcK1Y7RITaPaUJteOLF7PCSMd/2iRltRE+cIVWE3/OXVp+VGK98iu
	0y67BT+yPKiD59EWN3T0pXajFKQxo2lzOEDOxuNXNtniUMN9f91N/7HgG4dTqatfwK
	MvaAE8BXcfUKD0AU1UMrY0BJ4LfMaWAXWa9ONtLA=
Received: from DFLE100.ent.ti.com (dfle100.ent.ti.com [10.64.6.21])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 12AK12VZ081867
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-arago@arago-project.org>; Wed, 10 Mar 2021 14:01:02 -0600
Received: from DFLE115.ent.ti.com (10.64.6.36) by DFLE100.ent.ti.com
	(10.64.6.21) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2;
	Wed, 10 Mar 2021 14:01:02 -0600
Received: from fllv0040.itg.ti.com (10.64.41.20) by DFLE115.ent.ti.com
	(10.64.6.36) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2 via
	Frontend Transport; Wed, 10 Mar 2021 14:01:02 -0600
Received: from swubn03.india.englab.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])
	by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 12AK0xT5054264;
	Wed, 10 Mar 2021 14:00:59 -0600
From: Nikhil Devshatwar <nikhil.nd@ti.com>
To: <meta-arago@arago-project.org>, <praneeth@ti.com>
Date: Thu, 11 Mar 2021 01:30:45 +0530
Message-ID: <20210310200045.1287-1-nikhil.nd@ti.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Cc: saurabhnarang@ti.com, lokeshvutla@ti.com, nsekhar@ti.com, kishon@ti.com,
	hnagalla@ti.com
Subject: [dunfell][PATCH v3] packagegroups: tisdk-connectivity: Include TI wlan packages for k3 platforms
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
X-List-Received-Date: Wed, 10 Mar 2021 20:00:48 -0000
Content-Type: text/plain

Currently, the K3 platforms do not include the TI wlan related packages.
Add in the tisdk-connectivity packagegroup.

While at it, combine the packages added in all overrides into
CONNECTIVITY_RDEPENDS variable and remove from overrides.

Signed-off-by: Nikhil Devshatwar <nikhil.nd@ti.com>
Suggested-by: Hari Nagalla <hnagalla@gmail.com>
Reviewed-by: Lokesh Vutla <lokeshvutla@ti.com>
---

Notes:
    changes from v2:
    * Combine the common package list into CONNECTIVITY_RDEPENDS
    
    changes from v1:
    
    * Drop the new recipe and simply include the existing packages for wilink
      This way, all the platforms are using the same recipes and we don't
      have to maintain any new recipe just for the am64xx-sk
      The firmare will get picked from the repo
      git://git.ti.com/wilink8-wlan/wl18xx_fw.git

 .../packagegroup-arago-tisdk-connectivity.bb    | 17 +++--------------
 1 file changed, 3 insertions(+), 14 deletions(-)

diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-connectivity.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-connectivity.bb
index 11109432..8a8189fe 100644
--- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-connectivity.bb
+++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-connectivity.bb
@@ -61,36 +61,25 @@ CONNECTIVITY_RDEPENDS = " \
     iproute2-devlink \
     net-snmp \
     net-snmp-server-snmpd \
-"
-
-CONNECTIVITY_RDEPENDS_append_ti33x = "\
     ${WLAN_COMMON} \
     ${WLAN_TI} \
     ${BT_COMMON} \
+"
+
+CONNECTIVITY_RDEPENDS_append_ti33x = "\
     ${BT_TI} \
     ${DEMO_APPS} \
 "
 
 CONNECTIVITY_RDEPENDS_append_ti43x = "\
-    ${WLAN_COMMON} \
-    ${WLAN_TI} \
-    ${BT_COMMON} \
     ${BT_TI} \
     ${DEMO_APPS} \
 "
 
 CONNECTIVITY_RDEPENDS_append_dra7xx = "\
-    ${WLAN_COMMON} \
-    ${WLAN_TI} \
-    ${BT_COMMON} \
     ${BT_TI} \
 "
 
-CONNECTIVITY_RDEPENDS_append_k3 = "\
-    ${WLAN_COMMON} \
-    ${BT_COMMON} \
-"
-
 RDEPENDS_${PN} = "\
     ${CONNECTIVITY_RDEPENDS} \
 "
-- 
2.17.1


