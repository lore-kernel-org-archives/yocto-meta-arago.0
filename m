Return-Path: <jake@udd0866934>
Received: from comal.ext.ti.com (comal.ext.ti.com [198.47.26.152])
	by arago-project.org (Postfix) with ESMTPS id 6D8FB52A02
	for <meta-arago@arago-project.org>;
	Wed, 16 Sep 2015 17:15:04 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by comal.ext.ti.com (8.13.7/8.13.7) with ESMTP id t8GHF3F0001649
	for <meta-arago@arago-project.org>; Wed, 16 Sep 2015 12:15:03 -0500
Received: from DLEE71.ent.ti.com (dlee71.ent.ti.com [157.170.170.114])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id t8GHF3JA011781
	for <meta-arago@arago-project.org>; Wed, 16 Sep 2015 12:15:03 -0500
Received: from dflp33.itg.ti.com (10.64.6.16) by DLEE71.ent.ti.com
	(157.170.170.114) with Microsoft SMTP Server id 14.3.224.2;
	Wed, 16 Sep 2015 12:15:03 -0500
Received: from udd0866934 (ileax41-snat.itg.ti.com [10.172.224.153])	by
	dflp33.itg.ti.com (8.14.3/8.13.8) with ESMTP id t8GHF26d005413;
	Wed, 16 Sep 2015 12:15:03 -0500
Received: from jake by udd0866934 with local (Exim 4.82)	(envelope-from
	<jake@udd0866934>)	id 1ZcGIQ-0006Sk-Oz; Wed, 16 Sep 2015 13:15:02 -0400
From: Jacob Stiffler <j-stiffler@ti.com>
To: <meta-arago@arago-project.org>
Date: Wed, 16 Sep 2015 13:14:57 -0400
Message-ID: <1442423699-24800-2-git-send-email-j-stiffler@ti.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1442423699-24800-1-git-send-email-j-stiffler@ti.com>
References: <1442423699-24800-1-git-send-email-j-stiffler@ti.com>
MIME-Version: 1.0
Subject: [PATCH 2/4] arm-benchmarks: Bump SRCREV
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
X-List-Received-Date: Wed, 16 Sep 2015 17:15:04 -0000
Content-Type: text/plain

* Fix Makefile to take LDFLAGS from environment.

Signed-off-by: Jacob Stiffler <j-stiffler@ti.com>
---
 .../recipes-benchmark/arm-benchmarks/arm-benchmarks_1.3.bb            | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-arago-extras/recipes-benchmark/arm-benchmarks/arm-benchmarks_1.3.bb b/meta-arago-extras/recipes-benchmark/arm-benchmarks/arm-benchmarks_1.3.bb
index 5b72bb0..fd72a26 100644
--- a/meta-arago-extras/recipes-benchmark/arm-benchmarks/arm-benchmarks_1.3.bb
+++ b/meta-arago-extras/recipes-benchmark/arm-benchmarks/arm-benchmarks_1.3.bb
@@ -4,10 +4,10 @@ LICENSE = "BSD"
 LIC_FILES_CHKSUM = "file://COPYING;md5=7aefb5e1cffc7b6a3ef18b803f957922"
 SECTION = "system"
 
-PR = "r9"
+PR = "r10"
 
 BRANCH ?= "master"
-SRCREV = "b3997516aee27d46ce1f59796af82ddbf06d20f4"
+SRCREV = "e124b687cbc56a663f8403c9836244a8595e0f70"
 
 SRC_URI = "git://git.ti.com/apps/arm_benchmarks.git;protocol=git;branch=${BRANCH}"
 
-- 
1.9.1


