Return-Path: <yan-liu@ti.com>
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
	by arago-project.org (Postfix) with ESMTPS id 544F952995
	for <meta-arago@arago-project.org>;
	Tue, 17 Mar 2020 15:05:36 +0000 (UTC)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 02HF3S4Q047679
	for <meta-arago@arago-project.org>; Tue, 17 Mar 2020 10:03:28 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1584457408;
	bh=eM5PZWG4kd1YpuNhy7nsbpeOvNdoaBX8Hxi8Isr4U44=;
	h=From:To:CC:Subject:Date;
	b=ayvt2F8hasK4mLnJQC6ZPv6j2qgp+0QWjora7tdeq9iS3/Q0HvAdk4gmglgxzWWOB
	H1R6vLtlA1IgPW0QhDbg79V1JJeZHnqS5ruFsmYtsc0AyNNQ9PHMzd68pqBKghYO/0
	TircCDEDX33ED7ZF3My1SJf+/Rm/ik7G0qxy/leE=
Received: from DLEE114.ent.ti.com (dlee114.ent.ti.com [157.170.170.25])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 02HF3Skq090582
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-arago@arago-project.org>; Tue, 17 Mar 2020 10:03:28 -0500
Received: from DLEE111.ent.ti.com (157.170.170.22) by DLEE114.ent.ti.com
	(157.170.170.25) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3;
	Tue, 17 Mar 2020 10:03:28 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DLEE111.ent.ti.com
	(157.170.170.22) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3 via
	Frontend Transport; Tue, 17 Mar 2020 10:03:28 -0500
Received: from yan-ubuntu-1204.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])
	by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 02HF3S7X084082;
	Tue, 17 Mar 2020 10:03:28 -0500
From: <yan-liu@ti.com>
To: <meta-arago@arago-project.org>
Date: Tue, 17 Mar 2020 11:01:52 -0400
Message-ID: <1584457312-21599-1-git-send-email-yan-liu@ti.com>
X-Mailer: git-send-email 1.7.9.5
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
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
X-List-Received-Date: Tue, 17 Mar 2020 15:05:36 -0000
Content-Type: text/plain

From: Yan Liu <yan-liu@ti.com>

Signed-off-by: Yan Liu <yan-liu@ti.com>
---
 .../recipes-devtools/ltp-ddt/ltp-ddt_20200217.bb   |    4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-arago-extras/recipes-devtools/ltp-ddt/ltp-ddt_20200217.bb b/meta-arago-extras/recipes-devtools/ltp-ddt/ltp-ddt_20200217.bb
index 539213a..bfa7136 100644
--- a/meta-arago-extras/recipes-devtools/ltp-ddt/ltp-ddt_20200217.bb
+++ b/meta-arago-extras/recipes-devtools/ltp-ddt/ltp-ddt_20200217.bb
@@ -4,7 +4,7 @@ SECTION = "console/utils"
 LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"
 
-PR = "r2"
+PR = "r3"
 PV_append = "+git${SRCPV}"
 
 PROVIDES += "ltp"
@@ -39,7 +39,7 @@ RDEPENDS_${PN} = "\
 
 inherit autotools-brokensep
 
-SRCREV = "bd16a9e6a9a7f273d400b543713a0d7b2fdaae63"
+SRCREV = "eac44ee24fd0827fb550a8afafe01f0ea3b4b039"
 BRANCH ?= "master"
 
 SRC_URI = "git://arago-project.org/git/projects/test-automation/ltp-ddt.git;branch=${BRANCH} \
-- 
1.7.9.5


