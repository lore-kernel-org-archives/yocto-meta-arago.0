Return-Path: <denys@ti.com>
Received: from lelnx194.ext.ti.com (lelnx194.ext.ti.com [198.47.27.80])
	by arago-project.org (Postfix) with ESMTPS id 312F25298C
	for <meta-arago@arago-project.org>;
	Tue, 15 May 2018 16:59:16 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by lelnx194.ext.ti.com (8.15.1/8.15.1) with ESMTP id w4FGxB5r003285
	for <meta-arago@arago-project.org>; Tue, 15 May 2018 11:59:11 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1526403551;
	bh=xCK3HrHuX0nBS2uUwThWZCuhCtoZUBSjAhuwsxSiQ7k=;
	h=From:To:CC:Subject:Date;
	b=QFSykmMakKOUV8dtqQBHCkFCbzMJE1HWVM7ZQouU7hcB1TfMogAXI5FkpHWp64GAi
	aA8eGrAifU58+pZTQDvBJZAcrC2pVFezyPW2p+VoJKfHLjVlyIN74puarKL5XnYA8u
	iDDfpum7P/Qp4XQYsVWCxLJ3Yhzwj0+o/na0X5Bk=
Received: from DFLE111.ent.ti.com (dfle111.ent.ti.com [10.64.6.32])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id w4FGxBka018250
	for <meta-arago@arago-project.org>; Tue, 15 May 2018 11:59:11 -0500
Received: from DFLE111.ent.ti.com (10.64.6.32) by DFLE111.ent.ti.com
	(10.64.6.32) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1466.3;
	Tue, 15 May 2018 11:59:11 -0500
Received: from dflp33.itg.ti.com (10.64.6.16) by DFLE111.ent.ti.com
	(10.64.6.32) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.1466.3 via Frontend
	Transport; Tue, 15 May 2018 11:59:11 -0500
Received: from puget.gt.design.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])
	by dflp33.itg.ti.com (8.14.3/8.13.8) with ESMTP id w4FGxBIC020983;
	Tue, 15 May 2018 11:59:11 -0500
From: Denys Dmytriyenko <denys@ti.com>
To: <meta-arago@arago-project.org>
Date: Tue, 15 May 2018 12:59:08 -0400
Message-ID: <1526403548-26145-1-git-send-email-denys@ti.com>
X-Mailer: git-send-email 1.7.9.5
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: [PATCH] branding-core: lower FW priority for new opencl-monitor-ipu
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
X-List-Received-Date: Tue, 15 May 2018 16:59:16 -0000
Content-Type: text/plain

Similar to existing opencl-monitor for DSP FWs.

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 .../conf/distro/include/branding-core.inc          |    1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-arago-distro/conf/distro/include/branding-core.inc b/meta-arago-distro/conf/distro/include/branding-core.inc
index 2cdaf8b..1a4dee4 100644
--- a/meta-arago-distro/conf/distro/include/branding-core.inc
+++ b/meta-arago-distro/conf/distro/include/branding-core.inc
@@ -7,6 +7,7 @@
 
 # Lower opencl-monitor priority for now
 ALTERNATIVE_PRIORITY_pn-opencl-monitor = "1"
+ALTERNATIVE_PRIORITY_pn-opencl-monitor-ipu = "1"
 
 # Raise priority for sample IPC FW images
 ALTERNATIVE_PRIORITY_pn-ti-ipc-rtos = "15"
-- 
1.7.9.5


