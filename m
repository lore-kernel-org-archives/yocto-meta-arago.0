Return-Path: <d-senicic1@ti.com>
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
	by arago-project.org (Postfix) with ESMTPS id F402D52987
	for <meta-arago@arago-project.org>;
	Fri, 10 May 2019 18:17:34 +0000 (UTC)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id x4AIH5Fk069741
	for <meta-arago@arago-project.org>; Fri, 10 May 2019 13:17:05 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1557512225;
	bh=glmt6EUYSh6e66DjtGPwJ2NfEv4aSgQDFpsFk4MghCs=;
	h=From:To:CC:Subject:Date;
	b=ADjCF3VIjv7dtYnvStAdVCoqDPmppyHKUecL3Q7j/74oFzDoW4uCLT69JOhubAWA6
	UkfdSg+ZDm1Bu8IXssOYVlPwX+Xc5gMHXdu4t5Bh3Nmy5Qg9fRyIzAgfMAyNoul5YV
	qsK/AP+QBkWpx0GPlNlnLWg0/h6Qv3Gend011SzM=
Received: from DLEE109.ent.ti.com (dlee109.ent.ti.com [157.170.170.41])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x4AIH5qw094553
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-arago@arago-project.org>; Fri, 10 May 2019 13:17:05 -0500
Received: from DLEE108.ent.ti.com (157.170.170.38) by DLEE109.ent.ti.com
	(157.170.170.41) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5;
	Fri, 10 May 2019 13:17:05 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DLEE108.ent.ti.com
	(157.170.170.38) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
	Frontend Transport; Fri, 10 May 2019 13:17:05 -0500
Received: from uda0271529a.gt.design.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])
	by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id x4AIH5jO042788;
	Fri, 10 May 2019 13:17:05 -0500
From: Djordje Senicic <x0157990@ti.com>
To: <meta-arago@arago-project.org>
Date: Fri, 10 May 2019 09:08:39 -0400
Message-ID: <20190510130839.31906-1-x0157990@ti.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Cc: Djordje Senicic <x0157990@ti.com>
Subject: [qt-opencv-opencl-opengl-multithreaded][PATCH] Fix demo compilation issue
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
X-List-Received-Date: Fri, 10 May 2019 18:17:35 -0000
Content-Type: text/plain

Signed-off-by: Djordje Senicic <x0157990@ti.com>
---
 ImageProcessingSettingsDialog.cpp | 1 +
 1 file changed, 1 insertion(+)

diff --git a/ImageProcessingSettingsDialog.cpp b/ImageProcessingSettingsDialog.cpp
index fa968af..33e65c1 100644
--- a/ImageProcessingSettingsDialog.cpp
+++ b/ImageProcessingSettingsDialog.cpp
@@ -34,6 +34,7 @@
 #include "ui_ImageProcessingSettingsDialog.h"
 // Qt
 #include <QMessageBox>
+#include <QRegExpValidator>
 
 ImageProcessingSettingsDialog::ImageProcessingSettingsDialog(QWidget *parent) :
     QDialog(parent),
-- 
2.17.1


