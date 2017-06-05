Return-Path: <e-ruei1@ti.com>
Received: from lelnx193.ext.ti.com (lelnx193.ext.ti.com [198.47.27.77])
	by arago-project.org (Postfix) with ESMTPS id 6EFA5529D6
	for <meta-arago@arago-project.org>;
	Mon,  5 Jun 2017 19:30:23 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by lelnx193.ext.ti.com (8.15.1/8.15.1) with ESMTP id v55JUNHH004735
	for <meta-arago@arago-project.org>; Mon, 5 Jun 2017 14:30:23 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ti.com;
	s=ti-com-17Q1; t=1496691023;
	bh=StxdHPn1SNKU/0uo3oiqTZgF5joa8WBwJuSgDBQV4sY=;
	h=From:To:Subject:Date:In-Reply-To:References;
	b=dNK+eZ2DXWuQT8D6/A3eycJW4g4+6ZJ5Xn+mHKlVWZlRkrnI3MKKZfRLGeK0prLu9
	MD9Q1ylegP7B2BepcbzU1XnW2lLnuqx3EdQC9FfmP8JaRFtIpqt8XLvm+QH5TkDAEO
	JgG9Q+dtH3hL9Cprz+Bn8xmeqvB/5i+kCv/XK+Eg=
Received: from DLEE70.ent.ti.com (dlemailx.itg.ti.com [157.170.170.113])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id v55JUMfG025384
	for <meta-arago@arago-project.org>; Mon, 5 Jun 2017 14:30:22 -0500
Received: from dflp32.itg.ti.com (10.64.6.15) by DLEE70.ent.ti.com
	(157.170.170.113) with Microsoft SMTP Server id 14.3.294.0;
	Mon, 5 Jun 2017 14:30:21 -0500
Received: from uda0850410.am.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])	by dflp32.itg.ti.com (8.14.3/8.13.8) with ESMTP id
	v55JUHaM018150	for <meta-arago@arago-project.org>;
	Mon, 5 Jun 2017 14:30:22 -0500
From: Eric Ruei <e-ruei1@ti.com>
To: <meta-arago@arago-project.org>
Date: Mon, 5 Jun 2017 15:30:14 -0400
Message-ID: <1496691014-53218-2-git-send-email-e-ruei1@ti.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1496691014-53218-1-git-send-email-e-ruei1@ti.com>
References: <1496691014-53218-1-git-send-email-e-ruei1@ti.com>
MIME-Version: 1.0
Subject: [morty/master][PATCH 2/2] packagegroup-arago-tisdk-qte: add qtwebbrowser-example to the list and sort it
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
X-List-Received-Date: Mon, 05 Jun 2017 19:30:23 -0000
Content-Type: text/plain

Signed-off-by: Eric Ruei <e-ruei1@ti.com>
---
 .../recipes-core/packagegroups/packagegroup-arago-tisdk-qte.bb           | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-qte.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-qte.bb
index f2f87be..d7b8f0b 100644
--- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-qte.bb
+++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-qte.bb
@@ -24,6 +24,7 @@ QT5_DEMOS = "\
     qtscript-examples \
     qtsvg-examples \
     ${@bb.utils.contains('DISTRO_FEATURES', 'wayland', 'qtwayland-examples', '', d)} \
+    qtwebbrowser-example \
     qtwebengine-examples \
     qtwebkit-examples-examples \
 "
-- 
1.9.1


