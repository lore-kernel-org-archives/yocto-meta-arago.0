Return-Path: <j-stiffler@ti.com>
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
	by arago-project.org (Postfix) with ESMTPS id 5427E52A06
	for <meta-arago@arago-project.org>;
	Wed,  8 Jul 2020 14:43:25 +0000 (UTC)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 068EekXC025578
	for <meta-arago@arago-project.org>; Wed, 8 Jul 2020 09:40:46 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1594219246;
	bh=Zt2Bh8q62wZ2ftsnRjHWupUQlQ4qEAdX+qq1HLjebGw=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=a25liDBE9Ok41T7GQP8P92we9RYwEwr0P8FSAeMzxky+HHNA/CMhR7/u/BO4Jwu+R
	IMuv5hTB6vrBcjNuZZQy8rBtjahalUPHCy0wZ213uVKQ8xo2eEzgixy0vzyqjBsHDa
	IfPoC2Y4F+vtaPaL/BpRRliNxpW3esgcMIggNfjQ=
Received: from DLEE109.ent.ti.com (dlee109.ent.ti.com [157.170.170.41])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 068Eekka100622
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-arago@arago-project.org>; Wed, 8 Jul 2020 09:40:46 -0500
Received: from DLEE100.ent.ti.com (157.170.170.30) by DLEE109.ent.ti.com
	(157.170.170.41) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3;
	Wed, 8 Jul 2020 09:40:45 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DLEE100.ent.ti.com
	(157.170.170.30) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
	Frontend Transport; Wed, 8 Jul 2020 09:40:45 -0500
Received: from udd0866934.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])
	by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 068EeiNe011476;
	Wed, 8 Jul 2020 09:40:45 -0500
From: Jacob Stiffler <j-stiffler@ti.com>
To: <meta-arago@arago-project.org>
Date: Wed, 8 Jul 2020 10:40:39 -0400
Message-ID: <1594219239-532-2-git-send-email-j-stiffler@ti.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1594219239-532-1-git-send-email-j-stiffler@ti.com>
References: <1594219239-532-1-git-send-email-j-stiffler@ti.com>
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: [master/dunfell][PATCH 2/2] arago: add uEnv.txt to wic images
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
X-List-Received-Date: Wed, 08 Jul 2020 14:43:25 -0000
Content-Type: text/plain

Signed-off-by: Jacob Stiffler <j-stiffler@ti.com>
---
 meta-arago-distro/conf/distro/arago.conf | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/meta-arago-distro/conf/distro/arago.conf b/meta-arago-distro/conf/distro/arago.conf
index bc786a7..1e8d66f 100644
--- a/meta-arago-distro/conf/distro/arago.conf
+++ b/meta-arago-distro/conf/distro/arago.conf
@@ -70,6 +70,10 @@ KERNEL_IMAGETYPES_k2l-hs-evm = "zImage fitImage"
 INITRAMFS_IMAGE_k2l-hs-evm = "k2-fw-initrd"
 INITRAMFS_FSTYPES_k2l-hs-evm = "cpio.gz"
 
+# Extra boot files for WIC images
+do_image_wic[depends] += "tisdk-uenv:do_deploy"
+IMAGE_BOOT_FILES += "uEnv.txt"
+
 # Mask any broken recipes (currently none)
 #BBMASK = ""
 
-- 
2.7.4


