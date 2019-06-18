Return-Path: <j-stiffler@ti.com>
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
	by arago-project.org (Postfix) with ESMTPS id 4EC53529E7
	for <meta-arago@arago-project.org>;
	Tue, 18 Jun 2019 15:01:55 +0000 (UTC)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id x5IF1EFw075312
	for <meta-arago@arago-project.org>; Tue, 18 Jun 2019 10:01:14 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1560870074;
	bh=CrvNGUp5bIgAY0VFCUb/ibd/tYqHEZfWRHln8sgpxy4=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=rAbzTWqUsN+zn2udduY2NzC/G5CxAudcF8EgoAraLTJB3BkIJxNOefhazksyNBmo2
	sE4V2z3UU+SaMCixIb50sutJzUtXQ6LuXmCqnZ/TAXo8mbXbz7MgVN8xOHNq9fir/h
	QAFBFqYnmMFQrFP4SisFJEfGcku9JUY2teo2jPlc=
Received: from DLEE109.ent.ti.com (dlee109.ent.ti.com [157.170.170.41])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x5IF1EK3011635
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-arago@arago-project.org>; Tue, 18 Jun 2019 10:01:14 -0500
Received: from DLEE100.ent.ti.com (157.170.170.30) by DLEE109.ent.ti.com
	(157.170.170.41) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5;
	Tue, 18 Jun 2019 10:01:13 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DLEE100.ent.ti.com
	(157.170.170.30) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
	Frontend Transport; Tue, 18 Jun 2019 10:01:13 -0500
Received: from udd0866934.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])
	by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id x5IF18Oo067158;
	Tue, 18 Jun 2019 10:01:13 -0500
From: Jacob Stiffler <j-stiffler@ti.com>
To: <meta-arago@arago-project.org>
Date: Tue, 18 Jun 2019 10:45:03 -0400
Message-ID: <1560869103-4803-4-git-send-email-j-stiffler@ti.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1560869103-4803-1-git-send-email-j-stiffler@ti.com>
References: <1560869103-4803-1-git-send-email-j-stiffler@ti.com>
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Cc: a-kramer@ti.com
Subject: [meta-processor-sdk][PATCH 4/4] processor-sdk: choose net-snmp 5.7.3
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
X-List-Received-Date: Tue, 18 Jun 2019 15:01:55 -0000
Content-Type: text/plain

Signed-off-by: Jacob Stiffler <j-stiffler@ti.com>
---
 conf/distro/include/branding-processor-sdk.inc | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/conf/distro/include/branding-processor-sdk.inc b/conf/distro/include/branding-processor-sdk.inc
index 69d1c39..72635bf 100644
--- a/conf/distro/include/branding-processor-sdk.inc
+++ b/conf/distro/include/branding-processor-sdk.inc
@@ -17,6 +17,9 @@ PREFERRED_PROVIDER_virtual/kernel_omapl137 = "linux-dummy"
 #PREFERRED_PROVIDER_virtual/kernel_keystone = "linux-processor-sdk${ARAGO_KERNEL_SUFFIX}"
 PREFERRED_VERSION_linux-processor-sdk = "4.4%"
 
+# Use the net-snmp version from rocko
+PREFERRED_VERSION_net-snmp = "5.7.3"
+
 # Remove wayland from keystone DISTRO_FEATURES.
 DISTRO_FEATURES_remove_keystone = "wayland opengl"
 
-- 
2.7.4


