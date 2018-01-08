Return-Path: <h-gou@ti.com>
Received: from fllnx210.ext.ti.com (fllnx210.ext.ti.com [198.47.19.17])
	by arago-project.org (Postfix) with ESMTPS id 5654952A19
	for <meta-arago@arago-project.org>;
	Mon,  8 Jan 2018 23:34:02 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by fllnx210.ext.ti.com (8.15.1/8.15.1) with ESMTP id w08NXtCs025162
	for <meta-arago@arago-project.org>; Mon, 8 Jan 2018 17:33:55 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ti.com;
	s=ti-com-17Q1; t=1515454435;
	bh=H1y7thg8FmPXbZEiABq2fgPueMiUYtm3yfCU5m2I+vk=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=DoHFmAHPimoxE/nyM1okfkNpCmyN3QjfTOijPhspA5Z4J0Uof9mFRvisFB6YcPDpo
	YdZIn4VqNR+ozh9WwT78W4s4gkusytQ+nrgZb9L42wuDutrK2I/9qU7QVti3BzTh91
	EyZpKYz3Us+dUvWnS9MARqyMsGw+1EpaId3Gaovs=
Received: from DFLE114.ent.ti.com (dfle114.ent.ti.com [10.64.6.35])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id w08NXtYm004807
	for <meta-arago@arago-project.org>; Mon, 8 Jan 2018 17:33:55 -0600
Received: from DFLE109.ent.ti.com (10.64.6.30) by DFLE114.ent.ti.com
	(10.64.6.35) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1261.35;
	Mon, 8 Jan 2018 17:33:55 -0600
Received: from dflp33.itg.ti.com (10.64.6.16) by DFLE109.ent.ti.com
	(10.64.6.30) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.1261.35 via Frontend
	Transport; Mon, 8 Jan 2018 17:33:55 -0600
Received: from uda0271529.am.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])
	by dflp33.itg.ti.com (8.14.3/8.13.8) with ESMTP id w08NXrhA019194;
	Mon, 8 Jan 2018 17:33:55 -0600
From: Hongmei Gou <a0271529@ti.com>
To: <meta-arago@arago-project.org>
Date: Mon, 8 Jan 2018 18:33:33 -0500
Message-ID: <1515454420-19972-6-git-send-email-a0271529@ti.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1515454420-19972-1-git-send-email-a0271529@ti.com>
References: <1515454420-19972-1-git-send-email-a0271529@ti.com>
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Cc: Hongmei Gou <a0271529@ti.com>
Subject: [meta-processor-sdk 05/12] gpio-lld-rtos: upstreamed to meta-ti
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
X-List-Received-Date: Mon, 08 Jan 2018 23:34:03 -0000
Content-Type: text/plain

Signed-off-by: Hongmei Gou <a0271529@ti.com>
---
 recipes-bsp/gpio-lld/gpio-lld-rtos_git.bbappend | 5 -----
 1 file changed, 5 deletions(-)
 delete mode 100644 recipes-bsp/gpio-lld/gpio-lld-rtos_git.bbappend

diff --git a/recipes-bsp/gpio-lld/gpio-lld-rtos_git.bbappend b/recipes-bsp/gpio-lld/gpio-lld-rtos_git.bbappend
deleted file mode 100644
index b452c70..0000000
--- a/recipes-bsp/gpio-lld/gpio-lld-rtos_git.bbappend
+++ /dev/null
@@ -1,5 +0,0 @@
-# Below commit ID corresponds to "DEV.GPIO_LLD.01.00.00.09"
-GPIO_LLD_SRCREV = "99a20a668f36217705d57f7cc2f7faf1a5533bbe"
-
-PV = "01.00.00.09"
-PR = "r0"
-- 
1.9.1


