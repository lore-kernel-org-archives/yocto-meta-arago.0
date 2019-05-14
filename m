Return-Path: <e-ruei1@ti.com>
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
	by arago-project.org (Postfix) with ESMTPS id 4E143529EB
	for <meta-arago@arago-project.org>;
	Tue, 14 May 2019 01:45:00 +0000 (UTC)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id x4E1iUnG040532
	for <meta-arago@arago-project.org>; Mon, 13 May 2019 20:44:30 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1557798270;
	bh=KvZG82LtkT69Xfnb78XUwF+HgpLlFG6JEDtAqOuR1vM=;
	h=From:To:Subject:Date:In-Reply-To:References;
	b=uD9PY5YbErpcPtDjrqI+0IBaknikihEAbqYWimR1TrLf3+kOOZKz4v11POVR1MnUt
	WUgPRkf4viK9DB6tKsILutk2qMw6Sgo/fF5yg7WLc072tkMZbeSaBY2wXh70Ytw7cM
	oAatBxJS1/FqUAoqmomA2WyeUkTCk0ESl/VdCCJM=
Received: from DLEE109.ent.ti.com (dlee109.ent.ti.com [157.170.170.41])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x4E1iTBK124485
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-arago@arago-project.org>; Mon, 13 May 2019 20:44:30 -0500
Received: from DLEE107.ent.ti.com (157.170.170.37) by DLEE109.ent.ti.com
	(157.170.170.41) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5;
	Mon, 13 May 2019 20:44:29 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DLEE107.ent.ti.com
	(157.170.170.37) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
	Frontend Transport; Mon, 13 May 2019 20:44:29 -0500
Received: from UDA0850410.gt.design.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])
	by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id x4E1iSuJ064750
	for <meta-arago@arago-project.org>; Mon, 13 May 2019 20:44:29 -0500
From: Eric Ruei <e-ruei1@ti.com>
To: <meta-arago@arago-project.org>
Date: Mon, 13 May 2019 21:44:18 -0400
Message-ID: <20190514014418.20156-6-e-ruei1@ti.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190514014418.20156-1-e-ruei1@ti.com>
References: <20190514014418.20156-1-e-ruei1@ti.com>
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: [PATCH 5/5] matrix-gui-browser: pick up the matrix-gui-browser built on top of qtwebkit
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
X-List-Received-Date: Tue, 14 May 2019 01:45:03 -0000
Content-Type: text/plain

- qtwebengine 5.11.3 does not work, replace it with qtwebkit until the
  fix is available

Signed-off-by: Eric Ruei <e-ruei1@ti.com>
---
 .../recipes-core/matrix/matrix-gui-browser_2.0.bb   | 13 +++++++------
 1 file changed, 7 insertions(+), 6 deletions(-)

diff --git a/meta-arago-extras/recipes-core/matrix/matrix-gui-browser_2.0.bb b/meta-arago-extras/recipes-core/matrix/matrix-gui-browser_2.0.bb
index 9ceaa560..9c99b469 100644
--- a/meta-arago-extras/recipes-core/matrix/matrix-gui-browser_2.0.bb
+++ b/meta-arago-extras/recipes-core/matrix/matrix-gui-browser_2.0.bb
@@ -9,15 +9,16 @@ inherit qt-provider
 # Make sure that QT font libraries have been installed
 RDEPENDS_${PN} += "${QT_RDEPENDS_FONTS}"
 
-DEPENDS += "${QT_DEPENDS_WEBENGINE}"
-DEPENDS_k3 += "${QT_DEPENDS_WEBKIT}"
-DEPENDS_remove_k3 = "${QT_DEPENDS_WEBENGINE}"
+DEPENDS += "${QT_DEPENDS_WEBKIT}"
+#DEPENDS_k3 += "${QT_DEPENDS_WEBKIT}"
+#DEPENDS_remove_k3 = "${QT_DEPENDS_WEBENGINE}"
 
-PR = "r16"
+PR = "r17"
 
 QT4_SRCREV = "83019b46fb3dec1a12667d251d35ba8682953a79"
-QT5_SRCREV = "d3ecf8d0dff3e4f901d588ea0dfe485733dfc9dc"
-QT5_SRCREV_k3 = "78ad5db716d1abc4c05abfe435f066b6b88454d5"
+QT5_SRCREV = "78ad5db716d1abc4c05abfe435f066b6b88454d5"
+#QT5_SRCREV = "d3ecf8d0dff3e4f901d588ea0dfe485733dfc9dc"
+#QT5_SRCREV_k3 = "78ad5db716d1abc4c05abfe435f066b6b88454d5"
 
 
 SRCREV = "${@oe.utils.conditional('QT_PROVIDER', 'qt5', "${QT5_SRCREV}", "${QT4_SRCREV}", d)}"
-- 
2.17.1


