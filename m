Return-Path: <d-senicic1@ti.com>
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
	by arago-project.org (Postfix) with ESMTPS id E540152993
	for <meta-arago@arago-project.org>;
	Thu,  9 Aug 2018 00:41:23 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id w790fGxt051705
	for <meta-arago@arago-project.org>; Wed, 8 Aug 2018 19:41:16 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1533775276;
	bh=wiHLRPX31nadHAc10jDPC/fSbT9/5FGY1/2KZNLv6MI=;
	h=From:To:CC:Subject:Date;
	b=MubEvPoRwyOT3WKkxYOi1VLEjOP2Dfl/NKHsAzY9Z/PjDzupxT/gYXcL7H5VTZ3Fa
	vrQIda6zpwKFDjBwjZgUM5eAmdvrtgrt3QpKNNa5/Lm+57c0AgzTZI757FPwaRcp9E
	yWr23YNZB5YcUMOB7DLsewYVvMdbvxY0sfNc4P0s=
Received: from DFLE101.ent.ti.com (dfle101.ent.ti.com [10.64.6.22])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id w790fGBq000840
	for <meta-arago@arago-project.org>; Wed, 8 Aug 2018 19:41:16 -0500
Received: from DFLE111.ent.ti.com (10.64.6.32) by DFLE101.ent.ti.com
	(10.64.6.22) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1466.3;
	Wed, 8 Aug 2018 19:41:16 -0500
Received: from dlep33.itg.ti.com (157.170.170.75) by DFLE111.ent.ti.com
	(10.64.6.32) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.1466.3 via Frontend
	Transport; Wed, 8 Aug 2018 19:41:16 -0500
Received: from UDA0271529.am.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])
	by dlep33.itg.ti.com (8.14.3/8.13.8) with ESMTP id w790fFEh010773;
	Wed, 8 Aug 2018 19:41:15 -0500
From: Djordje Senicic <x0157990@ti.com>
To: <meta-arago@arago-project.org>
Date: Wed, 8 Aug 2018 20:41:10 -0400
Message-ID: <1533775270-4850-1-git-send-email-x0157990@ti.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Cc: d-senicic1@ti.com, Djordje Senicic <x0157990@ti.com>
Subject: [rocko/master][PATCH] opencv: bump SRCREV to include optimized stereobm kernel
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
X-List-Received-Date: Thu, 09 Aug 2018 00:41:24 -0000
Content-Type: text/plain

* Include stereobm opencl kernel specifically optimized for C66x DSP

Signed-off-by: Djordje Senicic <x0157990@ti.com>
---
 meta-arago-distro/recipes-support/opencv/opencv_3.1.bbappend | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-arago-distro/recipes-support/opencv/opencv_3.1.bbappend b/meta-arago-distro/recipes-support/opencv/opencv_3.1.bbappend
index 3915c4d..d10ff9f 100644
--- a/meta-arago-distro/recipes-support/opencv/opencv_3.1.bbappend
+++ b/meta-arago-distro/recipes-support/opencv/opencv_3.1.bbappend
@@ -11,7 +11,7 @@ SRC_URI_append += "\
      file://setupEnv.sh \
 "
 
-SRCREV_opencv = "9b88e8c746e531a1b4cc61e5235e4e747c319945"
+SRCREV_opencv = "102577cf10416ca8180adda88d3fd801eebc6318"
 
 DEPENDS_remove_keystone = "qtbase"
 
-- 
1.9.1


