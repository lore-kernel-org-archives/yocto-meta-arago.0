Return-Path: <yan-liu@ti.com>
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
	by arago-project.org (Postfix) with ESMTPS id 4263552978
	for <meta-arago@arago-project.org>;
	Tue,  5 Mar 2019 21:11:00 +0000 (UTC)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id x25LArWn087840
	for <meta-arago@arago-project.org>; Tue, 5 Mar 2019 15:10:53 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1551820253;
	bh=CeCLlp7ttTg4edBztU8ioWsBuMSgFNvDmUP6L8A+9HY=;
	h=From:To:CC:Subject:Date;
	b=jFkeDI+OYlrtDe5GsqdpxG1A3rEeCLnXnFGyhLgVGdIjOuZEN3Q/xdjHV9gsPTwn8
	AAInN1xCW0lLKw1yjLCWRAYIL62er0RlSormyC7ZY62kdf3ro431IpWX/aLgyZwy0+
	ZMvCL2tmE932fQBnWJnVIxbevuhOQ0dCrmhUS8BE=
Received: from DLEE112.ent.ti.com (dlee112.ent.ti.com [157.170.170.23])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x25LArnU031795
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-arago@arago-project.org>; Tue, 5 Mar 2019 15:10:53 -0600
Received: from DLEE105.ent.ti.com (157.170.170.35) by DLEE112.ent.ti.com
	(157.170.170.23) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1591.10;
	Tue, 5 Mar 2019 15:10:53 -0600
Received: from dflp32.itg.ti.com (10.64.6.15) by DLEE105.ent.ti.com
	(157.170.170.35) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.1591.10 via Frontend
	Transport; Tue, 5 Mar 2019 15:10:53 -0600
Received: from yan-ubuntu-1204.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])
	by dflp32.itg.ti.com (8.14.3/8.13.8) with ESMTP id x25LAqeV008970;
	Tue, 5 Mar 2019 15:10:52 -0600
From: <yan-liu@ti.com>
To: <meta-arago@arago-project.org>
Date: Tue, 5 Mar 2019 16:15:07 -0500
Message-ID: <1551820507-11444-1-git-send-email-yan-liu@ti.com>
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
X-List-Received-Date: Tue, 05 Mar 2019 21:11:00 -0000
Content-Type: text/plain

From: Yan Liu <yan-liu@ti.com>

Signed-off-by: Yan Liu <yan-liu@ti.com>
---
 .../{ltp-ddt_20180118.bb => ltp-ddt_20190305.bb}   |    4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-arago-extras/recipes-devtools/ltp-ddt/{ltp-ddt_20180118.bb => ltp-ddt_20190305.bb} (97%)

diff --git a/meta-arago-extras/recipes-devtools/ltp-ddt/ltp-ddt_20180118.bb b/meta-arago-extras/recipes-devtools/ltp-ddt/ltp-ddt_20190305.bb
similarity index 97%
rename from meta-arago-extras/recipes-devtools/ltp-ddt/ltp-ddt_20180118.bb
rename to meta-arago-extras/recipes-devtools/ltp-ddt/ltp-ddt_20190305.bb
index 2f491ad..9ff582f 100644
--- a/meta-arago-extras/recipes-devtools/ltp-ddt/ltp-ddt_20180118.bb
+++ b/meta-arago-extras/recipes-devtools/ltp-ddt/ltp-ddt_20190305.bb
@@ -4,7 +4,7 @@ SECTION = "console/utils"
 LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"
 
-PR = "r22"
+PR = "r1"
 PV_append = "+git${SRCPV}"
 
 PROVIDES += "ltp"
@@ -39,7 +39,7 @@ RDEPENDS_${PN} = "\
 
 inherit autotools-brokensep
 
-SRCREV = "cc77bda07ecfc3bc7c42a559ec17d7a7736d1e9f"
+SRCREV = "22e65405811dc47a4254a52aaaf09a5a83387bdd"
 BRANCH ?= "master"
 
 SRC_URI = "git://arago-project.org/git/projects/test-automation/ltp-ddt.git;branch=${BRANCH} \
-- 
1.7.9.5


