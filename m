Return-Path: <g-tammana@ti.com>
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
	by arago-project.org (Postfix) with ESMTPS id 90EFC52970
	for <meta-arago@arago-project.org>;
	Thu, 17 Sep 2020 18:49:47 +0000 (UTC)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 08HIkpX3084873
	for <meta-arago@arago-project.org>; Thu, 17 Sep 2020 13:46:51 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1600368411;
	bh=mGE5EATOd5qYY4nfl9upTTYPyBlhSQAuOrFT+P8ZrZ4=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=mXDoY3hfOZJXJc5XxS6LP9ZZiY1nDMl3FlaJJvoxV04ImoutyPJzxVXb/ZYjwDVlC
	SKVpzKKcRgjOq1sp/q3PWZLVRXQO+BoogVG5m/T58pIMOMnJqJt2AR8Fy1N3UjI0id
	izcannsuRzUX53eTkS4kf+kGdyFZj1IoUNTACqz8=
Received: from DFLE112.ent.ti.com (dfle112.ent.ti.com [10.64.6.33])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTP id 08HIkplK062158
	for <meta-arago@arago-project.org>; Thu, 17 Sep 2020 13:46:51 -0500
Received: from DFLE105.ent.ti.com (10.64.6.26) by DFLE112.ent.ti.com
	(10.64.6.33) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3;
	Thu, 17 Sep 2020 13:46:51 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DFLE105.ent.ti.com
	(10.64.6.26) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
	Frontend Transport; Thu, 17 Sep 2020 13:46:51 -0500
Received: from lelv0597.itg.ti.com (lelv0597.itg.ti.com [10.181.64.32])
	by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 08HIkpnE008903;
	Thu, 17 Sep 2020 13:46:51 -0500
Received: from uda0271916b.dhcp.ti.com (uda0271916b.dhcp.ti.com
	[128.247.77.45])
	by lelv0597.itg.ti.com (8.14.7/8.14.7) with ESMTP id 08HIko4n016836;
	Thu, 17 Sep 2020 13:46:51 -0500
From: Gowtham Tammana <g-tammana@ti.com>
To: <meta-arago@arago-project.org>, Denys Dmytriyenko <denys@ti.com>
Date: Thu, 17 Sep 2020 13:46:47 -0500
Message-ID: <20200917184647.3292-2-g-tammana@ti.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20200917184647.3292-1-g-tammana@ti.com>
References: <20200917184647.3292-1-g-tammana@ti.com>
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Cc: k-bhargav@ti.com
Subject: [dunfell][PATCH 2/2] qtwebengine: disable failing "set default logging level back" patch
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
X-List-Received-Date: Thu, 17 Sep 2020 18:49:47 -0000
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

Signed-off-by: Gowtham Tammana <g-tammana@ti.com>
---
 meta-arago-distro/recipes-qt/qt5/qtwebengine_git.bbappend | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/meta-arago-distro/recipes-qt/qt5/qtwebengine_git.bbappend b/meta-arago-distro/recipes-qt/qt5/qtwebengine_git.bbappend
index 28ff601a..3d1864bd 100644
--- a/meta-arago-distro/recipes-qt/qt5/qtwebengine_git.bbappend
+++ b/meta-arago-distro/recipes-qt/qt5/qtwebengine_git.bbappend
@@ -1,8 +1,7 @@
 FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"
-PR_append = ".arago1"
+PR_append = ".arago2"
 
 SRC_URI += " \
-    file://0002-qtwebengine-set-default-logging-level-back-to-LOG_FA.patch \
     file://0003-qtwebengine-HACK-disable-SECCOMP-BPF-Sandbox-at-star.patch \
 "
 
-- 
2.28.0


