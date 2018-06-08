Return-Path: <x0038811@ti.com>
Received: from lelnx194.ext.ti.com (lelnx194.ext.ti.com [198.47.27.80])
	by arago-project.org (Postfix) with ESMTPS id 5A482529C0
	for <meta-arago@arago-project.org>;
	Fri,  8 Jun 2018 11:26:27 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by lelnx194.ext.ti.com (8.15.1/8.15.1) with ESMTP id w58BQMKo009394
	for <meta-arago@arago-project.org>; Fri, 8 Jun 2018 06:26:22 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1528457182;
	bh=BoKnLB9unDR50wz+/J8k3Q1iA5x/G0UwOG/tI0PIztI=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=j74VCjbCibB0JziMj+YVUGL/juiJdJKQHQnHC+pI92dFvWeQ/ij8Rg6ipi8YtmRxI
	7F12PWuU7oSAb3SrXPBwqKbI54VGAmgkrA0J2L7ooTHJsUrLjNuEd5+FXEWRYaWjAp
	nZa8M94k867QWEzknoYuRfALEMfraH/1LVmFrpSo=
Received: from DLEE105.ent.ti.com (dlee105.ent.ti.com [157.170.170.35])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id w58BQMlf020771
	for <meta-arago@arago-project.org>; Fri, 8 Jun 2018 06:26:22 -0500
Received: from DLEE103.ent.ti.com (157.170.170.33) by DLEE105.ent.ti.com
	(157.170.170.35) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1466.3;
	Fri, 8 Jun 2018 06:26:21 -0500
Received: from dflp32.itg.ti.com (10.64.6.15) by DLEE103.ent.ti.com
	(157.170.170.33) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.1466.3 via Frontend
	Transport; Fri, 8 Jun 2018 06:26:21 -0500
Received: from udx0038811.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])
	by dflp32.itg.ti.com (8.14.3/8.13.8) with ESMTP id w58BQHAg028663;
	Fri, 8 Jun 2018 06:26:20 -0500
From: Ramprasad N <x0038811@ti.com>
To: <meta-arago@arago-project.org>
Date: Fri, 8 Jun 2018 16:56:13 +0530
Message-ID: <1528457173-29368-3-git-send-email-x0038811@ti.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1528457173-29368-1-git-send-email-x0038811@ti.com>
References: <1528457173-29368-1-git-send-email-x0038811@ti.com>
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: [rocko] gst-ducati: Bump SRCREV with latest commit
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
X-List-Received-Date: Fri, 08 Jun 2018 11:26:28 -0000
Content-Type: text/plain

Update recipe with latest commit

Signed-off-by: Ramprasad N <x0038811@ti.com>
---
 .../gst-plugins-ti/gstreamer1.0-plugins-ducati_git.bb                 | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-arago-extras/recipes-multimedia/gst-plugins-ti/gstreamer1.0-plugins-ducati_git.bb b/meta-arago-extras/recipes-multimedia/gst-plugins-ti/gstreamer1.0-plugins-ducati_git.bb
index 6c6a474..556dc31 100644
--- a/meta-arago-extras/recipes-multimedia/gst-plugins-ti/gstreamer1.0-plugins-ducati_git.bb
+++ b/meta-arago-extras/recipes-multimedia/gst-plugins-ti/gstreamer1.0-plugins-ducati_git.bb
@@ -4,8 +4,8 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=fbc093901857fcd118f065f900982c24"
 
 require gstreamer1.0-plugins-ti.inc
 
-PR = "${INC_PR}.28"
-SRCREV = "7f3326b81b838fb6c916acd1d6a3090fda12c772"
+PR = "${INC_PR}.29"
+SRCREV = "19e911bb45757d8341ffd7819ca783ca04f5e3b1"
 
 BRANCH ?= "master"
 
-- 
1.9.1


