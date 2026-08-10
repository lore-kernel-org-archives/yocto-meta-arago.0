Return-Path: <s-joshi@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 13156C5AD4E
	for <webhook@archiver.kernel.org>; Mon, 10 Aug 2026 05:49:23 +0000 (UTC)
Received: from mx0b-0002e601.pphosted.com (mx0b-0002e601.pphosted.com [148.163.154.28])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.23572.1786340955729867834
 for <meta-arago@lists.yoctoproject.org>;
 Sun, 09 Aug 2026 22:49:16 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=proofpoint-05-2026 header.b=dptxdJqL;
 dkim=pass header.i=@ti.com header.s=selector1 header.b=TRG0yKl9;
 spf=pass (domain: ti.com, ip: 148.163.154.28, mailfrom: s-joshi@ti.com)
Received: from pps.filterd (m0374956.ppops.net [127.0.0.1])
	by mx0b-0002e601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67A5JlWV1741929
	for <meta-arago@lists.yoctoproject.org>; Mon, 10 Aug 2026 00:49:14 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=cc
	:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=proofpoint-05-2026; bh=w0BSxAPnjB/MF
	ik/t5+0xXaGlzweQDGZv6lKZw52c+w=; b=dptxdJqLF65HVEHYAHMnTFiYUH5vx
	0kaq+3EPKbUFPAoZoqbpNHRckfcGS3QCLqEmyWX01EwJHDdFJIjprUInjBZDtGa1
	hpEBpw3age4lc4awt/9UrU5CzUggaZodvosrdsqDIBJZ/1JiHoeg0gNT808YQibu
	bgJQrOKhZHFoEC436w81t6ffd20R3FIbezrULuNCQESFEsgvt+SEYaNxS/yjQawR
	sX9fX2G1qo5rZ1pUMCOljRBfjspGZXcI2xSGZvD20kLu9DtikhqvkGpRPzZGGrJC
	fs4Tsm5UoyWJk5AgvKv/Xs/BSOv6m9UetWXtGrrIidaQJ3jxxlxQYvKcQ==
Received: from byapr05cu005.outbound.protection.outlook.com (mail-westusazon11010007.outbound.protection.outlook.com [52.101.85.7])
	by mx0b-0002e601.pphosted.com (PPS) with ESMTPS id 4fxkkpchj5-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <meta-arago@lists.yoctoproject.org>; Mon, 10 Aug 2026 00:49:14 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Upwtne59McscISr94q+dSBqGMKd+36VenuIefRErYsP3K5IdLkEIS/kyl2ZfPtxz6d/f6JzBOmztGQ5SGWnvg1NYsLBP4Ka/W6boMF4If03cyVzAs8vdKxFtzfdgem8L1iauIQJvRrsGUAqu03nca0f2VZUODCgbYYNgzHVs1cMrO1MDy6bbDXKio6z2HzEnphnlEeBotdkZfvnLNHAtvy0s8gGDaFJXe02ld8cR0V+EaUQR8WfbPm1WwoHq5e2XMFmZjNZfck3ftpahCiN9AIdt5EkUASNBbdhH6k1YWILjJmJn8uYUR0dp/hM+C27drqqDb6jVuS7xvFyj+nRYyw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=w0BSxAPnjB/MFik/t5+0xXaGlzweQDGZv6lKZw52c+w=;
 b=pB4YlH041mmtchNZB1s7yTyIoEJSmLhVS1I6wIvwKXyjCnqxONW4hXAlTy6L6lONe8as2tqrSZ7CpSU9rSMsmqH+kxYnSpILDRROJuZ9TNTMLxzoUDxmQTwGAgbvG7IXd6dNu0sJpFdF0r79FbFCFKJll08RsvSXK73XgW+659FQn5077qRpEVhTsdB/8ScrXHxwKdXIzhCJQMFyuTVq5yH4B9/Yhp1nY8da1li4UHJn9tj8AlOlo54PmGRI9uy8w8Qm92zTEko9dH1SMHA7PfP4C9aQobXiz/llyIcEV+ZqVtPb86DlZLTqpeOahb2Srs1G+SaMKYWA/FUJoffXew==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.194) smtp.rcpttodomain=lists.yoctoproject.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=w0BSxAPnjB/MFik/t5+0xXaGlzweQDGZv6lKZw52c+w=;
 b=TRG0yKl9P0Ks9TyH+ImOKPiKdVa5dAINiF73jxkFqfmpn96A1nHIwyr4+VYehWeXweuOwrFvqtGOyl77wLD/6GTzQqkPkHv8GBZLwratnpidi57jT7Yq+RNUlS13kAnf88/QQK176EQKIJ+HplmemW9W14Yk8DdaC7Ql7RXFYtI=
Received: from SJ0PR13CA0003.namprd13.prod.outlook.com (2603:10b6:a03:2c0::8)
 by CH3PR10MB6903.namprd10.prod.outlook.com (2603:10b6:610:151::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.292.25; Mon, 10 Aug
 2026 05:49:08 +0000
Received: from SJ1PEPF00002310.namprd03.prod.outlook.com
 (2603:10b6:a03:2c0:cafe::4f) by SJ0PR13CA0003.outlook.office365.com
 (2603:10b6:a03:2c0::8) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.315.11 via Frontend Transport; Mon,
 10 Aug 2026 05:49:08 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.194; helo=lewvzet200.ext.ti.com; pr=C
Received: from lewvzet200.ext.ti.com (198.47.23.194) by
 SJ1PEPF00002310.mail.protection.outlook.com (10.167.242.164) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.315.6 via Frontend Transport; Mon, 10 Aug 2026 05:49:08 +0000
Received: from DLEE215.ent.ti.com (157.170.170.118) by lewvzet200.ext.ti.com
 (10.4.14.103) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Mon, 10 Aug
 2026 00:49:07 -0500
Received: from DLEE206.ent.ti.com (157.170.170.90) by DLEE215.ent.ti.com
 (157.170.170.118) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Mon, 10 Aug
 2026 00:49:07 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DLEE206.ent.ti.com
 (157.170.170.90) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37 via Frontend
 Transport; Mon, 10 Aug 2026 00:49:07 -0500
Received: from localhost (ula0507357.dhcp.ti.com [10.24.52.150])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 67A5n6Iu1816142;
	Mon, 10 Aug 2026 00:49:06 -0500
From: Suhaas Joshi <s-joshi@ti.com>
To: <meta-arago@lists.yoctoproject.org>
CC: <s-tripathi1@ti.com>, <k-malarvizhi@ti.com>, <kamlesh@ti.com>,
        <vishalm@ti.com>, <reatmon@ti.com>, <j-sahu@ti.com>, <y-hegde@ti.com>
Subject: [oe-layersetup][master][PATCH] processor-sdk: Add luks config for Sitara SDK 12.01 release
Date: Mon, 10 Aug 2026 11:18:28 +0530
Message-ID: <20260810054828.2384527-1-s-joshi@ti.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF00002310:EE_|CH3PR10MB6903:EE_
X-MS-Office365-Filtering-Correlation-Id: 391927cd-e6a0-460a-759f-08def6a31860
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|23010399003|82310400026|36860700016|1800799024|376014|13003099007|20052099010|18002099003|56012099006|10067099003|3023799007|6133799003;
X-Microsoft-Antispam-Message-Info: 
	NShOP3vu3ViQUshnlU3A5CRy9qHhrFnbhgFoUfNypXe95nqjgV6uQX7uZLnd9Z8sTB+94BPq/qH+CMB5nSytbe48amXRCvjjNc4s2eS5ue8MBN52KDKefbbYNsNs6Ui2wInbHliqT4CvRAihLyj7O3khBRMYqemEBkFUg7H/FPSrCgrZUe+6i7JuM4vwGi2I8u+vl3b2qu4gVhmBtxlvtTkzgD+qks6JtD5PuaDPowQ090vCAy+QF3S1xzWeM4oKEFQEs9HWyNQgEZaypWLQQW+l2sNStF2NOTI0/OWU70BsKgSkWWUiGy8EJJCu+DIspuBBXxXn9TNoKYnmFCFjJBaqUzGOQurNMXjFimvEHzViCYflMSVubxDGI3TU++bhEmaixMt4xUwu9bmr4gJHFY0SxJX3W5M4wSlyhHsuMviCFm+FvjUmyfmPo9I4hi7X8S+KMXzIxz6DaECsj06uA7eJSAJEJSzokbYAC9zbtD6BhIVgJhRXHyMvmD9NO9foIPiuiwrq3uca4VDnanMdMNoCeQCXqWP0jMsyiE3qUNwF0Vyp1zN85DhuW1T4IVcq3xnldNic/ovmEkO6mAGt6KE7NzQinapg4V+t+92B2p4Y7hK/+nrvmNA/ow/rSOD1AI2EyJ7BPFHlRO7Ty3LhJQ==
X-Forefront-Antispam-Report: 
	CIP:198.47.23.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet200.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(23010399003)(82310400026)(36860700016)(1800799024)(376014)(13003099007)(20052099010)(18002099003)(56012099006)(10067099003)(3023799007)(6133799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	auj6/+022h2R4xwgiTt4yp+QFU7pGp9ApWOEV6+dor9agf0rWEBLDNXZPl7FbYIqghDVcUKPiS5NaPJWGbjhGWEa7NYjPH8mW+4IIUEJouZzfe6047/+ChOt3JI81jFrOdGmiJEROW79R9MgDVjflKxfdPLlc79bTbiHPEf9k8OZZ00ttnosQhr9v8iAPhe15BkVdKETOho1TJehgtccsP5KQtdZpQXdMXj+mGaE0hnU40AFrZaBz1nj/Vbw1oTaMmPfrbLa0Z2ORjGmzcT5D0191fjGfzKNdnrxLUhfxRgzB36uGKfW6tK5m0+mH34h0jUHml4Crm8fhmu8gHz1x0EiOBlqjs9+T97vGgnTiFgLZSWCm/lJpQ2DjNMgJWEllACyA1+8cArL0Y0/JfXESK/wfh8vEoYXIYdrfcOwuCtO2EpW18u+VjrNvE9MgIa+
X-Exchange-RoutingPolicyChecked: 
	TR53gBWBCS5MytQKWosZ5Fimspk1TgT+nHe5zSIq3EsKdCs7JpRSXDz/TwQZNKNvlcjN8y3Aytp3IgXy+jv1KtjRcvD63/FmGzv+J34efeKMGYWb7XHrSE9UemattKzLKrH1MwL9HGbcxXcrozyfegKvQ1DBdWAtq/cbNfZT/6pA+2q7HACAeruz11EDUQR271LazepyjR1Xhk+4Td8AZHWzF616RwbhZcZcU17X84g5T0rOr4AErhh142XbV1ZGtTHy6U360oTCZE55bmXCsELfi1g8at+X6Eunv5P/lUoO+aG0ix2kZdrISQX/PXaQBxieno8EFCmygidk+ux24A==
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Aug 2026 05:49:08.1016
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 391927cd-e6a0-460a-759f-08def6a31860
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.194];Helo=[lewvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	SJ1PEPF00002310.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR10MB6903
X-Authority-Analysis: v=2.4 cv=UvpT8ewB c=1 sm=1 tr=0 ts=6a79665a cx=c_pps
 a=x36oJTDjInEio3y4qvlK/w==:117 a=WotqVVQAdb04rnGuttW3Kw==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=Sv0fKeRqtYgA:10 a=s63m1ICgrNkA:10
 a=V5UXEbMT0ywA:10 a=VkNPw1HP01LnGYTKEx00:22 a=Z8NIEmU8O1QQgoT56wFK:22
 a=jwouBfj2j3NM8CExmVVE:22 a=sozttTNsAAAA:8 a=Q4-j1AaZAAAA:8 a=NEAV23lmAAAA:8
 a=iGHA9ds3AAAA:8 a=WNDY76dxAAAA:8 a=SSmOFEACAAAA:8 a=IYaVakXwgeXXf1lTqAkA:9
 a=9H3Qd4_ONW2Ztcrla5EB:22 a=nM-MV4yxpKKO9kiQg6Ot:22 a=HFDSX3BADwN2sFIQuyTb:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODEwMDA0NyBTYWx0ZWRfX2Tes8RoiZRLT
 YCICaQNMrk6PWMX8t/R6IAKHv+HaNYAbMEp5dRs+dwQVtFNx8qhtctg754gsE5DTJyred1zE0Wn
 +JAZaUiS4hJpntW17GeXZhnyJ87+dvlkF8XOLp31dEYtw9rM459VKtpCQxkf7Z+xyBJBig+nTKY
 xgZd0QBijmWdiRo4UltvKi9ewFvfw4pUJQY9B5m2RbQrHcIj4ZkcrH7gqnebIH7M7OcTWyrRI5F
 xdXNM4/XIVidRUYOywbDbWSxbXXGgJCrzgCA+FFBBiOmAB7oh3bUT0og4Bgk43B4tPLAv2vKxs8
 hnt+E89t9HGMzPbEUI3OKVSQ6tLUl4Un5rM2YmFD1EYwU0oaXtiBl6g8OxB5nTCJDNAaxQ4/lVA
 a+d66rld2Kw+PjthNqAXypFzuU7KU6AD8bcBZGmI2C1OQqggssPi0eM9ANweF9+CLC4VLeM/Zel
 z4idF7SK70RvkfqOQOA==
X-Proofpoint-ORIG-GUID: CJEEiC2PTWYiu4XNmcDnMjrLyjKMv_KI
X-Proofpoint-Spam-Info: AW1haW4tMjYwODEwMDA0NyBTYWx0ZWRfX2N7d+QW7T2gP
 RavRhlxTK38wXSZHXRGLExsLCO5ZCY9Nq0AyffAOxRVkx9SzW9S2q8OT41tE+llVImoIgCk5Qjm
 nhzcdujdRMTv3zvRraCKpouejXIOr/s=
X-Proofpoint-GUID: CJEEiC2PTWYiu4XNmcDnMjrLyjKMv_KI
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-10_01,2026-08-07_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 lowpriorityscore=0 adultscore=0 priorityscore=1501
 impostorscore=0 malwarescore=0 clxscore=1011 phishscore=0 spamscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608100047
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Mon, 10 Aug 2026 05:49:23 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/17600

Add processor-sdk-wrynose-luks-12.01.00.05.03-config.txt used for
building the SDK with luks disk encryption, spported for AM62X, AM62P,
AM62L and AM64X.

Signed-off-by: Suhaas Joshi <s-joshi@ti.com>
---
 ...ynose-luks-12.01.00.05.03-config.conf.json | 147 ++++++++++++++++++
 ...dk-wrynose-luks-12.01.00.05.03-config.conf |   4 +
 ...sdk-wrynose-luks-12.01.00.05.03-config.txt |  21 +++
 ...sdk-wrynose-luks-12.01.00.05.03-config.yml | 100 ++++++++++++
 ...sdk-wrynose-luks-12.01.00.05.03-config.xml |  85 ++++++++++
 5 files changed, 357 insertions(+)
 create mode 100644 bitbake-setup/processor-sdk/processor-sdk-wrynose-luks-12.01.00.05.03-config.conf.json
 create mode 100644 conf/fragments/localconf/configs/processor-sdk/processor-sdk-wrynose-luks-12.01.00.05.03-config.conf
 create mode 100644 configs/processor-sdk/processor-sdk-wrynose-luks-12.01.00.05.03-config.txt
 create mode 100644 kas/processor-sdk/processor-sdk-wrynose-luks-12.01.00.05.03-config.yml
 create mode 100644 src/configs/processor-sdk/processor-sdk-wrynose-luks-12.01.00.05.03-config.xml

diff --git a/bitbake-setup/processor-sdk/processor-sdk-wrynose-luks-12.01.00.05.03-config.conf.json b/bitbake-setup/processor-sdk/processor-sdk-wrynose-luks-12.01.00.05.03-config.conf.json
new file mode 100644
index 0000000..09cffb4
--- /dev/null
+++ b/bitbake-setup/processor-sdk/processor-sdk-wrynose-luks-12.01.00.05.03-config.conf.json
@@ -0,0 +1,147 @@
+{
+  "version": "1.0",
+  "description": "TI Processor SDK vwrynose-luks-12.01.00.05.03",
+  "sources": {
+    "oe-layersetup": {
+      "git-remote": {
+        "remotes": {
+          "origin": {
+            "uri": "https://git.ti.com/git/arago-project/oe-layersetup.git"
+          }
+        },
+        "rev": "master"
+      },
+      "path": "oe-layersetup"
+    },
+    "bitbake": {
+      "git-remote": {
+        "remotes": {
+          "origin": {
+            "uri": "https://git.openembedded.org/bitbake"
+          }
+        },
+        "rev": "2.18"
+      },
+      "path": "bitbake"
+    },
+    "meta-tisdk": {
+      "git-remote": {
+        "remotes": {
+          "origin": {
+            "uri": "https://github.com/TexasInstruments/meta-tisdk.git"
+          }
+        },
+        "rev": "wrynose"
+      },
+      "path": "meta-tisdk"
+    },
+    "meta-arago": {
+      "git-remote": {
+        "remotes": {
+          "origin": {
+            "uri": "https://git.yoctoproject.org/meta-arago"
+          }
+        },
+        "rev": "wrynose"
+      },
+      "path": "meta-arago"
+    },
+    "meta-qt6": {
+      "git-remote": {
+        "remotes": {
+          "origin": {
+            "uri": "https://code.qt.io/yocto/meta-qt6.git"
+          }
+        },
+        "rev": "6.11"
+      },
+      "path": "meta-qt6"
+    },
+    "meta-virtualization": {
+      "git-remote": {
+        "remotes": {
+          "origin": {
+            "uri": "https://git.yoctoproject.org/meta-virtualization"
+          }
+        },
+        "rev": "wrynose"
+      },
+      "path": "meta-virtualization"
+    },
+    "meta-openembedded": {
+      "git-remote": {
+        "remotes": {
+          "origin": {
+            "uri": "https://git.openembedded.org/meta-openembedded"
+          }
+        },
+        "rev": "wrynose"
+      },
+      "path": "meta-openembedded"
+    },
+    "meta-ti": {
+      "git-remote": {
+        "remotes": {
+          "origin": {
+            "uri": "https://git.yoctoproject.org/meta-ti"
+          }
+        },
+        "rev": "wrynose"
+      },
+      "path": "meta-ti"
+    },
+    "meta-arm": {
+      "git-remote": {
+        "remotes": {
+          "origin": {
+            "uri": "https://git.yoctoproject.org/meta-arm"
+          }
+        },
+        "rev": "wrynose"
+      },
+      "path": "meta-arm"
+    },
+    "oe-core": {
+      "git-remote": {
+        "remotes": {
+          "origin": {
+            "uri": "https://git.openembedded.org/openembedded-core"
+          }
+        },
+        "rev": "wrynose"
+      },
+      "path": "oe-core"
+    },
+    "meta-security": {
+      "git-remote": {
+        "remotes": {
+          "origin": {
+            "uri": "https://git.yoctoproject.org/meta-security"
+          }
+        },
+        "rev": "wrynose"
+      },
+      "path": "meta-security"
+    }
+  },
+  "bitbake-setup": {
+    "configurations": [
+      {
+        "name": "arago",
+        "description": "TI Arago distro build",
+        "bb-layers": [ "meta-tisdk/meta-ti-foundational","meta-tisdk/meta-ti-ml","meta-arago/meta-arago-distro","meta-arago/meta-arago-extras","meta-qt6","meta-virtualization","meta-openembedded/meta-networking","meta-openembedded/meta-python","meta-openembedded/meta-oe","meta-openembedded/meta-gnome","meta-openembedded/meta-filesystems","meta-openembedded/meta-multimedia","meta-ti/meta-ti-test","meta-ti/meta-ti-extras","meta-ti/meta-beagle","meta-ti/meta-ti-bsp","meta-arm/meta-arm","meta-arm/meta-arm-toolchain","oe-core/meta","meta-security/meta-tpm","oe-layersetup" ],
+        "oe-fragments": [ "oe-layersetup/localconf/local-arago64-v3", "oe-layersetup/localconf/configs/processor-sdk/processor-sdk-wrynose-luks-12.01.00.05.03-config.conf" ],
+        "oe-fragments-one-of": {
+          "machine": {
+            "description": "Available target machines",
+            "options": [ "machine/am335x-evm","machine/am335x-hs-evm","machine/am437x-evm","machine/am437x-hs-evm","machine/am57xx-evm","machine/am57xx-hs-evm","machine/am62xx-evm","machine/am62xx-lp-evm","machine/am62xxsip-evm","machine/am62axx-evm","machine/am62dxx-evm","machine/am62lxx-evm","machine/am62pxx-evm","machine/am64xx-evm","machine/am65xx-evm","machine/am65xx-hs-evm","machine/am68-sk","machine/am69-sk","machine/beagle-x15","machine/beaglebone","machine/beaglebone-ai64","machine/beagleplay","machine/beagleplay-ti","machine/beagley-ai","machine/j7-evm","machine/j7-hs-evm","machine/j721e-evm","machine/j721e-sk","machine/j7200-evm","machine/j7200-hs-evm","machine/j721s2-evm","machine/j721s2-hs-evm","machine/j742s2-evm","machine/j784s4-evm","machine/j784s4-hs-evm","machine/j722s-evm","machine/pocketbeagle2" ]
+          },
+          "distro": {
+            "description": "Available distributions",
+            "options": [ "distro/arago" ]
+          }
+        }
+      }
+    ]
+  }
+}
diff --git a/conf/fragments/localconf/configs/processor-sdk/processor-sdk-wrynose-luks-12.01.00.05.03-config.conf b/conf/fragments/localconf/configs/processor-sdk/processor-sdk-wrynose-luks-12.01.00.05.03-config.conf
new file mode 100644
index 0000000..cd6635d
--- /dev/null
+++ b/conf/fragments/localconf/configs/processor-sdk/processor-sdk-wrynose-luks-12.01.00.05.03-config.conf
@@ -0,0 +1,4 @@
+BB_CONF_FRAGMENT_SUMMARY = "Config specific overrides for processor-sdk/processor-sdk-wrynose-luks-12.01.00.05.03-config"
+BB_CONF_FRAGMENT_DESCRIPTION = "Config specific overrides for processor-sdk/processor-sdk-wrynose-luks-12.01.00.05.03-config"
+
+DISTRO_FEATURES:append = " tpm luks"
diff --git a/configs/processor-sdk/processor-sdk-wrynose-luks-12.01.00.05.03-config.txt b/configs/processor-sdk/processor-sdk-wrynose-luks-12.01.00.05.03-config.txt
new file mode 100644
index 0000000..b6ef37d
--- /dev/null
+++ b/configs/processor-sdk/processor-sdk-wrynose-luks-12.01.00.05.03-config.txt
@@ -0,0 +1,21 @@
+# This file takes repo entries in the format
+# repo name,repo uri,repo branch,repo commit[,layers=layer1:layer2...:layern]
+
+bitbake,https://git.openembedded.org/bitbake,2.18,acfe02fa38b5da9e6a36c6cedcf91d4fcbefbfbd
+meta-tisdk,https://github.com/TexasInstruments/meta-tisdk.git,wrynose,12.01.00.05.03,layers=meta-ti-foundational:meta-ti-ml
+meta-arago,https://git.yoctoproject.org/meta-arago,wrynose,12.01.00.05,layers=meta-arago-distro:meta-arago-extras
+#meta-flutter,https://github.com/meta-flutter/meta-flutter.git,wrynose,8ec316bc8fb45c182b5e0d9bb2402491c538f3db,layers=.:meta-flutter-apps
+meta-qt6,https://code.qt.io/yocto/meta-qt6.git,6.11,ef0611a598fd7ba909804be0c6314ed7c85725b9,layers=
+meta-virtualization,https://git.yoctoproject.org/meta-virtualization,wrynose,781735b97ae5013cacabbecd38e6da6b510cf3fb,layers=
+meta-openembedded,https://git.openembedded.org/meta-openembedded,wrynose,100027977216601000cbefc42c2ff6cf667e7b5e,layers=meta-networking:meta-python:meta-oe:meta-gnome:meta-filesystems:meta-multimedia
+meta-ti,https://git.yoctoproject.org/meta-ti,wrynose,12.01.00.05,layers=meta-ti-test:meta-ti-extras:meta-beagle:meta-ti-bsp
+meta-arm,https://git.yoctoproject.org/meta-arm,wrynose,caa36c53f796beb25d9b9f58b1b7a492e9987e15,layers=meta-arm:meta-arm-toolchain
+oe-core,https://git.openembedded.org/openembedded-core,wrynose,c2746a4a165fd99c2d1aafed17533555787f37ce,layers=meta
+meta-security,https://git.yoctoproject.org/meta-security,wrynose,c0d1d6200e7a84c39fb940cb1f22aad4b0b3d808,layers=meta-tpm
+#meta-cyclonedx,https://github.com/iris-GmbH/meta-cyclonedx.git,wrynose,02ec3a875f2cb3ae6ed85981d09228409d25a108,layers=
+
+OECORELAYERCONF=./sample-files/bblayers.conf.sample
+OECORELOCALCONF=./sample-files/local-arago64-v3.conf.sample
+BITBAKE_INCLUSIVE_VARS=yes
+
+LOCALCONF:DISTRO_FEATURES:append = " tpm luks"
diff --git a/kas/processor-sdk/processor-sdk-wrynose-luks-12.01.00.05.03-config.yml b/kas/processor-sdk/processor-sdk-wrynose-luks-12.01.00.05.03-config.yml
new file mode 100644
index 0000000..65a0095
--- /dev/null
+++ b/kas/processor-sdk/processor-sdk-wrynose-luks-12.01.00.05.03-config.yml
@@ -0,0 +1,100 @@
+---
+header:
+  version: 17
+  includes:
+    - kas/templates/bblayers.conf.yml
+    - kas/templates/local-arago64-v3.conf.yml
+
+target: tisdk-default-image
+
+repos:
+  bitbake:
+    url: "https://git.openembedded.org/bitbake"
+    branch: "2.18"
+    commit: "acfe02fa38b5da9e6a36c6cedcf91d4fcbefbfbd"
+    path: "sources/bitbake"
+    layers:
+      .: disabled
+
+  meta-tisdk:
+    url: "https://github.com/TexasInstruments/meta-tisdk.git"
+    branch: "wrynose"
+    commit: "12.01.00.05.03"
+    path: "sources/meta-tisdk"
+    layers:
+      meta-ti-foundational:
+      meta-ti-ml:
+
+  meta-arago:
+    url: "https://git.yoctoproject.org/meta-arago"
+    branch: "wrynose"
+    commit: "12.01.00.05"
+    path: "sources/meta-arago"
+    layers:
+      meta-arago-distro:
+      meta-arago-extras:
+
+  meta-qt6:
+    url: "https://code.qt.io/yocto/meta-qt6.git"
+    branch: "6.11"
+    commit: "ef0611a598fd7ba909804be0c6314ed7c85725b9"
+    path: "sources/meta-qt6"
+
+  meta-virtualization:
+    url: "https://git.yoctoproject.org/meta-virtualization"
+    branch: "wrynose"
+    commit: "781735b97ae5013cacabbecd38e6da6b510cf3fb"
+    path: "sources/meta-virtualization"
+
+  meta-openembedded:
+    url: "https://git.openembedded.org/meta-openembedded"
+    branch: "wrynose"
+    commit: "100027977216601000cbefc42c2ff6cf667e7b5e"
+    path: "sources/meta-openembedded"
+    layers:
+      meta-networking:
+      meta-python:
+      meta-oe:
+      meta-gnome:
+      meta-filesystems:
+      meta-multimedia:
+
+  meta-ti:
+    url: "https://git.yoctoproject.org/meta-ti"
+    branch: "wrynose"
+    commit: "12.01.00.05"
+    path: "sources/meta-ti"
+    layers:
+      meta-ti-test:
+      meta-ti-extras:
+      meta-beagle:
+      meta-ti-bsp:
+
+  meta-arm:
+    url: "https://git.yoctoproject.org/meta-arm"
+    branch: "wrynose"
+    commit: "caa36c53f796beb25d9b9f58b1b7a492e9987e15"
+    path: "sources/meta-arm"
+    layers:
+      meta-arm:
+      meta-arm-toolchain:
+
+  oe-core:
+    url: "https://git.openembedded.org/openembedded-core"
+    branch: "wrynose"
+    commit: "c2746a4a165fd99c2d1aafed17533555787f37ce"
+    path: "sources/oe-core"
+    layers:
+      meta:
+
+  meta-security:
+    url: "https://git.yoctoproject.org/meta-security"
+    branch: "wrynose"
+    commit: "c0d1d6200e7a84c39fb940cb1f22aad4b0b3d808"
+    path: "sources/meta-security"
+    layers:
+      meta-tpm:
+
+local_conf_header:
+  oe-layersetup-local-conf-config-specific: |
+    DISTRO_FEATURES:append = " tpm luks"
diff --git a/src/configs/processor-sdk/processor-sdk-wrynose-luks-12.01.00.05.03-config.xml b/src/configs/processor-sdk/processor-sdk-wrynose-luks-12.01.00.05.03-config.xml
new file mode 100644
index 0000000..dfb4bfb
--- /dev/null
+++ b/src/configs/processor-sdk/processor-sdk-wrynose-luks-12.01.00.05.03-config.xml
@@ -0,0 +1,85 @@
+<?xml version='1.0'?>
+<config>
+    <description>TI Processor SDK vwrynose-luks-12.01.00.05.03</description>
+
+    <xi:include href='../../common/distro_arago.xml' xmlns:xi='http://www.w3.org/2001/XInclude'/>
+    <xi:include href='../../common/machines.xml' xmlns:xi='http://www.w3.org/2001/XInclude'/>
+    <xi:include href='../../templates/bblayers.conf.xml' xmlns:xi='http://www.w3.org/2001/XInclude'/>
+    <xi:include href='../../templates/local-arago64-v3.conf.xml' xmlns:xi='http://www.w3.org/2001/XInclude'/>
+
+    <bitbake url='https://git.openembedded.org/bitbake' branch='2.18' commit='acfe02fa38b5da9e6a36c6cedcf91d4fcbefbfbd'/>
+
+    <repos>
+        <repo name='meta-tisdk' url='https://github.com/TexasInstruments/meta-tisdk.git' branch='wrynose' commit='12.01.00.05.03'>
+            <layers>
+                <layer>meta-ti-foundational</layer>
+                <layer>meta-ti-ml</layer>
+            </layers>
+        </repo>
+        <repo name='meta-arago' url='https://git.yoctoproject.org/meta-arago' branch='wrynose' commit='12.01.00.05'>
+            <layers>
+                <layer>meta-arago-distro</layer>
+                <layer>meta-arago-extras</layer>
+            </layers>
+        </repo>
+        <repo name='meta-flutter' url='https://github.com/meta-flutter/meta-flutter.git' branch='wrynose' commit='8ec316bc8fb45c182b5e0d9bb2402491c538f3db' disabled='true'>
+            <layers>
+                <layer>.</layer>
+                <layer>meta-flutter-apps</layer>
+            </layers>
+        </repo>
+        <repo name='meta-qt6' url='https://code.qt.io/yocto/meta-qt6.git' branch='6.11' commit='ef0611a598fd7ba909804be0c6314ed7c85725b9'>
+            <layers/>
+        </repo>
+        <repo name='meta-virtualization' url='https://git.yoctoproject.org/meta-virtualization' branch='wrynose' commit='781735b97ae5013cacabbecd38e6da6b510cf3fb'>
+            <layers/>
+        </repo>
+        <repo name='meta-openembedded' url='https://git.openembedded.org/meta-openembedded' branch='wrynose' commit='100027977216601000cbefc42c2ff6cf667e7b5e'>
+            <layers>
+                <layer>meta-networking</layer>
+                <layer>meta-python</layer>
+                <layer>meta-oe</layer>
+                <layer>meta-gnome</layer>
+                <layer>meta-filesystems</layer>
+                <layer>meta-multimedia</layer>
+            </layers>
+        </repo>
+        <repo name='meta-ti' url='https://git.yoctoproject.org/meta-ti' branch='wrynose' commit='12.01.00.05'>
+            <layers>
+                <layer>meta-ti-test</layer>
+                <layer>meta-ti-extras</layer>
+                <layer>meta-beagle</layer>
+                <layer>meta-ti-bsp</layer>
+            </layers>
+        </repo>
+        <repo name='meta-arm' url='https://git.yoctoproject.org/meta-arm' branch='wrynose' commit='caa36c53f796beb25d9b9f58b1b7a492e9987e15'>
+            <layers>
+                <layer>meta-arm</layer>
+                <layer>meta-arm-toolchain</layer>
+            </layers>
+        </repo>
+        <repo name='oe-core' url='https://git.openembedded.org/openembedded-core' branch='wrynose' commit='c2746a4a165fd99c2d1aafed17533555787f37ce'>
+            <layers>
+                <layer>meta</layer>
+            </layers>
+        </repo>
+        <repo name='meta-security' url='https://git.yoctoproject.org/meta-security' branch='wrynose' commit='c0d1d6200e7a84c39fb940cb1f22aad4b0b3d808'>
+            <layers>
+                <layer>meta-tpm</layer>
+            </layers>
+        </repo>
+        <repo name='meta-cyclonedx' url='https://github.com/iris-GmbH/meta-cyclonedx.git' branch='wrynose' commit='02ec3a875f2cb3ae6ed85981d09228409d25a108' disabled='true'>
+            <layers/>
+        </repo>
+    </repos>
+
+    <tools>
+        <tool type='oe-layersetup'>
+            <var name='BITBAKE_INCLUSIVE_VARS' value='yes'/>
+        </tool>
+    </tools>
+
+    <local-conf>
+        <line>DISTRO_FEATURES:append = " tpm luks"</line>
+    </local-conf>
+</config>
-- 
2.34.1


