Return-Path: <j-stiffler@ti.com>
Received: from lelnx194.ext.ti.com (lelnx194.ext.ti.com [198.47.27.80])
	by arago-project.org (Postfix) with ESMTPS id 00479529E7
	for <meta-arago@arago-project.org>;
	Fri, 22 Jun 2018 18:32:56 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by lelnx194.ext.ti.com (8.15.1/8.15.1) with ESMTP id w5MIWpTf016607
	for <meta-arago@arago-project.org>; Fri, 22 Jun 2018 13:32:51 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1529692371;
	bh=LJ1ibZyYYmDWrwfcL9Lw29q+y2WCCH8M3z783TJQwlY=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=KfUyanlu+iIGZuByyc5zr7ebVPTs9NUSwqO7ko751IITjs12VmyZWG7nfoyAEfoi8
	PF/6l6kf4xb+cgzHbSM8rc9QP64E/1BLZlq70STu8Dl9L3MByQBYkWFJEV2hGstwwg
	rFxg0BraMaC3+26tj1SRMdmEqLjwax4lkYefOEIU=
Received: from DLEE115.ent.ti.com (dlee115.ent.ti.com [157.170.170.26])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id w5MIWpOh012553
	for <meta-arago@arago-project.org>; Fri, 22 Jun 2018 13:32:51 -0500
Received: from DLEE108.ent.ti.com (157.170.170.38) by DLEE115.ent.ti.com
	(157.170.170.26) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1466.3;
	Fri, 22 Jun 2018 13:32:50 -0500
Received: from dflp32.itg.ti.com (10.64.6.15) by DLEE108.ent.ti.com
	(157.170.170.38) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.1466.3 via Frontend
	Transport; Fri, 22 Jun 2018 13:32:50 -0500
Received: from udd0866934.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])
	by dflp32.itg.ti.com (8.14.3/8.13.8) with ESMTP id w5MIWn0d021857;
	Fri, 22 Jun 2018 13:32:50 -0500
From: Jacob Stiffler <j-stiffler@ti.com>
To: <meta-arago@arago-project.org>
Date: Fri, 22 Jun 2018 14:21:12 -0400
Message-ID: <1529691675-25624-4-git-send-email-j-stiffler@ti.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1529691675-25624-1-git-send-email-j-stiffler@ti.com>
References: <1529691675-25624-1-git-send-email-j-stiffler@ti.com>
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Cc: ajayj@ti.com
Subject: [meta-processor-sdk][PATCH 3/6] packagegroup-arago-tisdk-opencl-sdk-target: add tidl-examples-dev
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
X-List-Received-Date: Fri, 22 Jun 2018 18:32:58 -0000
Content-Type: text/plain

* Include the dev package so that build dependencies are available in
  the devkit.

Signed-off-by: Jacob Stiffler <j-stiffler@ti.com>
---
 .../packagegroups/packagegroup-arago-tisdk-opencl-sdk-target.bbappend  | 3 +++
 1 file changed, 3 insertions(+)
 create mode 100644 recipes-core/packagegroups/packagegroup-arago-tisdk-opencl-sdk-target.bbappend

diff --git a/recipes-core/packagegroups/packagegroup-arago-tisdk-opencl-sdk-target.bbappend b/recipes-core/packagegroups/packagegroup-arago-tisdk-opencl-sdk-target.bbappend
new file mode 100644
index 0000000..694fa75
--- /dev/null
+++ b/recipes-core/packagegroups/packagegroup-arago-tisdk-opencl-sdk-target.bbappend
@@ -0,0 +1,3 @@
+PR_append = ".tisdk0"
+
+UTILS_append_am57xx-evm = " tidl-examples-dev"
-- 
2.7.4


