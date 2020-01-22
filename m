Return-Path: <j-stiffler@ti.com>
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
	by arago-project.org (Postfix) with ESMTPS id BF2A35298B
	for <meta-arago@arago-project.org>;
	Wed, 22 Jan 2020 14:36:11 +0000 (UTC)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 00MEYMql035409
	for <meta-arago@arago-project.org>; Wed, 22 Jan 2020 08:34:22 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1579703662;
	bh=QkNlMCVn9GmAO02yU8dVznV28mdM+dTkJQoJ+uXSbho=;
	h=From:To:CC:Subject:Date;
	b=dmr/4FcWDoQkXWjV+izKZ1rGfHAzaE3+ByUquFX/DVYYBAtYkhfBg3sG558BouO04
	N/D5ZRr9JHAl4r+P/XpGy81rEeJ/hzELmzly3wNTQ4JYv8DIaK8slxfGfq2GZb/QZJ
	bwcBdmfBr9aHoZ63mM5cH6kSEo++AhJ9zZ/2ZiuE=
Received: from DFLE111.ent.ti.com (dfle111.ent.ti.com [10.64.6.32])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 00MEYMXa025907
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-arago@arago-project.org>; Wed, 22 Jan 2020 08:34:22 -0600
Received: from DFLE111.ent.ti.com (10.64.6.32) by DFLE111.ent.ti.com
	(10.64.6.32) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3;
	Wed, 22 Jan 2020 08:34:21 -0600
Received: from lelv0327.itg.ti.com (10.180.67.183) by DFLE111.ent.ti.com
	(10.64.6.32) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3 via
	Frontend Transport; Wed, 22 Jan 2020 08:34:21 -0600
Received: from udd0866934.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])
	by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 00MEYLVE129953;
	Wed, 22 Jan 2020 08:34:21 -0600
From: Jacob Stiffler <j-stiffler@ti.com>
To: <meta-arago@arago-project.org>
Date: Wed, 22 Jan 2020 09:15:22 -0500
Message-ID: <1579702522-31819-1-git-send-email-j-stiffler@ti.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: [RFC][PATCH] opencl: fix packaging of library
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
X-List-Received-Date: Wed, 22 Jan 2020 14:36:12 -0000
Content-Type: text/plain

* Add daemon conffiles and library to runtime package.

Signed-off-by: Jacob Stiffler <j-stiffler@ti.com>
---
 meta-arago-extras/recipes-ti/ocl/opencl_git.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-arago-extras/recipes-ti/ocl/opencl_git.bb b/meta-arago-extras/recipes-ti/ocl/opencl_git.bb
index 59cb8ca..502e1cf 100644
--- a/meta-arago-extras/recipes-ti/ocl/opencl_git.bb
+++ b/meta-arago-extras/recipes-ti/ocl/opencl_git.bb
@@ -4,7 +4,7 @@ LICENSE = "BSD"
 
 include ocl.inc
 
-PR = "${INC_PR}.1"
+PR = "${INC_PR}.2"
 
 inherit cmake systemd
 
@@ -80,7 +80,7 @@ do_install_append() {
 SYSTEMD_SERVICE_${PN}-runtime = "ti-mct-daemon.service"
 SYSTEMD_AUTO_ENABLE_${PN}-runtime = "${@oe.utils.conditional("RESERVE_CMEM", "1", "enable", "disable", d)}"
 
-FILES_${PN}-runtime += "${bindir} ${systemd_system_unitdir}"
+FILES_${PN}-runtime += "${bindir} ${systemd_system_unitdir} ${sysconfdir}/ti-mctd ${libdir}/lib*${SOLIBS}"
 
 FILES_${PN} += " \
     ${datadir}/ti/opencl/* \
-- 
2.7.4


