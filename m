Return-Path: <>
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
	by arago-project.org (Postfix) with ESMTPS id DD77C529A2
	for <meta-arago@arago-project.org>;
	Fri, 19 Jul 2019 21:09:22 +0000 (UTC)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id x6JL8W1L113888
	for <meta-arago@arago-project.org>; Fri, 19 Jul 2019 16:08:32 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1563570512;
	bh=s+R0n2eij0ayzkLD6aIUFsEBTyawRZ/J/yGgpVQ2anQ=;
	h=From:To:CC:Subject:Date;
	b=TRiCeXRp/uR3s6mBbB4gZAODR6BMow1Yg2CgdpmZiQ+bSAjECGuIqcRaaYZ25gG75
	QPMv9IlyP40Jd33GnrbKcgjcHyuWrvYklIIcR5kYFpc+tAMFoJ14u1HuErYDFnZvAu
	FFOMB/Nhf69sokcCTCzfiw1L4fx9lIvrjdWxzGHY=
Received: from DFLE115.ent.ti.com (dfle115.ent.ti.com [10.64.6.36])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x6JL8W86011884
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-arago@arago-project.org>; Fri, 19 Jul 2019 16:08:32 -0500
Received: from DFLE105.ent.ti.com (10.64.6.26) by DFLE115.ent.ti.com
	(10.64.6.36) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5;
	Fri, 19 Jul 2019 16:08:32 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DFLE105.ent.ti.com
	(10.64.6.26) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
	Frontend Transport; Fri, 19 Jul 2019 16:08:32 -0500
Received: from legion.dal.design.ti.com (legion.dal.design.ti.com
	[128.247.22.53])
	by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id x6JL8W2x114517;
	Fri, 19 Jul 2019 16:08:32 -0500
Received: from localhost ([10.250.86.29])
	by legion.dal.design.ti.com (8.11.7p1+Sun/8.11.7) with ESMTP id
	x6JL8VZ19195; Fri, 19 Jul 2019 16:08:31 -0500 (CDT)
From: "Andrew F. Davis" <afd@ti.com>
To: Denys Dmytriyenko <denys@ti.com>
Date: Fri, 19 Jul 2019 17:08:31 -0400
Message-ID: <20190719210831.18710-1-afd@ti.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Cc: meta-arago@arago-project.org
Subject: [master/thud][RFC PATCH] arago-prefs: Set virtual/libgbm as provided by ti-sgx-ddk-um
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
X-List-Received-Date: Fri, 19 Jul 2019 21:09:23 -0000
Content-Type: text/plain

The GBM library is no longer a separate package, like with Mesa and
RGX driver it is provided by the GPU driver. Cleanup the setting of
this to make it more clear.

Also drop virtual/libgbm-dev, dev packages are not valid when used like
this or is this needed by anyone to begin with.

Signed-off-by: Andrew F. Davis <afd@ti.com>
---

This is an RFC as the companion patch in meta-ti for the same
is also an RFC.

 .../conf/distro/include/arago-prefs.inc             | 13 ++++---------
 1 file changed, 4 insertions(+), 9 deletions(-)

diff --git a/meta-arago-distro/conf/distro/include/arago-prefs.inc b/meta-arago-distro/conf/distro/include/arago-prefs.inc
index 0f961322..3d2ad74b 100644
--- a/meta-arago-distro/conf/distro/include/arago-prefs.inc
+++ b/meta-arago-distro/conf/distro/include/arago-prefs.inc
@@ -6,35 +6,30 @@ PREFERRED_PROVIDER_ltp-ddt = "ltp-ddt"
 
 PREFERRED_PROVIDER_virtual/gettext = "gettext"
 
-# OpenGLES/EGL preferences
+# OpenGLES/EGL/GBM preferences
 # Most of existing TI platforms have SGX GPU core
 PREFERRED_PROVIDER_virtual/egl = "ti-sgx-ddk-um"
 PREFERRED_PROVIDER_virtual/libgles1 = "ti-sgx-ddk-um"
 PREFERRED_PROVIDER_virtual/libgles2 = "ti-sgx-ddk-um"
+PREFERRED_PROVIDER_virtual/libgbm = "ti-sgx-ddk-um"
 PREFERRED_PROVIDER_virtual/gpudriver = "ti-sgx-ddk-km"
 
 # J7 has a Rogue GPU core
 PREFERRED_PROVIDER_virtual/egl_j7-evm = "ti-img-rogue-umlibs"
 PREFERRED_PROVIDER_virtual/libgles1_j7-evm = "ti-img-rogue-umlibs"
 PREFERRED_PROVIDER_virtual/libgles2_j7-evm = "ti-img-rogue-umlibs"
+PREFERRED_PROVIDER_virtual/libgbm_j7-evm = "ti-img-rogue-umlibs"
 PREFERRED_PROVIDER_virtual/gpudriver_j7-evm = "ti-img-rogue-driver"
 
 # OpenGL preferences
 PREFERRED_PROVIDER_virtual/libgl = "mesa-gl"
 
-# GBM (Generic Buffer Management) preferences
-PREFERRED_PROVIDER_virtual/libgbm = "libgbm"
-PREFERRED_PROVIDER_virtual/libgbm-dev = "libgbm-dev"
-
-# J7 gbm provider
-PREFERRED_PROVIDER_virtual/libgbm_j7-evm = "ti-img-rogue-umlibs"
-PREFERRED_PROVIDER_virtual/libgbm-dev_j7-evm = "ti-img-rogue-umlibs-dev"
-
 # This is required when using keystone devices with graphical support
 # such as Qt5
 PREFERRED_PROVIDER_virtual/egl_keystone = "mesa"
 PREFERRED_PROVIDER_virtual/libgles1_keystone = "mesa"
 PREFERRED_PROVIDER_virtual/libgles2_keystone = "mesa"
+PREFERRED_PROVIDER_virtual/libgbm_keystone = "mesa"
 PREFERRED_PROVIDER_virtual/libgl_keystone = "mesa"
 PREFERRED_PROVIDER_virtual/mesa_keystone = "mesa"
 
-- 
2.17.1


