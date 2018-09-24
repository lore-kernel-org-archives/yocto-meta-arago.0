Return-Path: <d-senicic1@ti.com>
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
	by arago-project.org (Postfix) with ESMTPS id DD41E529AF
	for <meta-arago@arago-project.org>;
	Mon, 24 Sep 2018 16:06:05 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id w8OG5vSS051031
	for <meta-arago@arago-project.org>; Mon, 24 Sep 2018 11:05:57 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1537805157;
	bh=qv9ypi5gXjjOsY4n+YFu+YSox+Eny9MZZYkIF1hG4gA=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=K8fJDKPrqAITXMQkT7IdmMZUK6OrwJdSY1BAUALswq64T4hspElpn5w7VhYwYBvSz
	VbGvi0+aeoPVq4bTdIRNrh2VjBGlqybI/WEsyYpC09peZDdG5wx+CmZq8OeFQIwaCd
	J8HbaS/ibXnAje1Mv9a/K1qORfJW8HBnVaIAChTI=
Received: from DFLE105.ent.ti.com (dfle105.ent.ti.com [10.64.6.26])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id w8OG5vYm018356
	for <meta-arago@arago-project.org>; Mon, 24 Sep 2018 11:05:57 -0500
Received: from DFLE108.ent.ti.com (10.64.6.29) by DFLE105.ent.ti.com
	(10.64.6.26) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1466.3;
	Mon, 24 Sep 2018 11:05:56 -0500
Received: from dflp32.itg.ti.com (10.64.6.15) by DFLE108.ent.ti.com
	(10.64.6.29) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.1466.3 via Frontend
	Transport; Mon, 24 Sep 2018 11:05:56 -0500
Received: from UDA0271529.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])
	by dflp32.itg.ti.com (8.14.3/8.13.8) with ESMTP id w8OG5sNZ011650;
	Mon, 24 Sep 2018 11:05:56 -0500
From: Djordje Senicic <x0157990@ti.com>
To: <meta-arago@arago-project.org>
Date: Mon, 24 Sep 2018 12:05:52 -0400
Message-ID: <1537805152-4059-3-git-send-email-x0157990@ti.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1537805152-4059-1-git-send-email-x0157990@ti.com>
References: <1537805152-4059-1-git-send-email-x0157990@ti.com>
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Cc: d-senicic1@ti.com, Djordje Senicic <x0157990@ti.com>
Subject: [rocko][PATCH 3/3] packagegroups-arago-tisdk-addons: Add armnn and arm-compute-library packages to target filesystem and dev package
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
X-List-Received-Date: Mon, 24 Sep 2018 16:06:07 -0000
Content-Type: text/plain

Signed-off-by: Djordje Senicic <x0157990@ti.com>
---
 .../packagegroup-arago-tisdk-addons-sdk-target.bb         | 15 ++++++++++++---
 .../packagegroups/packagegroup-arago-tisdk-addons.bb      | 14 ++++++++++++--
 2 files changed, 24 insertions(+), 5 deletions(-)

diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons-sdk-target.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons-sdk-target.bb
index dc33381..4ff30cd 100644
--- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons-sdk-target.bb
+++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons-sdk-target.bb
@@ -150,9 +150,18 @@ EXTRA_LIBS_append_k2e = " libulm-staticdev \
 "
 
 EXTRA_PACKAGES = ""
-EXTRA_PACKAGES_append_ti33x = " voxelsdk-dev"
-EXTRA_PACKAGES_append_ti43x = " voxelsdk-dev"
-EXTRA_PACKAGES_append_omap-a15 = " voxelsdk-dev"
+EXTRA_PACKAGES_append_ti33x = " voxelsdk-dev \
+                                arm-compute-library-dev \
+                                armnn-dev \
+"
+EXTRA_PACKAGES_append_ti43x = " voxelsdk-dev \
+                                arm-compute-library-dev \
+                                armnn-dev \
+"
+EXTRA_PACKAGES_append_omap-a15 = " voxelsdk-dev \
+                                arm-compute-library-dev \
+                                armnn-dev \
+"
 
 IPCDEV = " \
 	ti-ipc-dev \
diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons.bb
index b0a9a50..5c77d8b 100644
--- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons.bb
+++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons.bb
@@ -142,11 +142,21 @@ EXTRA_PACKAGES_omapl138 = " \
     protobuf \
 "
 
-EXTRA_PACKAGES_append_ti33x = " voxelsdk"
-EXTRA_PACKAGES_append_ti43x = " voxelsdk"
+EXTRA_PACKAGES_append_ti33x = " voxelsdk \
+                                arm-compute-library \
+                                armnn \
+"
+
+EXTRA_PACKAGES_append_ti43x = " voxelsdk \
+                                arm-compute-library \
+                                armnn \
+"
+
 EXTRA_PACKAGES_append_omap-a15 = " voxelsdk \
                                    big-data-ipc-demo-linux \
                                    big-data-ipc-demo-linux-firmware \
+                                   arm-compute-library \
+                                   armnn \
 "
 
 EXTRA_PACKAGES_append_omap-a15 = " ti-ipc-examples-linux"
-- 
1.9.1


