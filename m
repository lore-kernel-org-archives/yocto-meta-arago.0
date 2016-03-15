Return-Path: <jake@udd0866934>
Received: from bear.ext.ti.com (bear.ext.ti.com [192.94.94.41])
	by arago-project.org (Postfix) with ESMTPS id 6440952ABE
	for <meta-arago@arago-project.org>;
	Tue, 15 Mar 2016 19:54:17 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by bear.ext.ti.com (8.13.7/8.13.7) with ESMTP id u2FJsGxl027442
	for <meta-arago@arago-project.org>; Tue, 15 Mar 2016 14:54:16 -0500
Received: from DLEE70.ent.ti.com (dlemailx.itg.ti.com [157.170.170.113])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id u2FJsG1V025383
	for <meta-arago@arago-project.org>; Tue, 15 Mar 2016 14:54:16 -0500
Received: from dflp33.itg.ti.com (10.64.6.16) by DLEE70.ent.ti.com
	(157.170.170.113) with Microsoft SMTP Server id 14.3.224.2;
	Tue, 15 Mar 2016 14:54:16 -0500
Received: from udd0866934 (ileax41-snat.itg.ti.com [10.172.224.153])	by
	dflp33.itg.ti.com (8.14.3/8.13.8) with ESMTP id u2FJsGr0032701;
	Tue, 15 Mar 2016 14:54:16 -0500
Received: from jake by udd0866934 with local (Exim 4.82)	(envelope-from
	<jake@udd0866934>)	id 1afv2m-0004Zt-39; Tue, 15 Mar 2016 15:54:16 -0400
From: Jacob Stiffler <j-stiffler@ti.com>
To: <meta-arago@arago-project.org>
Date: Tue, 15 Mar 2016 15:54:08 -0400
Message-ID: <1458071653-17553-4-git-send-email-j-stiffler@ti.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1458071653-17553-1-git-send-email-j-stiffler@ti.com>
References: <1458071653-17553-1-git-send-email-j-stiffler@ti.com>
MIME-Version: 1.0
Cc: xuj@ti.com
Subject: [PATCH 3/8] arago-source-ipk: Enable libarch-examples-src
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
X-List-Received-Date: Tue, 15 Mar 2016 19:54:19 -0000
Content-Type: text/plain

Signed-off-by: Jacob Stiffler <j-stiffler@ti.com>
---
 meta-arago-distro/conf/distro/arago-source-ipk.conf | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta-arago-distro/conf/distro/arago-source-ipk.conf b/meta-arago-distro/conf/distro/arago-source-ipk.conf
index 95132c8..56a488f 100644
--- a/meta-arago-distro/conf/distro/arago-source-ipk.conf
+++ b/meta-arago-distro/conf/distro/arago-source-ipk.conf
@@ -347,6 +347,9 @@ SRCIPK_INSTALL_DIR_pn-openmpacc-examples = "example-applications/${PN}-${PV}"
 CREATE_SRCIPK_pn-qt-opencv-opencl-opengl-multithreaded = "1"
 SRCIPK_INSTALL_DIR_pn-qt-opencv-opencl-opengl-multithreaded = "example-applications/${PN}-${PV}"
 
+CREATE_SRCIPK_pn-libarch-examples = "1"
+SRCIPK_INSTALL_DIR_pn-libarch-examples = "example-applications/${PN}-${PV}"
+
 CREATE_SRCIPK_pn-boot-monitor = "1"
 SRCIPK_INSTALL_DIR_pn-boot-monitor = "board-support/${PN}-${PV}"
 
-- 
1.9.1


