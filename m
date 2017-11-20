Return-Path: <h-gou@ti.com>
Received: from lelnx194.ext.ti.com (lelnx194.ext.ti.com [198.47.27.80])
	by arago-project.org (Postfix) with ESMTPS id 08C8F52A02
	for <meta-arago@arago-project.org>;
	Mon, 20 Nov 2017 22:55:57 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by lelnx194.ext.ti.com (8.15.1/8.15.1) with ESMTP id vAKMtvsg001832
	for <meta-arago@arago-project.org>; Mon, 20 Nov 2017 16:55:57 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ti.com;
	s=ti-com-17Q1; t=1511218557;
	bh=MpD86pvSh5vjYY0gpyooV/hniu600/8m+csiUQ3kndg=;
	h=From:To:CC:Subject:Date;
	b=yhRtV/cg//u/ebCc092IrNM/dCbHxU2uOXAov3fnfZw8zE6qmWiXDYpge6+7RUgqX
	zASBv/If5Y+JzRaunAq/f4nB7qNvbXv/8hk98NLY1g19lSJ6Gv1fRlP2fw1Lp0WA9Q
	nUzZGg7ejgFC6TKt2YNxdlVPHFz2tmhw9MBO5NFE=
Received: from DLEE110.ent.ti.com (dlee110.ent.ti.com [157.170.170.21])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id vAKMtvul003176
	for <meta-arago@arago-project.org>; Mon, 20 Nov 2017 16:55:57 -0600
Received: from DLEE110.ent.ti.com (157.170.170.21) by DLEE110.ent.ti.com
	(157.170.170.21) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P256) id 15.1.845.34;
	Mon, 20 Nov 2017 16:55:57 -0600
Received: from dflp33.itg.ti.com (10.64.6.16) by DLEE110.ent.ti.com
	(157.170.170.21) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.845.34 via Frontend
	Transport; Mon, 20 Nov 2017 16:55:57 -0600
Received: from uda0271529.am.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])
	by dflp33.itg.ti.com (8.14.3/8.13.8) with ESMTP id vAKMtvug011895;
	Mon, 20 Nov 2017 16:55:57 -0600
From: Hongmei Gou <a0271529@ti.com>
To: <meta-arago@arago-project.org>
Date: Mon, 20 Nov 2017 17:55:54 -0500
Message-ID: <1511218554-4334-1-git-send-email-a0271529@ti.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Cc: Hongmei Gou <a0271529@ti.com>
Subject: [meta-processor-sdk] [PATCH] ccief-basic: bump SRCREV to get the fix for slave aging test failure
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
X-List-Received-Date: Mon, 20 Nov 2017 22:55:58 -0000
Content-Type: text/plain

Signed-off-by: Hongmei Gou <a0271529@ti.com>
---
 recipes-support/cclink/ccief-basic_git.bbappend | 3 +++
 1 file changed, 3 insertions(+)
 create mode 100644 recipes-support/cclink/ccief-basic_git.bbappend

diff --git a/recipes-support/cclink/ccief-basic_git.bbappend b/recipes-support/cclink/ccief-basic_git.bbappend
new file mode 100644
index 0000000..2d3f0ab
--- /dev/null
+++ b/recipes-support/cclink/ccief-basic_git.bbappend
@@ -0,0 +1,3 @@
+PR_append = ".tisdk0"
+
+CCIEF-BASIC_SRCREV = "ec2a42e61c85c6a5e858438c590b052f2e780d6f"
-- 
1.9.1


