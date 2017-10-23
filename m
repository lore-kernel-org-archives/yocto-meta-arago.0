Return-Path: <esc@ti.com>
Received: from fllnx210.ext.ti.com (fllnx210.ext.ti.com [198.47.19.17])
	by arago-project.org (Postfix) with ESMTPS id 6C4F752A05
	for <meta-arago@arago-project.org>;
	Mon, 23 Oct 2017 21:57:30 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by fllnx210.ext.ti.com (8.15.1/8.15.1) with ESMTP id v9NLvUB3008145
	for <meta-arago@arago-project.org>; Mon, 23 Oct 2017 16:57:30 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ti.com;
	s=ti-com-17Q1; t=1508795850;
	bh=o9UvkaTBvjWhINDC2S5HxkEEbwkGXfCBUezhd7t7t6E=;
	h=From:To:CC:Subject:Date;
	b=dJwSNC77HTlTzyf4Bs0dP4wF0ST+nGnSk0JF0eR8UiYQVbKXVRi/4YigsCMwUPB8t
	phLlUCl3FckLt3paBD+1RKXBNigNrjq+xUOaLUDitredKrKAdsWLMivMPIbTbo365C
	ZawD5BnFZmEeVnQwY7/btkJAuIvPQumybfdKds0M=
Received: from DFLE112.ent.ti.com (dfle112.ent.ti.com [10.64.6.33])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id v9NLvU3a018662
	for <meta-arago@arago-project.org>; Mon, 23 Oct 2017 16:57:30 -0500
Received: from DFLE103.ent.ti.com (10.64.6.24) by DFLE112.ent.ti.com
	(10.64.6.33) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P256) id 15.1.845.34;
	Mon, 23 Oct 2017 16:57:30 -0500
Received: from dflp33.itg.ti.com (10.64.6.16) by DFLE103.ent.ti.com
	(10.64.6.24) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.845.34 via Frontend
	Transport; Mon, 23 Oct 2017 16:57:29 -0500
Received: from sdomc-build0.hou.asp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])
	by dflp33.itg.ti.com (8.14.3/8.13.8) with ESMTP id v9NLvTaO025071;
	Mon, 23 Oct 2017 16:57:29 -0500
From: Emily Curry <esc@ti.com>
To: <meta-arago@arago-project.org>
Date: Mon, 23 Oct 2017 16:57:11 -0500
Message-ID: <20171023215711.36722-1-esc@ti.com>
X-Mailer: git-send-email 2.14.1
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: [PATCH] ocl: Update to v01.01.14.06
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
X-List-Received-Date: Mon, 23 Oct 2017 21:57:30 -0000
Content-Type: text/plain

* Fix OpenCL example cross-compile failure
---
 meta-arago-extras/recipes-ti/ocl/ocl.inc | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-arago-extras/recipes-ti/ocl/ocl.inc b/meta-arago-extras/recipes-ti/ocl/ocl.inc
index 5cd1e02f..d036dfc6 100644
--- a/meta-arago-extras/recipes-ti/ocl/ocl.inc
+++ b/meta-arago-extras/recipes-ti/ocl/ocl.inc
@@ -1,4 +1,4 @@
-PV = "1.1.14.5"
+PV = "1.1.14.6"
 INC_PR = "r0"
 
 LIC_FILES_CHKSUM = "file://../debian/copyright;md5=2e3965a73a8a49c23836467266120dff"
@@ -9,7 +9,7 @@ OCL_GIT_URI = "git://git.ti.com/opencl/ti-opencl.git"
 OCL_GIT_PROTOCOL = "git"
 OCL_GIT_BRANCH = "master"
 
-OCL_SRCREV = "e77c89ddd5c9da66ad0a0eec859958c3d8728f87"
+OCL_SRCREV = "03e89944c6dc4ab508698610baef623231de436d"
 
 BRANCH = "${OCL_GIT_BRANCH}"
 SRC_URI = "${OCL_GIT_URI};protocol=${OCL_GIT_PROTOCOL};branch=${BRANCH}"
-- 
2.14.1


