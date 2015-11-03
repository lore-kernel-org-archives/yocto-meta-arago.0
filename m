Return-Path: <jake@udd0866934>
Received: from bear.ext.ti.com (bear.ext.ti.com [192.94.94.41])
	by arago-project.org (Postfix) with ESMTPS id C99A852AB2
	for <meta-arago@arago-project.org>;
	Tue,  3 Nov 2015 19:56:37 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by bear.ext.ti.com (8.13.7/8.13.7) with ESMTP id tA3JuaGf015507
	for <meta-arago@arago-project.org>; Tue, 3 Nov 2015 13:56:36 -0600
Received: from DLEE70.ent.ti.com (dlee70.ent.ti.com [157.170.170.113])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id tA3Juarm006519
	for <meta-arago@arago-project.org>; Tue, 3 Nov 2015 13:56:36 -0600
Received: from dlep32.itg.ti.com (157.170.170.100) by DLEE70.ent.ti.com
	(157.170.170.113) with Microsoft SMTP Server id 14.3.224.2;
	Tue, 3 Nov 2015 13:56:36 -0600
Received: from udd0866934 (ileax41-snat.itg.ti.com [10.172.224.153])	by
	dlep32.itg.ti.com (8.14.3/8.13.8) with ESMTP id tA3Juau8016073;
	Tue, 3 Nov 2015 13:56:36 -0600
Received: from jake by udd0866934 with local (Exim 4.82)	(envelope-from
	<jake@udd0866934>)	id 1Zthh5-0004V5-Qa; Tue, 03 Nov 2015 14:56:35 -0500
From: Jacob Stiffler <j-stiffler@ti.com>
To: <meta-arago@arago-project.org>
Date: Tue, 3 Nov 2015 14:56:24 -0500
Message-ID: <1446580592-17255-3-git-send-email-j-stiffler@ti.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1446580592-17255-1-git-send-email-j-stiffler@ti.com>
References: <1446580592-17255-1-git-send-email-j-stiffler@ti.com>
MIME-Version: 1.0
Subject: [PATCH 02/10] hplib-mod: Adjust SRCIPK_SRC_DIR
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
X-List-Received-Date: Tue, 03 Nov 2015 19:56:39 -0000
Content-Type: text/plain

Signed-off-by: Jacob Stiffler <j-stiffler@ti.com>
---
 meta-arago-distro/recipes-bsp/hplib/hplib-mod_git.bbappend | 3 +++
 1 file changed, 3 insertions(+)
 create mode 100644 meta-arago-distro/recipes-bsp/hplib/hplib-mod_git.bbappend

diff --git a/meta-arago-distro/recipes-bsp/hplib/hplib-mod_git.bbappend b/meta-arago-distro/recipes-bsp/hplib/hplib-mod_git.bbappend
new file mode 100644
index 0000000..ac946db
--- /dev/null
+++ b/meta-arago-distro/recipes-bsp/hplib/hplib-mod_git.bbappend
@@ -0,0 +1,3 @@
+PR_append = ".arago0"
+
+SRCIPK_SRC_DIR = "${WORKDIR}/git/ti/runtime/hplib"
-- 
1.9.1


