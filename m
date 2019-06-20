Return-Path: <denys@ti.com>
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
	by arago-project.org (Postfix) with ESMTPS id D9C94520E1
	for <meta-arago@arago-project.org>;
	Thu, 20 Jun 2019 00:24:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 2EA2140BC7;
	Thu, 20 Jun 2019 00:23:50 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new,
	port 10024)
	with ESMTP id dQkoZxJilXq4; Thu, 20 Jun 2019 00:23:50 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-86-127.washdc.fios.verizon.net
	[100.15.86.127])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 1694340A55;
	Thu, 20 Jun 2019 00:23:49 +0000 (UTC)
Received: from gimli.denix (unknown [192.168.30.6])
	by mail.denix.org (Postfix) with ESMTP id 3B95F170519;
	Wed, 19 Jun 2019 20:23:48 -0400 (EDT)
From: Denys Dmytriyenko <denys@ti.com>
To: meta-arago@arago-project.org
Date: Wed, 19 Jun 2019 20:23:47 -0400
Message-Id: <1560990227-25118-1-git-send-email-denys@ti.com>
X-Mailer: git-send-email 2.7.4
Subject: [thud/master][PATCH] arago-prefs: specify GLES providers for J7 EVM
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
X-List-Received-Date: Thu, 20 Jun 2019 00:24:37 -0000

Also clean up the file and add additional comments.

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 meta-arago-distro/conf/distro/include/arago-prefs.inc | 14 ++++++++++++--
 1 file changed, 12 insertions(+), 2 deletions(-)

diff --git a/meta-arago-distro/conf/distro/include/arago-prefs.inc b/meta-arago-distro/conf/distro/include/arago-prefs.inc
index a96569f..25d32d5 100644
--- a/meta-arago-distro/conf/distro/include/arago-prefs.inc
+++ b/meta-arago-distro/conf/distro/include/arago-prefs.inc
@@ -6,14 +6,24 @@ PREFERRED_PROVIDER_ltp-ddt = "ltp-ddt"
 
 PREFERRED_PROVIDER_virtual/gettext = "gettext"
 
+# OpenGLES/EGL preferences
+# Most of existing TI platforms have SGX GPU core
 PREFERRED_PROVIDER_virtual/egl = "ti-sgx-ddk-um"
 PREFERRED_PROVIDER_virtual/libgles1 = "ti-sgx-ddk-um"
 PREFERRED_PROVIDER_virtual/libgles2 = "ti-sgx-ddk-um"
-PREFERRED_PROVIDER_libgbm = "libgbm"
-PREFERRED_PROVIDER_libgbm-dev = "libgbm-dev"
 
+# J7 has a Rogue GPU core
+PREFERRED_PROVIDER_virtual/egl_j7-evm = "ti-img-rogue-umlibs"
+PREFERRED_PROVIDER_virtual/libgles1_j7-evm = "ti-img-rogue-umlibs"
+PREFERRED_PROVIDER_virtual/libgles2_j7-evm = "ti-img-rogue-umlibs"
+
+# OpenGL preferences
 PREFERRED_PROVIDER_virtual/libgl = "mesa-gl"
 
+# GBM (Generic Buffer Management) preferences
+PREFERRED_PROVIDER_libgbm = "libgbm"
+PREFERRED_PROVIDER_libgbm-dev = "libgbm-dev"
+
 # This is required when using keystone devices with graphical support
 # such as Qt5
 PREFERRED_PROVIDER_virtual/egl_keystone = "mesa"
-- 
2.7.4


