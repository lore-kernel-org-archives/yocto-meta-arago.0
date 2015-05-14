Return-Path: <jake@ubuntu-quadshannondemopc5>
Received: from bear.ext.ti.com (bear.ext.ti.com [192.94.94.41])
	by arago-project.org (Postfix) with ESMTPS id 1485052A4F
	for <meta-arago@arago-project.org>;
	Thu, 14 May 2015 14:28:33 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by bear.ext.ti.com (8.13.7/8.13.7) with ESMTP id t4EESV9f006147
	for <meta-arago@arago-project.org>; Thu, 14 May 2015 09:28:31 -0500
Received: from DLEE71.ent.ti.com (dlee71.ent.ti.com [157.170.170.114])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id t4EESVdY022431
	for <meta-arago@arago-project.org>; Thu, 14 May 2015 09:28:31 -0500
Received: from dflp33.itg.ti.com (10.64.6.16) by DLEE71.ent.ti.com
	(157.170.170.114) with Microsoft SMTP Server id 14.3.224.2;
	Thu, 14 May 2015 09:28:30 -0500
Received: from Ubuntu-QuadShannonDemoPC5 (ileax41-snat.itg.ti.com
	[10.172.224.153])	by dflp33.itg.ti.com (8.14.3/8.13.8) with ESMTP id
	t4EESUte001508;	Thu, 14 May 2015 09:28:30 -0500
Received: from jake by Ubuntu-QuadShannonDemoPC5 with local (Exim 4.76)
	(envelope-from <jake@ubuntu-quadshannondemopc5>)	id 1Ysu7i-0006na-Nk;
	Thu, 14 May 2015 10:28:30 -0400
From: Jacob Stiffler <j-stiffler@ti.com>
To: <meta-arago@arago-project.org>
Date: Thu, 14 May 2015 10:28:17 -0400
Message-ID: <1431613705-26086-2-git-send-email-j-stiffler@ti.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <1431613705-26086-1-git-send-email-j-stiffler@ti.com>
References: <1431613705-26086-1-git-send-email-j-stiffler@ti.com>
MIME-Version: 1.0
Subject: [PATCH 1/9] arm-benchmarks: Move SRC_URI to git.ti.com.
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
X-List-Received-Date: Thu, 14 May 2015 14:28:33 -0000
Content-Type: text/plain

Signed-off-by: Jacob Stiffler <j-stiffler@ti.com>
---
 .../arm-benchmarks/arm-benchmarks_1.3.bb           |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-arago-extras/recipes-benchmark/arm-benchmarks/arm-benchmarks_1.3.bb b/meta-arago-extras/recipes-benchmark/arm-benchmarks/arm-benchmarks_1.3.bb
index 20363d8..bbef97f 100644
--- a/meta-arago-extras/recipes-benchmark/arm-benchmarks/arm-benchmarks_1.3.bb
+++ b/meta-arago-extras/recipes-benchmark/arm-benchmarks/arm-benchmarks_1.3.bb
@@ -9,7 +9,7 @@ PR = "r8"
 BRANCH ?= "master"
 SRCREV = "7f76ec24d3fedb9b2e3331f77c2f790c8b43f5f0"
 
-SRC_URI = "git://gitorious.org/arm_benchmarks/arm_benchmarks.git;protocol=http;branch=${BRANCH}"
+SRC_URI = "git://git.ti.com/apps/arm_benchmarks.git;protocol=git;branch=${BRANCH}"
 
 S = "${WORKDIR}/git"
 
-- 
1.7.9.5


