Return-Path: <d-senicic1@ti.com>
Received: from fllnx209.ext.ti.com (fllnx209.ext.ti.com [198.47.19.16])
	by arago-project.org (Postfix) with ESMTPS id 74EED529BC
	for <meta-arago@arago-project.org>;
	Mon,  4 Jun 2018 14:56:55 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by fllnx209.ext.ti.com (8.15.1/8.15.1) with ESMTP id w54Eunf6016384
	for <meta-arago@arago-project.org>; Mon, 4 Jun 2018 09:56:49 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1528124209;
	bh=m9BMFDcPEo1CUdCWxyPkLF6UM0Chq6Fd5bxD3S9kwJ4=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=jwvo9Rx9ii+6vN+8fTYn1MHwHnP/OMalZUiNJfoaQI0w1vSacg4qwHj1wJtNEnkoY
	Y6Z/cL4ixqlSJpzxBrAlC0iP4MHOOE6V3QnP3y5RadrqfH0qos379Zxi0CMjgX8Sta
	FqMgNML0o84smhbXy5hXE9hSHIo2d9Aq/0wYan1E=
Received: from DFLE106.ent.ti.com (dfle106.ent.ti.com [10.64.6.27])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id w54EunOk014614
	for <meta-arago@arago-project.org>; Mon, 4 Jun 2018 09:56:49 -0500
Received: from DFLE106.ent.ti.com (10.64.6.27) by DFLE106.ent.ti.com
	(10.64.6.27) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1466.3;
	Mon, 4 Jun 2018 09:56:48 -0500
Received: from dlep33.itg.ti.com (157.170.170.75) by DFLE106.ent.ti.com
	(10.64.6.27) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.1466.3 via Frontend
	Transport; Mon, 4 Jun 2018 09:56:48 -0500
Received: from UDA0271529.am.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])
	by dlep33.itg.ti.com (8.14.3/8.13.8) with ESMTP id w54Eumpp003223;
	Mon, 4 Jun 2018 09:56:48 -0500
From: Djordje Senicic <x0157990@ti.com>
To: <meta-arago@arago-project.org>
Date: Mon, 4 Jun 2018 10:56:43 -0400
Message-ID: <1528124204-19003-3-git-send-email-x0157990@ti.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1528124204-19003-1-git-send-email-x0157990@ti.com>
References: <1528124204-19003-1-git-send-email-x0157990@ti.com>
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Cc: d-senicic1@ti.com, Djordje Senicic <x0157990@ti.com>
Subject: [meta-processor-sdk][PATCH 3/4] pm-lld: update for DEV.PM_LLD.01.04.00.05
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
X-List-Received-Date: Mon, 04 Jun 2018 14:56:56 -0000
Content-Type: text/plain

* pm-lld: new release 1.4.0.5, will be moved later to meta-ti

Signed-off-by: Djordje Senicic <x0157990@ti.com>
---
 recipes-bsp/pm-lld/pm-lld-rtos_git.bbappend | 9 +++++++++
 1 file changed, 9 insertions(+)
 create mode 100644 recipes-bsp/pm-lld/pm-lld-rtos_git.bbappend

diff --git a/recipes-bsp/pm-lld/pm-lld-rtos_git.bbappend b/recipes-bsp/pm-lld/pm-lld-rtos_git.bbappend
new file mode 100644
index 0000000..5fd59ef
--- /dev/null
+++ b/recipes-bsp/pm-lld/pm-lld-rtos_git.bbappend
@@ -0,0 +1,9 @@
+# Below commit ID corresponds to "DEV.PM_LLD.01.04.00.04"
+PM_LLD_SRCREV = "1c0cae9b001137f68f34bf9168d7c3fa9036b1a6"
+
+# Below commit ID corresponds to "DEV.PM_LLD.01.04.00.05"
+PM_LLD_SRCREV_dra7xx-evm = "945d7ce376c9d9ab748312c48c36994ee7c03dc7"
+PM_LLD_SRCREV_am57xx-evm = "945d7ce376c9d9ab748312c48c36994ee7c03dc7"
+
+PV = "01.04.00.05"
+PR = "r0"
-- 
1.9.1


