Return-Path: <yan-liu@ti.com>
Received: from lelnx193.ext.ti.com (lelnx193.ext.ti.com [198.47.27.77])
	by arago-project.org (Postfix) with ESMTPS id D6FE552A27
	for <meta-arago@arago-project.org>;
	Tue, 28 Mar 2017 16:02:36 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by lelnx193.ext.ti.com (8.15.1/8.15.1) with ESMTP id v2SG2aUc008420
	for <meta-arago@arago-project.org>; Tue, 28 Mar 2017 11:02:36 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ti.com;
	s=ti-com-17Q1; t=1490716956;
	bh=IWPvD7UAhE+djE8Ja6LiiTmgkx0SgqN4r6fsn4GPcsw=;
	h=From:To:CC:Subject:Date;
	b=uu7iNUpUcM6eeeuXx1pc2sOfvGRD5zYLSD5tD9s/SG94bxOxSw7aQ64ANvzDRmGlm
	8iztDF4YLI6QIqRI4igCU5a3CwrvD2GFNEUMg7OjM3cMexTNfu3DPjDGoItr3HWo6X
	59ap1K7yk04jLtmrYZ4+VawWjwnFI8pTPoj3C81k=
Received: from DLEE70.ent.ti.com (dlee70.ent.ti.com [157.170.170.113])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id v2SG2aPQ025307
	for <meta-arago@arago-project.org>; Tue, 28 Mar 2017 11:02:36 -0500
Received: from dlep33.itg.ti.com (157.170.170.75) by DLEE70.ent.ti.com
	(157.170.170.113) with Microsoft SMTP Server id 14.3.294.0;
	Tue, 28 Mar 2017 11:02:36 -0500
Received: from yan-ubuntu-1204.am.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])	by dlep33.itg.ti.com (8.14.3/8.13.8) with ESMTP id
	v2SG2aJ3002979;	Tue, 28 Mar 2017 11:02:36 -0500
From: <yan-liu@ti.com>
To: <meta-arago@arago-project.org>
Date: Tue, 28 Mar 2017 12:02:57 -0400
Message-ID: <1490716977-32302-1-git-send-email-yan-liu@ti.com>
X-Mailer: git-send-email 1.7.9.5
MIME-Version: 1.0
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
X-List-Received-Date: Tue, 28 Mar 2017 16:02:37 -0000
Content-Type: text/plain

From: Yan Liu <yan-liu@ti.com>

Signed-off-by: Yan Liu <yan-liu@ti.com>
---
 .../recipes-devtools/ltp-ddt/ltp-ddt_20170116.bb   |    4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-arago-extras/recipes-devtools/ltp-ddt/ltp-ddt_20170116.bb b/meta-arago-extras/recipes-devtools/ltp-ddt/ltp-ddt_20170116.bb
index e276514..033890e 100644
--- a/meta-arago-extras/recipes-devtools/ltp-ddt/ltp-ddt_20170116.bb
+++ b/meta-arago-extras/recipes-devtools/ltp-ddt/ltp-ddt_20170116.bb
@@ -4,7 +4,7 @@ SECTION = "console/utils"
 LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"
 
-PR = "r13"
+PR = "r14"
 PV_append = "+git${SRCPV}"
 
 PROVIDES += "ltp"
@@ -14,7 +14,7 @@ RDEPENDS_${PN} += "pm-qa serialcheck"
 
 inherit autotools-brokensep
 
-SRCREV = "a8664d63fc1a8945e79686787c4e0e6cbe95cdd6"
+SRCREV = "d233acf0cb34988d6cc079c4f6d4f7961a96908a"
 BRANCH ?= "master"
 
 SRC_URI = "git://arago-project.org/git/projects/test-automation/ltp-ddt.git;branch=${BRANCH}"
-- 
1.7.9.5


