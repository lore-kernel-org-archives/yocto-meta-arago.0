Return-Path: <yan-liu@ti.com>
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
	by arago-project.org (Postfix) with ESMTPS id CBD53529C0
	for <meta-arago@arago-project.org>;
	Wed, 11 Jul 2018 13:01:12 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id w6BD162t122916
	for <meta-arago@arago-project.org>; Wed, 11 Jul 2018 08:01:06 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1531314066;
	bh=vs42M9ywVA2pGXngAFzDCRHQwtVVadImOqP/XdjnBEc=;
	h=From:To:CC:Subject:Date;
	b=xC+eATlFxNViJrXe4XwZ3yt9zdzTTZrnWmmpT7W9DeYcs6joA3YnAoRnearkz1QcZ
	ADEzqb7keyfrjakUGc1/IxUqRxVQIG5D79KqaiHNXWFvRyZxfMKuOfW5ygCIC53enG
	FaZWwTPmOqeypn732X8995nga7tXBteEUqpbZlm0=
Received: from DFLE105.ent.ti.com (dfle105.ent.ti.com [10.64.6.26])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id w6BD16MU009469
	for <meta-arago@arago-project.org>; Wed, 11 Jul 2018 08:01:06 -0500
Received: from DFLE104.ent.ti.com (10.64.6.25) by DFLE105.ent.ti.com
	(10.64.6.26) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1466.3;
	Wed, 11 Jul 2018 08:01:05 -0500
Received: from dflp32.itg.ti.com (10.64.6.15) by DFLE104.ent.ti.com
	(10.64.6.25) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.1466.3 via Frontend
	Transport; Wed, 11 Jul 2018 08:01:05 -0500
Received: from yan-ubuntu-1204.am.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])
	by dflp32.itg.ti.com (8.14.3/8.13.8) with ESMTP id w6BD15kf000321;
	Wed, 11 Jul 2018 08:01:05 -0500
From: <yan-liu@ti.com>
To: <meta-arago@arago-project.org>
Date: Wed, 11 Jul 2018 08:52:39 -0400
Message-ID: <1531313559-30661-1-git-send-email-yan-liu@ti.com>
X-Mailer: git-send-email 1.7.9.5
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: [PATCH v2] ltp-ddt: Update to latest
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
X-List-Received-Date: Wed, 11 Jul 2018 13:01:13 -0000
Content-Type: text/plain

From: Yan Liu <yan-liu@ti.com>

Signed-off-by: Yan Liu <yan-liu@ti.com>
---
 .../recipes-devtools/ltp-ddt/ltp-ddt_20180118.bb   |    4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-arago-extras/recipes-devtools/ltp-ddt/ltp-ddt_20180118.bb b/meta-arago-extras/recipes-devtools/ltp-ddt/ltp-ddt_20180118.bb
index 19e7229..828eea5 100644
--- a/meta-arago-extras/recipes-devtools/ltp-ddt/ltp-ddt_20180118.bb
+++ b/meta-arago-extras/recipes-devtools/ltp-ddt/ltp-ddt_20180118.bb
@@ -4,7 +4,7 @@ SECTION = "console/utils"
 LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"
 
-PR = "r9"
+PR = "r10"
 PV_append = "+git${SRCPV}"
 
 PROVIDES += "ltp"
@@ -39,7 +39,7 @@ RDEPENDS_${PN} = "\
 
 inherit autotools-brokensep
 
-SRCREV = "83db9c1bcf7c1bfc67a018640a73b2508768ab34"
+SRCREV = "3e0e187ce2c46f1d222df5d7edbdce3dcde428fa"
 BRANCH ?= "master"
 
 SRC_URI = "git://arago-project.org/git/projects/test-automation/ltp-ddt.git;branch=${BRANCH} \
-- 
1.7.9.5


