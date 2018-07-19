Return-Path: <m-radhakrishnan2@ti.com>
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
	by arago-project.org (Postfix) with ESMTPS id 6E797529F1
	for <meta-arago@arago-project.org>;
	Thu, 19 Jul 2018 17:28:59 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id w6JHSqsn122192
	for <meta-arago@arago-project.org>; Thu, 19 Jul 2018 12:28:52 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1532021332;
	bh=bgFnjm2dW0ODAgV6I/rZ0obYVlqoQUyvj8ZU10bwCJA=;
	h=From:To:Subject:Date:In-Reply-To:References;
	b=kkNyYdWCuEjqiD0TNtEH+K1yS31dmqyCmIo/mXpSvP0/h7kg3Xnmkfrh7dexA4ZCS
	WQn+IZ6qw79ZrJxUIuePmgwUr8tc1rZfoKSBtyGcsNR2iBG0sumi8txFEQTTTOTJqH
	8noAoEeywk4FvTIo9+z4WrIuZEWaLEBSbiS95JCM=
Received: from DFLE115.ent.ti.com (dfle115.ent.ti.com [10.64.6.36])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id w6JHSqEF021841
	for <meta-arago@arago-project.org>; Thu, 19 Jul 2018 12:28:52 -0500
Received: from DFLE100.ent.ti.com (10.64.6.21) by DFLE115.ent.ti.com
	(10.64.6.36) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1466.3;
	Thu, 19 Jul 2018 12:28:52 -0500
Received: from dlep33.itg.ti.com (157.170.170.75) by DFLE100.ent.ti.com
	(10.64.6.21) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.1466.3 via Frontend
	Transport; Thu, 19 Jul 2018 12:28:52 -0500
Received: from uda0875154a.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])
	by dlep33.itg.ti.com (8.14.3/8.13.8) with ESMTP id w6JHSpg6028108
	for <meta-arago@arago-project.org>; Thu, 19 Jul 2018 12:28:52 -0500
From: Mahesh Radhakrishnan <m-radhakrishnan2@ti.com>
To: <meta-arago@arago-project.org>
Date: Thu, 19 Jul 2018 13:28:46 -0400
Message-ID: <1532021329-48972-2-git-send-email-m-radhakrishnan2@ti.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1532021329-48972-1-git-send-email-m-radhakrishnan2@ti.com>
References: <1532021329-48972-1-git-send-email-m-radhakrishnan2@ti.com>
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: [master][meta-processor-sdk][PATCH 1/4] common-csl-ip: Removing redundant recipes after upstreaming them to meta-ti
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
X-List-Received-Date: Thu, 19 Jul 2018 17:29:00 -0000
Content-Type: text/plain

Signed-off-by: Mahesh Radhakrishnan <m-radhakrishnan2@ti.com>
---
 recipes-bsp/common-csl-ip/common-csl-ip-03.03.00.11.inc   | 5 -----
 recipes-bsp/common-csl-ip/common-csl-ip-rtos_git.bbappend | 1 -
 recipes-bsp/common-csl-ip/common-csl-ip_git.bbappend      | 1 -
 3 files changed, 7 deletions(-)
 delete mode 100644 recipes-bsp/common-csl-ip/common-csl-ip-03.03.00.11.inc
 delete mode 100644 recipes-bsp/common-csl-ip/common-csl-ip-rtos_git.bbappend
 delete mode 100644 recipes-bsp/common-csl-ip/common-csl-ip_git.bbappend

diff --git a/recipes-bsp/common-csl-ip/common-csl-ip-03.03.00.11.inc b/recipes-bsp/common-csl-ip/common-csl-ip-03.03.00.11.inc
deleted file mode 100644
index dca0a73..0000000
--- a/recipes-bsp/common-csl-ip/common-csl-ip-03.03.00.11.inc
+++ /dev/null
@@ -1,5 +0,0 @@
-# Below commit ID corresponding to "DEV.CSL_PROCESSOR-SDK.03.03.00.11"
-CSL_SRCREV = "b18c65acf85f9d94226cc573a99ba94bfe822b88"
-
-PV = "03.03.00.11"
-INC_PR = "r0"
diff --git a/recipes-bsp/common-csl-ip/common-csl-ip-rtos_git.bbappend b/recipes-bsp/common-csl-ip/common-csl-ip-rtos_git.bbappend
deleted file mode 100644
index dbf994a..0000000
--- a/recipes-bsp/common-csl-ip/common-csl-ip-rtos_git.bbappend
+++ /dev/null
@@ -1 +0,0 @@
-require recipes-bsp/common-csl-ip/common-csl-ip-03.03.00.11.inc
diff --git a/recipes-bsp/common-csl-ip/common-csl-ip_git.bbappend b/recipes-bsp/common-csl-ip/common-csl-ip_git.bbappend
deleted file mode 100644
index dbf994a..0000000
--- a/recipes-bsp/common-csl-ip/common-csl-ip_git.bbappend
+++ /dev/null
@@ -1 +0,0 @@
-require recipes-bsp/common-csl-ip/common-csl-ip-03.03.00.11.inc
-- 
1.9.1


