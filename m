Return-Path: <s-vadapalli@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 70CE4CA9ED0
	for <webhook@archiver.kernel.org>; Mon, 12 Oct 2026 12:32:33 +0000 (UTC)
Received: from mx0b-0002e601.pphosted.com (mx0b-0002e601.pphosted.com [148.163.154.28])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.11990.1791808346656804037
 for <meta-arago@lists.yoctoproject.org>;
 Mon, 12 Oct 2026 05:32:27 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=proofpoint-05-2026 header.b=cOcqD8I/;
 dkim=pass header.i=@ticloud.onmicrosoft.com header.s=selector1-ticloud-onmicrosoft-com header.b=pBSrhGiD;
 spf=pass (domain: ti.com, ip: 148.163.154.28, mailfrom: s-vadapalli@ti.com)
Received: from pps.filterd (m0374956.ppops.net [127.0.0.1])
	by mx0b-0002e601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69CBwiKh1628278;
	Mon, 12 Oct 2026 07:32:25 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=cc
	:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=proofpoint-05-2026; bh=k6yXklF4Jp0Rl
	ozBq4VgXsTYSa8elwTGPq2zp8RoN00=; b=cOcqD8I/i6OPDS1ycEqQSzoV+uR8Q
	eOqmHnj4gzfqkcT83LAHAvg/kQGW12A4RN9t0F+aMNkNth90+j8ELW4l+EcMiX8k
	pg7rpil0dapmE+h9Pn7bQ8kT3knoigvS7lA4wlKq0reF9pGLVdv9zfFHjZt2foci
	LywwZD3NoD5B+r/9xgB3eGxUz6Q14kJ9HNEIlR5ROfuECC+OtBXGVK0/RhXENDBU
	LxPWPydAreGpIOg1x5BJGnbqxsE7KeUmq1Wf0eJQdZUJkZwHylFci1hbusbnZPtp
	ZbPWKuL5sZPfPqj2f6QqHWz+H4dh9ERv2QjvlbV9BbWOHoDJyyTRCeNCA==
Received: from ch4pr04cu002.outbound.protection.outlook.com (mail-northcentralusazon11013042.outbound.protection.outlook.com [40.107.201.42])
	by mx0b-0002e601.pphosted.com (PPS) with ESMTPS id 4h8u3xhg9v-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Mon, 12 Oct 2026 07:32:24 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=B5SGCLH6R6BGYa1Nb9H7ycTFMzZasraqWMfBTgo/LYzir2vtRxJnLKCFY29N3xWpu9tD/5kpTDmHSVy7EburckDVpa6vtzxiw2/dmOzBOeWVxyWv6+O+L49OQKs8EhcJxE110KUmRSA46Rhu29Ct7J+Z2bfCBWcyugEvhSUWSM7MLFxjW2bZUHQHvN1lI/pVVTzQmXv5Hcbtdax32Mi4ZNmNj5azst6CPzmLwqtTiLuNK4aul99052DpWW5Jnj7C8iBkYDDlqUZAThK0SDBWLvBS4ZXr7P6IuLCCFZt546b456hwZaqvpKLRpGQ9eG+OubBhgIdL6smz1bDa6xKgTg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=k6yXklF4Jp0RlozBq4VgXsTYSa8elwTGPq2zp8RoN00=;
 b=YGoUuO8muXMd5nv4OtCOYzrG+ql2MNxaOp3Xt38Pyg0ZUsoApz2Z+Qf6EWnqVgOeXLWwfkyGIO3FY0fNqX0J+3h1lnTorvI3NqiEVfrNvyPybb1ok21e+EjjVPrisNkU97vIZzw0+s4/rhxKQMfFkWR4//C67Of07h+Hkex+0r+OQi12G/2P/UAPvf+Me0xlq6EFQcDDA6XA/i5Hm2cre/v/SY6GpfauEFV2jhfb6PhDq8rXCsaJZb/LWk+7NAu+lEhVfrHosM0ULqrpZUiVvgcQ55zBjmszGF2qoMFAjdBf7OWF9MfnfGfuQqmgLulKhi8q8EQ7r0vJ7M7Sxuq9EQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.195) smtp.rcpttodomain=lists.yoctoproject.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ticloud.onmicrosoft.com; s=selector1-ticloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=k6yXklF4Jp0RlozBq4VgXsTYSa8elwTGPq2zp8RoN00=;
 b=pBSrhGiDIvoz4LsJgbSu6pYImyotc+IJNWRkIl8plFfPLgKfN+V79ecs6CRWF/LPmjB+Iq3D2sHHJde98IaTlAAmeB3ysKfxe5EBgqlhi1EWAj4vuFJmoYov1FB4z+esTshahdZFNXNPsLV1SSdp46Dzbo9s16LFR1OzsQzH/pQ=
Received: from CY5PR20CA0022.namprd20.prod.outlook.com (2603:10b6:930:3::15)
 by CY5PR10MB6071.namprd10.prod.outlook.com (2603:10b6:930:39::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.522.12; Mon, 12 Oct
 2026 12:32:19 +0000
Received: from CY5PEPF00000E74.namprd02.prod.outlook.com
 (2603:10b6:930:3:cafe::6f) by CY5PR20CA0022.outlook.office365.com
 (2603:10b6:930:3::15) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.496.5 via Frontend Transport; Mon, 12
 Oct 2026 12:32:18 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 198.47.23.195) smtp.mailfrom=ti.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.195; helo=lewvzet201.ext.ti.com; pr=C
Received: from lewvzet201.ext.ti.com (198.47.23.195) by
 CY5PEPF00000E74.mail.protection.outlook.com (10.167.247.36) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.522.6 via Frontend Transport; Mon, 12 Oct 2026 12:32:18 +0000
Received: from DLEE215.ent.ti.com (157.170.170.118) by lewvzet201.ext.ti.com
 (10.4.14.104) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Mon, 12 Oct
 2026 07:32:07 -0500
Received: from DLEE202.ent.ti.com (157.170.170.77) by DLEE215.ent.ti.com
 (157.170.170.118) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Mon, 12 Oct
 2026 07:32:07 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DLEE202.ent.ti.com
 (157.170.170.77) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45 via Frontend
 Transport; Mon, 12 Oct 2026 07:32:07 -0500
Received: from toolbx.dhcp.ti.com (uhda0492258.dhcp.ti.com [10.24.68.238])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 69CCW4Ya2404169;
	Mon, 12 Oct 2026 07:32:05 -0500
From: Siddharth Vadapalli <s-vadapalli@ti.com>
To: <reatmon@ti.com>, <denys@konsulko.com>
CC: <meta-arago@lists.yoctoproject.org>, <u-kumar1@ti.com>, <srk@ti.com>,
        <s-vadapalli@ti.com>
Subject: [meta-arago][master][PATCH] tisdk-bundle: package EthFw for multi-core Ethernet
Date: Mon, 12 Oct 2026 18:02:02 +0530
Message-ID: <20261012123204.4185891-1-s-vadapalli@ti.com>
X-Mailer: git-send-email 2.56.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PEPF00000E74:EE_|CY5PR10MB6071:EE_
X-MS-Office365-Filtering-Correlation-Id: a7dd8493-90d9-4598-a5ff-08df285cdb14
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|23010399003|82310400026|36860700016|1800799024|376014|18002099003|10067099003|3023799007|261009223027099003|56012099006;
X-Microsoft-Antispam-Message-Info: 
	fWg1kzwLR19fQrW+/PQGQP/i7MbU4ihPwCjOFLPivDbVtnk6fHhSmvwrpaI/Ytp9zPRsv5Vp17k9BQ8uJMKQccamZwnSRXpro6DKFYkU0WHZp3QcIP3fwfPJdsAHHrAQJfC93rgccGJAdpaO99GnE97G6hFyoxo16PxU9htttfSyI3LLvbCephAQwADYdhXDdQpWLDG/9kw7743Ebs/Eo+/UiKuQHCCmZOiWT9AqS5N+6cQ53biU9fPVoqy+L1xjlcSEvIH314StJqqFc2GcErgDzp1SdhymzRy3ZyHyK6PXBJfntcsGJq1zRtv+1kJza3641EWzXXjkn7pW7DmegjZ/ECClKmuTtWtiwDgASI8L8ps6qFX9s50IWXOPoXK98me0NHuWVHA5jlbIo8VrTEpi2HivKW/O8wOLRMuSHcAQxV5NSYY60LBxUnO3rKYGZtNqKv4WIFgSWkDHVa4z8IylFvRzFNPUV6VPgsuJGhm4OjR+W37DfBzdDjBpVUb7BsYEsvMfsCR1s7DB9F5mox60LCuyU+mHteYkmzJbmhDLbuAqgJH5jCz9LtAcCyfoKcqYijAHEZQIDKxhSayyBeqBXbhilwfN/0NwpqUoLm6bEu3Rv+aUNvnq7OidNHbCly56qBYGiGogCdtcBfa/IPWVFssWXh6RrGKANEssb80MrHQeNkvDU7zvcibwIiiBJdtPyIrrxvJjPgP8lztLdQ==
X-Forefront-Antispam-Report: 
	CIP:198.47.23.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet201.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(23010399003)(82310400026)(36860700016)(1800799024)(376014)(18002099003)(10067099003)(3023799007)(261009223027099003)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	Pn0S3Do0zlPgziIvGzDDJcmEcD9RnQx27y8lXG07oMqyY7WJQS8ISArd4PJcq+h/RRx8Pktt9fpwvXnHw9BYuVOISk3WCNUZGfUiq0JTNwdbpPxQWjzagEC5tj0vqnRGrUz+6EiZGLCNKvemuqM4V37vfE8nuiz3LbfxkZ0GcYuOdB103Try+tOFc+C8qjU7g5E32MCaT/1P5m6mfG40SVrWNU75C9EP/OKZ1CJrEUjOShhEnSlSFk8XM2bVBre0a8nOdKRBSyp31Sfy8pdqNxs4odJ2uhagRLnKrqgdK9TjKlPk+MK669w39W1yju+8YTgwMAvDFxke+ERY/XjEV0eiHb2+tnPtbJdoZ8UrWItUnFsLNsBk7pJgPLmYdu41NBsJg4+/Bw69t4nznefPHW/qLF+2PTnauHtiBnB8iWSIF333RIbhYkDXqRdcAwnP
X-Exchange-RoutingPolicyChecked: 
	hnz/CWmJsy/UKa2TXZOw9X10hkiZ6SMQZVhX7q/oHlHTndCD7QBkX5LMAR1VRTt9jWKJdrR0g7c6sheJTae7cpvr59jQ9dO72i5uxblg/YYOTWmZi8z4IdFEw+mVyAgjgOjhgMy/WlaV+dAuagtNr+mAh4fFKV+4O5d+0VnzDKEZpuvWm+jprlTONE3CFNzw+2LbxKsCAqepruFUS6Vd/FGdNwqN2A58fN1+Ntol75y0FSpu6chEIxmZo1jdwVxAWEMe70ko0LVUpQzeijlRZOVd9OlBTdLOhkX2fxblmIgYYQ5pujRuCCB6x5P619bdNXak2jQsli8buOH956ZBwg==
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Oct 2026 12:32:18.6650
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a7dd8493-90d9-4598-a5ff-08df285cdb14
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.195];Helo=[lewvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	CY5PEPF00000E74.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR10MB6071
X-Authority-Analysis: v=2.4 cv=R6uWitRX c=1 sm=1 tr=0 ts=6accd358 cx=c_pps
 a=MKhdtnkEmnO/r5iZxkZDBQ==:117 a=f+v6EHfkeJbVwR46tk4DMg==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=660iZSQnnn4A:10 a=s63m1ICgrNkA:10
 a=AlMIdn_sM9wA:10 a=VkNPw1HP01LnGYTKEx00:22 a=Z8NIEmU8O1QQgoT56wFK:22
 a=jwouBfj2j3NM8CExmVVE:22 a=sozttTNsAAAA:8 a=I9mXlGmmh06hSaTBnxcA:9
X-Proofpoint-ORIG-GUID: 3kSjp0-_GQ91VZggQ2uRo-2OoPqZUyzD
X-Proofpoint-GUID: 3kSjp0-_GQ91VZggQ2uRo-2OoPqZUyzD
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDEyMDA0OSBTYWx0ZWRfX6DkIEqzKOEtT
 OqzJ5dMj6eEeG5TU0SoVa5ucbwIfLo4O0+/KYtxhF+u5Pb69iVdYtra+dLLqBEfXpJdRVawciFf
 5+wLh322Zy0Zd3umRwB5X0rh0I0C7Hhs2rZRD9IhZIPjcUMZfEDTDBUuXURYBRXAdq8sJWRGqN4
 P/BdCCMt36jlCiSh1y1jl/PhfF4xn2Z+7gS/3RbE+TYC8Oe9kHTnOLAj+G1scAuSTHE0TlpmbBl
 /umsPCCjS9CrbYEoQcpr46mgsEVP1fztcwpl0Xg5SZi0IMfqW0RGYKVnSnQoYryDWkkgzOYdCv4
 h7rzhJURxsUlro65WuzmQipxN84HIKpJE21UXaYJN6vsfWE3nI5y86Lmfu5Jt7cQVGZig9UX3o/
 /yAbNRxp8m/Aq3XSlyMdK4+AW1u29KPn+o+ByoWu3W1rts/RXHJKwl7Wd3IXRXDdgIY3iLC2zrV
 Mm10JNfEJc33qYIb+xA==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDEyMDA0OSBTYWx0ZWRfX2aYxSYarw834
 c/W2myAkLtCn3ZwFnTpJSG3g44GC+SFgCqpJYI3KNwMTeqETRxGG7MItV8ZAIXWbOfb8NGJ405x
 RPx6StMpbYwCcYAHRBAHQ2iV5YfNVZs=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-12_04,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 clxscore=1011 malwarescore=0 suspectscore=0
 impostorscore=0 bulkscore=0 adultscore=0 phishscore=0 priorityscore=1501
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2610080000
 definitions=main-2610120049
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Mon, 12 Oct 2026 12:32:33 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/17737

The Ethernet Switch Firmware on Texas Instruments SoCs enables Ethernet
functionality with CPSW for Software running on various cores in the
heterogeneous SoC. Package it for enabling Ethernet for such use-cases.

Signed-off-by: Siddharth Vadapalli <s-vadapalli@ti.com>
---
 meta-arago-distro/classes/tisdk-bundle.bbclass | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/meta-arago-distro/classes/tisdk-bundle.bbclass b/meta-arago-distro/classes/tisdk-bundle.bbclass
index 4033f9a2..28df766a 100644
--- a/meta-arago-distro/classes/tisdk-bundle.bbclass
+++ b/meta-arago-distro/classes/tisdk-bundle.bbclass
@@ -288,6 +288,12 @@ tisdk_image_build () {
         cp ${DEPLOY_DIR_IMAGE}/ti-hsm/* ${prebuilt_dir}/ti-hsm/
     fi
 
+    # Copy EthFw which enables multi-core Ethernet
+    if [ -d "${DEPLOY_DIR_IMAGE}/ti-eth" ]
+    then
+        cp -r ${DEPLOY_DIR_IMAGE}/ti-eth ${prebuilt_dir}/
+    fi
+
     # Add the EXTRA_TISDK_FILES contents if they exist
     # Make sure EXTRA_TISDK_FILES is not empty so we don't accidentaly
     # copy the root directory.
-- 
2.56.0


