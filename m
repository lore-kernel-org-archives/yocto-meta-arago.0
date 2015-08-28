Return-Path: <h-gou@ti.com>
Received: from bear.ext.ti.com (bear.ext.ti.com [192.94.94.41])
	by arago-project.org (Postfix) with ESMTPS id D8BC052A28
	for <meta-arago@arago-project.org>;
	Fri, 28 Aug 2015 04:01:58 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by bear.ext.ti.com (8.13.7/8.13.7) with ESMTP id t7S41wZd002170
	for <meta-arago@arago-project.org>; Thu, 27 Aug 2015 23:01:58 -0500
Received: from DLEE71.ent.ti.com (dlee71.ent.ti.com [157.170.170.114])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id t7S41wPd030741
	for <meta-arago@arago-project.org>; Thu, 27 Aug 2015 23:01:58 -0500
Received: from dlep32.itg.ti.com (157.170.170.100) by DLEE71.ent.ti.com
	(157.170.170.114) with Microsoft SMTP Server id 14.3.224.2;
	Thu, 27 Aug 2015 23:01:57 -0500
Received: from uda0271529.am.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])	by dlep32.itg.ti.com (8.14.3/8.13.8) with ESMTP id
	t7S41vic027352;	Thu, 27 Aug 2015 23:01:57 -0500
From: Hongmei Gou <h-gou@ti.com>
To: <meta-arago@arago-project.org>
Date: Fri, 28 Aug 2015 00:01:50 -0400
Message-ID: <1440734514-16165-2-git-send-email-h-gou@ti.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1440734514-16165-1-git-send-email-h-gou@ti.com>
References: <1440734514-16165-1-git-send-email-h-gou@ti.com>
MIME-Version: 1.0
Subject: [PATCH 1/5] arago-prefs: use libgbm and omap5-sgx-ddk-um-linux (SGX user module) for AM3 and AM4
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
X-List-Received-Date: Fri, 28 Aug 2015 04:01:59 -0000
Content-Type: text/plain

Signed-off-by: Hongmei Gou <h-gou@ti.com>
---
 meta-arago-distro/conf/distro/include/arago-prefs.inc | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/meta-arago-distro/conf/distro/include/arago-prefs.inc b/meta-arago-distro/conf/distro/include/arago-prefs.inc
index a4b335c..4f47d5b 100644
--- a/meta-arago-distro/conf/distro/include/arago-prefs.inc
+++ b/meta-arago-distro/conf/distro/include/arago-prefs.inc
@@ -48,6 +48,16 @@ PREFERRED_PROVIDER_virtual/libgles1_omap-a15 = "omap5-sgx-ddk-um-linux"
 PREFERRED_PROVIDER_virtual/libgles2_omap-a15 = "omap5-sgx-ddk-um-linux"
 PREFERRED_PROVIDER_libgbm_omap-a15 = "libgbm"
 
+PREFERRED_PROVIDER_virtual/egl_ti43x = "omap5-sgx-ddk-um-linux"
+PREFERRED_PROVIDER_virtual/libgles1_ti43x = "omap5-sgx-ddk-um-linux"
+PREFERRED_PROVIDER_virtual/libgles2_ti43x = "omap5-sgx-ddk-um-linux"
+PREFERRED_PROVIDER_libgbm_ti43x = "libgbm"
+
+PREFERRED_PROVIDER_virtual/egl_ti33x = "omap5-sgx-ddk-um-linux"
+PREFERRED_PROVIDER_virtual/libgles1_ti33x = "omap5-sgx-ddk-um-linux"
+PREFERRED_PROVIDER_virtual/libgles2_ti33x = "omap5-sgx-ddk-um-linux"
+PREFERRED_PROVIDER_libgbm_ti33x = "libgbm"
+
 PREFERRED_PROVIDER_virtual/libgl = "mesa-gl"
 PREFERRED_PROVIDER_virtual/mesa = "mesa-gl"
 
-- 
1.9.1


