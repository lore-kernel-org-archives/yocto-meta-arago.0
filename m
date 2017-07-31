Return-Path: <yan-liu@ti.com>
Received: from fllnx209.ext.ti.com (fllnx209.ext.ti.com [198.47.19.16])
	by arago-project.org (Postfix) with ESMTPS id D99B452B13
	for <meta-arago@arago-project.org>;
	Mon, 31 Jul 2017 15:55:20 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by fllnx209.ext.ti.com (8.15.1/8.15.1) with ESMTP id v6VFtA5i022141
	for <meta-arago@arago-project.org>; Mon, 31 Jul 2017 10:55:10 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ti.com;
	s=ti-com-17Q1; t=1501516510;
	bh=nxHSXEdzOeyhrvdyjC7l3PFbaG5srCdQ4O8uYMr/tes=;
	h=From:To:CC:Subject:Date;
	b=hrq8ymoQG9rLO6DM9RZwCywhu1IvtB6ayM8F11we+usH27A9nqtXvGH5ZcV/pMqcD
	DW+Lnd2d5HwkUAZqQzf9xrwsN+kz+LrwoiH8r3KuFCooZGtsef5iR5JycF5FYPUm0G
	Me9r27FvKYUL5+Fgvnc4pMMaaHw09+JPtH4XKUL8=
Received: from DLEE70.ent.ti.com (dlemailx.itg.ti.com [157.170.170.113])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id v6VFt5xG000623
	for <meta-arago@arago-project.org>; Mon, 31 Jul 2017 10:55:05 -0500
Received: from dlep33.itg.ti.com (157.170.170.75) by DLEE70.ent.ti.com
	(157.170.170.113) with Microsoft SMTP Server id 14.3.294.0;
	Mon, 31 Jul 2017 10:55:05 -0500
Received: from yan-ubuntu-1204.am.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])	by dlep33.itg.ti.com (8.14.3/8.13.8) with ESMTP id
	v6VFt5Ii012757;	Mon, 31 Jul 2017 10:55:05 -0500
From: <yan-liu@ti.com>
To: <meta-arago@arago-project.org>
Date: Mon, 31 Jul 2017 11:49:36 -0400
Message-ID: <1501516176-7630-1-git-send-email-yan-liu@ti.com>
X-Mailer: git-send-email 1.7.9.5
MIME-Version: 1.0
Subject: [PATCH v1] ltp-ddt: Update to latest
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
X-List-Received-Date: Mon, 31 Jul 2017 15:55:21 -0000
Content-Type: text/plain

From: Yan Liu <yan-liu@ti.com>

Signed-off-by: Yan Liu <yan-liu@ti.com>
---
 .../recipes-devtools/ltp-ddt/ltp-ddt_20170116.bb   |    4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-arago-extras/recipes-devtools/ltp-ddt/ltp-ddt_20170116.bb b/meta-arago-extras/recipes-devtools/ltp-ddt/ltp-ddt_20170116.bb
index 3a013f0..771e117 100644
--- a/meta-arago-extras/recipes-devtools/ltp-ddt/ltp-ddt_20170116.bb
+++ b/meta-arago-extras/recipes-devtools/ltp-ddt/ltp-ddt_20170116.bb
@@ -4,7 +4,7 @@ SECTION = "console/utils"
 LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"
 
-PR = "r19"
+PR = "r20"
 PV_append = "+git${SRCPV}"
 
 PROVIDES += "ltp"
@@ -14,7 +14,7 @@ RDEPENDS_${PN} += "pm-qa serialcheck"
 
 inherit autotools-brokensep
 
-SRCREV = "b3f82f35246aed3294ab42f1b25d8c3ef7142066"
+SRCREV = "6958753d18971cbf3e6f297191d648bc618818f8"
 BRANCH ?= "master"
 
 SRC_URI = "git://arago-project.org/git/projects/test-automation/ltp-ddt.git;branch=${BRANCH}"
-- 
1.7.9.5


