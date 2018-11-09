Return-Path: <j-stiffler@ti.com>
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
	by arago-project.org (Postfix) with ESMTPS id 0AAB15298A
	for <meta-arago@arago-project.org>;
	Fri,  9 Nov 2018 17:09:02 +0000 (UTC)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id wA9H8rGU065598
	for <meta-arago@arago-project.org>; Fri, 9 Nov 2018 11:08:53 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1541783333;
	bh=eCxE6e8lHMED6ivG176nD28OVg4+waCaJlxz/zslxIc=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=IJEE4Pu890djUIKtuw9On6+u0Svg+cpC2bgEJSXPbvEdo4YQUVmvqNvEKwVUEGxIw
	WUpnxn259Bo2oPeJs9FtHhiZNkNtWIcshLPkT7HAP3NcqBhgDnaOCnGsM/XlFoD68m
	cmKNSFSV7X4h2SHaAfXDdkPqBNDibL8pkNwQxFB8=
Received: from DLEE112.ent.ti.com (dlee112.ent.ti.com [157.170.170.23])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id wA9H8r41080504
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-arago@arago-project.org>; Fri, 9 Nov 2018 11:08:53 -0600
Received: from DLEE115.ent.ti.com (157.170.170.26) by DLEE112.ent.ti.com
	(157.170.170.23) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1466.3;
	Fri, 9 Nov 2018 11:08:52 -0600
Received: from dflp32.itg.ti.com (10.64.6.15) by DLEE115.ent.ti.com
	(157.170.170.26) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.1466.3 via Frontend
	Transport; Fri, 9 Nov 2018 11:08:52 -0600
Received: from udd0866934.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])
	by dflp32.itg.ti.com (8.14.3/8.13.8) with ESMTP id wA9H8qoA029532;
	Fri, 9 Nov 2018 11:08:52 -0600
From: Jacob Stiffler <j-stiffler@ti.com>
To: <meta-arago@arago-project.org>
Date: Fri, 9 Nov 2018 11:56:22 -0500
Message-ID: <1541782587-24044-2-git-send-email-j-stiffler@ti.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1541782587-24044-1-git-send-email-j-stiffler@ti.com>
References: <1541782587-24044-1-git-send-email-j-stiffler@ti.com>
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: [rocko/master][PATCH 1/6] ti-sci-fw: deploy original firmware
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
X-List-Received-Date: Fri, 09 Nov 2018 17:09:05 -0000
Content-Type: text/plain

* This can be used in the SDK to rebuild the sysfw.itb image.

Signed-off-by: Jacob Stiffler <j-stiffler@ti.com>
---
 meta-arago-distro/recipes-bsp/ti-sci-fw/ti-sci-fw_2018.10.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-arago-distro/recipes-bsp/ti-sci-fw/ti-sci-fw_2018.10.bb b/meta-arago-distro/recipes-bsp/ti-sci-fw/ti-sci-fw_2018.10.bb
index c05582a..d7ba79c 100644
--- a/meta-arago-distro/recipes-bsp/ti-sci-fw/ti-sci-fw_2018.10.bb
+++ b/meta-arago-distro/recipes-bsp/ti-sci-fw/ti-sci-fw_2018.10.bb
@@ -42,6 +42,8 @@ do_install() {
 	install -d ${D}/boot
 	install -m 644 ${WORKDIR}/imggen/${SYSFW_BINARY} ${D}/boot/${SYSFW_IMAGE}
 	ln -sf ${SYSFW_IMAGE} ${D}/boot/${SYSFW_BINARY}
+
+        install -m 644 ${S}/ti-sysfw/${SYSFW_TISCI} ${D}/boot/${SYSFW_TISCI}
 }
 
 FILES_${PN} = "/boot"
-- 
2.7.4


