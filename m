Return-Path: <e-ruei1@ti.com>
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
	by arago-project.org (Postfix) with ESMTPS id 30E8852092
	for <meta-arago@arago-project.org>;
	Fri, 31 May 2019 20:10:17 +0000 (UTC)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id x4VK9fHO105289
	for <meta-arago@arago-project.org>; Fri, 31 May 2019 15:09:41 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1559333381;
	bh=SE/I+t1SITyPNMepJbhPWbLMWh5DKrXzF6BxSZAWCWQ=;
	h=From:To:Subject:Date;
	b=LPGFuZeOb6FPXgJXl2G0ebycW6NoCAfGLm85JbTWyzfRFvPhszbKZA67rT3cF7fk8
	hMTbsD7YVsSk43PW02Ak3TFu7VHmZnFSmbxpHQrd/uOBrRCpJUKVC9O81DpRG9HTlj
	vIAomPB/1qb/ENM5xxxwkCLPet10FNwdVNX7AdM4=
Received: from DFLE100.ent.ti.com (dfle100.ent.ti.com [10.64.6.21])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x4VK9f6I078612
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-arago@arago-project.org>; Fri, 31 May 2019 15:09:41 -0500
Received: from DFLE109.ent.ti.com (10.64.6.30) by DFLE100.ent.ti.com
	(10.64.6.21) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5;
	Fri, 31 May 2019 15:09:40 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DFLE109.ent.ti.com
	(10.64.6.30) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
	Frontend Transport; Fri, 31 May 2019 15:09:40 -0500
Received: from UDA0850410.gt.design.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])
	by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id x4VK9eCP030192
	for <meta-arago@arago-project.org>; Fri, 31 May 2019 15:09:40 -0500
From: Eric Ruei <e-ruei1@ti.com>
To: <meta-arago@arago-project.org>
Date: Fri, 31 May 2019 16:09:26 -0400
Message-ID: <20190531200926.63040-1-e-ruei1@ti.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: [matrix-gui-v2-apps][PATCH] Revert "qt5_deform: change from full-screen mode to window mode"
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
X-List-Received-Date: Fri, 31 May 2019 20:10:17 -0000
Content-Type: text/plain

This reverts commit 66f586896ba8e5fdea7a0f6280d0a871fddd841a.
The original patch is no longer needed for weston 5.0 and the
full-screen mode is required for non-sgx build.
---
 qt5_apps/qt5_deform/qt5_deform.desktop | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/qt5_apps/qt5_deform/qt5_deform.desktop b/qt5_apps/qt5_deform/qt5_deform.desktop
index ffe8e8a..9ad1d6f 100644
--- a/qt5_apps/qt5_deform/qt5_deform.desktop
+++ b/qt5_apps/qt5_deform/qt5_deform.desktop
@@ -4,7 +4,7 @@
 Name=Deform
 GenericName=Demo App
 Icon=/usr/share/matrix-gui-2.0/apps/images/qt-icon.png
-Exec=/usr/share/qt5/examples/widgets/painting/deform/deform
+Exec=/usr/share/qt5/examples/widgets/painting/deform/deform -small-screen
 Type=Application
 Categories=Qt5
 ProgramType=gui
-- 
2.17.1


