Return-Path: <m-radhakrishnan2@ti.com>
Received: from lelnx194.ext.ti.com (lelnx194.ext.ti.com [198.47.27.80])
	by arago-project.org (Postfix) with ESMTPS id 37F05529D1
	for <meta-arago@arago-project.org>;
	Fri, 15 Dec 2017 16:49:09 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by lelnx194.ext.ti.com (8.15.1/8.15.1) with ESMTP id vBFGn8p3011395
	for <meta-arago@arago-project.org>; Fri, 15 Dec 2017 10:49:08 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ti.com;
	s=ti-com-17Q1; t=1513356548;
	bh=kWUxzGLeZY3t+PLjruWlTjgTtOGXvqc0TV9lltZcD4Q=;
	h=From:To:Subject:Date;
	b=Y4SD1Eml/G+vtQ13rlxjzNURIdrx4QWqqM3xJo8KIIhTop8pYHkO4jX6AejpcMf2n
	WebEOnJdQz+H1ZvTqVs4s2PwSr8LurFrPRr/or6/YyZcJ1DNYcJE5JIPXFB0Wx4+vB
	lTWDGUSqg1Dix9D2+S1NG6sjqxsKZkTOY/aoZWuY=
Received: from DFLE111.ent.ti.com (dfle111.ent.ti.com [10.64.6.32])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id vBFGn8S1014205
	for <meta-arago@arago-project.org>; Fri, 15 Dec 2017 10:49:08 -0600
Received: from DFLE108.ent.ti.com (10.64.6.29) by DFLE111.ent.ti.com
	(10.64.6.32) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1261.35;
	Fri, 15 Dec 2017 10:49:08 -0600
Received: from dflp32.itg.ti.com (10.64.6.15) by DFLE108.ent.ti.com
	(10.64.6.29) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.1261.35 via Frontend
	Transport; Fri, 15 Dec 2017 10:49:08 -0600
Received: from uda0875154a.am.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])
	by dflp32.itg.ti.com (8.14.3/8.13.8) with ESMTP id vBFGn7gM027386
	for <meta-arago@arago-project.org>; Fri, 15 Dec 2017 10:49:08 -0600
From: Mahesh Radhakrsihnan <m-radhakrishnan2@ti.com>
To: <meta-arago@arago-project.org>
Date: Fri, 15 Dec 2017 11:49:06 -0500
Message-ID: <1513356546-1537-1-git-send-email-m-radhakrishnan2@ti.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: [morty][meta-processor-sdk][PATCH ] mcasp-lld-rtos: Update to version 1.1.0.8A
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
X-List-Received-Date: Fri, 15 Dec 2017 16:49:10 -0000
Content-Type: text/plain

From: Mahesh Radhakrishnan <m-radhakrishnan2@ti.com>

Signed-off-by: Mahesh Radhakrishnan <m-radhakrishnan2@ti.com>
---
 recipes-bsp/mcasp-lld/mcasp-lld-rtos_git.bbappend | 5 +++++
 1 file changed, 5 insertions(+)
 create mode 100644 recipes-bsp/mcasp-lld/mcasp-lld-rtos_git.bbappend

diff --git a/recipes-bsp/mcasp-lld/mcasp-lld-rtos_git.bbappend b/recipes-bsp/mcasp-lld/mcasp-lld-rtos_git.bbappend
new file mode 100644
index 0000000..112fb7e
--- /dev/null
+++ b/recipes-bsp/mcasp-lld/mcasp-lld-rtos_git.bbappend
@@ -0,0 +1,5 @@
+# Below commit ID corresponds to "DEV.MCASP_LLD.01.01.00.08A"
+MCASP_LLD_SRCREV = "56fc546fe3f0ba89477dfa020bcc4b6aa8ce64f3"
+
+PV = "01.01.00.08A"
+PR = "r0"
-- 
1.9.1


