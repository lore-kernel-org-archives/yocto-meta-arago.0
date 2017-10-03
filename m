Return-Path: <e-ruei1@ti.com>
Received: from fllnx209.ext.ti.com (fllnx209.ext.ti.com [198.47.19.16])
	by arago-project.org (Postfix) with ESMTPS id 9077852AF7
	for <meta-arago@arago-project.org>;
	Tue,  3 Oct 2017 15:54:31 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by fllnx209.ext.ti.com (8.15.1/8.15.1) with ESMTP id v93FsLf5005617
	for <meta-arago@arago-project.org>; Tue, 3 Oct 2017 10:54:21 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ti.com;
	s=ti-com-17Q1; t=1507046061;
	bh=occhx35xLbe+/OKlcFac69qcI338pR8E4vNv88wIVfE=;
	h=From:To:Subject:Date:In-Reply-To:References;
	b=mPgxKtRugSIYKjnn9oWghakWfAGGicm3Jr6YQ6fmgwjU+k5wa5RoPfmqOK1unh+t5
	QySmMjAdrWFsRvqfRmedyDoI04uM+MHR7DO7In0ywnZ/b+sclEBw1psbar91U7bI9/
	IZg4nCo+e1W5/OsD1EQX1u0ll1j8iiW40/HsfiTg=
Received: from DLEE113.ent.ti.com (dlee113.ent.ti.com [157.170.170.24])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id v93FsG4k013464
	for <meta-arago@arago-project.org>; Tue, 3 Oct 2017 10:54:16 -0500
Received: from DLEE100.ent.ti.com (157.170.170.30) by DLEE113.ent.ti.com
	(157.170.170.24) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P256) id 15.1.845.34;
	Tue, 3 Oct 2017 10:54:16 -0500
Received: from dlep33.itg.ti.com (157.170.170.75) by DLEE100.ent.ti.com
	(157.170.170.30) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.845.34 via Frontend
	Transport; Tue, 3 Oct 2017 10:54:16 -0500
Received: from uda0850410.am.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])
	by dlep33.itg.ti.com (8.14.3/8.13.8) with ESMTP id v93FsFS2013524
	for <meta-arago@arago-project.org>; Tue, 3 Oct 2017 10:54:16 -0500
From: Eric Ruei <e-ruei1@ti.com>
To: <meta-arago@arago-project.org>
Date: Tue, 3 Oct 2017 11:53:53 -0400
Message-ID: <1507046051-57949-6-git-send-email-e-ruei1@ti.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1507046051-57949-1-git-send-email-e-ruei1@ti.com>
References: <1507046051-57949-1-git-send-email-e-ruei1@ti.com>
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: [meta-processor-sdk][PATCH v2 05/23] arago-core-tisdk-image: add additional packagegroup for X11 (xsgx) build
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
X-List-Received-Date: Tue, 03 Oct 2017 15:54:32 -0000
Content-Type: text/plain

Signed-off-by: Eric Ruei <e-ruei1@ti.com>
---
 recipes-core/images/arago-core-tisdk-image.bbappend | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/recipes-core/images/arago-core-tisdk-image.bbappend b/recipes-core/images/arago-core-tisdk-image.bbappend
index 2c804f0..58195b3 100644
--- a/recipes-core/images/arago-core-tisdk-image.bbappend
+++ b/recipes-core/images/arago-core-tisdk-image.bbappend
@@ -1,7 +1,9 @@
-PR_append = ".tisdk13"
+PR_append = ".tisdk14"
 
 IMAGE_INSTALL_append = " \                                                                                                                   
       packagegroup-arago-tisdk-hmi-sdk-host \ 
+      ${@bb.utils.contains('MACHINE_FEATURES','xsgx','packagegroup-arago-tisdk-qte-sdk-host','',d)} \
+      ${@bb.utils.contains('MACHINE_FEATURES','xsgx','packagegroup-arago-tisdk-graphics-sdk-host','',d)} \
  "
 
 # The following FITIMAGE vars are copied from kernel-fitimage.bbclass.
-- 
1.9.1


