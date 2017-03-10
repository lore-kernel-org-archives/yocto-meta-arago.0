Return-Path: <yan-liu@ti.com>
Received: from lelnx193.ext.ti.com (lelnx193.ext.ti.com [198.47.27.77])
	by arago-project.org (Postfix) with ESMTPS id 55EAB52007
	for <meta-arago@arago-project.org>;
	Fri, 10 Mar 2017 19:09:12 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by lelnx193.ext.ti.com (8.15.1/8.15.1) with ESMTP id v2AJ9CW9022435
	for <meta-arago@arago-project.org>; Fri, 10 Mar 2017 13:09:12 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ti.com;
	s=ti-com-17Q1; t=1489172952;
	bh=QiLP9cl8N6uN4ahFSJi/HdlMmv0ulGsLMBxe/9Q4/kc=;
	h=From:To:CC:Subject:Date;
	b=LtVDBJ9hEf+mE/3UEmJs2/GGhRpN6Jw4R/M/N3DSGq+D4RPwtl030d5wFz+a9Vx+T
	LC1vx+jVZ3ej7SKP/XEBJOOqH3YRkfHlxC0yDfODovqZosUUJFuvrxsl4MJh7suOaK
	eDJOd6cuhf0RMmdKfVKgLnzjh+4KgsbNf3pGXPwc=
Received: from DFLE73.ent.ti.com (dfle73.ent.ti.com [128.247.5.110])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id v2AJ9BKO026022
	for <meta-arago@arago-project.org>; Fri, 10 Mar 2017 13:09:12 -0600
Received: from dflp33.itg.ti.com (10.64.6.16) by DFLE73.ent.ti.com
	(128.247.5.110) with Microsoft SMTP Server id 14.3.294.0;
	Fri, 10 Mar 2017 13:09:11 -0600
Received: from yan-ubuntu-1204.am.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])	by dflp33.itg.ti.com (8.14.3/8.13.8) with ESMTP id
	v2AJ9BKU009288;	Fri, 10 Mar 2017 13:09:11 -0600
From: <yan-liu@ti.com>
To: <meta-arago@arago-project.org>
Date: Fri, 10 Mar 2017 14:08:52 -0500
Message-ID: <1489172932-22124-1-git-send-email-yan-liu@ti.com>
X-Mailer: git-send-email 1.7.9.5
MIME-Version: 1.0
Subject: [PATCH v2] ltp-ddt: Update to latest ltp-ddt
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
X-List-Received-Date: Fri, 10 Mar 2017 19:09:12 -0000
Content-Type: text/plain

From: Yan Liu <yan-liu@ti.com>

Signed-off-by: Yan Liu <yan-liu@ti.com>
---
 .../recipes-devtools/ltp-ddt/ltp-ddt_20170116.bb   |    4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-arago-extras/recipes-devtools/ltp-ddt/ltp-ddt_20170116.bb b/meta-arago-extras/recipes-devtools/ltp-ddt/ltp-ddt_20170116.bb
index 2d78fa8..75e298f 100644
--- a/meta-arago-extras/recipes-devtools/ltp-ddt/ltp-ddt_20170116.bb
+++ b/meta-arago-extras/recipes-devtools/ltp-ddt/ltp-ddt_20170116.bb
@@ -4,7 +4,7 @@ SECTION = "console/utils"
 LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"
 
-PR = "r11"
+PR = "r12"
 PV_append = "+git${SRCPV}"
 
 PROVIDES += "ltp"
@@ -14,7 +14,7 @@ RDEPENDS_${PN} += "pm-qa serialcheck"
 
 inherit autotools-brokensep
 
-SRCREV = "7b43afae8b931541388b0a7e6f65d7ceb6d01b3e"
+SRCREV = "127c5f715a6bc149189cc4ba84f97cc3d7857c8f"
 BRANCH ?= "master"
 
 SRC_URI = "git://arago-project.org/git/projects/test-automation/ltp-ddt.git;branch=${BRANCH}"
-- 
1.7.9.5


