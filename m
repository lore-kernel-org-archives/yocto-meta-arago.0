Return-Path: <denis@denix.org>
Received: from vms173017pub.verizon.net (vms173017pub.verizon.net
	[206.46.173.17])
	by arago-project.org (Postfix) with ESMTPS id 5E4FB5208C
	for <meta-arago@arago-project.org>;
	Tue, 16 Aug 2016 20:22:18 +0000 (UTC)
Received: from vz-proxy-m002.mx.aol.com ([64.236.83.3])
	by vms173017.mailsrvcs.net
	(Oracle Communications Messaging Server 7.0.5.32.0 64bit (built Jul 16
	2014)) with ESMTPA id <0OC000M2ZR8QZ7A0@vms173017.mailsrvcs.net> for
	meta-arago@arago-project.org; Tue, 16 Aug 2016 15:22:03 -0500 (CDT)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.1 cv=MtGvkDue c=1 sm=1 tr=0	a=yQ9kT6OsLgv7WE5tBE7I5g==:117
	a=7z1cN_iqozsA:10 a=sozttTNsAAAA:8	a=HihYlcsHAAAA:8
	a=lIudUmX-Z9Kg3_q3jB8A:9
Received: by 100.15.86.14 with SMTP id 52b6b479; Tue, 16 Aug 2016 20:22:03 GMT
Received: from sam.denix (sam [192.168.0.5])	by gandalf.denix.org (Postfix)
	with ESMTP id 00B481620F3;	Tue, 16 Aug 2016 16:22:01 -0400 (EDT)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-arago@arago-project.org
Date: Tue, 16 Aug 2016 16:22:01 -0400
Message-id: <1471378921-25291-1-git-send-email-denis@denix.org>
X-Mailer: git-send-email 2.7.4
Subject: [PATCH] ltp-ddt: update to the latest
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
X-List-Received-Date: Tue, 16 Aug 2016 20:22:18 -0000

From: Denys Dmytriyenko <denys@ti.com>

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 meta-arago-extras/recipes-devtools/ltp-ddt/ltp-ddt_20160510.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-arago-extras/recipes-devtools/ltp-ddt/ltp-ddt_20160510.bb b/meta-arago-extras/recipes-devtools/ltp-ddt/ltp-ddt_20160510.bb
index e526655..d5e5664 100644
--- a/meta-arago-extras/recipes-devtools/ltp-ddt/ltp-ddt_20160510.bb
+++ b/meta-arago-extras/recipes-devtools/ltp-ddt/ltp-ddt_20160510.bb
@@ -4,7 +4,7 @@ SECTION = "console/utils"
 LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"
 
-PR = "r1"
+PR = "r2"
 PV_append = "+git${SRCPV}"
 
 PROVIDES += "ltp"
@@ -14,7 +14,7 @@ RDEPENDS_${PN} += "pm-qa serialcheck"
 
 inherit autotools-brokensep
 
-SRCREV = "dcf7d78ce8fc4ce1e280085bae9ec2d64cd3fdf1"
+SRCREV = "bd741d353d15f3d7bbc3579f2371933f9dd300fb"
 BRANCH ?= "master"
 
 SRC_URI = "git://arago-project.org/git/projects/test-automation/ltp-ddt.git;branch=${BRANCH}"
-- 
2.7.4


