Return-Path: <denys@ti.com>
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
	by arago-project.org (Postfix) with ESMTPS id 2846A52997
	for <meta-arago@arago-project.org>;
	Thu,  6 Dec 2018 20:29:14 +0000 (UTC)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id wB6KT2iK122840
	for <meta-arago@arago-project.org>; Thu, 6 Dec 2018 14:29:02 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1544128142;
	bh=URiYvPtgPbwC7uNzv8oCvRBU/gIzJtANr/t7KLpsoNw=;
	h=From:To:CC:Subject:Date;
	b=qS3cB+Fgs2J05I2rBdMdq9DZ5VSk2/SxLQgy+6MltqGeXW8dCZ7FrjX+Cv3t5hrw9
	86Kt4H9aOJy8AgN30E1K7GzJTm2bm9mpX5ozOVuWLYgp6N84EwsHQat5K/Biz4iWfi
	q5c/XnIUjQ9yNSKccHbeOmLSvgUm1FDRtOMPpjfU=
Received: from DLEE115.ent.ti.com (dlee115.ent.ti.com [157.170.170.26])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id wB6KT2Xx126316
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-arago@arago-project.org>; Thu, 6 Dec 2018 14:29:02 -0600
Received: from DLEE110.ent.ti.com (157.170.170.21) by DLEE115.ent.ti.com
	(157.170.170.26) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1591.10;
	Thu, 6 Dec 2018 14:29:02 -0600
Received: from dlep32.itg.ti.com (157.170.170.100) by DLEE110.ent.ti.com
	(157.170.170.21) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.1591.10 via Frontend
	Transport; Thu, 6 Dec 2018 14:29:01 -0600
Received: from puget.gt.design.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])
	by dlep32.itg.ti.com (8.14.3/8.13.8) with ESMTP id wB6KT1DH032232;
	Thu, 6 Dec 2018 14:29:01 -0600
From: Denys Dmytriyenko <denys@ti.com>
To: <meta-arago@arago-project.org>
Date: Thu, 6 Dec 2018 20:22:38 +0000
Message-ID: <20181206202238.761-1-denys@ti.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: [oe-layersetup][PATCH] arago-master, arago-thud: do not look for any layers in bitbake repo
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
X-List-Received-Date: Thu, 06 Dec 2018 20:29:15 -0000
Content-Type: text/plain

bitbake has no usable layers, but has 4 test layers, which should not be used
in normal builds.

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 configs/arago-master-config.txt | 2 +-
 configs/arago-thud-config.txt   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/configs/arago-master-config.txt b/configs/arago-master-config.txt
index 01940ca..0d560a4 100644
--- a/configs/arago-master-config.txt
+++ b/configs/arago-master-config.txt
@@ -1,7 +1,7 @@
 # This file takes repo entries in the format
 # repo name,repo uri,repo branch,repo commit[,layers=layer1:layer2...:layern]
 
-bitbake,git://git.openembedded.org/bitbake,master,HEAD,layers=
+bitbake,git://git.openembedded.org/bitbake,master,HEAD
 meta-arago,git://arago-project.org/git/meta-arago.git,master,HEAD,layers=meta-arago-distro:meta-arago-extras
 meta-browser,git://github.com/OSSystems/meta-browser.git,master,HEAD,layers=
 meta-qt5,git://github.com/meta-qt5/meta-qt5.git,master,HEAD,layers=
diff --git a/configs/arago-thud-config.txt b/configs/arago-thud-config.txt
index 44a6bae..ca8bcae 100644
--- a/configs/arago-thud-config.txt
+++ b/configs/arago-thud-config.txt
@@ -1,7 +1,7 @@
 # This file takes repo entries in the format
 # repo name,repo uri,repo branch,repo commit[,layers=layer1:layer2...:layern]
 
-bitbake,git://git.openembedded.org/bitbake,1.40,HEAD,layers=
+bitbake,git://git.openembedded.org/bitbake,1.40,HEAD
 meta-arago,git://arago-project.org/git/meta-arago.git,master,HEAD,layers=meta-arago-distro:meta-arago-extras
 meta-browser,git://github.com/OSSystems/meta-browser.git,master,26d50665e2f7223c5f4ad7481a8d2431e7cb55fb,layers=
 meta-qt5,git://github.com/meta-qt5/meta-qt5.git,thud,HEAD,layers=
-- 
2.17.1


