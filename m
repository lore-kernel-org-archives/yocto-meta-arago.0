Return-Path: <e-ruei1@ti.com>
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
	by arago-project.org (Postfix) with ESMTPS id 56507520EA
	for <meta-arago@arago-project.org>;
	Fri, 31 May 2019 17:48:47 +0000 (UTC)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id x4VHmBAo006428
	for <meta-arago@arago-project.org>; Fri, 31 May 2019 12:48:11 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1559324891;
	bh=WGS/sKw/aJk/liBl/rtoFdjVrEzKIa/W0Vre7zaak9c=;
	h=From:To:Subject:Date:In-Reply-To:References;
	b=yvelkMhb5TguUWEGgbrjWdPLJHIid2NAiguqxV8AKf1zqbjNE6JJuQ8aawayJo+AB
	QncWPWHjJsWlP7r/SIwWK5ymAwxrnxnqzmhKc1pcjyHpgCm1v27sQkd+fi6mnqq8Ac
	nD4JmtSI2QJKrTKWgemoqa75yDd46kvzHWGl/8tY=
Received: from DFLE109.ent.ti.com (dfle109.ent.ti.com [10.64.6.30])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x4VHmB2X039815
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-arago@arago-project.org>; Fri, 31 May 2019 12:48:11 -0500
Received: from DFLE107.ent.ti.com (10.64.6.28) by DFLE109.ent.ti.com
	(10.64.6.30) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5;
	Fri, 31 May 2019 12:48:11 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DFLE107.ent.ti.com
	(10.64.6.28) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
	Frontend Transport; Fri, 31 May 2019 12:48:11 -0500
Received: from UDA0850410.gt.design.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])
	by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id x4VHmANM118948
	for <meta-arago@arago-project.org>; Fri, 31 May 2019 12:48:11 -0500
From: Eric Ruei <e-ruei1@ti.com>
To: <meta-arago@arago-project.org>
Date: Fri, 31 May 2019 13:47:52 -0400
Message-ID: <20190531174754.42586-2-e-ruei1@ti.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190531174754.42586-1-e-ruei1@ti.com>
References: <20190531174754.42586-1-e-ruei1@ti.com>
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: [meta-processor-sdk][PATCH 1/3] tisdk-roofs-image: add packagegroup-arago-tisdk-graphics unconditionally
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
X-List-Received-Date: Fri, 31 May 2019 17:48:48 -0000
Content-Type: text/plain

packagegroup-arago-tisdk-graphics is required for both sgx and non-sgx
builds for AM3/4/5/6

Signed-off-by: Eric Ruei <e-ruei1@ti.com>
---
 recipes-core/images/tisdk-rootfs-image.bbappend | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/recipes-core/images/tisdk-rootfs-image.bbappend b/recipes-core/images/tisdk-rootfs-image.bbappend
index 6f6c3bc..180bb0c 100644
--- a/recipes-core/images/tisdk-rootfs-image.bbappend
+++ b/recipes-core/images/tisdk-rootfs-image.bbappend
@@ -1,4 +1,4 @@
-PR_append = ".tisdk6"
+PR_append = ".tisdk7"
 
 # Disable ros-world until it can be fixed
 #	packagegroup-ros-world
@@ -17,6 +17,12 @@ IMAGE_INSTALL_append_ti33x = " \
 
 #	packagegroup-ros-world
 IMAGE_INSTALL_append_omap-a15 = " \
+	packagegroup-arago-tisdk-graphics \
 	packagegroup-arago-tisdk-hmi \
 	packagegroup-ros-ti \
 "
+
+#	packagegroup-ros-world
+IMAGE_INSTALL_append_k3 = " \
+	packagegroup-arago-tisdk-graphics \
+"
-- 
2.17.1


