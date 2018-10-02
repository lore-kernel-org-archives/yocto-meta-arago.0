Return-Path: <m-radhakrishnan2@ti.com>
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
	by arago-project.org (Postfix) with ESMTPS id CC18352092
	for <meta-arago@arago-project.org>;
	Tue,  2 Oct 2018 02:42:38 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id w922gUkI048284
	for <meta-arago@arago-project.org>; Mon, 1 Oct 2018 21:42:30 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1538448150;
	bh=2Ei/XfxFyZFl5KkX/JDJQ8k0qwbxvpuqCuJtEMFiols=;
	h=From:To:Subject:Date:In-Reply-To:References;
	b=chEXRzSvn6JiedxxFEYcuvDsDkuL+yjq+pXug2Oz82EsiiPNB+EXfO0r8dt+/NK7w
	e61cOjlS0ytBGKU6Upun1AYkBBYLatrVYJNql/QPbl5x0kK0sKXQkSAjbJitx07gQm
	uua/3KApVzEDvo0utCJGVE+qOfYZA91AiwXUn9Gk=
Received: from DFLE108.ent.ti.com (dfle108.ent.ti.com [10.64.6.29])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id w922gUcf017575
	for <meta-arago@arago-project.org>; Mon, 1 Oct 2018 21:42:30 -0500
Received: from DFLE111.ent.ti.com (10.64.6.32) by DFLE108.ent.ti.com
	(10.64.6.29) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1466.3;
	Mon, 1 Oct 2018 21:42:29 -0500
Received: from dflp32.itg.ti.com (10.64.6.15) by DFLE111.ent.ti.com
	(10.64.6.32) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.1466.3 via Frontend
	Transport; Mon, 1 Oct 2018 21:42:29 -0500
Received: from uda0875154a.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])
	by dflp32.itg.ti.com (8.14.3/8.13.8) with ESMTP id w922gTKl011998
	for <meta-arago@arago-project.org>; Mon, 1 Oct 2018 21:42:29 -0500
From: Mahesh Radhakrishnan <m-radhakrishnan2@ti.com>
To: <meta-arago@arago-project.org>
Date: Mon, 1 Oct 2018 22:42:25 -0400
Message-ID: <1538448145-23106-2-git-send-email-m-radhakrishnan2@ti.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1538448145-23106-1-git-send-email-m-radhakrishnan2@ti.com>
References: <1538448145-23106-1-git-send-email-m-radhakrishnan2@ti.com>
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: [master][meta-processor-sdk][PATCH] common-csl-ip: SRCREV bump to version 03.03.00.12A
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
X-List-Received-Date: Tue, 02 Oct 2018 02:42:39 -0000
Content-Type: text/plain

Signed-off-by: Mahesh Radhakrishnan <m-radhakrishnan2@ti.com>
---
 recipes-bsp/common-csl-ip/common-csl-ip-03_03_00_12A.inc  | 5 +++++
 recipes-bsp/common-csl-ip/common-csl-ip-rtos_git.bbappend | 1 +
 recipes-bsp/common-csl-ip/common-csp-ip_git.bbappend      | 1 +
 3 files changed, 7 insertions(+)
 create mode 100644 recipes-bsp/common-csl-ip/common-csl-ip-03_03_00_12A.inc
 create mode 100644 recipes-bsp/common-csl-ip/common-csl-ip-rtos_git.bbappend
 create mode 100644 recipes-bsp/common-csl-ip/common-csp-ip_git.bbappend

diff --git a/recipes-bsp/common-csl-ip/common-csl-ip-03_03_00_12A.inc b/recipes-bsp/common-csl-ip/common-csl-ip-03_03_00_12A.inc
new file mode 100644
index 0000000..24bfd8a
--- /dev/null
+++ b/recipes-bsp/common-csl-ip/common-csl-ip-03_03_00_12A.inc
@@ -0,0 +1,5 @@
+PV = "03.03.00.12A"
+INC_PR = "r0"
+
+# Below commit ID corresponding to "DEV.CSL_PROCESSOR-SDK.03.03.00.12A"
+CSL_SRCREV = "852cfe681c766a2096007fee37358c0782194897"
diff --git a/recipes-bsp/common-csl-ip/common-csl-ip-rtos_git.bbappend b/recipes-bsp/common-csl-ip/common-csl-ip-rtos_git.bbappend
new file mode 100644
index 0000000..f71f851
--- /dev/null
+++ b/recipes-bsp/common-csl-ip/common-csl-ip-rtos_git.bbappend
@@ -0,0 +1 @@
+require common-csl-ip-03_03_00_12A.inc
diff --git a/recipes-bsp/common-csl-ip/common-csp-ip_git.bbappend b/recipes-bsp/common-csl-ip/common-csp-ip_git.bbappend
new file mode 100644
index 0000000..f71f851
--- /dev/null
+++ b/recipes-bsp/common-csl-ip/common-csp-ip_git.bbappend
@@ -0,0 +1 @@
+require common-csl-ip-03_03_00_12A.inc
-- 
1.9.1


