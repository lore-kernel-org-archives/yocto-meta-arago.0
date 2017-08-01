Return-Path: <e-ruei1@ti.com>
Received: from lelnx194.ext.ti.com (lelnx194.ext.ti.com [198.47.27.80])
	by arago-project.org (Postfix) with ESMTPS id C7C8452A63
	for <meta-arago@arago-project.org>;
	Tue,  1 Aug 2017 19:54:23 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by lelnx194.ext.ti.com (8.15.1/8.15.1) with ESMTP id v71JsNTI001372
	for <meta-arago@arago-project.org>; Tue, 1 Aug 2017 14:54:23 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ti.com;
	s=ti-com-17Q1; t=1501617263;
	bh=GHD/4pLAYpZbN7ZnyTKwZbAwNr7CynPWwzC0+4FZurs=;
	h=From:To:Subject:Date:In-Reply-To:References;
	b=c2yU28HPa8fNj9qZ0pxbk6y7etTteK4ju1Hq2NSGkoACuPlYHU9qPDwR8h3YYZgAK
	BTdcvw8J0EWPQsiz0vyphUogzfOtmDx6jxIV9IOZjrZi7KfFkh9xVnfH/f7RO0OXRx
	kTFO1Kp0Af53nWZxG4uYIAtLrloDdl6dgWvKvIyU=
Received: from DLEE71.ent.ti.com (dlee71.ent.ti.com [157.170.170.114])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id v71JsN28019559
	for <meta-arago@arago-project.org>; Tue, 1 Aug 2017 14:54:23 -0500
Received: from dlep33.itg.ti.com (157.170.170.75) by DLEE71.ent.ti.com
	(157.170.170.114) with Microsoft SMTP Server id 14.3.294.0;
	Tue, 1 Aug 2017 14:54:23 -0500
Received: from uda0850410.am.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])	by dlep33.itg.ti.com (8.14.3/8.13.8) with ESMTP id
	v71JsAQg012102	for <meta-arago@arago-project.org>;
	Tue, 1 Aug 2017 14:54:22 -0500
From: Eric Ruei <e-ruei1@ti.com>
To: <meta-arago@arago-project.org>
Date: Tue, 1 Aug 2017 15:54:08 -0400
Message-ID: <1501617248-46185-5-git-send-email-e-ruei1@ti.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1501617248-46185-1-git-send-email-e-ruei1@ti.com>
References: <1501617248-46185-1-git-send-email-e-ruei1@ti.com>
MIME-Version: 1.0
Subject: [morty/master][PATCH v2 4/4] packagegroup-arago-tisdk-matrix: add browser demos for AM5/DRA7
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
X-List-Received-Date: Tue, 01 Aug 2017 19:54:24 -0000
Content-Type: text/plain

Signed-off-by: Eric Ruei <e-ruei1@ti.com>
---
 .../recipes-core/packagegroups/packagegroup-arago-tisdk-matrix.bb      | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-matrix.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-matrix.bb
index 7402427..02d46c4 100644
--- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-matrix.bb
+++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-matrix.bb
@@ -1,6 +1,6 @@
 DESCRIPTION = "Task to include Matrix v2"
 LICENSE = "MIT"
-PR = "r66"
+PR = "r67"
 
 PACKAGE_ARCH = "${MACHINE_ARCH}"
 
@@ -128,6 +128,7 @@ MATRIX_APPS_append_omap-a15 = "     \
     matrix-gui-generic-pm           \
     matrix-gui-clocks               \
     matrix-gui-pm-demos-governor    \
+    ${@['','matrix-gui-browser-demos'][bb.utils.contains('MACHINE_FEATURES','sgx',True,False,d) and bb.utils.contains('DISTRO_FEATURES','wayland',True,False,d)]} \
 "
 
 MATRIX_APPS_append_dra7xx += " \
-- 
1.9.1


