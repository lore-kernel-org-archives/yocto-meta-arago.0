Return-Path: <e-ruei1@ti.com>
Received: from fllnx209.ext.ti.com (fllnx209.ext.ti.com [198.47.19.16])
	by arago-project.org (Postfix) with ESMTPS id 41D31529AA
	for <meta-arago@arago-project.org>;
	Thu,  8 Jun 2017 18:54:43 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by fllnx209.ext.ti.com (8.15.1/8.15.1) with ESMTP id v58IsWDH003169
	for <meta-arago@arago-project.org>; Thu, 8 Jun 2017 13:54:32 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ti.com;
	s=ti-com-17Q1; t=1496948072;
	bh=uGKwYY+ZnnXhG3yHPQH2/gBCf1/oWQHKPMrM1ip6Mqg=;
	h=From:To:Subject:Date:In-Reply-To:References;
	b=rp+nL5T3mxrCNWnKwzV42Tf5zn2XEYjEjhwd2qq3dTeEnhsBsNIG+76IQ4Cq5hKmB
	DJGfvzM1RxHCxo0HTXMboJqgqHAltOaMB5zzGBO0TJ1his/0lt0mUclHN+GjXXbg4g
	wKhtNLpwD6joSzTyLMKce6KwWfn9JaFp2cFPG4XQ=
Received: from DFLE73.ent.ti.com (dfle73.ent.ti.com [128.247.5.110])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id v58IsRt6021723
	for <meta-arago@arago-project.org>; Thu, 8 Jun 2017 13:54:27 -0500
Received: from dflp32.itg.ti.com (10.64.6.15) by DFLE73.ent.ti.com
	(128.247.5.110) with Microsoft SMTP Server id 14.3.294.0;
	Thu, 8 Jun 2017 13:54:27 -0500
Received: from uda0850410.am.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])	by dflp32.itg.ti.com (8.14.3/8.13.8) with ESMTP id
	v58IsRND028339	for <meta-arago@arago-project.org>;
	Thu, 8 Jun 2017 13:54:27 -0500
From: Eric Ruei <e-ruei1@ti.com>
To: <meta-arago@arago-project.org>
Date: Thu, 8 Jun 2017 14:54:23 -0400
Message-ID: <1496948064-3161-2-git-send-email-e-ruei1@ti.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1496948064-3161-1-git-send-email-e-ruei1@ti.com>
References: <1496948064-3161-1-git-send-email-e-ruei1@ti.com>
MIME-Version: 1.0
Subject: [morty/master][PATCH v3 2/3] packagegroup-arago-tisdk-qte: add qtwebbrowser demo application to the list and sort it
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
X-List-Received-Date: Thu, 08 Jun 2017 18:54:43 -0000
Content-Type: text/plain

Signed-off-by: Eric Ruei <e-ruei1@ti.com>
---
 .../recipes-core/packagegroups/packagegroup-arago-tisdk-qte.bb           | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-qte.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-qte.bb
index f2f87be..530d93d 100644
--- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-qte.bb
+++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-qte.bb
@@ -24,6 +24,7 @@ QT5_DEMOS = "\
     qtscript-examples \
     qtsvg-examples \
     ${@bb.utils.contains('DISTRO_FEATURES', 'wayland', 'qtwayland-examples', '', d)} \
+    qtwebbrowser \
     qtwebengine-examples \
     qtwebkit-examples-examples \
 "
-- 
1.9.1


