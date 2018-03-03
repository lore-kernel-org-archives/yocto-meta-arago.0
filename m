Return-Path: <e-ruei1@ti.com>
Received: from fllnx209.ext.ti.com (fllnx209.ext.ti.com [198.47.19.16])
	by arago-project.org (Postfix) with ESMTPS id CE7BE529EE
	for <meta-arago@arago-project.org>;
	Sat,  3 Mar 2018 19:31:40 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by fllnx209.ext.ti.com (8.15.1/8.15.1) with ESMTP id w23JV2Ra013445
	for <meta-arago@arago-project.org>; Sat, 3 Mar 2018 13:31:02 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ti.com;
	s=ti-com-17Q1; t=1520105462;
	bh=704QxCiZC0+WdVDDAKb+2DRjlQtSGNsbiLM7Ug0RNqc=;
	h=From:To:Subject:Date:In-Reply-To:References;
	b=Fw82Ry5iI1sRfuuX50XvgHklEaEHTS5uCG40OifIIXBgK/z1+iy7I3/UaXlvwHFtF
	fpcH2b/cL+veyfDextIYKDpXPUK/5q8K+4kde59b0brU2aT6vcbIv+WgwFl8nqLDtD
	c4qHKVtiaw+hivjoiy9geYCKy0bxMlWNqtvwC9RA=
Received: from DFLE102.ent.ti.com (dfle102.ent.ti.com [10.64.6.23])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id w23JV2SN021067
	for <meta-arago@arago-project.org>; Sat, 3 Mar 2018 13:31:02 -0600
Received: from DFLE105.ent.ti.com (10.64.6.26) by DFLE102.ent.ti.com
	(10.64.6.23) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1261.35;
	Sat, 3 Mar 2018 13:31:01 -0600
Received: from dflp32.itg.ti.com (10.64.6.15) by DFLE105.ent.ti.com
	(10.64.6.26) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.1261.35 via Frontend
	Transport; Sat, 3 Mar 2018 13:31:01 -0600
Received: from uda0850410.am.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])
	by dflp32.itg.ti.com (8.14.3/8.13.8) with ESMTP id w23JV07b019492
	for <meta-arago@arago-project.org>; Sat, 3 Mar 2018 13:31:01 -0600
From: Eric Ruei <e-ruei1@ti.com>
To: <meta-arago@arago-project.org>
Date: Sat, 3 Mar 2018 14:30:55 -0500
Message-ID: <1520105455-43017-5-git-send-email-e-ruei1@ti.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1520105455-43017-1-git-send-email-e-ruei1@ti.com>
References: <1520105455-43017-1-git-send-email-e-ruei1@ti.com>
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: [morty/rocko/master][PATCH v4 4/4] ti-tisdk-makefile: add qt-tstat to MAKEFILES_MATRIX_GUI unconditionally
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
X-List-Received-Date: Sat, 03 Mar 2018 19:31:41 -0000
Content-Type: text/plain

qt-tstat has been enhanced to support both Qt4 and Qt5

Signed-off-by: Eric Ruei <e-ruei1@ti.com>
---
 .../recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile_1.0.bb          | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile_1.0.bb b/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile_1.0.bb
index 29e74b0..0f7670c 100644
--- a/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile_1.0.bb
+++ b/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile_1.0.bb
@@ -50,11 +50,11 @@ SRC_URI = "\
     file://Makefile_barcode-roi \
 "
 
-PR = "r84"
+PR = "r85"
 
 MAKEFILES_MATRIX_GUI = "matrix-gui-browser \
                         refresh-screen \
-                        ${@base_conditional('QT_PROVIDER', 'qt5', '', 'qt-tstat', d)} \
+                        qt-tstat \
 "
 
 MAKEFILES_MATRIX_GUI_keystone = ""
-- 
1.9.1


