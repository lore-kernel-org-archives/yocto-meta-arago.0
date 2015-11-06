Return-Path: <jake@udd0866934>
Received: from arroyo.ext.ti.com (arroyo.ext.ti.com [192.94.94.40])
	by arago-project.org (Postfix) with ESMTPS id 47BD352A5B
	for <meta-arago@arago-project.org>;
	Fri,  6 Nov 2015 19:30:38 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by arroyo.ext.ti.com (8.13.7/8.13.7) with ESMTP id tA6JUbik012097
	for <meta-arago@arago-project.org>; Fri, 6 Nov 2015 13:30:37 -0600
Received: from DLEE71.ent.ti.com (dlee71.ent.ti.com [157.170.170.114])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id tA6JUb7O010844
	for <meta-arago@arago-project.org>; Fri, 6 Nov 2015 13:30:37 -0600
Received: from dflp32.itg.ti.com (10.64.6.15) by DLEE71.ent.ti.com
	(157.170.170.114) with Microsoft SMTP Server id 14.3.224.2;
	Fri, 6 Nov 2015 13:30:38 -0600
Received: from udd0866934 (ileax41-snat.itg.ti.com [10.172.224.153])	by
	dflp32.itg.ti.com (8.14.3/8.13.8) with ESMTP id tA6JUbWd009605;
	Fri, 6 Nov 2015 13:30:37 -0600
Received: from jake by udd0866934 with local (Exim 4.82)	(envelope-from
	<jake@udd0866934>)	id 1Zumib-0006MZ-5U; Fri, 06 Nov 2015 14:30:37 -0500
From: Jacob Stiffler <j-stiffler@ti.com>
To: <meta-arago@arago-project.org>
Date: Fri, 6 Nov 2015 14:30:31 -0500
Message-ID: <1446838233-24415-3-git-send-email-j-stiffler@ti.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1446838233-24415-1-git-send-email-j-stiffler@ti.com>
References: <1446838233-24415-1-git-send-email-j-stiffler@ti.com>
MIME-Version: 1.0
Subject: [PATCH 2/4] arago-source-ipk: Enable pru-icss sourceipk
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
X-List-Received-Date: Fri, 06 Nov 2015 19:30:38 -0000
Content-Type: text/plain

Signed-off-by: Jacob Stiffler <j-stiffler@ti.com>
---
 meta-arago-distro/conf/distro/arago-source-ipk.conf | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta-arago-distro/conf/distro/arago-source-ipk.conf b/meta-arago-distro/conf/distro/arago-source-ipk.conf
index 2e93294..09e6ce4 100644
--- a/meta-arago-distro/conf/distro/arago-source-ipk.conf
+++ b/meta-arago-distro/conf/distro/arago-source-ipk.conf
@@ -339,3 +339,6 @@ SRCIPK_INSTALL_DIR_pn-hplib-mod = "board-support/${PN}-${PV}"
 
 CREATE_SRCIPK_pn-uio-module-drv = "1"
 SRCIPK_INSTALL_DIR_pn-uio-module-drv = "board-support/${PN}-${PV}"
+
+CREATE_SRCIPK_pn-pru-icss = "1"
+SRCIPK_INSTALL_DIR_pn-pru-icss = "example-applications/${PN}-${PV}"
-- 
1.9.1


