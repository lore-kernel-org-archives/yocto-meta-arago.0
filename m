Return-Path: <qsu@ti.com>
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
	by arago-project.org (Postfix) with ESMTPS id F21B35298D
	for <meta-arago@arago-project.org>;
	Tue,  4 Dec 2018 21:47:51 +0000 (UTC)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id wB4Llese090082
	for <meta-arago@arago-project.org>; Tue, 4 Dec 2018 15:47:40 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1543960060;
	bh=7FtbCAZ4NUWr0H2Kjpe8gIic+T7wkTOBnZ8UI8EVO/0=;
	h=From:To:Subject:Date;
	b=XShtFDIJ71k4B9gXWAeP7nJMbM11Y9he0OroKeD2CA9LLnbiCrUw5bgZV0HSXwZOc
	LXRy1TqwxvDKrY89cSQ/R8RhpgyuxjXvXbMqn0ZYfAQ9t0Q0b0Yc7FO7clcWXCmFEz
	JiVMORn9k8WBAq58bXlu1knlDB29KcP6yxnBwkmc=
Received: from DFLE109.ent.ti.com (dfle109.ent.ti.com [10.64.6.30])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id wB4LleSW060573
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-arago@arago-project.org>; Tue, 4 Dec 2018 15:47:40 -0600
Received: from DFLE112.ent.ti.com (10.64.6.33) by DFLE109.ent.ti.com
	(10.64.6.30) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1591.10;
	Tue, 4 Dec 2018 15:47:40 -0600
Received: from dlep32.itg.ti.com (157.170.170.100) by DFLE112.ent.ti.com
	(10.64.6.33) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.1591.10 via Frontend
	Transport; Tue, 4 Dec 2018 15:47:40 -0600
Received: from UDA0216595.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])
	by dlep32.itg.ti.com (8.14.3/8.13.8) with ESMTP id wB4LleJa012243
	for <meta-arago@arago-project.org>; Tue, 4 Dec 2018 15:47:40 -0600
From: Qin Su <qsu@ti.com>
To: <meta-arago@arago-project.org>
Date: Tue, 4 Dec 2018 16:47:37 -0500
Message-ID: <1543960057-15578-1-git-send-email-qsu@ti.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: [PATCH] packagegroups-arago-tisdk-addons: Add armnn and arm-compute-library support on k3 to target filesystem and dev package.
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
X-List-Received-Date: Tue, 04 Dec 2018 21:47:52 -0000
Content-Type: text/plain

Signed-off-by: Qin Su <qsu@ti.com>
---
 .../packagegroups/packagegroup-arago-tisdk-addons-sdk-target.bb       | 3 +++
 .../recipes-core/packagegroups/packagegroup-arago-tisdk-addons.bb     | 4 ++++
 2 files changed, 7 insertions(+)

diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons-sdk-target.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons-sdk-target.bb
index 4ff30cd..ef2bb1c 100644
--- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons-sdk-target.bb
+++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons-sdk-target.bb
@@ -162,6 +162,9 @@ EXTRA_PACKAGES_append_omap-a15 = " voxelsdk-dev \
                                 arm-compute-library-dev \
                                 armnn-dev \
 "
+EXTRA_PACKAGES_append_k3 = " arm-compute-library-dev \
+                             armnn-dev \
+"
 
 IPCDEV = " \
 	ti-ipc-dev \
diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons.bb
index f2ef679..dfb7e35 100644
--- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons.bb
+++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons.bb
@@ -158,6 +158,10 @@ EXTRA_PACKAGES_append_omap-a15 = " voxelsdk \
                                    armnn \
 "
 
+EXTRA_PACKAGES_append_k3 = " arm-compute-library \
+                             armnn \
+"
+
 EXTRA_PACKAGES_append_omap-a15 = " ti-ipc-examples-linux"
 EXTRA_PACKAGES_append_keystone = " ti-ipc-examples-linux"
 EXTRA_PACKAGES_append_omapl138 = " ti-ipc-examples-linux"
-- 
1.9.1


