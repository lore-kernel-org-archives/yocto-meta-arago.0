Return-Path: <jake@udd0866934>
Received: from arroyo.ext.ti.com (arroyo.ext.ti.com [192.94.94.40])
	by arago-project.org (Postfix) with ESMTPS id CCE2E52AD6
	for <meta-arago@arago-project.org>;
	Fri, 19 Feb 2016 19:43:02 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by arroyo.ext.ti.com (8.13.7/8.13.7) with ESMTP id u1JJh2d8006624
	for <meta-arago@arago-project.org>; Fri, 19 Feb 2016 13:43:02 -0600
Received: from DLEE70.ent.ti.com (dlemailx.itg.ti.com [157.170.170.113])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id u1JJh1pN022377
	for <meta-arago@arago-project.org>; Fri, 19 Feb 2016 13:43:02 -0600
Received: from dflp33.itg.ti.com (10.64.6.16) by DLEE70.ent.ti.com
	(157.170.170.113) with Microsoft SMTP Server id 14.3.224.2;
	Fri, 19 Feb 2016 13:43:01 -0600
Received: from udd0866934 (ileax41-snat.itg.ti.com [10.172.224.153])	by
	dflp33.itg.ti.com (8.14.3/8.13.8) with ESMTP id u1JJh1nw026285;
	Fri, 19 Feb 2016 13:43:01 -0600
Received: from jake by udd0866934 with local (Exim 4.82)	(envelope-from
	<jake@udd0866934>)	id 1aWqxB-0006ed-80; Fri, 19 Feb 2016 14:43:01 -0500
From: Jacob Stiffler <j-stiffler@ti.com>
To: <meta-arago@arago-project.org>
Date: Fri, 19 Feb 2016 14:42:55 -0500
Message-ID: <1455910978-25530-5-git-send-email-j-stiffler@ti.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1455910978-25530-1-git-send-email-j-stiffler@ti.com>
References: <1455910978-25530-1-git-send-email-j-stiffler@ti.com>
MIME-Version: 1.0
Subject: [PATCH 4/7] arago-source-ipk: Enable openmpacc-examples source ipk
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
X-List-Received-Date: Fri, 19 Feb 2016 19:43:03 -0000
Content-Type: text/plain

Signed-off-by: Jacob Stiffler <j-stiffler@ti.com>
---
 meta-arago-distro/conf/distro/arago-source-ipk.conf | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta-arago-distro/conf/distro/arago-source-ipk.conf b/meta-arago-distro/conf/distro/arago-source-ipk.conf
index aec669e..054a86a 100644
--- a/meta-arago-distro/conf/distro/arago-source-ipk.conf
+++ b/meta-arago-distro/conf/distro/arago-source-ipk.conf
@@ -341,6 +341,9 @@ SRCIPK_INSTALL_DIR_pn-oe-layersetup = "bin/oe-layersetup"
 CREATE_SRCIPK_pn-opencl-examples = "1"
 SRCIPK_INSTALL_DIR_pn-opencl-examples = "example-applications/${PN}-${PV}"
 
+CREATE_SRCIPK_pn-openmpacc-examples = "1"
+SRCIPK_INSTALL_DIR_pn-openmpacc-examples = "example-applications/${PN}-${PV}"
+
 CREATE_SRCIPK_pn-qt-opencv-opencl-opengl-multithreaded = "1"
 SRCIPK_INSTALL_DIR_pn-qt-opencv-opencl-opengl-multithreaded = "example-applications/${PN}-${PV}"
 
-- 
1.9.1


