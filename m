Return-Path: <e-ruei1@ti.com>
Received: from lelnx193.ext.ti.com (lelnx193.ext.ti.com [198.47.27.77])
	by arago-project.org (Postfix) with ESMTPS id BA16452AB9
	for <meta-arago@arago-project.org>;
	Thu, 27 Jul 2017 22:28:20 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by lelnx193.ext.ti.com (8.15.1/8.15.1) with ESMTP id v6RMSK2w002862
	for <meta-arago@arago-project.org>; Thu, 27 Jul 2017 17:28:20 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ti.com;
	s=ti-com-17Q1; t=1501194500;
	bh=AXWO/2HbgWmK83weYklcxIWluiu1fxMaJQofgB1OFQw=;
	h=From:To:Subject:Date:In-Reply-To:References;
	b=M1Ko8/rPXHWy/YLixk9dtm86MZWdriEK3RmR8Rz5t48xUFhAFYmuZZKxFeU22gHSb
	s9y7cP1evToqI6YUge5KCCTfJowf7lbFFRDYR5Iw5CaXV8BX5RNGeCVBdRMXFCjAmU
	FZj+rwqjN/AKHzLxNHwPnAMb37HRf0VxspYXVloU=
Received: from DFLE73.ent.ti.com (dfle73.ent.ti.com [128.247.5.110])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id v6RMSKKk004345
	for <meta-arago@arago-project.org>; Thu, 27 Jul 2017 17:28:20 -0500
Received: from dlep32.itg.ti.com (157.170.170.100) by DFLE73.ent.ti.com
	(128.247.5.110) with Microsoft SMTP Server id 14.3.294.0;
	Thu, 27 Jul 2017 17:28:20 -0500
Received: from uda0850410.am.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])	by dlep32.itg.ti.com (8.14.3/8.13.8) with ESMTP id
	v6RMSJXR022464	for <meta-arago@arago-project.org>;
	Thu, 27 Jul 2017 17:28:20 -0500
From: Eric Ruei <e-ruei1@ti.com>
To: <meta-arago@arago-project.org>
Date: Thu, 27 Jul 2017 18:28:15 -0400
Message-ID: <1501194495-48938-5-git-send-email-e-ruei1@ti.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1501194495-48938-1-git-send-email-e-ruei1@ti.com>
References: <1501194495-48938-1-git-send-email-e-ruei1@ti.com>
MIME-Version: 1.0
Subject: [morty/master][PATCH 4/4] packagegroup-arago-tisdk-matrix: add browser demos for AM5/DRA7
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
X-List-Received-Date: Thu, 27 Jul 2017 22:28:21 -0000
Content-Type: text/plain

Signed-off-by: Eric Ruei <e-ruei1@ti.com>
---
 .../recipes-core/packagegroups/packagegroup-arago-tisdk-matrix.bb      | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-matrix.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-matrix.bb
index 7402427..9a19224 100644
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
+    ${@bb.utils.contains('MACHINE_FEATURES','sgx','matrix-gui-browser-demos','',d)} \
 "
 
 MATRIX_APPS_append_dra7xx += " \
-- 
1.9.1


