Return-Path: <a0875592@swubn01>
Received: from devils.ext.ti.com (devils.ext.ti.com [198.47.26.153])
	by arago-project.org (Postfix) with ESMTPS id 6776C529A7
	for <meta-arago@arago-project.org>;
	Tue,  1 Oct 2013 05:27:51 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by devils.ext.ti.com (8.13.7/8.13.7) with ESMTP id r915RoJT006287
	for <meta-arago@arago-project.org>; Tue, 1 Oct 2013 00:27:50 -0500
Received: from DFLE72.ent.ti.com (dfle72.ent.ti.com [128.247.5.109])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id r915Ro4p027386
	for <meta-arago@arago-project.org>; Tue, 1 Oct 2013 00:27:50 -0500
Received: from dflp33.itg.ti.com (10.64.6.16) by DFLE72.ent.ti.com
	(128.247.5.109) with Microsoft SMTP Server id 14.2.342.3;
	Tue, 1 Oct 2013 00:27:49 -0500
Received: from swubn01 (ileax41-snat.itg.ti.com [10.172.224.153])	by
	dflp33.itg.ti.com (8.14.3/8.13.8) with ESMTP id r915RnkH012248;
	Tue, 1 Oct 2013 00:27:49 -0500
Received: from a0875592 by swubn01 with local (Exim 4.71)	(envelope-from
	<a0875592@swubn01>)	id 1VQsUu-0000eS-Lm; Tue, 01 Oct 2013 10:57:48 +0530
From: Siddharth Heroor <heroor@ti.com>
To: <meta-arago@arago-project.org>
Date: Tue, 1 Oct 2013 10:57:40 +0530
Message-ID: <1380605260-2468-1-git-send-email-heroor@ti.com>
X-Mailer: git-send-email 1.7.0.4
MIME-Version: 1.0
Subject: [PATCH] omapconf: update to v1.68
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
X-List-Received-Date: Tue, 01 Oct 2013 05:27:52 -0000
Content-Type: text/plain

Signed-off-by: Siddharth Heroor <heroor@ti.com>
---
 .../recipes-devtools/omapconf/omapconf_git.bb      |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-arago-extras/recipes-devtools/omapconf/omapconf_git.bb b/meta-arago-extras/recipes-devtools/omapconf/omapconf_git.bb
index a505eca..2170d9e 100644
--- a/meta-arago-extras/recipes-devtools/omapconf/omapconf_git.bb
+++ b/meta-arago-extras/recipes-devtools/omapconf/omapconf_git.bb
@@ -4,13 +4,13 @@ HOMEPAGE = "https://github.com/omapconf/omapconf"
 LICENSE = "GPLv2 BSD"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=205c83c4e2242a765acb923fc766e914"
 
-PV = "1.66"
+PV = "1.68"
 PR = "r0"
 
 COMPATIBLE_MACHINE = "omap-a15|omap4"
 
 BRANCH ?= "master"
-SRCREV = "418b94bde60dbd3f85a0afb6e4d2a808cfb104cd"
+SRCREV = "51fa0acb6ae24a9f14b11bc4b56c4f764b017f3f"
 
 SRC_URI = "git://github.com/omapconf/omapconf.git;protocol=git;branch=${BRANCH}"
 
-- 
1.7.0.4


