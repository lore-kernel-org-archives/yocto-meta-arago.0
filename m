Return-Path: <d-senicic1@ti.com>
Received: from fllnx209.ext.ti.com (fllnx209.ext.ti.com [198.47.19.16])
	by arago-project.org (Postfix) with ESMTPS id 6C8C952A45
	for <meta-arago@arago-project.org>;
	Mon,  4 Jun 2018 18:48:45 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by fllnx209.ext.ti.com (8.15.1/8.15.1) with ESMTP id w54ImejW024468
	for <meta-arago@arago-project.org>; Mon, 4 Jun 2018 13:48:40 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1528138120;
	bh=5OpyqwvRPEZwUf+3N0+8LuXZrzcEGFboymsq1q5XOc0=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=UImR6YAMzcgZDzNj5g668PKqXLM0GF2FFYWTstKm8Ur9TdazwMk94Ujkfasbvlby7
	+atsTfDuBSID6KSGriKsf2NoNPDylCstRCuwcBKboDqpMJwvbY3PMKLZxWceObU2EW
	/hDvqF1mFmH8DQ1EZx7ALoFgxNLh5WWshYwZRi/s=
Received: from DLEE100.ent.ti.com (dlee100.ent.ti.com [157.170.170.30])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id w54ImeYF026339
	for <meta-arago@arago-project.org>; Mon, 4 Jun 2018 13:48:40 -0500
Received: from DLEE109.ent.ti.com (157.170.170.41) by DLEE100.ent.ti.com
	(157.170.170.30) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1466.3;
	Mon, 4 Jun 2018 13:48:39 -0500
Received: from dflp33.itg.ti.com (10.64.6.16) by DLEE109.ent.ti.com
	(157.170.170.41) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.1466.3 via Frontend
	Transport; Mon, 4 Jun 2018 13:48:39 -0500
Received: from UDA0271529.am.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])
	by dflp33.itg.ti.com (8.14.3/8.13.8) with ESMTP id w54Imckc026353;
	Mon, 4 Jun 2018 13:48:39 -0500
From: Djordje Senicic <x0157990@ti.com>
To: <meta-arago@arago-project.org>
Date: Mon, 4 Jun 2018 14:48:36 -0400
Message-ID: <1528138116-20563-3-git-send-email-x0157990@ti.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1528138116-20563-1-git-send-email-x0157990@ti.com>
References: <1528138116-20563-1-git-send-email-x0157990@ti.com>
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Cc: d-senicic1@ti.com, Djordje Senicic <x0157990@ti.com>
Subject: [meta-processor-sdk][PATCHv2 3/3] csl: update for common-csl-ip 3.3.0.11
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
X-List-Received-Date: Mon, 04 Jun 2018 18:48:46 -0000
Content-Type: text/plain

* common-csl-ip: New release 03.03.00.11

Signed-off-by: Djordje Senicic <x0157990@ti.com>
---
 recipes-bsp/common-csl-ip/common-csl-ip-03.03.00.11.inc   | 5 +++++
 recipes-bsp/common-csl-ip/common-csl-ip-rtos_git.bbappend | 1 +
 recipes-bsp/common-csl-ip/common-csl-ip_git.bbappend      | 1 +
 3 files changed, 7 insertions(+)
 create mode 100644 recipes-bsp/common-csl-ip/common-csl-ip-03.03.00.11.inc
 create mode 100644 recipes-bsp/common-csl-ip/common-csl-ip-rtos_git.bbappend
 create mode 100644 recipes-bsp/common-csl-ip/common-csl-ip_git.bbappend

diff --git a/recipes-bsp/common-csl-ip/common-csl-ip-03.03.00.11.inc b/recipes-bsp/common-csl-ip/common-csl-ip-03.03.00.11.inc
new file mode 100644
index 0000000..dca0a73
--- /dev/null
+++ b/recipes-bsp/common-csl-ip/common-csl-ip-03.03.00.11.inc
@@ -0,0 +1,5 @@
+# Below commit ID corresponding to "DEV.CSL_PROCESSOR-SDK.03.03.00.11"
+CSL_SRCREV = "b18c65acf85f9d94226cc573a99ba94bfe822b88"
+
+PV = "03.03.00.11"
+INC_PR = "r0"
diff --git a/recipes-bsp/common-csl-ip/common-csl-ip-rtos_git.bbappend b/recipes-bsp/common-csl-ip/common-csl-ip-rtos_git.bbappend
new file mode 100644
index 0000000..dbf994a
--- /dev/null
+++ b/recipes-bsp/common-csl-ip/common-csl-ip-rtos_git.bbappend
@@ -0,0 +1 @@
+require recipes-bsp/common-csl-ip/common-csl-ip-03.03.00.11.inc
diff --git a/recipes-bsp/common-csl-ip/common-csl-ip_git.bbappend b/recipes-bsp/common-csl-ip/common-csl-ip_git.bbappend
new file mode 100644
index 0000000..dbf994a
--- /dev/null
+++ b/recipes-bsp/common-csl-ip/common-csl-ip_git.bbappend
@@ -0,0 +1 @@
+require recipes-bsp/common-csl-ip/common-csl-ip-03.03.00.11.inc
-- 
1.9.1


