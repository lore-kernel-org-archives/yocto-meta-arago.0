Return-Path: <jake@udd0866934>
Received: from devils.ext.ti.com (devils.ext.ti.com [198.47.26.153])
	by arago-project.org (Postfix) with ESMTPS id C56F052A02
	for <meta-arago@arago-project.org>;
	Wed, 16 Sep 2015 17:15:04 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by devils.ext.ti.com (8.13.7/8.13.7) with ESMTP id t8GHF4cx020864
	for <meta-arago@arago-project.org>; Wed, 16 Sep 2015 12:15:04 -0500
Received: from DLEE71.ent.ti.com (dlee71.ent.ti.com [157.170.170.114])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id t8GHF4pQ003422
	for <meta-arago@arago-project.org>; Wed, 16 Sep 2015 12:15:04 -0500
Received: from dflp33.itg.ti.com (10.64.6.16) by DLEE71.ent.ti.com
	(157.170.170.114) with Microsoft SMTP Server id 14.3.224.2;
	Wed, 16 Sep 2015 12:15:04 -0500
Received: from udd0866934 (ileax41-snat.itg.ti.com [10.172.224.153])	by
	dflp33.itg.ti.com (8.14.3/8.13.8) with ESMTP id t8GHF3EW005472;
	Wed, 16 Sep 2015 12:15:03 -0500
Received: from jake by udd0866934 with local (Exim 4.82)	(envelope-from
	<jake@udd0866934>)	id 1ZcGIR-0006Sp-ES; Wed, 16 Sep 2015 13:15:03 -0400
From: Jacob Stiffler <j-stiffler@ti.com>
To: <meta-arago@arago-project.org>
Date: Wed, 16 Sep 2015 13:14:58 -0400
Message-ID: <1442423699-24800-3-git-send-email-j-stiffler@ti.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1442423699-24800-1-git-send-email-j-stiffler@ti.com>
References: <1442423699-24800-1-git-send-email-j-stiffler@ti.com>
MIME-Version: 1.0
Subject: [PATCH 3/4] am-sysinfo: Bump SRCREV
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
X-List-Received-Date: Wed, 16 Sep 2015 17:15:05 -0000
Content-Type: text/plain

* Fix Makefile to take LDFLAGS from environment.

Signed-off-by: Jacob Stiffler <j-stiffler@ti.com>
---
 meta-arago-extras/recipes-core/am-sysinfo/am-sysinfo_git.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-arago-extras/recipes-core/am-sysinfo/am-sysinfo_git.bb b/meta-arago-extras/recipes-core/am-sysinfo/am-sysinfo_git.bb
index 0fa7366..0dc9e8e 100644
--- a/meta-arago-extras/recipes-core/am-sysinfo/am-sysinfo_git.bb
+++ b/meta-arago-extras/recipes-core/am-sysinfo/am-sysinfo_git.bb
@@ -6,10 +6,10 @@ LIC_FILES_CHKSUM = "file://mem_util/mem_util.c;beginline=1;endline=37;md5=8aa8e7
 SECTION = "system"
 
 PACKAGE_STRIP = "no"
-PR = "r9"
+PR = "r10"
 
 BRANCH ?= "master"
-SRCREV = "5df7da69a50d27b7f594db0918c5e6793c3a6237"
+SRCREV = "cfc788fc883932385d42b99b7f18b2c3ba8ea579"
 
 SRC_URI = "git://git.ti.com/apps/am_sysinfo.git;protocol=git;branch=${BRANCH}"
 
-- 
1.9.1


