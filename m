Return-Path: <e-ruei1@ti.com>
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
	by arago-project.org (Postfix) with ESMTPS id 91F2D52B00
	for <meta-arago@arago-project.org>;
	Tue, 21 Aug 2018 19:29:40 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id w7LJTXQK055203
	for <meta-arago@arago-project.org>; Tue, 21 Aug 2018 14:29:33 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1534879773;
	bh=OYN6rixBa6wbnAHKfaYGETXp+Zav0ilsDt7ZOSAsxpo=;
	h=From:To:Subject:Date:In-Reply-To:References;
	b=k6PzLunfEOOK8kmR+1GREhm2hEXCH7qeIBGdgb3W1QB/XJCY58PL7XGhgf8DwOuBi
	dsIxWFlb6vVZos4JFZSJqYytEqrrLrKvXpCuns0oAQpjd0sB/Tcjok8tshomQW9xnx
	w6jarHkJXU48LTAc6U3qim+6xcAisYGKBWNBMoUA=
Received: from DFLE102.ent.ti.com (dfle102.ent.ti.com [10.64.6.23])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id w7LJTWWJ023903
	for <meta-arago@arago-project.org>; Tue, 21 Aug 2018 14:29:32 -0500
Received: from DFLE115.ent.ti.com (10.64.6.36) by DFLE102.ent.ti.com
	(10.64.6.23) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1466.3;
	Tue, 21 Aug 2018 14:29:32 -0500
Received: from dlep33.itg.ti.com (157.170.170.75) by DFLE115.ent.ti.com
	(10.64.6.36) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.1466.3 via Frontend
	Transport; Tue, 21 Aug 2018 14:29:32 -0500
Received: from uda0850410.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])
	by dlep33.itg.ti.com (8.14.3/8.13.8) with ESMTP id w7LJTV8R012810
	for <meta-arago@arago-project.org>; Tue, 21 Aug 2018 14:29:32 -0500
From: Eric Ruei <e-ruei1@ti.com>
To: <meta-arago@arago-project.org>
Date: Tue, 21 Aug 2018 15:29:26 -0400
Message-ID: <1534879768-59124-3-git-send-email-e-ruei1@ti.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1534879768-59124-1-git-send-email-e-ruei1@ti.com>
References: <1534879768-59124-1-git-send-email-e-ruei1@ti.com>
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: [PATCH 2/4] packagegroup-arago-gtk: add package group files for GTK
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
X-List-Received-Date: Tue, 21 Aug 2018 19:29:41 -0000
Content-Type: text/plain

Signed-off-by: Eric Ruei <e-ruei1@ti.com>
---
 .../packagegroup-arago-gtk-sdk-target.bb             | 11 +++++++++++
 .../packagegroups/packagegroup-arago-tisdk-gtk.bb    | 20 ++++++++++++++++++++
 2 files changed, 31 insertions(+)
 create mode 100644 meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-gtk-sdk-target.bb
 create mode 100644 meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-gtk.bb

diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-gtk-sdk-target.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-gtk-sdk-target.bb
new file mode 100644
index 0000000..a72e425
--- /dev/null
+++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-gtk-sdk-target.bb
@@ -0,0 +1,11 @@
+DESCRIPTION = "Task to install Gtk dev packages in SDK"
+LICENSE = "MIT"
+PR = "r0"
+
+PACKAGE_ARCH = "${MACHINE_ARCH}"
+
+inherit packagegroup
+
+RDEPENDS_${PN} = "\
+    gtk+3-dev \
+"
diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-gtk.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-gtk.bb
new file mode 100644
index 0000000..f2f76bf
--- /dev/null
+++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-gtk.bb
@@ -0,0 +1,20 @@
+DESCRIPTION = "Task to add Gtk embedded related packages"
+LICENSE = "MIT"
+PR = "r0"
+
+PACKAGE_ARCH = "${MACHINE_ARCH}"
+
+inherit packagegroup
+
+GTK = "\
+    gtk+3 \
+"
+
+GTK_DEMOS = "\
+    gtk+3-demo \
+"
+
+RDEPENDS_${PN} = "\
+    ${GTK} \
+    ${GTK_DEMOS} \
+"
-- 
1.9.1


