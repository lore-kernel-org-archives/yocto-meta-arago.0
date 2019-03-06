Return-Path: <h-gou@ti.com>
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
	by arago-project.org (Postfix) with ESMTPS id B4C83529E3
	for <meta-arago@arago-project.org>;
	Wed,  6 Mar 2019 17:59:47 +0000 (UTC)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id x26Hxelm003012
	for <meta-arago@arago-project.org>; Wed, 6 Mar 2019 11:59:40 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1551895180;
	bh=e6VUXPKfXqcOGWnWWSi3sR8U9UmRb3dKWFuDOtdkHJ8=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=g92Ny7OmdPsOm+qOuVonFpFxCuvC4PRqgOlQYhD6mcxXKTRC9Po7O5YMoUAj7f/Nx
	jCMRraH9bToAe8slwLHobMLXfj+veC/VCkGMhxM1UWyReDQzMneDZ9BtejGt3RAuXm
	i9H4DBknILHku/yqUuIuWC0NTi4vQd1UDVhAO5SY=
Received: from DFLE115.ent.ti.com (dfle115.ent.ti.com [10.64.6.36])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x26Hxe2Z093415
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-arago@arago-project.org>; Wed, 6 Mar 2019 11:59:40 -0600
Received: from DFLE113.ent.ti.com (10.64.6.34) by DFLE115.ent.ti.com
	(10.64.6.36) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1591.10;
	Wed, 6 Mar 2019 11:59:39 -0600
Received: from dlep33.itg.ti.com (157.170.170.75) by DFLE113.ent.ti.com
	(10.64.6.34) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.1591.10 via Frontend
	Transport; Wed, 6 Mar 2019 11:59:39 -0600
Received: from uda0271529.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])
	by dlep33.itg.ti.com (8.14.3/8.13.8) with ESMTP id x26HxZ5x029657;
	Wed, 6 Mar 2019 11:59:38 -0600
From: Hongmei Gou <a0271529@ti.com>
To: <meta-arago@arago-project.org>
Date: Wed, 6 Mar 2019 12:59:31 -0500
Message-ID: <1551895171-20664-2-git-send-email-a0271529@ti.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1551895171-20664-1-git-send-email-a0271529@ti.com>
References: <1551895171-20664-1-git-send-email-a0271529@ti.com>
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Cc: Hongmei Gou <a0271529@ti.com>
Subject: [rocko/master] [PATCH 2/2] packagegroup-arago-tisdk-addons: add acontis-atemsys for am3 and am5
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
X-List-Received-Date: Wed, 06 Mar 2019 17:59:48 -0000
Content-Type: text/plain

Signed-off-by: Hongmei Gou <a0271529@ti.com>
---
 .../recipes-core/packagegroups/packagegroup-arago-tisdk-addons.bb   | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons.bb
index a62c4e7..b86412a 100644
--- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons.bb
+++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons.bb
@@ -1,6 +1,6 @@
 DESCRIPTION = "Task to install additional utilities/demos for SDKs"
 LICENSE = "MIT"
-PR = "r71"
+PR = "r72"
 
 PACKAGE_ARCH = "${MACHINE_ARCH}"
 
@@ -171,9 +171,9 @@ EXTRA_PACKAGES_append_keystone = " ti-ipc-examples-linux"
 EXTRA_PACKAGES_append_omapl138 = " ti-ipc-examples-linux"
 EXTRA_PACKAGES_append_k3 = " ti-ipc-examples-linux"
 
-EXTRA_PACKAGES_append_am335x-evm = " pruss-lld-apps"
+EXTRA_PACKAGES_append_am335x-evm = " pruss-lld-apps acontis-atemsys"
 EXTRA_PACKAGES_append_am437x-evm = " pruss-lld-apps"
-EXTRA_PACKAGES_append_am57xx-evm = " pruss-lld-apps"
+EXTRA_PACKAGES_append_am57xx-evm = " pruss-lld-apps acontis-atemsys"
 EXTRA_PACKAGES_append_k2g-evm  = " pruss-lld-apps"
 
 RDEPENDS_${PN} = "\
-- 
1.9.1


