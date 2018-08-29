Return-Path: <e-ruei1@ti.com>
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
	by arago-project.org (Postfix) with ESMTPS id D9C4D52A86
	for <meta-arago@arago-project.org>;
	Wed, 29 Aug 2018 15:03:33 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id w7TF3Phj052875
	for <meta-arago@arago-project.org>; Wed, 29 Aug 2018 10:03:25 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1535555005;
	bh=Pj/u13ZUlsCLq8EhPBROVcn8KWpj+WisjArMreh2KG8=;
	h=From:To:Subject:Date:In-Reply-To:References;
	b=HkKAF9t4YUs6MSb5E4MVFFFOKES1k5bwxS3lFZMUU7+2QOLhRztLYk4fL72J1qWdd
	L17jKR8udyTEieLq+rNnaFpQX9CL2Tybefxb22wUwMr1wS25SNs0HbpCOavXlZE2hs
	obTyxn6ona46BFGM3xIuHZ6wxrh58tNBQe9o5lMk=
Received: from DLEE115.ent.ti.com (dlee115.ent.ti.com [157.170.170.26])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id w7TF3PAR024370
	for <meta-arago@arago-project.org>; Wed, 29 Aug 2018 10:03:25 -0500
Received: from DLEE115.ent.ti.com (157.170.170.26) by DLEE115.ent.ti.com
	(157.170.170.26) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1466.3;
	Wed, 29 Aug 2018 10:03:25 -0500
Received: from dlep33.itg.ti.com (157.170.170.75) by DLEE115.ent.ti.com
	(157.170.170.26) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.1466.3 via Frontend
	Transport; Wed, 29 Aug 2018 10:03:25 -0500
Received: from uda0850410.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])
	by dlep33.itg.ti.com (8.14.3/8.13.8) with ESMTP id w7TF3OiX028516
	for <meta-arago@arago-project.org>; Wed, 29 Aug 2018 10:03:25 -0500
From: Eric Ruei <e-ruei1@ti.com>
To: <meta-arago@arago-project.org>
Date: Wed, 29 Aug 2018 11:03:18 -0400
Message-ID: <1535555000-25564-6-git-send-email-e-ruei1@ti.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1535555000-25564-1-git-send-email-e-ruei1@ti.com>
References: <1535555000-25564-1-git-send-email-e-ruei1@ti.com>
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: [PATCH 5/7] matrix-gui-browser: use QWebView instead of QWebEgineView for k3 devices
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
X-List-Received-Date: Wed, 29 Aug 2018 15:03:35 -0000
Content-Type: text/plain

Note: qwebengine-based browser does not work on k3 devices

Signed-off-by: Eric Ruei <e-ruei1@ti.com>
---
 meta-arago-extras/recipes-core/matrix/matrix-gui-browser_2.0.bb | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/meta-arago-extras/recipes-core/matrix/matrix-gui-browser_2.0.bb b/meta-arago-extras/recipes-core/matrix/matrix-gui-browser_2.0.bb
index 0455962..8845325 100644
--- a/meta-arago-extras/recipes-core/matrix/matrix-gui-browser_2.0.bb
+++ b/meta-arago-extras/recipes-core/matrix/matrix-gui-browser_2.0.bb
@@ -10,11 +10,15 @@ inherit qt-provider
 RDEPENDS_${PN} += "${QT_RDEPENDS_FONTS}"
 
 DEPENDS += "${QT_DEPENDS_WEBENGINE}"
+DEPENDS_k3 += "${QT_DEPENDS_WEBKIT}"
+DEPENDS_remove_k3 = "${QT_DEPENDS_WEBENGINE}"
 
-PR = "r15"
+PR = "r16"
 
 QT4_SRCREV = "83019b46fb3dec1a12667d251d35ba8682953a79"
 QT5_SRCREV = "d3ecf8d0dff3e4f901d588ea0dfe485733dfc9dc"
+QT5_SRCREV_k3 = "78ad5db716d1abc4c05abfe435f066b6b88454d5"
+
 
 SRCREV = "${@base_conditional('QT_PROVIDER', 'qt5', "${QT5_SRCREV}", "${QT4_SRCREV}", d)}"
 BRANCH ?= "master"
-- 
1.9.1


