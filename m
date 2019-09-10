Return-Path: <e-ruei1@ti.com>
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
	by arago-project.org (Postfix) with ESMTPS id 8A44A52A3B
	for <meta-arago@arago-project.org>;
	Tue, 10 Sep 2019 18:15:03 +0000 (UTC)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id x8AIDwCR054603
	for <meta-arago@arago-project.org>; Tue, 10 Sep 2019 13:13:58 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1568139238;
	bh=nUAQKc7iQlum5z35jp7D+LtKDiagspcfewAZ6qsr/LM=;
	h=From:To:Subject:Date:In-Reply-To:References;
	b=X9PEmKCB6FUuGZ2vmJ1+uVIJk9wZU+Tw30UBItnJhjJsyhVbZWYAPctQhzV8hENiX
	GO8B8axIKzv+fzZ7HwdV8SL2Mik4tF1QC5KMkHFbcP9wKBR6nJOICaO4DI3ahhwqQ9
	FlIa4trwGkE3Og/lG3AnAOrmh0yiV6DiumzF+V+o=
Received: from DFLE113.ent.ti.com (dfle113.ent.ti.com [10.64.6.34])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTP id x8AIDwdD046509
	for <meta-arago@arago-project.org>; Tue, 10 Sep 2019 13:13:58 -0500
Received: from DFLE112.ent.ti.com (10.64.6.33) by DFLE113.ent.ti.com
	(10.64.6.34) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5;
	Tue, 10 Sep 2019 13:13:57 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DFLE112.ent.ti.com
	(10.64.6.33) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
	Frontend Transport; Tue, 10 Sep 2019 13:13:58 -0500
Received: from UDA0850410.gt.design.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])
	by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id x8AIDunw035961
	for <meta-arago@arago-project.org>; Tue, 10 Sep 2019 13:13:57 -0500
From: Eric Ruei <e-ruei1@ti.com>
To: <meta-arago@arago-project.org>
Date: Tue, 10 Sep 2019 14:11:26 -0400
Message-ID: <20190910181131.8808-5-e-ruei1@ti.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190910181131.8808-1-e-ruei1@ti.com>
References: <20190910181131.8808-1-e-ruei1@ti.com>
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: [meta-processor-sdk][PATCH 4/9] packagegroup-arago-tisdk-multimedia: rename chromium-wayland
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
X-List-Received-Date: Tue, 10 Sep 2019 18:15:05 -0000
Content-Type: text/plain

chromium-wayland has been renamed to chromium-ozone-wayland at new recipes

Signed-off-by: Eric Ruei <e-ruei1@ti.com>
---
 .../packagegroup-arago-tisdk-multimedia.bbappend          | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/recipes-core/packagegroups/packagegroup-arago-tisdk-multimedia.bbappend b/recipes-core/packagegroups/packagegroup-arago-tisdk-multimedia.bbappend
index c48ba85..fe422c5 100644
--- a/recipes-core/packagegroups/packagegroup-arago-tisdk-multimedia.bbappend
+++ b/recipes-core/packagegroups/packagegroup-arago-tisdk-multimedia.bbappend
@@ -1,14 +1,14 @@
-PR_append = ".tisdk3"
+PR_append = ".tisdk4"
 
 MULTIMEDIA_append_omap-a15 = " \
-    ${@['','chromium-wayland'][bb.utils.contains('MACHINE_FEATURES', 'gpu', True, False, d) and bb.utils.contains('DISTRO_FEATURES', 'wayland', True, False, d)]} \
+    ${@['','chromium-ozone-wayland'][bb.utils.contains('MACHINE_FEATURES', 'gpu', True, False, d) and bb.utils.contains('DISTRO_FEATURES', 'wayland', True, False, d)]} \
     ${@bb.utils.contains('MACHINE_FEATURES', 'gpu', 'video-graphics-test', '', d)} \
 "
 
 MULTIMEDIA_append_ti43x = " \
-    ${@['','chromium-wayland'][bb.utils.contains('MACHINE_FEATURES', 'gpu', True, False, d) and bb.utils.contains('DISTRO_FEATURES', 'wayland', True, False, d)]} \
+    ${@['','chromium-ozone-wayland'][bb.utils.contains('MACHINE_FEATURES', 'gpu', True, False, d) and bb.utils.contains('DISTRO_FEATURES', 'wayland', True, False, d)]} \
 "
 
 MULTIMEDIA_append_ti33x = " \
-    ${@['','chromium-wayland'][bb.utils.contains('MACHINE_FEATURES', 'gpu', True, False, d) and bb.utils.contains('DISTRO_FEATURES', 'wayland', True, False, d)]} \
+    ${@['','chromium-ozone-wayland'][bb.utils.contains('MACHINE_FEATURES', 'gpu', True, False, d) and bb.utils.contains('DISTRO_FEATURES', 'wayland', True, False, d)]} \
 "
-- 
2.17.1


