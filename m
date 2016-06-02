Return-Path: <denis@denix.org>
Received: from vms173023pub.verizon.net (vms173023pub.verizon.net
	[206.46.173.23])
	by arago-project.org (Postfix) with ESMTPS id 991D152090
	for <meta-arago@arago-project.org>;
	Thu,  2 Jun 2016 19:09:54 +0000 (UTC)
Received: from vz-proxy-m007.mx.aol.com ([64.236.83.14])
	by vms173023.mailsrvcs.net
	(Oracle Communications Messaging Server 7.0.5.32.0 64bit (built Jul 16
	2014)) with ESMTPA id <0O8500B0XRVYP4C0@vms173023.mailsrvcs.net> for
	meta-arago@arago-project.org; Thu, 02 Jun 2016 14:09:36 -0500 (CDT)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.1 cv=WcjxEBVX c=1 sm=1 tr=0	a=MJxOpqxZADbEbEImuSX/mw==:117
	a=eIhxMilvRf8A:10 a=pD_ry4oyNxEA:10	a=sozttTNsAAAA:8 a=x5BwiFZGAAAA:8
	a=8rzGWIGGXaePXXifIJQA:9
Received: by 100.15.86.14 with SMTP id 009e8714; Thu, 02 Jun 2016 19:09:35 GMT
Received: from localhost.localdomain (elrond [192.168.0.7])
	by gandalf.denix.org (Postfix) with ESMTP id 9C24A162037;	Thu,
	2 Jun 2016 15:09:34 -0400 (EDT)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-arago@arago-project.org
Date: Thu, 02 Jun 2016 15:09:34 -0400
Message-id: <1464894574-25569-1-git-send-email-denis@denix.org>
X-Mailer: git-send-email 2.2.0
Subject: [PATCH] libdce: update to latest commit after 3.00.10.01
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
X-List-Received-Date: Thu, 02 Jun 2016 19:09:55 -0000

From: Denys Dmytriyenko <denys@ti.com>

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 .../libdce/{libdce_3.00.08.02.bb => libdce_3.00.10.01.bb}              | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)
 rename meta-arago-extras/recipes-multimedia/libdce/{libdce_3.00.08.02.bb => libdce_3.00.10.01.bb} (88%)

diff --git a/meta-arago-extras/recipes-multimedia/libdce/libdce_3.00.08.02.bb b/meta-arago-extras/recipes-multimedia/libdce/libdce_3.00.10.01.bb
similarity index 88%
rename from meta-arago-extras/recipes-multimedia/libdce/libdce_3.00.08.02.bb
rename to meta-arago-extras/recipes-multimedia/libdce/libdce_3.00.10.01.bb
index be17d90..aa61cb6 100644
--- a/meta-arago-extras/recipes-multimedia/libdce/libdce_3.00.08.02.bb
+++ b/meta-arago-extras/recipes-multimedia/libdce/libdce_3.00.10.01.bb
@@ -7,8 +7,7 @@ inherit autotools pkgconfig
 DEPENDS = "libdrm ti-ipc"
 
 SRC_URI = "git://git.omapzoom.org/repo/libdce.git;protocol=git"
-SRCREV = "3040e7e3f7d1ed42a1273ccc6b912328b90b16db"
+SRCREV = "4e9b02508ac3847df0af5c496a1be7b4ae082ad5"
 
 S = "${WORKDIR}/git"
 EXTRA_OECONF += "IPC_HEADERS=${STAGING_INCDIR}/ti/ipc/mm"
-
-- 
2.2.0


