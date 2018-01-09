Return-Path: <h-gou@ti.com>
Received: from lelnx194.ext.ti.com (lelnx194.ext.ti.com [198.47.27.80])
	by arago-project.org (Postfix) with ESMTPS id 8D96552093
	for <meta-arago@arago-project.org>;
	Tue,  9 Jan 2018 21:48:55 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by lelnx194.ext.ti.com (8.15.1/8.15.1) with ESMTP id w09Lmmn6009348
	for <meta-arago@arago-project.org>; Tue, 9 Jan 2018 15:48:48 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ti.com;
	s=ti-com-17Q1; t=1515534528;
	bh=oUPc5TwrJqf1/FpLKvbWKrWS4RzN6PIqxwfXeey8IXU=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=hG6csEmfhMi6vQ12V+j9bbtRaYC5ewxjdrMk245P5aHzlaGETRtmOyB/vH6WphFOA
	l9i30wC7H2kmYnoAbLUN/ztCe1mmJloMQcH9F8ygoL0FhdpzkP/FLVl84jkm2w3Si5
	G8MSXpH9bzhL5Qe1fj6FATHwtNs/FBJ4fEMUNeXo=
Received: from DFLE108.ent.ti.com (dfle108.ent.ti.com [10.64.6.29])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id w09LmmvJ022455
	for <meta-arago@arago-project.org>; Tue, 9 Jan 2018 15:48:48 -0600
Received: from DFLE109.ent.ti.com (10.64.6.30) by DFLE108.ent.ti.com
	(10.64.6.29) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1261.35;
	Tue, 9 Jan 2018 15:48:48 -0600
Received: from dflp32.itg.ti.com (10.64.6.15) by DFLE109.ent.ti.com
	(10.64.6.30) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.1261.35 via Frontend
	Transport; Tue, 9 Jan 2018 15:48:48 -0600
Received: from uda0271529.am.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])
	by dflp32.itg.ti.com (8.14.3/8.13.8) with ESMTP id w09LmkRb011305;
	Tue, 9 Jan 2018 15:48:48 -0600
From: Hongmei Gou <a0271529@ti.com>
To: <meta-arago@arago-project.org>
Date: Tue, 9 Jan 2018 16:48:44 -0500
Message-ID: <1515534524-21325-6-git-send-email-a0271529@ti.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1515534524-21325-1-git-send-email-a0271529@ti.com>
References: <1515534524-21325-1-git-send-email-a0271529@ti.com>
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Cc: Hongmei Gou <a0271529@ti.com>
Subject: [meta-processor-sdk 5/5] ti-tisdk-makefile: remove cmem-mod for AM4
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
X-List-Received-Date: Tue, 09 Jan 2018 21:48:56 -0000
Content-Type: text/plain

* This has been upstreamed to meta-arago

Signed-off-by: Hongmei Gou <a0271529@ti.com>
---
 recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile_1.0.bbappend | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile_1.0.bbappend b/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile_1.0.bbappend
index db065a8..37aa6a6 100644
--- a/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile_1.0.bbappend
+++ b/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile_1.0.bbappend
@@ -1,4 +1,4 @@
-PR_append = ".tisdk48"
+PR_append = ".tisdk49"
 
 FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"
 
@@ -36,9 +36,7 @@ MAKEFILES_remove_omapl138 = "u-boot-legacy"
 
 MAKEFILES_append_omap-a15 = " video-graphics-test"
 
-MAKEFILES_append_ti43x = " cmem-mod \
-			   evse-hmi \
-"
+MAKEFILES_append_ti43x = " evse-hmi"
 
 MAKEFILES_append_ti33x = " evse-hmi \
 			   protection-relays-hmi \
-- 
1.9.1


