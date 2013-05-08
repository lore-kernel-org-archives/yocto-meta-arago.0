Return-Path: <a0756824@ares-ubuntu>
Received: from comal.ext.ti.com (comal.ext.ti.com [198.47.26.152])
	by arago-project.org (Postfix) with ESMTPS id A3653529F5
	for <meta-arago@arago-project.org>;
	Wed,  8 May 2013 00:28:14 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by comal.ext.ti.com (8.13.7/8.13.7) with ESMTP id r480SE07017853
	for <meta-arago@arago-project.org>; Tue, 7 May 2013 19:28:14 -0500
Received: from DLEE70.ent.ti.com (dlee70.ent.ti.com [157.170.170.113])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id r480SE4p006202
	for <meta-arago@arago-project.org>; Tue, 7 May 2013 19:28:14 -0500
Received: from dlelxv22.itg.ti.com (172.17.1.197) by DLEE70.ent.ti.com
	(157.170.170.113) with Microsoft SMTP Server id 14.2.342.3;
	Tue, 7 May 2013 19:28:13 -0500
Received: from ares-ubuntu.am.dhcp.ti.com (ares-ubuntu.am.dhcp.ti.com
	[158.218.103.17])	by dlelxv22.itg.ti.com (8.13.8/8.13.8) with ESMTP id
	r480SD5o017905;	Tue, 7 May 2013 19:28:13 -0500
Received: from a0756824 by ares-ubuntu.am.dhcp.ti.com with local (Exim 4.76)
	(envelope-from <a0756824@ares-ubuntu>)	id 1UZsEv-0003lc-K1;
	Tue, 07 May 2013 20:28:13 -0400
From: Sajesh Kumar Saran <sajesh@ti.com>
To: <meta-arago@arago-project.org>
Date: Tue, 7 May 2013 20:28:09 -0400
Message-ID: <1367972890-14439-3-git-send-email-sajesh@ti.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <1367972890-14439-1-git-send-email-sajesh@ti.com>
References: <1367972890-14439-1-git-send-email-sajesh@ti.com>
MIME-Version: 1.0
Subject: [PATCH] incrementing IPC verion to 3.0.0.16
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
X-List-Received-Date: Wed, 08 May 2013 00:28:15 -0000
Content-Type: text/plain

---
 .../recipes-bsp/ti-ipc/ti-ipc_3.00.00.bb           |    4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-arago-extras/recipes-bsp/ti-ipc/ti-ipc_3.00.00.bb b/meta-arago-extras/recipes-bsp/ti-ipc/ti-ipc_3.00.00.bb
index deb0356..d127020 100644
--- a/meta-arago-extras/recipes-bsp/ti-ipc/ti-ipc_3.00.00.bb
+++ b/meta-arago-extras/recipes-bsp/ti-ipc/ti-ipc_3.00.00.bb
@@ -12,10 +12,10 @@ SECTION = "console"
 COMPATIBLE_MACHINE = "keystone"
 TARGET_PLATFORM = "tci6638"
 
-PR = "r18"
+PR = "r19"
 
 BRANCH ?= "master"
-SRCREV = "3.00.00.15_eng"
+SRCREV = "3.00.00.16_eng"
 
 SRC_URI = "git://git.ti.com/ipc/ipcdev.git;protocol=git;branch=${BRANCH}"
 
-- 
1.7.9.5


