Return-Path: <m-radhakrishnan2@ti.com>
Received: from lelnx193.ext.ti.com (lelnx193.ext.ti.com [198.47.27.77])
	by arago-project.org (Postfix) with ESMTPS id 11BB152986
	for <meta-arago@arago-project.org>;
	Fri, 16 Mar 2018 16:41:35 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by lelnx193.ext.ti.com (8.15.1/8.15.1) with ESMTP id w2GGeeY9023039
	for <meta-arago@arago-project.org>; Fri, 16 Mar 2018 11:40:40 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ti.com;
	s=ti-com-17Q1; t=1521218440;
	bh=cpODHZCW+7qOH5Hqp4uetHfT50JnisGJM9gmwgzILFo=;
	h=From:To:Subject:Date;
	b=wwqBTG/MPW8oEAkZdokZNSfUVgePvsYZYEjZ8nrP/C+AYoscCKv78H1coXMxwZuth
	QBF1xeVzX0K6fulZaPi4gbZb5UFgarzjc8fN0bW9yqDso2n/uHy7xJT4k2KfNlXeQJ
	mAhG3lRkTYFkVrd4rs/y/sgjOrlZx6BFO2i1jaT8=
Received: from DFLE102.ent.ti.com (dfle102.ent.ti.com [10.64.6.23])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id w2GGee9b016405
	for <meta-arago@arago-project.org>; Fri, 16 Mar 2018 11:40:40 -0500
Received: from DFLE108.ent.ti.com (10.64.6.29) by DFLE102.ent.ti.com
	(10.64.6.23) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1261.35;
	Fri, 16 Mar 2018 11:40:40 -0500
Received: from dflp32.itg.ti.com (10.64.6.15) by DFLE108.ent.ti.com
	(10.64.6.29) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.1261.35 via Frontend
	Transport; Fri, 16 Mar 2018 11:40:40 -0500
Received: from uda0875154a.am.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])
	by dflp32.itg.ti.com (8.14.3/8.13.8) with ESMTP id w2GGeegp030189
	for <meta-arago@arago-project.org>; Fri, 16 Mar 2018 11:40:40 -0500
From: Mahesh Radhakrishnan <m-radhakrishnan2@ti.com>
To: <meta-arago@arago-project.org>
Date: Fri, 16 Mar 2018 12:40:39 -0400
Message-ID: <1521218439-28679-1-git-send-email-m-radhakrishnan2@ti.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: [morty][meta-processor-sdk][PATCH] mcspb-lld-rtos: Updating to version 01.00.00.09
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
X-List-Received-Date: Fri, 16 Mar 2018 16:41:35 -0000
Content-Type: text/plain

Signed-off-by: Mahesh Radhakrishnan <m-radhakrishnan2@ti.com>
---
 recipes-bsp/mcbsp-lld/mcbsp-lld-rtos_git.bbappend | 6 ++++++
 1 file changed, 6 insertions(+)
 create mode 100644 recipes-bsp/mcbsp-lld/mcbsp-lld-rtos_git.bbappend

diff --git a/recipes-bsp/mcbsp-lld/mcbsp-lld-rtos_git.bbappend b/recipes-bsp/mcbsp-lld/mcbsp-lld-rtos_git.bbappend
new file mode 100644
index 0000000..ca0dee6
--- /dev/null
+++ b/recipes-bsp/mcbsp-lld/mcbsp-lld-rtos_git.bbappend
@@ -0,0 +1,6 @@
+# Below commit ID corresponds to "DEV.MCBSP_LLD.01.00.00.09"
+MCBSP_LLD_SRCREV = "e782f251a7009c786a208a15e6bc0331bb6808f6"
+
+PV = "01.00.00.09"
+PR = "r0"
+
-- 
1.9.1


