Return-Path: <fcooper@ti.com>
Received: from comal.ext.ti.com (comal.ext.ti.com [198.47.26.152])
	by arago-project.org (Postfix) with ESMTPS id 7B35452A76
	for <meta-arago@arago-project.org>;
	Wed, 24 Apr 2013 14:06:05 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by comal.ext.ti.com (8.13.7/8.13.7) with ESMTP id r3OE65YG004628
	for <meta-arago@arago-project.org>; Wed, 24 Apr 2013 09:06:05 -0500
Received: from DLEE71.ent.ti.com (dlee71.ent.ti.com [157.170.170.114])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id r3OE64MC030705
	for <meta-arago@arago-project.org>; Wed, 24 Apr 2013 09:06:04 -0500
Received: from dlelxv23.itg.ti.com (172.17.1.198) by DLEE71.ent.ti.com
	(157.170.170.114) with Microsoft SMTP Server id 14.2.342.3;
	Wed, 24 Apr 2013 09:06:04 -0500
Received: from localhost.localdomain (dbdp20.itg.ti.com [172.24.170.38])	by
	dlelxv23.itg.ti.com (8.13.8/8.13.8) with ESMTP id r3OE5xsj000444;
	Wed, 24 Apr 2013 09:06:03 -0500
From: "Franklin S. Cooper Jr" <fcooper@ti.com>
To: <meta-arago@arago-project.org>
Date: Wed, 24 Apr 2013 09:05:54 -0500
Message-ID: <1366812356-29846-2-git-send-email-fcooper@ti.com>
X-Mailer: git-send-email 1.7.0.4
In-Reply-To: <1366812356-29846-1-git-send-email-fcooper@ti.com>
References: <1366812356-29846-1-git-send-email-fcooper@ti.com>
MIME-Version: 1.0
Cc: "Franklin S. Cooper Jr" <fcooper@ti.com>
Subject: [PATCH 2/4] meta-toolchain-arago-qte: Add OE_QMAKE_STRIP environment variable
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
X-List-Received-Date: Wed, 24 Apr 2013 14:06:05 -0000
Content-Type: text/plain

* This variable was included in the environment-setup file in the 05.05.01 SDK.
* Not including this variable resulted in problems when running make install for
  Qt applications.
* A customer reported this issue on TI's forums:
  e2e.ti.com/support/arm/sitara_arm/f/791/t/244849.aspx

Signed-off-by: Franklin S. Cooper Jr <fcooper@ti.com>
---
 .../recipes-core/meta/meta-toolchain-arago-qte.bb  |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/meta-arago-extras/recipes-core/meta/meta-toolchain-arago-qte.bb b/meta-arago-extras/recipes-core/meta/meta-toolchain-arago-qte.bb
index 703c1cf..2960aa0 100644
--- a/meta-arago-extras/recipes-core/meta/meta-toolchain-arago-qte.bb
+++ b/meta-arago-extras/recipes-core/meta/meta-toolchain-arago-qte.bb
@@ -26,6 +26,7 @@ toolchain_create_sdk_env_script_append() {
 	echo 'export OE_QMAKE_QDBUSCPP2XML=$SDK_PATH${bindir_nativesdk}/qdbuscpp2xml4' >> $script
 	echo 'export OE_QMAKE_QDBUSXML2CPP=$SDK_PATH${bindir_nativesdk}/qdbusxml2cpp4' >> $script
 	echo 'export OE_QMAKE_QT_CONFIG=$SDK_PATH/$TARGET_SYS${datadir}/${QT_DIR_NAME}/mkspecs/qconfig.pri' >> $script
+	echo 'export OE_QMAKE_STRIP="echo"' >> $script
 	echo 'export QMAKESPEC=$SDK_PATH/$TARGET_SYS${datadir}/${QT_DIR_NAME}/mkspecs/linux-g++' >> $script
 
 	#Adds qt.conf file that points qmake to properly locate Qt library and header files.
-- 
1.7.0.4


