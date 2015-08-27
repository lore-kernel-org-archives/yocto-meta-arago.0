Return-Path: <karthik.ramanan@ti.com>
Received: from comal.ext.ti.com (comal.ext.ti.com [198.47.26.152])
	by arago-project.org (Postfix) with ESMTPS id 341CF52A08
	for <meta-arago@arago-project.org>;
	Thu, 27 Aug 2015 09:07:50 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by comal.ext.ti.com (8.13.7/8.13.7) with ESMTP id t7R97ns4030554
	for <meta-arago@arago-project.org>; Thu, 27 Aug 2015 04:07:49 -0500
Received: from DLEE70.ent.ti.com (dlee70.ent.ti.com [157.170.170.113])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id t7R97nst008713
	for <meta-arago@arago-project.org>; Thu, 27 Aug 2015 04:07:49 -0500
Received: from dflp33.itg.ti.com (10.64.6.16) by DLEE70.ent.ti.com
	(157.170.170.113) with Microsoft SMTP Server id 14.3.224.2;
	Thu, 27 Aug 2015 04:07:48 -0500
Received: from swubn01.india.ti.com (ileax41-snat.itg.ti.com [10.172.224.153])
	by dflp33.itg.ti.com (8.14.3/8.13.8) with ESMTP id t7R97lFr032320;
	Thu, 27 Aug 2015 04:07:48 -0500
From: Karthik Ramanan <a0393906@ti.com>
To: <meta-arago@arago-project.org>
Date: Thu, 27 Aug 2015 14:37:46 +0530
Message-ID: <1440666466-25862-1-git-send-email-a0393906@ti.com>
X-Mailer: git-send-email 1.7.9.5
MIME-Version: 1.0
Subject: [daisy, master] omapconf: update to version 1.72
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
X-List-Received-Date: Thu, 27 Aug 2015 09:07:50 -0000
Content-Type: text/plain

Signed-off-by: Karthik Ramanan <a0393906@ti.com>
---
 .../recipes-devtools/omapconf/omapconf_git.bb      |    6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta-arago-extras/recipes-devtools/omapconf/omapconf_git.bb b/meta-arago-extras/recipes-devtools/omapconf/omapconf_git.bb
index 5bc8a9e..4121150 100644
--- a/meta-arago-extras/recipes-devtools/omapconf/omapconf_git.bb
+++ b/meta-arago-extras/recipes-devtools/omapconf/omapconf_git.bb
@@ -4,13 +4,13 @@ HOMEPAGE = "https://github.com/omapconf/omapconf"
 LICENSE = "GPLv2 BSD"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=205c83c4e2242a765acb923fc766e914"
 
-PV = "1.71+1.72-rc1"
-PR = "r0"
+PV = "1.72"
+PR = "r1"
 
 COMPATIBLE_MACHINE = "ti33x|ti43x|omap-a15|omap4"
 
 BRANCH ?= "master"
-SRCREV = "576b01f43bcbfa15fb25b2aeb17ac3b3aa70e3d7"
+SRCREV = "e821a16e707cbde41ed07c1a05de4a497b39c000"
 
 SRC_URI = "git://github.com/omapconf/omapconf.git;protocol=git;branch=${BRANCH}"
 
-- 
1.7.9.5


