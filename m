Return-Path: <d-senicic1@ti.com>
Received: from fllnx210.ext.ti.com (fllnx210.ext.ti.com [198.47.19.17])
	by arago-project.org (Postfix) with ESMTPS id 4565A52998
	for <meta-arago@arago-project.org>;
	Wed, 21 Feb 2018 01:48:07 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by fllnx210.ext.ti.com (8.15.1/8.15.1) with ESMTP id w1L1lgwt019778
	for <meta-arago@arago-project.org>; Tue, 20 Feb 2018 19:47:42 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ti.com;
	s=ti-com-17Q1; t=1519177662;
	bh=S4h1VbQ8xOaQMFbmez8k/XrOnFfLoLnxnCSpi6P6jQs=;
	h=From:To:CC:Subject:Date;
	b=IW66aY4XJHAeC2QchGhGXXAkZBydlsXYkslZWzRlSXImid90t7z7HyWCEtGD084aZ
	8UWEmIO9of2pbJ95iG4Xt9BlN019CxurbTuTHAovOrjhZTgc02S3kYMD+qihwzDNP7
	bnML/mTCCTqAIT/h9TZ5OxqDFctbOFoCgM3zfy/s=
Received: from DLEE100.ent.ti.com (dlee100.ent.ti.com [157.170.170.30])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id w1L1lgVI009946
	for <meta-arago@arago-project.org>; Tue, 20 Feb 2018 19:47:42 -0600
Received: from DLEE105.ent.ti.com (157.170.170.35) by DLEE100.ent.ti.com
	(157.170.170.30) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1261.35;
	Tue, 20 Feb 2018 19:47:41 -0600
Received: from dflp32.itg.ti.com (10.64.6.15) by DLEE105.ent.ti.com
	(157.170.170.35) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.1261.35 via Frontend
	Transport; Tue, 20 Feb 2018 19:47:41 -0600
Received: from UDA0271529.am.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])
	by dflp32.itg.ti.com (8.14.3/8.13.8) with ESMTP id w1L1lfxI032501;
	Tue, 20 Feb 2018 19:47:41 -0600
From: Djordje Senicic <x0157990@ti.com>
To: <meta-arago@arago-project.org>
Date: Tue, 20 Feb 2018 20:47:26 -0500
Message-ID: <1519177646-5449-1-git-send-email-x0157990@ti.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Cc: d-senicic1@ti.com, Djordje Senicic <x0157990@ti.com>
Subject: [PATCH] opencv: Fix OpenCL linking with unused DSP library
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
X-List-Received-Date: Wed, 21 Feb 2018 01:48:07 -0000
Content-Type: text/plain

Signed-off-by: Djordje Senicic <x0157990@ti.com>
---
 meta-arago-distro/recipes-support/opencv/opencv_3.1.bbappend | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-arago-distro/recipes-support/opencv/opencv_3.1.bbappend b/meta-arago-distro/recipes-support/opencv/opencv_3.1.bbappend
index bf33a2e..3915c4d 100644
--- a/meta-arago-distro/recipes-support/opencv/opencv_3.1.bbappend
+++ b/meta-arago-distro/recipes-support/opencv/opencv_3.1.bbappend
@@ -11,7 +11,7 @@ SRC_URI_append += "\
      file://setupEnv.sh \
 "
 
-SRCREV_opencv = "4458601eb2766461f2f9da0d2527ff25ecb20284"
+SRCREV_opencv = "9b88e8c746e531a1b4cc61e5235e4e747c319945"
 
 DEPENDS_remove_keystone = "qtbase"
 
-- 
1.9.1


