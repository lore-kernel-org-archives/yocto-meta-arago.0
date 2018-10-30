Return-Path: <jake@udc0866934>
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
	by arago-project.org (Postfix) with ESMTPS id 14B0B520C1
	for <meta-arago@arago-project.org>;
	Tue, 30 Oct 2018 13:44:23 +0000 (UTC)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id w9UDiEZG059388
	for <meta-arago@arago-project.org>; Tue, 30 Oct 2018 08:44:14 -0500
Received: from DLEE115.ent.ti.com (dlee115.ent.ti.com [157.170.170.26])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id w9UDiEqq092491
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-arago@arago-project.org>; Tue, 30 Oct 2018 08:44:14 -0500
Received: from DLEE101.ent.ti.com (157.170.170.31) by DLEE115.ent.ti.com
	(157.170.170.26) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1466.3;
	Tue, 30 Oct 2018 08:44:13 -0500
Received: from dlep32.itg.ti.com (157.170.170.100) by DLEE101.ent.ti.com
	(157.170.170.31) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.1466.3 via Frontend
	Transport; Tue, 30 Oct 2018 08:44:13 -0500
Received: from udc0866934 (ileax41-snat.itg.ti.com [10.172.224.153])
	by dlep32.itg.ti.com (8.14.3/8.13.8) with ESMTP id w9UDiDN6005144;
	Tue, 30 Oct 2018 08:44:13 -0500
Received: from jake by udc0866934 with local (Exim 4.82)
	(envelope-from <jake@udc0866934>)
	id 1gHUJZ-0000PK-8x; Tue, 30 Oct 2018 09:44:13 -0400
From: Jacob Stiffler <j-stiffler@ti.com>
To: <meta-arago@arago-project.org>
Date: Tue, 30 Oct 2018 09:44:05 -0400
Message-ID: <1540907045-1534-1-git-send-email-j-stiffler@ti.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: [tisdk-build-scripts][PATCH] tisdk.xml: add Ubuntu 18.04 to recommended distros
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
X-List-Received-Date: Tue, 30 Oct 2018 13:44:25 -0000
Content-Type: text/plain

Signed-off-by: Jacob Stiffler <j-stiffler@ti.com>
---
 installer-files/tisdk.xml | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/installer-files/tisdk.xml b/installer-files/tisdk.xml
index e763f1e..52f235f 100644
--- a/installer-files/tisdk.xml
+++ b/installer-files/tisdk.xml
@@ -70,7 +70,7 @@
             <title>Linux Environment Support Message</title>
             <description></description>
             <explanation></explanation>
-            <value>It is highly recommend that the user, or especially new users, install this SDK into a Ubuntu 14.04 or Ubuntu 16.04 distribution environment. This is the environment that was used to develop and test this SDK.
+            <value>It is highly recommend that the user, or especially new users, install this SDK into a Ubuntu 14.04, Ubuntu 16.04, or Ubuntu 18.04 distribution environment. This is the environment that was used to develop and test this SDK.
 
 Please note that this suggestion does not prevent the SDK from installing on other Linux Distributions.</value>
             <default></default>
-- 
1.9.1


