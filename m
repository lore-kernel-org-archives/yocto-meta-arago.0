Return-Path: <e-ruei1@ti.com>
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
	by arago-project.org (Postfix) with ESMTPS id A82EE52A7E
	for <meta-arago@arago-project.org>;
	Wed, 29 Aug 2018 15:03:33 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id w7TF3PcL089688
	for <meta-arago@arago-project.org>; Wed, 29 Aug 2018 10:03:25 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1535555005;
	bh=H5JUVmY7HToEz3EG2GKydCzMLhuz28nfvfHaRFEpKJU=;
	h=From:To:Subject:Date:In-Reply-To:References;
	b=ukdKkurC0t/1U4xqec9NVQkrShQWloI2OLK/rIKczLdTj9CB+hCsGFncok77AEAnn
	VhJB3Nps61mIgiPBleoN9VgYh/XLK4BIB34jOreGqeT0PdFo87GlEsL372qTSZ4xm5
	vqZR4vzN7e2+UfGxW+2tsdCzMT94MJH766Qcsl7o=
Received: from DFLE106.ent.ti.com (dfle106.ent.ti.com [10.64.6.27])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id w7TF3PC3007471
	for <meta-arago@arago-project.org>; Wed, 29 Aug 2018 10:03:25 -0500
Received: from DFLE105.ent.ti.com (10.64.6.26) by DFLE106.ent.ti.com
	(10.64.6.27) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1466.3;
	Wed, 29 Aug 2018 10:03:25 -0500
Received: from dlep33.itg.ti.com (157.170.170.75) by DFLE105.ent.ti.com
	(10.64.6.26) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.1466.3 via Frontend
	Transport; Wed, 29 Aug 2018 10:03:25 -0500
Received: from uda0850410.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])
	by dlep33.itg.ti.com (8.14.3/8.13.8) with ESMTP id w7TF3OiW028516
	for <meta-arago@arago-project.org>; Wed, 29 Aug 2018 10:03:25 -0500
From: Eric Ruei <e-ruei1@ti.com>
To: <meta-arago@arago-project.org>
Date: Wed, 29 Aug 2018 11:03:17 -0400
Message-ID: <1535555000-25564-5-git-send-email-e-ruei1@ti.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1535555000-25564-1-git-send-email-e-ruei1@ti.com>
References: <1535555000-25564-1-git-send-email-e-ruei1@ti.com>
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: [PATCH 4/7] qtwebkit: add flex and bison to DEPENDS list
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
X-List-Received-Date: Wed, 29 Aug 2018 15:03:34 -0000
Content-Type: text/plain

Signed-off-by: Eric Ruei <e-ruei1@ti.com>
---
 meta-arago-distro/recipes-qt/qt5/qtwebkit_%.bbappend | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/meta-arago-distro/recipes-qt/qt5/qtwebkit_%.bbappend b/meta-arago-distro/recipes-qt/qt5/qtwebkit_%.bbappend
index a9289e8..c3b5700 100644
--- a/meta-arago-distro/recipes-qt/qt5/qtwebkit_%.bbappend
+++ b/meta-arago-distro/recipes-qt/qt5/qtwebkit_%.bbappend
@@ -7,4 +7,6 @@ SRC_URI += " \
 	file://WebCore.pri.patch \
 "
 
-PR_append = ".arago4"
+PR_append = ".arago5"
+
+DEPENDS += "flex-native bison-native"
-- 
1.9.1


