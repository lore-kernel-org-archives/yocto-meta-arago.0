Return-Path: <denys@ti.com>
Received: from fllnx210.ext.ti.com (fllnx210.ext.ti.com [198.47.19.17])
	by arago-project.org (Postfix) with ESMTPS id 2DAD652AAB
	for <meta-arago@arago-project.org>;
	Mon,  2 Oct 2017 20:13:16 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by fllnx210.ext.ti.com (8.15.1/8.15.1) with ESMTP id v92KDFOI028567
	for <meta-arago@arago-project.org>; Mon, 2 Oct 2017 15:13:15 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ti.com;
	s=ti-com-17Q1; t=1506975196;
	bh=qIkNQQyDuYP953rzby9xLS5EmS3zzWKCcw1qh3CPZq8=;
	h=From:To:CC:Subject:Date;
	b=DB38bYCGU2Pvp0L/ceCGIhRvXkEYQ5ePEFSB3dcNxsvVxfGqzfkZ1LotCv4zCdArv
	NWgvYfDt4Ipk35E9E4ysPDTrvgUvKUpvVC+Cl+qzGIg25tybWQbOZaaDYYcdJiXDCf
	9y/Z7k7H5NPxvy3B4fTU40p6kVLUHg1khR1DlUJY=
Received: from DFLE105.ent.ti.com (dfle105.ent.ti.com [10.64.6.26])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id v92KDFFZ018454
	for <meta-arago@arago-project.org>; Mon, 2 Oct 2017 15:13:15 -0500
Received: from DFLE105.ent.ti.com (10.64.6.26) by DFLE105.ent.ti.com
	(10.64.6.26) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P256) id 15.1.845.34;
	Mon, 2 Oct 2017 15:13:15 -0500
Received: from dlep33.itg.ti.com (157.170.170.75) by DFLE105.ent.ti.com
	(10.64.6.26) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.845.34 via Frontend
	Transport; Mon, 2 Oct 2017 15:13:15 -0500
Received: from puget.gt.design.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])
	by dlep33.itg.ti.com (8.14.3/8.13.8) with ESMTP id v92KDFfW011553;
	Mon, 2 Oct 2017 15:13:15 -0500
From: Denys Dmytriyenko <denys@ti.com>
To: <meta-arago@arago-project.org>
Date: Mon, 2 Oct 2017 16:13:14 -0400
Message-ID: <1506975194-2971-1-git-send-email-denys@ti.com>
X-Mailer: git-send-email 1.7.9.5
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: [oe-layersetup][PATCH] arago-master-config: remove deprecated meta-ruby from meta-openembedded
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
X-List-Received-Date: Mon, 02 Oct 2017 20:13:16 -0000
Content-Type: text/plain

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 configs/arago-master-config.txt |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/configs/arago-master-config.txt b/configs/arago-master-config.txt
index 44dfcd5..01940ca 100644
--- a/configs/arago-master-config.txt
+++ b/configs/arago-master-config.txt
@@ -5,7 +5,7 @@ bitbake,git://git.openembedded.org/bitbake,master,HEAD,layers=
 meta-arago,git://arago-project.org/git/meta-arago.git,master,HEAD,layers=meta-arago-distro:meta-arago-extras
 meta-browser,git://github.com/OSSystems/meta-browser.git,master,HEAD,layers=
 meta-qt5,git://github.com/meta-qt5/meta-qt5.git,master,HEAD,layers=
-meta-openembedded,git://git.openembedded.org/meta-openembedded,master,HEAD,layers=meta-networking:meta-ruby:meta-python:meta-oe:meta-gnome
+meta-openembedded,git://git.openembedded.org/meta-openembedded,master,HEAD,layers=meta-networking:meta-python:meta-oe:meta-gnome
 meta-ti,git://git.yoctoproject.org/meta-ti,master,HEAD,layers=
 meta-linaro,git://git.linaro.org/openembedded/meta-linaro.git,master,HEAD,layers=meta-linaro-toolchain:meta-optee
 oe-core,git://git.openembedded.org/openembedded-core,master,HEAD,layers=meta
-- 
1.7.9.5


