Return-Path: <j-stiffler@ti.com>
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
	by arago-project.org (Postfix) with ESMTPS id C9464529C7
	for <meta-arago@arago-project.org>;
	Mon, 11 Mar 2019 15:52:30 +0000 (UTC)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id x2BFqLl7013256
	for <meta-arago@arago-project.org>; Mon, 11 Mar 2019 10:52:21 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1552319541;
	bh=MYd0l56j9OfNwo+RotbQcWAgj4P8QOs3jWc3wcmKBWs=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=FDctp2WhsUV71j5iQsIEt4FP2VRvbLWexMSsBfD4a494R+wzNJbrxWSaoTgLlvjrM
	F96e4BcuVky8fuJKp6dBBqDuYaDz1ZBvN1/t6MDSCFd481ewbPswrKopqxzsRlJyVs
	V6NIrJfF23VlSm+Hx398DFhFh9H3h2qJ0WQkh/mE=
Received: from DFLE109.ent.ti.com (dfle109.ent.ti.com [10.64.6.30])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x2BFqLUo077515
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-arago@arago-project.org>; Mon, 11 Mar 2019 10:52:21 -0500
Received: from DFLE115.ent.ti.com (10.64.6.36) by DFLE109.ent.ti.com
	(10.64.6.30) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1591.10;
	Mon, 11 Mar 2019 10:52:21 -0500
Received: from dlep32.itg.ti.com (157.170.170.100) by DFLE115.ent.ti.com
	(10.64.6.36) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.1591.10 via Frontend
	Transport; Mon, 11 Mar 2019 10:52:21 -0500
Received: from udd0866934.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])
	by dlep32.itg.ti.com (8.14.3/8.13.8) with ESMTP id x2BFq67L031358;
	Mon, 11 Mar 2019 10:52:21 -0500
From: Jacob Stiffler <j-stiffler@ti.com>
To: <meta-arago@arago-project.org>
Date: Mon, 11 Mar 2019 11:39:50 -0400
Message-ID: <1552318790-23095-5-git-send-email-j-stiffler@ti.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1552318790-23095-1-git-send-email-j-stiffler@ti.com>
References: <1552318790-23095-1-git-send-email-j-stiffler@ti.com>
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: [master/thud/rocko][PATCH 4/4] arago.conf: open62541: enable encryption
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
X-List-Received-Date: Mon, 11 Mar 2019 15:52:31 -0000
Content-Type: text/plain

Signed-off-by: Jacob Stiffler <j-stiffler@ti.com>
---
 meta-arago-distro/conf/distro/arago.conf | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta-arago-distro/conf/distro/arago.conf b/meta-arago-distro/conf/distro/arago.conf
index dcab870..2ad9f01 100644
--- a/meta-arago-distro/conf/distro/arago.conf
+++ b/meta-arago-distro/conf/distro/arago.conf
@@ -123,6 +123,9 @@ PACKAGECONFIG_pn-glmark2 = "drm-gles2 wayland-gles2"
 # Enable U-boot OPTEE config for K3
 PACKAGECONFIG_append_pn-u-boot-ti-staging_k3 = " optee"
 
+# Enable encryption support in open62541
+PACKAGECONFIG_append_pn-open62541 = " encrypt"
+
 EXTRA_IMAGEDEPENDS_append_k3 += " u-boot-k3-r5 ti-sci-fw"
 
 # Enable UI and scripting for perf
-- 
2.7.4


