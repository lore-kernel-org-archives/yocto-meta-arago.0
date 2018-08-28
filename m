Return-Path: <j-stiffler@ti.com>
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
	by arago-project.org (Postfix) with ESMTPS id 8ADAA529AE
	for <meta-arago@arago-project.org>;
	Tue, 28 Aug 2018 17:46:49 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id w7SHkfF2011760
	for <meta-arago@arago-project.org>; Tue, 28 Aug 2018 12:46:41 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1535478401;
	bh=7c8PiCTSqUcu5CzuGNv4NlvyosCM9PFHhqSJvfvvQNA=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=R+9hiBqJyMmmxSZWCyZPhfmCpQ9d0T0PorYW7TR4QF4XCX9O4mFoFmUNV4YemQF9t
	HDxogg4MHNnx0cvM/DC5mDoxcwcey7dGnhlyc1gp4aWNJ03WYJfqxWDd4XU7Woq16e
	Vd7YMZrZk/194y4cUY3FCHoAUXS8t02mXZ+w5CpY=
Received: from DFLE112.ent.ti.com (dfle112.ent.ti.com [10.64.6.33])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id w7SHkfgj016840
	for <meta-arago@arago-project.org>; Tue, 28 Aug 2018 12:46:41 -0500
Received: from DFLE106.ent.ti.com (10.64.6.27) by DFLE112.ent.ti.com
	(10.64.6.33) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1466.3;
	Tue, 28 Aug 2018 12:46:41 -0500
Received: from dlep33.itg.ti.com (157.170.170.75) by DFLE106.ent.ti.com
	(10.64.6.27) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.1466.3 via Frontend
	Transport; Tue, 28 Aug 2018 12:46:41 -0500
Received: from udd0866934.am.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])
	by dlep33.itg.ti.com (8.14.3/8.13.8) with ESMTP id w7SHkdhW023691;
	Tue, 28 Aug 2018 12:46:41 -0500
From: Jacob Stiffler <j-stiffler@ti.com>
To: <meta-arago@arago-project.org>
Date: Tue, 28 Aug 2018 13:34:21 -0400
Message-ID: <1535477663-15879-2-git-send-email-j-stiffler@ti.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1535477663-15879-1-git-send-email-j-stiffler@ti.com>
References: <1535477663-15879-1-git-send-email-j-stiffler@ti.com>
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: [PATCH 2/4] packagegroup-arago-tisdk-addons-sdk-host: add pru-icss-src for k2g
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
X-List-Received-Date: Tue, 28 Aug 2018 17:46:49 -0000
Content-Type: text/plain

Signed-off-by: Jacob Stiffler <j-stiffler@ti.com>
---
 .../packagegroups/packagegroup-arago-tisdk-addons-sdk-host.bb       | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons-sdk-host.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons-sdk-host.bb
index 142e4b3..e2de61a 100644
--- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons-sdk-host.bb
+++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons-sdk-host.bb
@@ -1,6 +1,6 @@
 DESCRIPTION = "Task to install sources for additional utilities/demos for SDKs"
 LICENSE = "MIT"
-PR = "r33"
+PR = "r34"
 
 PACKAGE_ARCH = "${MACHINE_ARCH}"
 
@@ -32,6 +32,10 @@ UTILS_append_ti43x = " \
     pru-icss-src \
 "
 
+UTILS_append_k2g = " \
+    pru-icss-src \
+"
+
 UTILS_append_k3 = " \
     pru-icss-src \
 "
-- 
2.7.4


