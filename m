Return-Path: <e-ruei1@ti.com>
Received: from lelnx193.ext.ti.com (lelnx193.ext.ti.com [198.47.27.77])
	by arago-project.org (Postfix) with ESMTPS id 0F4305297F
	for <meta-arago@arago-project.org>;
	Wed,  6 Sep 2017 19:07:33 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by lelnx193.ext.ti.com (8.15.1/8.15.1) with ESMTP id v86J7WqF004627
	for <meta-arago@arago-project.org>; Wed, 6 Sep 2017 14:07:32 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ti.com;
	s=ti-com-17Q1; t=1504724852;
	bh=Mm2NJBtzKOc3qGXzos34VMkNV6/Fl3yrMSTvbogEKWo=;
	h=From:To:CC:Subject:Date;
	b=kAYE9HQnVggXrLkVL2LrAajI6di6tuAd2mISyp3t5VKErUZ/2r2Xi1a07wfNjgAsM
	8Gxi5Rh1TeDQk/ojTTGOfmgcehKBaXVrzCsvmRRamv8KBkkpxYYdy1O4eQsklaNvUR
	c/Ijn51im73OdjzPuh97KBakF8fSMvcownzHZWPY=
Received: from DLEE105.ent.ti.com (dlee105.ent.ti.com [157.170.170.35])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id v86J7WkZ017414
	for <meta-arago@arago-project.org>; Wed, 6 Sep 2017 14:07:32 -0500
Received: from DLEE105.ent.ti.com (157.170.170.35) by DLEE105.ent.ti.com
	(157.170.170.35) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P256) id 15.1.845.34;
	Wed, 6 Sep 2017 14:07:32 -0500
Received: from dlep33.itg.ti.com (157.170.170.75) by DLEE105.ent.ti.com
	(157.170.170.35) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.845.34 via Frontend
	Transport; Wed, 6 Sep 2017 14:07:32 -0500
Received: from uda0850410.am.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])
	by dlep33.itg.ti.com (8.14.3/8.13.8) with ESMTP id v86J7Wf8007471;
	Wed, 6 Sep 2017 14:07:32 -0500
From: Eric Ruei <e-ruei1@ti.com>
To: <meta-arago@arago-project.org>
Date: Wed, 6 Sep 2017 15:07:27 -0400
Message-ID: <1504724847-52601-1-git-send-email-e-ruei1@ti.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: [meta-processor-sdk][PATCH] matrix-gui-browser-demos: bump SRCREV to pickup runGoogleChrome.sh fixes
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
X-List-Received-Date: Wed, 06 Sep 2017 19:07:33 -0000
Content-Type: text/plain

Signed-off-by: Eric Ruei <e-ruei1@ti.com>
---
 recipes-core/matrix/matrix-gui-browser-demos_2.0.bbappend | 3 +++
 1 file changed, 3 insertions(+)
 create mode 100644 recipes-core/matrix/matrix-gui-browser-demos_2.0.bbappend

diff --git a/recipes-core/matrix/matrix-gui-browser-demos_2.0.bbappend b/recipes-core/matrix/matrix-gui-browser-demos_2.0.bbappend
new file mode 100644
index 0000000..9936396
--- /dev/null
+++ b/recipes-core/matrix/matrix-gui-browser-demos_2.0.bbappend
@@ -0,0 +1,3 @@
+PR_append = ".tisdk0"
+
+SRCREV = "c6fe9957de117bc87c48a7d63205dfae923bb5b9"
-- 
1.9.1


