Return-Path: <e-ruei1@ti.com>
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
	by arago-project.org (Postfix) with ESMTPS id BD5A3529F4
	for <meta-arago@arago-project.org>;
	Mon, 16 Sep 2019 16:05:03 +0000 (UTC)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id x8GG3ukj119526
	for <meta-arago@arago-project.org>; Mon, 16 Sep 2019 11:03:56 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1568649836;
	bh=aDBlwigNEWMVv/YnkxjktqOih4aQchm/x7w9+lR3DDw=;
	h=From:To:Subject:Date;
	b=zD45b44pPZeWynzy4mHwbW/wh5dbba76Y/NMU4WMv7KIKQGPf2/zulsWzxhMRSrFY
	9xF9SA/CGx85GMFLVIU4VcwAbgeJeiWZx2PlRz9NfTh58OzhZGmFk88GraX8Nb/3rR
	txEFF4DjRt73M8ZU7x0h0FRveLzknrFoBt5heGzc=
Received: from DFLE101.ent.ti.com (dfle101.ent.ti.com [10.64.6.22])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x8GG3t2q128205
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-arago@arago-project.org>; Mon, 16 Sep 2019 11:03:55 -0500
Received: from DFLE102.ent.ti.com (10.64.6.23) by DFLE101.ent.ti.com
	(10.64.6.22) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5;
	Mon, 16 Sep 2019 11:03:55 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DFLE102.ent.ti.com
	(10.64.6.23) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
	Frontend Transport; Mon, 16 Sep 2019 11:03:55 -0500
Received: from UDA0850410.gt.design.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])
	by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id x8GG3qXN097786
	for <meta-arago@arago-project.org>; Mon, 16 Sep 2019 11:03:54 -0500
From: Eric Ruei <e-ruei1@ti.com>
To: <meta-arago@arago-project.org>
Date: Mon, 16 Sep 2019 12:01:49 -0400
Message-ID: <20190916160149.12588-1-e-ruei1@ti.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: [PATCH] webkit: make Release build
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
X-List-Received-Date: Mon, 16 Sep 2019 16:05:04 -0000
Content-Type: text/plain

Note: The debug build causes some unnecessary crashes. Change to
Release build per advice from QT engineer.

Signed-off-by: Eric Ruei <e-ruei1@ti.com>
---
 meta-arago-distro/recipes-qt/qt5/qtwebkit_%.bbappend | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/meta-arago-distro/recipes-qt/qt5/qtwebkit_%.bbappend b/meta-arago-distro/recipes-qt/qt5/qtwebkit_%.bbappend
index 31c929a7..75213487 100644
--- a/meta-arago-distro/recipes-qt/qt5/qtwebkit_%.bbappend
+++ b/meta-arago-distro/recipes-qt/qt5/qtwebkit_%.bbappend
@@ -8,7 +8,9 @@ SRC_URI += " \
 	file://GraphicsSurfaceGL_NoX.cpp.patch \
 "
 
-PR_append = ".arago6"
+PR_append = ".arago7"
+
+EXTRA_OECMAKE_append = " -DCMAKE_BUILD_TYPE=Release"
 
 EXTRA_OECMAKE_append_k3 = " -DUSE_SYSTEM_MALLOC=ON"
 
-- 
2.17.1


