Return-Path: <e-ruei1@ti.com>
Received: from fllnx209.ext.ti.com (fllnx209.ext.ti.com [198.47.19.16])
	by arago-project.org (Postfix) with ESMTPS id 07BBD52970
	for <meta-arago@arago-project.org>;
	Tue, 27 Mar 2018 17:58:28 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by fllnx209.ext.ti.com (8.15.1/8.15.1) with ESMTP id w2RHwRBF004503
	for <meta-arago@arago-project.org>; Tue, 27 Mar 2018 12:58:27 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ti.com;
	s=ti-com-17Q1; t=1522173507;
	bh=1B6aSvi0jDyjs0kTPGGGH4rKN9U2bzrY/w4C3arxP/c=;
	h=From:To:Subject:Date;
	b=wguqaBwbQ1ejnXSWFIGdis/ZleIlXGoeG+HkODPX8aOK3AKXGjzFdLBTloV94qe9u
	wR0OzXNqBmKbJZU1SoZ+GYpZrRExwops0fXdnn6PYp1iFhtiOpd5gnhCH+cwZBmtAb
	n40IYlu1FILeeMLykFDZKodjJGEFWCnaQVKTPmic=
Received: from DFLE108.ent.ti.com (dfle108.ent.ti.com [10.64.6.29])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id w2RHwRbw010235
	for <meta-arago@arago-project.org>; Tue, 27 Mar 2018 12:58:27 -0500
Received: from DFLE105.ent.ti.com (10.64.6.26) by DFLE108.ent.ti.com
	(10.64.6.29) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1261.35;
	Tue, 27 Mar 2018 12:58:27 -0500
Received: from dlep32.itg.ti.com (157.170.170.100) by DFLE105.ent.ti.com
	(10.64.6.26) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.1261.35 via Frontend
	Transport; Tue, 27 Mar 2018 12:58:27 -0500
Received: from uda0850410.am.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])
	by dlep32.itg.ti.com (8.14.3/8.13.8) with ESMTP id w2RHwQ8n025607
	for <meta-arago@arago-project.org>; Tue, 27 Mar 2018 12:58:27 -0500
From: Eric Ruei <e-ruei1@ti.com>
To: <meta-arago@arago-project.org>
Date: Tue, 27 Mar 2018 13:58:22 -0400
Message-ID: <1522173502-8477-1-git-send-email-e-ruei1@ti.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: [morty/rocko/master][PATCH] qtdeclarative: add required compiler switch for a vertex shader for AM5
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
X-List-Received-Date: Tue, 27 Mar 2018 17:58:30 -0000
Content-Type: text/plain

This patch fixes some QML_based application crashes due to
compiling failure of a Vertex sharder.

Signed-off-by: Eric Ruei <e-ruei1@ti.com>
---
 meta-arago-distro/recipes-qt/qt5/qtdeclarative_git.bbappend | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/meta-arago-distro/recipes-qt/qt5/qtdeclarative_git.bbappend b/meta-arago-distro/recipes-qt/qt5/qtdeclarative_git.bbappend
index cc0f9d6..e1408c7 100644
--- a/meta-arago-distro/recipes-qt/qt5/qtdeclarative_git.bbappend
+++ b/meta-arago-distro/recipes-qt/qt5/qtdeclarative_git.bbappend
@@ -1,5 +1,8 @@
 FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"
-PR_append = ".tisdk0"
+PR_append = ".tisdk1"
+
+CXXFLAGS_append_omap-a15 = " -DQ_OS_BLACKBERRY"
+
 
 SRC_URI += " \
     file://0001-touchinteraction.qml-Add-exit-button.patch \
-- 
1.9.1


