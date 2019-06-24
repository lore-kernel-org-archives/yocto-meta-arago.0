Return-Path: <d-senicic1@ti.com>
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
	by arago-project.org (Postfix) with ESMTPS id 655BB52985
	for <meta-arago@arago-project.org>;
	Tue, 25 Jun 2019 00:50:59 +0000 (UTC)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id x5P0oGDv002551
	for <meta-arago@arago-project.org>; Mon, 24 Jun 2019 19:50:16 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1561423816;
	bh=8/YgP9ZCbRnj4LBfbkEdBWjQCicpb7uBcXPpvscv9Ew=;
	h=From:To:CC:Subject:Date;
	b=ks/l6Tr7v65aeAoqBDMYyK3XUruePL9x9wMPIjqfbbzd1jQfQL5BltVAVM+9SWRDL
	0v6+KAxHVDdSSnvJU2A+NqTTe0u13yzwRr5aV13JbK6OlJPWJBuaxrjzUvDzIjW6Mr
	cc+Q5F3JjGgWiqZLtXG7W64fv1CuRMV1SJUymSNw=
Received: from DFLE103.ent.ti.com (dfle103.ent.ti.com [10.64.6.24])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x5P0oGWq027592
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-arago@arago-project.org>; Mon, 24 Jun 2019 19:50:16 -0500
Received: from DFLE102.ent.ti.com (10.64.6.23) by DFLE103.ent.ti.com
	(10.64.6.24) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5;
	Mon, 24 Jun 2019 19:50:15 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DFLE102.ent.ti.com
	(10.64.6.23) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
	Frontend Transport; Mon, 24 Jun 2019 19:50:15 -0500
Received: from uda0271529a.gt.design.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])
	by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id x5P0oFCU112956;
	Mon, 24 Jun 2019 19:50:15 -0500
From: Djordje Senicic <x0157990@ti.com>
To: <meta-arago@arago-project.org>
Date: Mon, 24 Jun 2019 15:46:33 -0400
Message-ID: <20190624194634.9959-1-x0157990@ti.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Cc: Djordje Senicic <x0157990@ti.com>
Subject: [thud/master][PATCH 1/2] arm-compute-library: Upgrade to 19.05 version
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
X-List-Received-Date: Tue, 25 Jun 2019 00:51:00 -0000
Content-Type: text/plain

Signed-off-by: Djordje Senicic <x0157990@ti.com>
---
 .../arm-compute-library/arm-compute-library_git.bb       | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/meta-arago-extras/recipes-support/arm-compute-library/arm-compute-library_git.bb b/meta-arago-extras/recipes-support/arm-compute-library/arm-compute-library_git.bb
index a2e19fd4..a33a2bc1 100644
--- a/meta-arago-extras/recipes-support/arm-compute-library/arm-compute-library_git.bb
+++ b/meta-arago-extras/recipes-support/arm-compute-library/arm-compute-library_git.bb
@@ -1,7 +1,7 @@
 SUMMARY = "The ARM Computer Vision and Machine Learning library"
 DESCRIPTION = "The ARM Computer Vision and Machine Learning library is a set of functions optimised for both ARM CPUs and GPUs."
 LICENSE = "MIT"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=762a7ba8d2ddc3b38d88742fbaf0b62d"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=8948bc85114b3b716576ef8d732f034f"
 
 COMPATIBLE_MACHINE = "armv7a|aarch64"
 
@@ -20,11 +20,12 @@ SRC_URI = " \
     file://0011-add-ti-benchmark-test-group.patch \
 "
 PR = "r0"
-PV  = "19.02"
+PV  = "19.05"
 PV_MAJOR = "${@d.getVar('PV',d,1).split('.')[0]}"
 
-BRANCH = "master"
-SRCREV = "d9f9318cffba4051c4ca0ec2028819962bdc2b1c"
+BRANCH = "branches/arm_compute_19_05"
+SRCREV = "bd17a169153ee181100f3b31984968b66618ef3c"
+
 
 S = "${WORKDIR}/git"
 
-- 
2.17.1


