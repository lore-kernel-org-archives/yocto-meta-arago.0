Return-Path: <t-lannynd@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C5479EB3638
	for <webhook@archiver.kernel.org>; Mon,  2 Mar 2026 20:55:01 +0000 (UTC)
Received: from CH4PR04CU002.outbound.protection.outlook.com (CH4PR04CU002.outbound.protection.outlook.com [40.107.201.45])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.2426.1772484898165440784
 for <meta-arago@lists.yoctoproject.org>;
 Mon, 02 Mar 2026 12:54:58 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ti.com header.s=selector1 header.b=F0LD3dXz;
 spf=permerror, err=parse error for token &{10 18 spf.protection.outlook.com}: limit exceeded (domain: ti.com, ip: 40.107.201.45, mailfrom: t-lannynd@ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=LDGUZXKMHUSjcmpI7ztM7MOb+rQ25llabs41lMPxUWd64pQZ/qL60WJRDwieQctGp+mxJMbpQxsA5Cy7R7FJbByhj7Ky9GGblwwhWZydPv2fNTyAkQxNytjWmGHb+GLVLuIXenLEzOX3neZPQVA7705Pnnn9Mxm5RT1V7x4OYhxrwXbRnwtQ9a1JaCZCnQGqsa2+smIMC0HVU53Yw4lqkmHlWx+a2ZmW0h3htcbl83RQKezGzmI1OhOA5/jYbL4IasSwG3g9lPpX+vBfrnCrGMbXOIY6vSwTyly7PJlfF3zryGlb5Pk3Kp2Uhq8CwmzY/7/9+s5OGlg+05BCcYAHGA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZnQu0kwsT3BoBNWO2BSXb7W2+x6PEsgZYlS9MRdaatQ=;
 b=uAyrcoJ50VraXs69lQMG/tR42Av4COvINVwgWBSVLgdRh43Zl/xKPFUAHaa2PF/yUUcYFXsTeO2/PFW2CQ8lc4JzgtI8zp0PMX1b3puyLQbr0jcpe+1qU3NJ2GiOJOG9FDZp5xF235RjpbiIqiHG8M4XtUVQDRxFgA5J5a/eUEnEtglhlv6VsGfPPGDmxbgcL7XdfwdmxDBFnaCIMfi0iBYvY/FO3/gUB9eXZX5f6kwbUoDi+FJPC5qRpZdb66Wet9CE6tq9LIxX36inazPsh6JGjk+mp16aSggyXlJG1xapN45IX8q7bYENw5Y5l/vN70Iv2Ki8nYdwX1ztEwVBaQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.195) smtp.rcpttodomain=lists.yoctoproject.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZnQu0kwsT3BoBNWO2BSXb7W2+x6PEsgZYlS9MRdaatQ=;
 b=F0LD3dXzZUKb2IuHAqZCisfSnJJWsntFUU8HCp2w1WeE1lbNHV+gC3ckH1uQPVwsHAiktIEbwbWSZhYd+EHrDL+OPMi1Qo1XDPvHghoJWt6rPgOfsCQ4bMrUo74CuKDIE8talDkOivpwV0MQ0tBiZBJFPES5K2NGaXPzLaCxA9A=
Received: from PH1PEPF000132F2.NAMP220.PROD.OUTLOOK.COM (2603:10b6:518:1::35)
 by MW5PR10MB5737.namprd10.prod.outlook.com (2603:10b6:303:190::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9654.20; Mon, 2 Mar
 2026 20:54:55 +0000
Received: from CY4PEPF0000EE39.namprd03.prod.outlook.com
 (2a01:111:f403:f910::2) by PH1PEPF000132F2.outlook.office365.com
 (2603:1036:903:47::3) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9654.21 via Frontend Transport; Mon,
 2 Mar 2026 20:54:53 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.195; helo=flwvzet201.ext.ti.com; pr=C
Received: from flwvzet201.ext.ti.com (198.47.21.195) by
 CY4PEPF0000EE39.mail.protection.outlook.com (10.167.242.11) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9654.16 via Frontend Transport; Mon, 2 Mar 2026 20:54:52 +0000
Received: from DFLE204.ent.ti.com (10.64.6.62) by flwvzet201.ext.ti.com
 (10.248.192.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Mon, 2 Mar
 2026 14:54:46 -0600
Received: from DFLE211.ent.ti.com (10.64.6.69) by DFLE204.ent.ti.com
 (10.64.6.62) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Mon, 2 Mar
 2026 14:54:46 -0600
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DFLE211.ent.ti.com
 (10.64.6.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Mon, 2 Mar 2026 14:54:46 -0600
Received: from udba0500997.dhcp.ti.com (udba0500997.dhcp.ti.com [128.247.81.190])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 622Kskwi921778;
	Mon, 2 Mar 2026 14:54:46 -0600
From: Thorsten Lannynd <t-lannynd@ti.com>
To: <meta-arago@lists.yoctoproject.org>
CC: <detheridge@ti.com>, <b-brnich@ti.com>, <a-christidis@ti.com>
Subject: [meta-arago][master][PATCH 1/4] meta-arago-test: Add curl-cffi  recipe
Date: Mon, 2 Mar 2026 14:54:33 -0600
Message-ID: <20260302205436.1117890-1-t-lannynd@ti.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000EE39:EE_|MW5PR10MB5737:EE_
X-MS-Office365-Filtering-Correlation-Id: 7d1cff2b-b568-4850-3493-08de789df3af
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|82310400026|376014|1800799024|34020700016|36860700013;
X-Microsoft-Antispam-Message-Info: 
	kiQn1nq3PUWBQ4bnBb1IDEgEADaT/lBRYkoeKZ8iwGMfRl9g9EgAkGSo+rFYRgPkPmecw4Brw6OgxHFS4l+xauR8IqHzcTNaCDHeeldNV+VeurIuOHKLT0A6DHO0+9wefZFlMoDYrmXcMykbXxo9cNgF8ewnqaGcgT5HrbAYpHtdDVZMMNF6XjNIiZusagOnslsC7RP3SKdGPwKN93go22FpncPx+2a9hFRlzQZDUmyNCR2/ylQIGQAuOgn0CVLE5a4ubvVvRBgEAql5vHT5ROCFvGaU0HSFHb89by/RzSpA0UCBt7yGgU4uV+55Y8ZYaTOGCSD/lQG+JC4btbVFTcgH+7HgdvlKA/ZaqxpPtUQl8JMPI9q1poXy2aS6bTXY8x8RY/yjfefrEuz1h9ks+z3lSheZoORBCOH1Vd59+1RzJldizzqsB7VUhuiwk0oMp9i+JQyTEIpChKSrw5owRktyyp0hkI8KlBFbFN0XO46r0sSBbxEVEYw3T7HtxzKi5HF+o2B4Fehx3nCxsierNIN2m3xbqpYJKzrVTHEa8qdL40rphhgNRcekOr45xbsK0AASDt78+W+bNL1E0k6jZZJI8JvYyV0qRe0q9DetsszE+Q3XnlVF2wiHd/CQfbVK7cIe/tzZ9iI2LfSlg75g8c5o0WE/vpBLAokqYWqg9x7srDVhR0TqaQSWlcWS5p05e5T0+zoWcwbwAT8hGK2lHBnZWNDwdvec+udRGAAJkigXyPSoom1V5fHjgblxqHqih+qZE2/W1vcNwlei/E0etRpRRKGva6slPGX32a3C5mc=
X-Forefront-Antispam-Report: 
	CIP:198.47.21.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet201.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(82310400026)(376014)(1800799024)(34020700016)(36860700013);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	mpI0dq4JMU3feZ9S9uSm9lH7lBokUP9xiu0ZR4KgdJVrG487xdkSqblfIDCGsuTC4jIB48ZKws2fT3s9DUt5BYCd2dJBZBSMw2ZQG+CF8fEDuPrm7AlLibJisn2ruIWmq5CZDAb8V13l7KcIiBeHlxQbDUDnfES/CZroNQjH0+v0Sqk6tDxBzSAekz2tJ5PT58Dr9VYh5XfQ4wUp+WwF/YMEnYqPDSSHu1eET4qXJYUgBSVpW6Kxm9/O+SR6lAa3DhSyDPpeNS/EbGxRXt8lcKXhb6pzN3H+r1qHZqSssw6L9sJw6s2YeMrqDX7jVClh7lMQQsa87Id46tVR72/QTYQufqjwuQz+AAuVfGxz0eFt8bKpxH6wAcjSr4cxhW3qpLRghNtbawPkl/Pi/pPZ05P9STE7/hITpTqVLw1lb7sGDcpfPoH2UmvIqRhxTo1K
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Mar 2026 20:54:52.5851
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 7d1cff2b-b568-4850-3493-08de789df3af
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.195];Helo=[flwvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	CY4PEPF0000EE39.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW5PR10MB5737
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Mon, 02 Mar 2026 20:55:01 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/17179

Add curl-cffi 0.14.0, a Python library for implementing curl-impersonate to
bypass TLS fingerprinting.

This package enables Python applications to impersonate browser TLS
signatures and JA3 fingerprints.

Note: Build shows deprecation warnings from curl-cffi's upstream
pyproject.toml. These do not affect functionality.

Signed-off-by: Thorsten Lannynd <t-lannynd@ti.com>
---
 .../python3-curl-cffi/curl-cffi_0.14.0.bb     | 31 +++++++++++++++++++
 1 file changed, 31 insertions(+)
 create mode 100644 meta-arago-test/recipes-graphics/python3-curl-cffi/curl=
-cffi_0.14.0.bb

diff --git a/meta-arago-test/recipes-graphics/python3-curl-cffi/curl-cffi_0=
.14.0.bb b/meta-arago-test/recipes-graphics/python3-curl-cffi/curl-cffi_0.1=
4.0.bb
new file mode 100644
index 00000000..791a79bd
--- /dev/null
+++ b/meta-arago-test/recipes-graphics/python3-curl-cffi/curl-cffi_0.14.0.b=
b
@@ -0,0 +1,31 @@
+SUMMARY =3D "Python binding for curl-impersonate via cffi"
+
+DESCRIPTION =3D "curl_cffi is a Python library for implementing curl-imper=
sonate in Python. Unlike requests/httpx it can impersonate browsers' TLS si=
gnatures or JA3 fingerprints."
+
+HOMEPAGE =3D "https://github.com/lexiforest/curl_cffi"
+
+LICENSE =3D "MIT"
+LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3Dfd472d9f299a79040ca2acc5d42a1e3=
8"
+
+DEPENDS +=3D " \
+    python3-cffi-native \
+    python3-cffi \
+"
+
+RDEPENDS:${PN}:append =3D " python3-cffi python3-certifi"
+
+SRC_URI +=3D "https://github.com/lexiforest/curl-impersonate/releases/down=
load/v1.2.5/libcurl-impersonate-v1.2.5.aarch64-linux-gnu.tar.gz;name=3Dlibc=
url;unpack=3D0"
+
+SRC_URI[sha256sum] =3D "5ffbc82e59f05008ec08ea432f0e535418823cda44178ee518=
906a54f27a5f0f"
+SRC_URI[libcurl.sha256sum] =3D "a7c4fc4aad556a7b44b9896432d170380c64651fea=
a9cc44a773f8233efc79d2"
+
+PYPI_PACKAGE =3D "curl_cffi"
+
+export CI =3D "1"
+
+do_compile:prepend() {
+    mkdir -p ${S}/tmplibdir
+    tar -xzf ${WORKDIR}/sources/libcurl-impersonate-v1.2.5.aarch64-linux-g=
nu.tar.gz -C ${S}/tmplibdir
+}
+
+inherit pypi python_setuptools_build_meta
--=20
2.34.1


