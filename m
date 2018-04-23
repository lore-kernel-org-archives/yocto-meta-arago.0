Return-Path: <e-ruei1@ti.com>
Received: from fllnx209.ext.ti.com (fllnx209.ext.ti.com [198.47.19.16])
	by arago-project.org (Postfix) with ESMTPS id D8C685299F
	for <meta-arago@arago-project.org>;
	Mon, 23 Apr 2018 15:08:36 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by fllnx209.ext.ti.com (8.15.1/8.15.1) with ESMTP id w3NF8XCm010723
	for <meta-arago@arago-project.org>; Mon, 23 Apr 2018 10:08:33 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ti.com;
	s=ti-com-17Q1; t=1524496113;
	bh=RuS6XEErcSxixHAV+VuWLbrTyjKiRD76tr8UhskBIW8=;
	h=From:To:Subject:Date;
	b=m4G6osDnGSt6dW+XeO4FTWEqs6mjRe8U4VHMFWRVp5h+K61N1D6z4QId//fxWp1tt
	cgG4crAGfQKbJWoE7frYKNVSAl3JHPRix75kVT5y22kAj4ij1/tNmsZTHEqG+XxiwM
	WtKfZMdaAk2/Ibdbbt94Z0S9uQ/Q9tcMN0t/fhR8=
Received: from DLEE101.ent.ti.com (dlee101.ent.ti.com [157.170.170.31])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id w3NF8XeF016020
	for <meta-arago@arago-project.org>; Mon, 23 Apr 2018 10:08:33 -0500
Received: from DLEE107.ent.ti.com (157.170.170.37) by DLEE101.ent.ti.com
	(157.170.170.31) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1466.3;
	Mon, 23 Apr 2018 10:08:33 -0500
Received: from dlep32.itg.ti.com (157.170.170.100) by DLEE107.ent.ti.com
	(157.170.170.37) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.1466.3 via Frontend
	Transport; Mon, 23 Apr 2018 10:08:33 -0500
Received: from uda0850410.am.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])
	by dlep32.itg.ti.com (8.14.3/8.13.8) with ESMTP id w3NF8XPk003934
	for <meta-arago@arago-project.org>; Mon, 23 Apr 2018 10:08:33 -0500
From: Eric Ruei <e-ruei1@ti.com>
To: <meta-arago@arago-project.org>
Date: Mon, 23 Apr 2018 11:08:29 -0400
Message-ID: <1524496109-11156-1-git-send-email-e-ruei1@ti.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: [rocko][meta-processor-sdk][PATCH] qtbase: enable eglfs_kms for QT5.9.4
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
X-List-Received-Date: Mon, 23 Apr 2018 15:08:37 -0000
Content-Type: text/plain

For QT5.9.4 the new component gbm should be included in order to enable
eglfs_kms (GBM)


Signed-off-by: Eric Ruei <e-ruei1@ti.com>
---
 recipes-qt/qt5/qtbase_%.bbappend | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/recipes-qt/qt5/qtbase_%.bbappend b/recipes-qt/qt5/qtbase_%.bbappend
index 28255b7..1503beb 100644
--- a/recipes-qt/qt5/qtbase_%.bbappend
+++ b/recipes-qt/qt5/qtbase_%.bbappend
@@ -1,4 +1,4 @@
-PR_append = ".tisdk5.1"
+PR_append = ".tisdk5.2"
 
 FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"
 
@@ -13,6 +13,9 @@ GLES_EXTRA_DEPS = "libdrm ${@bb.utils.contains('MACHINE_FEATURES', 'sgx', 'wayla
 PACKAGECONFIG[kms] = "-kms,-no-kms,drm virtual/egl"
 PACKAGECONFIG += "kms"
 
+PACKAGECONFIG[gbm] = "-gbm,-no-gbm,drm virtual/egl"
+PACKAGECONFIG += "gbm"
+
 QT_NOSGX_PATCHES = "\
     file://0001-calculator-Add-exit-button-for-non-window-environmen.patch \
     file://0002-animatedtiles-Add-exit-button-for-non-window-environ.patch \
-- 
1.9.1


