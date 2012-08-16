Return-Path: <a0273011@sdit-build02.dal.design.ti.com>
Received: from comal.ext.ti.com (comal.ext.ti.com [198.47.26.152])
	by arago-project.org (Postfix) with ESMTPS id 8F33252986
	for <meta-arago@arago-project.org>;
	Thu, 16 Aug 2012 17:09:57 +0000 (UTC)
Received: from dlelxv30.itg.ti.com ([172.17.2.17])
	by comal.ext.ti.com (8.13.7/8.13.7) with ESMTP id q7GH9tQt015903
	for <meta-arago@arago-project.org>; Thu, 16 Aug 2012 12:09:55 -0500
Received: from DFLE72.ent.ti.com (dfle72.ent.ti.com [128.247.5.109])
	by dlelxv30.itg.ti.com (8.13.8/8.13.8) with ESMTP id q7GH9tVG006902
	for <meta-arago@arago-project.org>; Thu, 16 Aug 2012 12:09:55 -0500
Received: from dlelxv22.itg.ti.com (172.17.1.197) by dfle72.ent.ti.com
	(128.247.5.109) with Microsoft SMTP Server id 14.1.323.3;
	Thu, 16 Aug 2012 12:09:55 -0500
Received: from sdit-build02.dal.design.ti.com (sdit-build02.dal.design.ti.com
	[10.247.66.5])	by dlelxv22.itg.ti.com (8.13.8/8.13.8) with ESMTP id
	q7GH9twn023220;	Thu, 16 Aug 2012 12:09:55 -0500
Received: from a0273011 by sdit-build02.dal.design.ti.com with local (Exim
	4.71)	(envelope-from <a0273011@sdit-build02.dal.design.ti.com>)	id
	1T23jb-0005Pe-9n; Thu, 16 Aug 2012 12:19:51 -0500
From: Franklin S Cooper Jr <fcooper@ti.com>
To: <meta-arago@arago-project.org>
Date: Thu, 16 Aug 2012 12:19:50 -0500
Message-ID: <1345137590-20636-1-git-send-email-fcooper@ti.com>
X-Mailer: git-send-email 1.7.0.4
MIME-Version: 1.0
Cc: Franklin S Cooper Jr <fcooper@ti.com>
Subject: [meta-arago-distro][PATCH] arago.conf: Set Qt PREFERRED_VERSION
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
X-List-Received-Date: Thu, 16 Aug 2012 17:09:58 -0000
Content-Type: text/plain

* The various qt version 4.8.0 recipes have set the DEFAULT_PREFERENCE variable
  to -1 which causes version 4.7.4 to be used instead.
* Setting the PREFERRED_VERSION variable to pull in qt version 4.8.0 instead.

Signed-off-by: Franklin S Cooper Jr <fcooper@ti.com>
---
 meta-arago-distro/conf/distro/arago.conf |    5 +++++
 1 files changed, 5 insertions(+), 0 deletions(-)

diff --git a/meta-arago-distro/conf/distro/arago.conf b/meta-arago-distro/conf/distro/arago.conf
index ab8e6d6..cfef500 100644
--- a/meta-arago-distro/conf/distro/arago.conf
+++ b/meta-arago-distro/conf/distro/arago.conf
@@ -13,3 +13,8 @@ TOOLCHAIN_PATH := "${@bool(bb.data.getVar('TOOLCHAIN_SYSPATH', d, 1)) and (os.pa
 EXTERNAL_TOOLCHAIN = "${TOOLCHAIN_PATH}"
 
 PREFERRED_PROVIDER_virtual/gettext = "gettext"
+
+PREFERRED_VERSION_qt4-embedded = "4.8.0"
+PREFERRED_VERSION_qt4-native = "4.8.0"
+PREFERRED_VERSION_qt4-tools-nativesdk = "4.8.0"
+
-- 
1.7.0.4


