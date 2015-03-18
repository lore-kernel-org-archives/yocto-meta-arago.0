Return-Path: <karthik.ramanan@ti.com>
Received: from bear.ext.ti.com (bear.ext.ti.com [192.94.94.41])
	by arago-project.org (Postfix) with ESMTPS id DB52052099
	for <meta-arago@arago-project.org>;
	Wed, 18 Mar 2015 12:45:15 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by bear.ext.ti.com (8.13.7/8.13.7) with ESMTP id t2ICjFra010897
	for <meta-arago@arago-project.org>; Wed, 18 Mar 2015 07:45:15 -0500
Received: from DFLE73.ent.ti.com (dfle73.ent.ti.com [128.247.5.110])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id t2ICjDjw009631
	for <meta-arago@arago-project.org>; Wed, 18 Mar 2015 07:45:14 -0500
Received: from dflp33.itg.ti.com (10.64.6.16) by DFLE73.ent.ti.com
	(128.247.5.110) with Microsoft SMTP Server id 14.3.224.2;
	Wed, 18 Mar 2015 07:45:13 -0500
Received: from swubn01.india.ti.com (ileax41-snat.itg.ti.com [10.172.224.153])
	by dflp33.itg.ti.com (8.14.3/8.13.8) with ESMTP id t2ICjCcW012053;
	Wed, 18 Mar 2015 07:45:12 -0500
From: Karthik Ramanan <a0393906@ti.com>
To: <meta-arago@arago-project.org>
Date: Wed, 18 Mar 2015 18:15:09 +0530
Message-ID: <1426682711-3071-1-git-send-email-a0393906@ti.com>
X-Mailer: git-send-email 1.7.9.5
MIME-Version: 1.0
Subject: [meta-arago PATCH V2 1/3] arm-benchmarks: switch protocol to http
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
X-List-Received-Date: Wed, 18 Mar 2015 12:45:16 -0000
Content-Type: text/plain

Signed-off-by: Karthik Ramanan <a0393906@ti.com>
---
 .../arm-benchmarks/arm-benchmarks_1.3.bb           |    4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-arago-extras/recipes-benchmark/arm-benchmarks/arm-benchmarks_1.3.bb b/meta-arago-extras/recipes-benchmark/arm-benchmarks/arm-benchmarks_1.3.bb
index 952e50b..20363d8 100644
--- a/meta-arago-extras/recipes-benchmark/arm-benchmarks/arm-benchmarks_1.3.bb
+++ b/meta-arago-extras/recipes-benchmark/arm-benchmarks/arm-benchmarks_1.3.bb
@@ -4,12 +4,12 @@ LICENSE = "BSD"
 LIC_FILES_CHKSUM = "file://COPYING;md5=7aefb5e1cffc7b6a3ef18b803f957922"
 SECTION = "system"
 
-PR = "r7"
+PR = "r8"
 
 BRANCH ?= "master"
 SRCREV = "7f76ec24d3fedb9b2e3331f77c2f790c8b43f5f0"
 
-SRC_URI = "git://gitorious.org/arm_benchmarks/arm_benchmarks.git;protocol=git;branch=${BRANCH}"
+SRC_URI = "git://gitorious.org/arm_benchmarks/arm_benchmarks.git;protocol=http;branch=${BRANCH}"
 
 S = "${WORKDIR}/git"
 
-- 
1.7.9.5


