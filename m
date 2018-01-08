Return-Path: <h-gou@ti.com>
Received: from fllnx209.ext.ti.com (fllnx209.ext.ti.com [198.47.19.16])
	by arago-project.org (Postfix) with ESMTPS id E475D52983
	for <meta-arago@arago-project.org>;
	Mon,  8 Jan 2018 23:34:03 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by fllnx209.ext.ti.com (8.15.1/8.15.1) with ESMTP id w08NXvBG023918
	for <meta-arago@arago-project.org>; Mon, 8 Jan 2018 17:33:57 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ti.com;
	s=ti-com-17Q1; t=1515454437;
	bh=datFGtEyPkTeNQOsSqEeUhkxX4hX5xqKFZWgVN9kO+E=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=RF7EXMrRYaQj0cOQBc7Xi1BYZ2a68/GhxjTci6sj0w/BqtckaXT6KTf9j6k4W7vAp
	FegSL5ujrW8ilUlAQ4RD4Z+uwwjTLJHKFTgPBEA60tkjBVd7sPo6VKLoBAJha3h5L/
	afPnAp79TfJCPJD//PC+bmFsAgv2SEtHGH980GeQ=
Received: from DFLE114.ent.ti.com (dfle114.ent.ti.com [10.64.6.35])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id w08NXvWB025912
	for <meta-arago@arago-project.org>; Mon, 8 Jan 2018 17:33:57 -0600
Received: from DFLE103.ent.ti.com (10.64.6.24) by DFLE114.ent.ti.com
	(10.64.6.35) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1261.35;
	Mon, 8 Jan 2018 17:33:57 -0600
Received: from dflp33.itg.ti.com (10.64.6.16) by DFLE103.ent.ti.com
	(10.64.6.24) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.1261.35 via Frontend
	Transport; Mon, 8 Jan 2018 17:33:57 -0600
Received: from uda0271529.am.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])
	by dflp33.itg.ti.com (8.14.3/8.13.8) with ESMTP id w08NXrhG019194;
	Mon, 8 Jan 2018 17:33:57 -0600
From: Hongmei Gou <a0271529@ti.com>
To: <meta-arago@arago-project.org>
Date: Mon, 8 Jan 2018 18:33:39 -0500
Message-ID: <1515454420-19972-12-git-send-email-a0271529@ti.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1515454420-19972-1-git-send-email-a0271529@ti.com>
References: <1515454420-19972-1-git-send-email-a0271529@ti.com>
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Cc: Hongmei Gou <a0271529@ti.com>
Subject: [meta-processor-sdk 11/12] starterware: upstreamed to meta-ti
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
X-List-Received-Date: Mon, 08 Jan 2018 23:34:06 -0000
Content-Type: text/plain

Signed-off-by: Hongmei Gou <a0271529@ti.com>
---
 recipes-bsp/starterware/starterware-2.1.1.5.inc       | 5 -----
 recipes-bsp/starterware/starterware-rtos_git.bbappend | 1 -
 recipes-bsp/starterware/starterware_git.bbappend      | 1 -
 3 files changed, 7 deletions(-)
 delete mode 100644 recipes-bsp/starterware/starterware-2.1.1.5.inc
 delete mode 100644 recipes-bsp/starterware/starterware-rtos_git.bbappend
 delete mode 100644 recipes-bsp/starterware/starterware_git.bbappend

diff --git a/recipes-bsp/starterware/starterware-2.1.1.5.inc b/recipes-bsp/starterware/starterware-2.1.1.5.inc
deleted file mode 100644
index 7d21e52..0000000
--- a/recipes-bsp/starterware/starterware-2.1.1.5.inc
+++ /dev/null
@@ -1,5 +0,0 @@
-# Below commit ID corresponds to "DEV.STARTERWARE.PROCSDK.02.01.01.05"
-STARTERWARE_SRCREV = "58526af258ef9a10a9eec32d2a6e3a1c9e6f9e88"
-
-PV = "02.01.01.05"
-INC_PR = "r0"
diff --git a/recipes-bsp/starterware/starterware-rtos_git.bbappend b/recipes-bsp/starterware/starterware-rtos_git.bbappend
deleted file mode 100644
index 602c905..0000000
--- a/recipes-bsp/starterware/starterware-rtos_git.bbappend
+++ /dev/null
@@ -1 +0,0 @@
-require recipes-bsp/starterware/starterware-2.1.1.5.inc
diff --git a/recipes-bsp/starterware/starterware_git.bbappend b/recipes-bsp/starterware/starterware_git.bbappend
deleted file mode 100644
index 602c905..0000000
--- a/recipes-bsp/starterware/starterware_git.bbappend
+++ /dev/null
@@ -1 +0,0 @@
-require recipes-bsp/starterware/starterware-2.1.1.5.inc
-- 
1.9.1


