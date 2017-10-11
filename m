Return-Path: <jjhiblot@ti.com>
Received: from fllnx210.ext.ti.com (fllnx210.ext.ti.com [198.47.19.17])
	by arago-project.org (Postfix) with ESMTPS id AE7A452961
	for <meta-arago@arago-project.org>;
	Wed, 11 Oct 2017 17:58:48 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by fllnx210.ext.ti.com (8.15.1/8.15.1) with ESMTP id v9BHwmma008381
	for <meta-arago@arago-project.org>; Wed, 11 Oct 2017 12:58:48 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ti.com;
	s=ti-com-17Q1; t=1507744728;
	bh=bl+Aiu6Kkwp8sVq+9qL3HTxwPPcS1dVIycvAhV5/sWI=;
	h=From:To:CC:Subject:Date;
	b=KSRABZCEXQvmbAx69ieqEMQFDWpNEQ0JMnfEY/lEq4SsWSEQloGeb+8v4g01/DD59
	wyGlExRjW9pQappNoIB3XWb2Fuhd3BMrNUjr4XtoMk5LrA9r0995FBVVMep10FUr2A
	GOpAzbWSH5MfQZ5Sf8nNQ9m6PAoC7bmFf1EC+oxs=
Received: from DLEE101.ent.ti.com (dlee101.ent.ti.com [157.170.170.31])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id v9BHwm8a003096
	for <meta-arago@arago-project.org>; Wed, 11 Oct 2017 12:58:48 -0500
Received: from DLEE114.ent.ti.com (157.170.170.25) by DLEE101.ent.ti.com
	(157.170.170.31) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P256) id 15.1.845.34;
	Wed, 11 Oct 2017 12:58:48 -0500
Received: from dlep33.itg.ti.com (157.170.170.75) by DLEE114.ent.ti.com
	(157.170.170.25) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.845.34 via Frontend
	Transport; Wed, 11 Oct 2017 12:58:48 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
	by dlep33.itg.ti.com (8.14.3/8.13.8) with ESMTP id v9BHwl2R013331;
	Wed, 11 Oct 2017 12:58:47 -0500
From: Jean-Jacques Hiblot <jjhiblot@ti.com>
To: <meta-arago@arago-project.org>, <denys@ti.com>
Date: Wed, 11 Oct 2017 19:58:44 +0200
Message-ID: <1507744725-32713-1-git-send-email-jjhiblot@ti.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: [krogoth] [PATCH 1/2] can-utils: update to the latest
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
X-List-Received-Date: Wed, 11 Oct 2017 17:58:49 -0000
Content-Type: text/plain

Signed-off-by: Jean-Jacques Hiblot <jjhiblot@ti.com>
---
 meta-arago-distro/recipes-extended/socketcan/can-utils_git.bbappend | 3 +++
 1 file changed, 3 insertions(+)
 create mode 100644 meta-arago-distro/recipes-extended/socketcan/can-utils_git.bbappend

diff --git a/meta-arago-distro/recipes-extended/socketcan/can-utils_git.bbappend b/meta-arago-distro/recipes-extended/socketcan/can-utils_git.bbappend
new file mode 100644
index 0000000..c0e6666
--- /dev/null
+++ b/meta-arago-distro/recipes-extended/socketcan/can-utils_git.bbappend
@@ -0,0 +1,3 @@
+SRCREV = "5b518a0a5fa56856f804372a6b99b518dedb5386"
+
+PR_append = ".arago0"
-- 
1.9.1


