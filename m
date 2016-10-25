Return-Path: <denis@denix.org>
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.17])
	by arago-project.org (Postfix) with ESMTPS id A687A52A69
	for <meta-arago@arago-project.org>;
	Tue, 25 Oct 2016 19:56:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 9275920A49;
	Tue, 25 Oct 2016 19:56:13 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo03-pco.easydns.vpn [127.0.0.1]) (amavisd-new,
	port 10024)
	with ESMTP id LnrQLPWXknQ6; Tue, 25 Oct 2016 19:56:13 +0000 (UTC)
Received: from gandalf.denix.org (pool-100-15-106-107.washdc.fios.verizon.net
	[100.15.106.107])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 697F220A47;
	Tue, 25 Oct 2016 19:56:12 +0000 (UTC)
Received: from sam.denix (sam [192.168.0.5])
	by gandalf.denix.org (Postfix) with ESMTP id 6E299162177;
	Tue, 25 Oct 2016 15:56:11 -0400 (EDT)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-arago@arago-project.org
Date: Tue, 25 Oct 2016 15:56:08 -0400
Message-Id: <1477425370-21132-1-git-send-email-denis@denix.org>
X-Mailer: git-send-email 2.7.4
Subject: [PATCH 1/3] ltp-ddt: update to the latest commit
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
X-List-Received-Date: Tue, 25 Oct 2016 19:56:14 -0000

From: Denys Dmytriyenko <denys@ti.com>

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 meta-arago-extras/recipes-devtools/ltp-ddt/ltp-ddt_20160510.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-arago-extras/recipes-devtools/ltp-ddt/ltp-ddt_20160510.bb b/meta-arago-extras/recipes-devtools/ltp-ddt/ltp-ddt_20160510.bb
index 7fba2ef..ef31576 100644
--- a/meta-arago-extras/recipes-devtools/ltp-ddt/ltp-ddt_20160510.bb
+++ b/meta-arago-extras/recipes-devtools/ltp-ddt/ltp-ddt_20160510.bb
@@ -4,7 +4,7 @@ SECTION = "console/utils"
 LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"
 
-PR = "r6"
+PR = "r7"
 PV_append = "+git${SRCPV}"
 
 PROVIDES += "ltp"
@@ -14,7 +14,7 @@ RDEPENDS_${PN} += "pm-qa serialcheck"
 
 inherit autotools-brokensep
 
-SRCREV = "8b9737d0733d8bf0d70a3f37d2ee745a36a2ba4f"
+SRCREV = "2926b663850e0af624b978b402a92b9828e1b187"
 BRANCH ?= "master"
 
 SRC_URI = "git://arago-project.org/git/projects/test-automation/ltp-ddt.git;branch=${BRANCH}"
-- 
2.7.4


