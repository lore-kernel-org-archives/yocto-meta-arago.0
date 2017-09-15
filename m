Return-Path: <d-senicic1@ti.com>
Received: from fllnx209.ext.ti.com (fllnx209.ext.ti.com [198.47.19.16])
	by arago-project.org (Postfix) with ESMTPS id 9912B52A0C
	for <meta-arago@arago-project.org>;
	Fri, 15 Sep 2017 11:26:59 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by fllnx209.ext.ti.com (8.15.1/8.15.1) with ESMTP id v8FBQnCx013253
	for <meta-arago@arago-project.org>; Fri, 15 Sep 2017 06:26:49 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ti.com;
	s=ti-com-17Q1; t=1505474809;
	bh=c4hDgqhhh0LYKxwp6EJX4ipsmRaGGbgUBx3yocVdU4k=;
	h=From:To:CC:Subject:Date;
	b=FfpKMu1UJFJ2hFFGXCMQ/ZGUQonpo9Gh6Qpr3n7ub3jpLBtgn2FkkHTe4pC/rz/BG
	rClG6QgLFOXAorpbPg4KfH6EXJRuWdtm/vPaZIUt0FDsilJu9REKu8Hr9wkQWD34WC
	WaiIW0c/rQauK38kI5HokiFrqH8kkf39ENxZswnA=
Received: from DLEE108.ent.ti.com (dlee108.ent.ti.com [157.170.170.38])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id v8FBQiY0005291
	for <meta-arago@arago-project.org>; Fri, 15 Sep 2017 06:26:44 -0500
Received: from DLEE115.ent.ti.com (157.170.170.26) by DLEE108.ent.ti.com
	(157.170.170.38) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P256) id 15.1.845.34;
	Fri, 15 Sep 2017 06:26:43 -0500
Received: from dlep33.itg.ti.com (157.170.170.75) by DLEE115.ent.ti.com
	(157.170.170.26) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.845.34 via Frontend
	Transport; Fri, 15 Sep 2017 06:26:43 -0500
Received: from UDA0271529.am.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])
	by dlep33.itg.ti.com (8.14.3/8.13.8) with ESMTP id v8FBQh6A018070;
	Fri, 15 Sep 2017 06:26:43 -0500
From: Djordje Senicic <x0157990@ti.com>
To: <meta-arago@arago-project.org>
Date: Fri, 15 Sep 2017 07:26:26 -0400
Message-ID: <1505474786-20531-1-git-send-email-x0157990@ti.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Cc: d-senicic1@ti.com, Djordje Senicic <x0157990@ti.com>
Subject: [EXTERNAL][meta-processor-sdk][PATCH] opencv: bump SRCREV to fix OpenCL context iniitialization
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
X-List-Received-Date: Fri, 15 Sep 2017 11:27:00 -0000
Content-Type: text/plain

* Initialize OpenCL context only if cmem module is inserted and ti-mctd is running

Signed-off-by: Djordje Senicic <x0157990@ti.com>
---
 recipes-support/opencv/opencv_3.1.bbappend | 3 +++
 1 file changed, 3 insertions(+)
 create mode 100644 recipes-support/opencv/opencv_3.1.bbappend

diff --git a/recipes-support/opencv/opencv_3.1.bbappend b/recipes-support/opencv/opencv_3.1.bbappend
new file mode 100644
index 0000000..a8aeef0
--- /dev/null
+++ b/recipes-support/opencv/opencv_3.1.bbappend
@@ -0,0 +1,3 @@
+PR_append = ".tisdk0"
+
+SRCREV_opencv = "4458601eb2766461f2f9da0d2527ff25ecb20284"
-- 
1.9.1


