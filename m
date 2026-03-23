Return-Path: <j-sahu@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 92B22F46126
	for <webhook@archiver.kernel.org>; Mon, 23 Mar 2026 14:01:56 +0000 (UTC)
Received: from BL2PR02CU003.outbound.protection.outlook.com (BL2PR02CU003.outbound.protection.outlook.com [52.101.52.29])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.18265.1774274509418290510
 for <meta-arago@lists.yoctoproject.org>;
 Mon, 23 Mar 2026 07:01:49 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ti.com header.s=selector1 header.b=i4kZCinl;
 spf=permerror, err=parse error for token &{10 18 spf.protection.outlook.com}: limit exceeded (domain: ti.com, ip: 52.101.52.29, mailfrom: j-sahu@ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=pdoLajhx09TOBl2fisUTYnX/9dr8a0CwQ6NdQhCZrFExt2IS2AR0AW4bEBpjrrQnT18AKULAaE59YaytzOurSNg9b8+sFCWi0ffytsFryls174sk+nxgteNiNzvwOM6urP89jA9y2e31QTwHi+yosJTCOptHh1CBdJtrHn38dOxj7Pj9HKtCLSZqjVDIcT691CDD8AokRJb8j7Q4BMAoI/iRYLYBy36ZDHyrapTFUNHozjJ1QD4zd1pUh9wBXFaPKzHqf0aB6JOfCFKEMrJHO+bc2G9ktgR57Qe76wAPQ51gN8oBez6juVI3W4BY4OhtLcASrIxnI8v7M42U4qD1sg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BxAXoRYT32CRuaw/5NHRnSf6WD/hz5Ze7QEbBgJm7TI=;
 b=hY8fc6jBjnaX5GQcyzwVTOKJwtLVQqbRlVPkQW6RKMSB1wqIzjxE2FW8Wv9uMPaB1sN50ZK0rZYo0m+bY3neDK/wR7ejYQ+AOpnJME7bD10nW6ChVgmMaN2YHTQCP1iKihFh2jCChpJPTqEDFPuZpDP/zXkqDUs9iuJYQ2h1pdPECO1xNttUTmc4iK6WgpGuJSp3znAIwWRCRGBUqwI3il1lYeXqUkE5S65ZL+dTsy6igCgVeFnaVOWLg/mgnyy0j+32t4W4esk1/QIVM/z2wp4KGMT3Nceia4tnWZt+jaPE8iNL3FQJP6gmgv03LiK8eXJU77rTwyv4VMmzSXyKBg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.194) smtp.rcpttodomain=konsulko.com smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BxAXoRYT32CRuaw/5NHRnSf6WD/hz5Ze7QEbBgJm7TI=;
 b=i4kZCinlrDaRcZHYIDQ96c4EMeM+ENPRL2SghJ/loJLNNB9XugTV52+KFz4K9b0CC+gWacJNQ9HiIXAVzj2Xa8UX5vJUv1vBWA19/AW875AsSD6u2ndRcjF1v73AbJubEJlP3bqFak9ElmN2GxjOACHMwbGMEMZGQGssDfrynKM=
Received: from BL1PR13CA0437.namprd13.prod.outlook.com (2603:10b6:208:2c3::22)
 by DM3PPF83BEC1808.namprd10.prod.outlook.com (2603:10b6:f:fc00::c33) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9723.25; Mon, 23 Mar
 2026 14:01:47 +0000
Received: from BL02EPF0002992A.namprd02.prod.outlook.com
 (2603:10b6:208:2c3:cafe::f3) by BL1PR13CA0437.outlook.office365.com
 (2603:10b6:208:2c3::22) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9723.31 via Frontend Transport; Mon,
 23 Mar 2026 14:01:41 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.194; helo=flwvzet200.ext.ti.com; pr=C
Received: from flwvzet200.ext.ti.com (198.47.21.194) by
 BL02EPF0002992A.mail.protection.outlook.com (10.167.249.55) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9723.19 via Frontend Transport; Mon, 23 Mar 2026 14:01:45 +0000
Received: from DFLE208.ent.ti.com (10.64.6.66) by flwvzet200.ext.ti.com
 (10.248.192.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Mon, 23 Mar
 2026 09:01:22 -0500
Received: from DFLE206.ent.ti.com (10.64.6.64) by DFLE208.ent.ti.com
 (10.64.6.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Mon, 23 Mar
 2026 09:01:21 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DFLE206.ent.ti.com
 (10.64.6.64) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Mon, 23 Mar 2026 09:01:21 -0500
Received: from jeevan-HP-Z2-Tower-G9-Workstation-Desktop-PC.dhcp.ti.com (jeevan-hp-z2-tower-g9-workstation-desktop-pc.dhcp.ti.com [172.24.233.81])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 62NE1Jqa380851;
	Mon, 23 Mar 2026 09:01:20 -0500
From: Telukula Jeevan Kumar Sahu <j-sahu@ti.com>
To: <meta-arago@lists.yoctoproject.org>
CC: Ryan Eatmon <reatmon@ti.com>, Denys Dmytriyenko <denys@konsulko.com>
Subject: [meta-arago][master][PATCH 1/2] tisdk-bundle: Improve quote handling and add K3 firmware directory support
Date: Mon, 23 Mar 2026 19:24:41 +0530
Message-ID: <20260323135442.2056179-1-j-sahu@ti.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL02EPF0002992A:EE_|DM3PPF83BEC1808:EE_
X-MS-Office365-Filtering-Correlation-Id: 31c7db5f-f673-4ed1-c866-08de88e4b838
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|36860700016|82310400026|1800799024|18002099003|56012099003;
X-Microsoft-Antispam-Message-Info: 
	ZecgmAdBu1TO6pDAMst4jxq4tmq7EOXR5W4XeEaPqcF/KS3ppXZRAHPVN9Gj3v8uVg80BFMJT3yppmxgXAaP5hBs5nFNFZUErhBCv90sPJe15JJH6bKXj9nLCPhcm4qqhN8/HCGTX3P8ZOpHLZ7RTFOSNJDiT0VA5xM9jGI4hkcuHvZ2hd65RPy97uMFEWKfpTKZAMFMR2KneJ5/c9jYRub3eavCovYg7ojgYbtQtKrZgzWeWE0wsaP+wVwKjwC0ybWmznpuNkVFCSH1pUkIOQGO+6bAAvwYv9gpRlcfuooB8vZ6eUaDBxEqR/fgCUNm8oCX0XahmivHanhlf0JcttW9Jqcpib16yP/7vrmBSYIILnpZfbHpT3aPp/po5pkYNFuNJ0rqe5IkMjAbNFgARxBL4k0oT9OjoCu3jAOv2uKLhpw3tWDMt5gfEydCIhhvHYYPUVNj0JQqRH0IRPyc/8kIHbEKvRVI9AsPdazJLo2tkLmTjZpSFBg4RWdxZNcI4jVCTxoRiWTn3+e7MYc0ekLVrYMmajy/WqSHyrCJcoz79r+R3Vmb8t5OnfyAJjR3m/ZSAix1dM/SSM72F0h2ywkOrOjQr1Pvorx2IGqLTI0hzZytiVrM5ESoqoICaOMBqlL1d2p+YwhOEoruYbVUPuN5YzmZkcFtHRQeAzx54d1JIIg2MRBkPg0VXWgmaOUe/kIow4VpTAc9ifrtPs3rrstzNazNRy5yxnFjHazPfVoSw8Eo5iVYFHTkMHp5634wjMyfOSPYDg6h98GsKv7PQA==
X-Forefront-Antispam-Report: 
	CIP:198.47.21.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet200.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(376014)(36860700016)(82310400026)(1800799024)(18002099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	CQ6qXdTmUR6mZnKOqDlO7YD68jjiOFet6Sre93K/8ISKwzilCBvdJYmLVS2uyzhyCQk+0R7elO5XZEOnU1aeB+KaX4MWgVSj4ZP5gnCB9FXsNiYQjiW96/tnbDEmPViv+0tJTHyKoU5uu6bOxpRuTSAMObhVmjqA8E2pFBDNkRiY1AAVRGdQHElP0Rv259LuaEZsEJHGyUPluuC/l4E8CPkcOr99bHRqgKPRQJE90ayY/G23SuIBn5CYvKooDSQL8cRP6z9WO0XS/9zIOvv6bz3mZ0mhgsBD9qKuPfA4gvqpy63C7KEh1hH+iUo58pY//goeTvCy3MCUAKX0p6JiB8JDpgBHzvkD7f7n39zY5QNNtpS4C8UwpOxcb9qp+D7SBJS8z6101juND90Sd0xp6Gtr3adCr1CgerDmFSula1wOFkWeQAOA95YZHXYedOGH
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Mar 2026 14:01:45.6691
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 31c7db5f-f673-4ed1-c866-08de88e4b838
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.194];Helo=[flwvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	BL02EPF0002992A.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM3PPF83BEC1808
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Mon, 23 Mar 2026 14:01:56 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/17418

Fix quote handling for wildcard pattern expansion in SPL and image copy loo=
ps
to properly handle filenames with spaces and glob patterns.

Also, add support for copying ti-sysfw, ti-dm, and ti-hsm directories neede=
d
by binman builds for K3 u-boot

Signed-off-by: Telukula Jeevan Kumar Sahu <j-sahu@ti.com>
---
 .../classes/tisdk-bundle.bbclass              | 37 +++++++++++++++++--
 1 file changed, 33 insertions(+), 4 deletions(-)

diff --git a/meta-arago-distro/classes/tisdk-bundle.bbclass b/meta-arago-di=
stro/classes/tisdk-bundle.bbclass
index 24146529..4033f9a2 100644
--- a/meta-arago-distro/classes/tisdk-bundle.bbclass
+++ b/meta-arago-distro/classes/tisdk-bundle.bbclass
@@ -221,9 +221,10 @@ tisdk_image_build () {
     for spl_name in ${DEPLOY_SPL_NAME}
     do
         # Copy the SPL image if it exists
-        if [ -e ${DEPLOY_DIR_IMAGE}/$spl_name ]
+        set -- ${DEPLOY_DIR_IMAGE}/$spl_name
+        if [ -e "$1" ]
         then
-            cp ${DEPLOY_DIR_IMAGE}/$spl_name ${prebuilt_dir}/
+            cp "$@" ${prebuilt_dir}/
         else
             echo "Could not find the SPL image \"$spl_name\""
             return 1
@@ -232,9 +233,10 @@ tisdk_image_build () {
=20
     for image_name in ${DEPLOY_IMAGES_NAME}
     do
-        if [ -e ${DEPLOY_DIR_IMAGE}/$image_name ]
+        set -- ${DEPLOY_DIR_IMAGE}/$image_name
+        if [ -e "$1" ]
         then
-            cp ${DEPLOY_DIR_IMAGE}/$image_name ${prebuilt_dir}/
+            cp "$@" ${prebuilt_dir}/
         else
             echo "Could not find image \"$image_name\""
             return 1
@@ -259,6 +261,33 @@ tisdk_image_build () {
         fi
     fi
=20
+    # Copy ti-sysfw needed by binman builds for u-boot
+    if [ -d "${DEPLOY_DIR_IMAGE}/ti-sysfw" ] && [ -n "${SYSFW_BINARY}" ]
+    then
+        mkdir -p ${prebuilt_dir}/ti-sysfw/
+        for firmware_name in ${SYSFW_BINARY}
+        do
+            set -- ${DEPLOY_DIR_IMAGE}/ti-sysfw/$firmware_name
+            if [ -e "$1" ]
+            then
+                cp "$@" ${prebuilt_dir}/ti-sysfw/
+            fi
+        done
+    fi
+
+    # Copy ti-dm needed by binman builds for u-boot
+    if [ -d "${DEPLOY_DIR_IMAGE}/ti-dm" ]
+    then
+        cp -r ${DEPLOY_DIR_IMAGE}/ti-dm ${prebuilt_dir}/
+    fi
+
+    # Copy ti-hsm needed by binman builds for u-boot
+    if [ -d "${DEPLOY_DIR_IMAGE}/ti-hsm" ]
+    then
+        mkdir -p ${prebuilt_dir}/ti-hsm/
+        cp ${DEPLOY_DIR_IMAGE}/ti-hsm/* ${prebuilt_dir}/ti-hsm/
+    fi
+
     # Add the EXTRA_TISDK_FILES contents if they exist
     # Make sure EXTRA_TISDK_FILES is not empty so we don't accidentaly
     # copy the root directory.
--=20
2.34.1


