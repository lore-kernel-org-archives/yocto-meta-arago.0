Return-Path: <j-stiffler@ti.com>
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
	by arago-project.org (Postfix) with ESMTPS id 40058529FA
	for <meta-arago@arago-project.org>;
	Fri, 30 Aug 2019 17:27:12 +0000 (UTC)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id x7UHQAAn063919
	for <meta-arago@arago-project.org>; Fri, 30 Aug 2019 12:26:10 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1567185970;
	bh=X7xyjPGPvKY0N4J0o7vjzDlIQC2PNhJZ7q/+aQSK63M=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=dFBzsTofZ8ngozXSqCy+qWqAnVHSk2BsG3oENdyukOVPQz1XtGtg71PR6CzsnKi3r
	WelgRhttT9AxZVHXGZ8Qq5wV0+4Kr2ifSOPis23vJdVla4M0t580drkuX1NG0lU0cp
	efxI5LMyLhXaFnbOCOSAJ6FzUgQ21MbLHH/rTcjg=
Received: from DLEE115.ent.ti.com (dlee115.ent.ti.com [157.170.170.26])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x7UHQ9iD124747
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-arago@arago-project.org>; Fri, 30 Aug 2019 12:26:10 -0500
Received: from DLEE111.ent.ti.com (157.170.170.22) by DLEE115.ent.ti.com
	(157.170.170.26) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5;
	Fri, 30 Aug 2019 12:26:09 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DLEE111.ent.ti.com
	(157.170.170.22) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
	Frontend Transport; Fri, 30 Aug 2019 12:26:09 -0500
Received: from udd0866934.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])
	by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id x7UHQ9Pk117961;
	Fri, 30 Aug 2019 12:26:09 -0500
From: Jacob Stiffler <j-stiffler@ti.com>
To: <meta-arago@arago-project.org>
Date: Fri, 30 Aug 2019 13:08:05 -0400
Message-ID: <1567184885-17326-2-git-send-email-j-stiffler@ti.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1567184885-17326-1-git-send-email-j-stiffler@ti.com>
References: <1567184885-17326-1-git-send-email-j-stiffler@ti.com>
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: [master/thud][PATCH 2/2] arago-conf: configure ramfs for jailhouse linux-demo
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
X-List-Received-Date: Fri, 30 Aug 2019 17:27:13 -0000
Content-Type: text/plain

Signed-off-by: Jacob Stiffler <j-stiffler@ti.com>
---
 meta-arago-distro/conf/distro/arago.conf | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta-arago-distro/conf/distro/arago.conf b/meta-arago-distro/conf/distro/arago.conf
index ae151a7..770683b 100644
--- a/meta-arago-distro/conf/distro/arago.conf
+++ b/meta-arago-distro/conf/distro/arago.conf
@@ -125,6 +125,9 @@ PACKAGECONFIG_append_pn-u-boot-ti-staging_k3 = " optee"
 # Enable encryption support in open62541
 PACKAGECONFIG_append_pn-open62541 = " encrypt"
 
+# Configure RAMFS for jailhouse linux-demo
+JH_RAMFS_IMAGE = "arago-tiny-image"
+
 EXTRA_IMAGEDEPENDS_append_k3 += " u-boot-k3-r5 ti-sci-fw"
 
 # Enable UI and scripting for perf
-- 
2.7.4


