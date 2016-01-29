Return-Path: <jake@udd0866934>
Received: from comal.ext.ti.com (comal.ext.ti.com [198.47.26.152])
	by arago-project.org (Postfix) with ESMTPS id 916F352AA6
	for <meta-arago@arago-project.org>;
	Fri, 29 Jan 2016 15:10:23 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by comal.ext.ti.com (8.13.7/8.13.7) with ESMTP id u0TFANfI022678
	for <meta-arago@arago-project.org>; Fri, 29 Jan 2016 09:10:23 -0600
Received: from DLEE71.ent.ti.com (dlee71.ent.ti.com [157.170.170.114])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id u0TFAMU5019087
	for <meta-arago@arago-project.org>; Fri, 29 Jan 2016 09:10:22 -0600
Received: from dflp33.itg.ti.com (10.64.6.16) by DLEE71.ent.ti.com
	(157.170.170.114) with Microsoft SMTP Server id 14.3.224.2;
	Fri, 29 Jan 2016 09:10:22 -0600
Received: from udd0866934 (ileax41-snat.itg.ti.com [10.172.224.153])	by
	dflp33.itg.ti.com (8.14.3/8.13.8) with ESMTP id u0TFAMjQ008666;
	Fri, 29 Jan 2016 09:10:22 -0600
Received: from jake by udd0866934 with local (Exim 4.82)	(envelope-from
	<jake@udd0866934>)	id 1aPAgo-0001oU-Ee; Fri, 29 Jan 2016 10:10:22 -0500
From: Jacob Stiffler <j-stiffler@ti.com>
To: <meta-arago@arago-project.org>
Date: Fri, 29 Jan 2016 10:10:14 -0500
Message-ID: <1454080219-6927-3-git-send-email-j-stiffler@ti.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1454080219-6927-1-git-send-email-j-stiffler@ti.com>
References: <1454080219-6927-1-git-send-email-j-stiffler@ti.com>
MIME-Version: 1.0
Subject: [PATCH 2/7] arago-source-ipk: Enable qt-opencv-opencl-opengl-multithreaded-src
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
X-List-Received-Date: Fri, 29 Jan 2016 15:10:24 -0000
Content-Type: text/plain

Signed-off-by: Jacob Stiffler <j-stiffler@ti.com>
---
 meta-arago-distro/conf/distro/arago-source-ipk.conf | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta-arago-distro/conf/distro/arago-source-ipk.conf b/meta-arago-distro/conf/distro/arago-source-ipk.conf
index 122ea2d..4447463 100644
--- a/meta-arago-distro/conf/distro/arago-source-ipk.conf
+++ b/meta-arago-distro/conf/distro/arago-source-ipk.conf
@@ -336,6 +336,9 @@ SRCIPK_INSTALL_DIR_pn-oe-layersetup = "bin/oe-layersetup"
 CREATE_SRCIPK_pn-opencl-examples = "1"
 SRCIPK_INSTALL_DIR_pn-opencl-examples = "example-applications/${PN}-${PV}"
 
+CREATE_SRCIPK_pn-qt-opencv-opencl-opengl-multithreaded = "1"
+SRCIPK_INSTALL_DIR_pn-qt-opencv-opencl-opengl-multithreaded = "example-applications/${PN}-${PV}"
+
 CREATE_SRCIPK_pn-boot-monitor = "1"
 SRCIPK_INSTALL_DIR_pn-boot-monitor = "board-support/${PN}-${PV}"
 
-- 
1.9.1


