Return-Path: <e-ruei1@ti.com>
Received: from lelnx193.ext.ti.com (lelnx193.ext.ti.com [198.47.27.77])
	by arago-project.org (Postfix) with ESMTPS id 5861D52093
	for <meta-arago@arago-project.org>;
	Thu, 12 Oct 2017 18:38:22 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by lelnx193.ext.ti.com (8.15.1/8.15.1) with ESMTP id v9CIcMmt011101
	for <meta-arago@arago-project.org>; Thu, 12 Oct 2017 13:38:22 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ti.com;
	s=ti-com-17Q1; t=1507833502;
	bh=dqaYqNvsm/gitSuYNmCAQzRoqmMj/hbfGnxtPcRk4vc=;
	h=From:To:Subject:Date:In-Reply-To:References;
	b=Ddexxn7ONE3im2F8TARkAZRVpD7RCA4YAAEzDe9t/aPUyGxRHv26mALBxmziAjqV7
	gqN1dmQJDcfcuuFx0vYVwUvtYyF/x9YFfL0VKwfRXLDL0UgPUtMsGifVIVeGXH8Wsn
	n2lGkXyUZYNPZGuBctI2FGTXvsOMRJN5Nt1HxlLo=
Received: from DFLE109.ent.ti.com (dfle109.ent.ti.com [10.64.6.30])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id v9CIcMjR007394
	for <meta-arago@arago-project.org>; Thu, 12 Oct 2017 13:38:22 -0500
Received: from DFLE103.ent.ti.com (10.64.6.24) by DFLE109.ent.ti.com
	(10.64.6.30) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P256) id 15.1.845.34;
	Thu, 12 Oct 2017 13:38:21 -0500
Received: from dflp32.itg.ti.com (10.64.6.15) by DFLE103.ent.ti.com
	(10.64.6.24) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.845.34 via Frontend
	Transport; Thu, 12 Oct 2017 13:38:21 -0500
Received: from uda0850410.am.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])
	by dflp32.itg.ti.com (8.14.3/8.13.8) with ESMTP id v9CIcLa8016500
	for <meta-arago@arago-project.org>; Thu, 12 Oct 2017 13:38:21 -0500
From: Eric Ruei <e-ruei1@ti.com>
To: <meta-arago@arago-project.org>
Date: Thu, 12 Oct 2017 14:38:17 -0400
Message-ID: <1507833497-25049-2-git-send-email-e-ruei1@ti.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1507833497-25049-1-git-send-email-e-ruei1@ti.com>
References: <1507833497-25049-1-git-send-email-e-ruei1@ti.com>
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: [morty][meta-processor-sdk][PATCH 2/2] packagegroup-arago-tisdk-multimedia: fix non-sgx/non-wayland build
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
X-List-Received-Date: Thu, 12 Oct 2017 18:38:24 -0000
Content-Type: text/plain

non-sgx build does not support video-graphics-test
non-sgx/non-wayland build do not support chromium-wayland

Signed-off-by: Eric Ruei <e-ruei1@ti.com>
---
 .../packagegroups/packagegroup-arago-tisdk-multimedia.bbappend | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/recipes-core/packagegroups/packagegroup-arago-tisdk-multimedia.bbappend b/recipes-core/packagegroups/packagegroup-arago-tisdk-multimedia.bbappend
index db94cad..9ef92a4 100644
--- a/recipes-core/packagegroups/packagegroup-arago-tisdk-multimedia.bbappend
+++ b/recipes-core/packagegroups/packagegroup-arago-tisdk-multimedia.bbappend
@@ -1,14 +1,14 @@
-PR_append = ".tisdk1"
+PR_append = ".tisdk2"
 
 MULTIMEDIA_append_omap-a15 = " \
-    video-graphics-test \
-    chromium-wayland \
+    ${@bb.utils.contains('MACHINE_FEATURES', 'sgx', 'video-graphics-test', '', d)} \
+    ${@['','chromium-wayland'][bb.utils.contains('MACHINE_FEATURES', 'sgx', True, False, d) and bb.utils.contains('DISTRO_FEATURES', 'wayland', True, False, d)]} \
 "
 
 MULTIMEDIA_append_ti43x = " \
-    chromium-wayland \
+    ${@['','chromium-wayland'][bb.utils.contains('MACHINE_FEATURES', 'sgx', True, False, d) and bb.utils.contains('DISTRO_FEATURES', 'wayland', True, False, d)]} \
 "
 
 MULTIMEDIA_append_ti33x = " \
-    chromium-wayland \
+    ${@['','chromium-wayland'][bb.utils.contains('MACHINE_FEATURES', 'sgx', True, False, d) and bb.utils.contains('DISTRO_FEATURES', 'wayland', True, False, d)]} \
 "
-- 
1.9.1


