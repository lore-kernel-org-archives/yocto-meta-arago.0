Return-Path: <manishalocal@uda0393239>
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
	by arago-project.org (Postfix) with ESMTPS id B71E85298D
	for <meta-arago@arago-project.org>;
	Mon,  3 Dec 2018 20:44:39 +0000 (UTC)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id wB3KiSGO064727
	for <meta-arago@arago-project.org>; Mon, 3 Dec 2018 14:44:28 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1543869868;
	bh=sz4uqvmtESdc1wjXonYTLy91ZfY/Ln/EIKWc/GAD2v0=;
	h=From:To:CC:Subject:Date;
	b=sE/eMCNcHLMMEXzbnQtZyyTe4aS6yaJQYbHhEMu88oQ56qnHeBplKmaePK5bLA0LW
	6W5sfX/SlFcNWJgK+ntH2jTvRynJr1/BURLZfFHUMlGYYs2INALaTxQ/a18slh+W3+
	kpXnaD55/o0vA9dPQebTM40Lgr3oeYCTurhco8bE=
Received: from DFLE114.ent.ti.com (dfle114.ent.ti.com [10.64.6.35])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id wB3KiS4s115993
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-arago@arago-project.org>; Mon, 3 Dec 2018 14:44:28 -0600
Received: from DFLE108.ent.ti.com (10.64.6.29) by DFLE114.ent.ti.com
	(10.64.6.35) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1591.10;
	Mon, 3 Dec 2018 14:44:28 -0600
Received: from dlep33.itg.ti.com (157.170.170.75) by DFLE108.ent.ti.com
	(10.64.6.29) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.1591.10 via Frontend
	Transport; Mon, 3 Dec 2018 14:44:28 -0600
Received: from uda0393239 (ileax41-snat.itg.ti.com [10.172.224.153])
	by dlep33.itg.ti.com (8.14.3/8.13.8) with ESMTP id wB3KiS8S001740;
	Mon, 3 Dec 2018 14:44:28 -0600
Received: from manishalocal by uda0393239 with local (Exim 4.82)
	(envelope-from <manishalocal@uda0393239>)
	id 1gTv4u-0007EM-9o; Mon, 03 Dec 2018 14:44:28 -0600
From: Manisha Agrawal <manisha.agrawal@ti.com>
To: <meta-arago@arago-project.org>
Date: Mon, 3 Dec 2018 14:44:22 -0600
Message-ID: <20181203204426.27752-1-manisha.agrawal@ti.com>
X-Mailer: git-send-email 2.13.0
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: [meta-processor-sdk][rocko][PATCH v1 1/5] linux: update to processor-sdk-linux-5.2.0
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
X-List-Received-Date: Mon, 03 Dec 2018 20:44:40 -0000
Content-Type: text/plain

From: Jacob Stiffler <j-stiffler@ti.com>

Signed-off-by: Jacob Stiffler <j-stiffler@ti.com>
Signed-off-by: Manisha Agrawal <manisha.agrawal@ti.com>
---
 recipes-kernel/linux/linux-ti-staging-rt_4.14.bbappend | 4 ++--
 recipes-kernel/linux/linux-ti-staging_4.14.bbappend    | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/recipes-kernel/linux/linux-ti-staging-rt_4.14.bbappend b/recipes-kernel/linux/linux-ti-staging-rt_4.14.bbappend
index c919674..7990fb9 100644
--- a/recipes-kernel/linux/linux-ti-staging-rt_4.14.bbappend
+++ b/recipes-kernel/linux/linux-ti-staging-rt_4.14.bbappend
@@ -1,7 +1,7 @@
 require linux-processor-sdk-4.14.inc
 
-PR_append = ".3"
+PR_append = ".4"
 
 KERNEL_GIT_URI = "git://git.ti.com/processor-sdk/processor-sdk-linux.git"
 BRANCH = "processor-sdk-linux-rt-4.14.y"
-SRCREV = "cfb76a2032cf42007d7aefcefda1b5a673999769"
+SRCREV = "da0d0b490cc5e450d1ea613b5805a5cc5f020e08"
diff --git a/recipes-kernel/linux/linux-ti-staging_4.14.bbappend b/recipes-kernel/linux/linux-ti-staging_4.14.bbappend
index 501fd3b..d749ea0 100644
--- a/recipes-kernel/linux/linux-ti-staging_4.14.bbappend
+++ b/recipes-kernel/linux/linux-ti-staging_4.14.bbappend
@@ -1,7 +1,7 @@
 require linux-processor-sdk-4.14.inc
 
-PR_append = ".3"
+PR_append = ".4"
 
 KERNEL_GIT_URI = "git://git.ti.com/processor-sdk/processor-sdk-linux.git"
 BRANCH = "processor-sdk-linux-4.14.y"
-SRCREV = "d315a9bb00b65589fa23ad07c0b07e3b672db0d0"
+SRCREV = "2fe2b351f345291e38e01349c039defb95d92b04"
-- 
2.13.0


