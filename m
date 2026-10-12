Return-Path: <prc@list.ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 74680CA9EC5
	for <webhook@archiver.kernel.org>; Mon, 12 Oct 2026 12:36:03 +0000 (UTC)
Received: from mx0b-0002e601.pphosted.com (mx0b-0002e601.pphosted.com [148.163.154.28])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.12214.1791808554668330399
 for <meta-arago@lists.yoctoproject.org>;
 Mon, 12 Oct 2026 05:35:55 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=proofpoint-05-2026 header.b=pzMbAvJH;
 dkim=pass header.i=@list.ti.com header.s=selector1 header.b=ZwpYpBYW;
 spf=pass (domain: list.ti.com, ip: 148.163.154.28, mailfrom: prc@list.ti.com)
Received: from pps.filterd (m0374955.ppops.net [127.0.0.1])
	by mx0b-0002e601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69CBwLp42145689;
	Mon, 12 Oct 2026 07:35:52 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	proofpoint-05-2026; bh=A8CtqhNCldykYwWr+OFs/sYd+B6rlVHNlh3mO6aN6
	bQ=; b=pzMbAvJHnGWZh/gJQHnKpNm0bLEB1vXAD/GA3mHj0VZxzgI7feN6ly/5h
	sn4k4pVITZMRmL/s3E1vgWJvItXmBI6QbPfhKQ2jDi2xehItk/afv9Pd56TLembV
	x0izc9gEuicm4LNVJQVOemFzYV+FXkVBvki+38ZBbixUtp20RKsh+D6u5bFrtxiu
	lURC59+HGDBvoW+szZygPXkDoTt0KEnxyf+m6RkYVsHFxjByiifkBCQakxqcFu56
	CYuRhD72cr/6Nj7c9qC0DrbF+1FrWtnJWzZcq+YuRNV4Maej1OLCAKsEmyd4pIjv
	TE5refUjedlAy1lspcRVpULjh8sjg==
Received: from ph8pr06cu001.outbound.protection.outlook.com (mail-westus3azon11012046.outbound.protection.outlook.com [40.107.209.46])
	by mx0b-0002e601.pphosted.com (PPS) with ESMTPS id 4h8u43sh9q-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Mon, 12 Oct 2026 07:35:52 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=I1NwecgSIay82JXKkDSuvvWqDPKkW/f2fFK4UB+lNvcz0DqkyLY7K2q9Oh8GNQn4FqnWJYscLMlED1pMWBEYH/TbFqOrQ/vCO7eGKFr4RGg2uGI9PFQ6YHfu4cLhhxyw/7byqZfaoU1U4rsceuND6BHkzMoSwL1GkX8Pvh2l0OWziGsmgwZkPsv1OiERhcJ2Cn6cbUcooX5cZ3jkdLeIBOSHz3HChXgzpaUhm3hiZXJY+4Xs0SCBuxR40XxqqnTzYp2uZTDoyOMiFJs4O4uTHdpjH2sNBzh3PimWzCHBa4J1QYZyH1gJhBGtRDmHh5BV5OZv6x0MR8HqSdV4qOW+vQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=A8CtqhNCldykYwWr+OFs/sYd+B6rlVHNlh3mO6aN6bQ=;
 b=oKLnpRLV64C35aJ/F7+BlsMbU4G1aBjnAp+eSTAa2YyNJagdVJpOt1mumIkxamAOHU6tWo98sVh1bWshx5dyKHMUkSf5IeowtIL7rQppXvNU+w2c+LtZI4xFABQMCV9a2aybVEKGUwrNJ0X5OTOX8c1xuypdr1VKzdlq9gSUPc+cEWWyR/+FfgezMhGi7jY0LdA73PDOZKlbGgsSNTXiO7zjTUOuRy/CcmNwUBrz1Ra4enKqS9XbFSwgRm77/IoVmHc6wqSC9ff/qPHLJq0hYb3HrDQF6/mxCmnFyhZgQ6PGGsq1H2/GOM120Gfr6U73RmtLDXixR00lBL8Fuv7uOQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.194) smtp.rcpttodomain=lists.yoctoproject.org
 smtp.mailfrom=list.ti.com; dmarc=pass (p=quarantine sp=none pct=100)
 action=none header.from=list.ti.com; dkim=none (message not signed); arc=none
 (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=list.ti.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=A8CtqhNCldykYwWr+OFs/sYd+B6rlVHNlh3mO6aN6bQ=;
 b=ZwpYpBYWnDYRx62hUTGMPLPO+IZOzJRQYNMSh1iZhbLCSc/cTXy3Olc6XR7goTI7vjCqvHa2JIqNwTLLxjPKxjrrv8bfMailji7w8Kqql0TvQaR92q+3HquI9JSE/5vAHbAszyHHisNXadu7PZZEBK945ay6C+lkWTKxNWW8gByYWz6/q9NINZ9Cn5zJOM1x3YwleCH4dXOEwuXxP1JDc/JhdDzeZnJcwYJ1OBqqbccXx6mQM2z9nkl78PZsGtlXbzVXkhPmkedTigkonOuEph2bw7qAYSZ7UVUan9yA7dfKFjTC76qTdiP8mgLEFbv2wY1RLVk6aS75R201dT2c8w==
Received: from DS1P222CA0005.NAMP222.PROD.OUTLOOK.COM (2603:10b6:8:454::18) by
 IA0PR10MB6769.namprd10.prod.outlook.com (2603:10b6:208:43e::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.522.6; Mon, 12 Oct
 2026 12:35:50 +0000
Received: from DM3PEPF000265C4.namprd03.prod.outlook.com
 (2603:10b6:8:454:cafe::91) by DS1P222CA0005.outlook.office365.com
 (2603:10b6:8:454::18) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.496.5 via Frontend Transport; Mon, 12
 Oct 2026 12:35:50 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 198.47.23.194) smtp.mailfrom=list.ti.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=list.ti.com;
Received-SPF: Pass (protection.outlook.com: domain of list.ti.com designates
 198.47.23.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.194; helo=lewvzet200.ext.ti.com; pr=C
Received: from lewvzet200.ext.ti.com (198.47.23.194) by
 DM3PEPF000265C4.mail.protection.outlook.com (10.167.23.185) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.522.6 via Frontend Transport; Mon, 12 Oct 2026 12:35:50 +0000
Received: from DLEE215.ent.ti.com (157.170.170.118) by lewvzet200.ext.ti.com
 (10.4.14.103) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Mon, 12 Oct
 2026 07:35:36 -0500
Received: from DLEE207.ent.ti.com (157.170.170.95) by DLEE215.ent.ti.com
 (157.170.170.118) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Mon, 12 Oct
 2026 07:35:36 -0500
Received: from fllvem-mr08.itg.ti.com (10.64.41.88) by DLEE207.ent.ti.com
 (157.170.170.95) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45 via Frontend
 Transport; Mon, 12 Oct 2026 07:35:36 -0500
Received: from fllvdckhpci031.itg.ti.com (fllvdckhpci031.itg.ti.com [10.64.72.41])
	by fllvem-mr08.itg.ti.com (8.18.1/8.18.1) with ESMTP id 69CCZZ4u3854361;
	Mon, 12 Oct 2026 07:35:35 -0500
Received: by fllvdckhpci031.itg.ti.com (Postfix, from userid 60899)
	id 2E3CE9ADAD; Mon, 12 Oct 2026 07:35:35 -0500 (CDT)
From: PRC Automation <prc@list.ti.com>
To: Siddharth Vadapalli <s-vadapalli@ti.com>
CC: <reatmon@ti.com>, <denys@konsulko.com>,
        <meta-arago@lists.yoctoproject.org>, <u-kumar1@ti.com>, <srk@ti.com>
Subject: Re: [meta-arago][master][PATCH] tisdk-bundle: package EthFw for multi-core Ethernet
Date: Mon, 12 Oct 2026 07:35:35 -0500
Message-ID: <20261012123535.3540724-1-prc@list.ti.com>
X-Mailer: git-send-email 2.43.5
In-Reply-To: <20261012123204.4185891-1-s-vadapalli@ti.com>
References: <20261012123204.4185891-1-s-vadapalli@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM3PEPF000265C4:EE_|IA0PR10MB6769:EE_
X-MS-Office365-Filtering-Correlation-Id: acde18cb-3c6c-47a3-05f6-08df285d592c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|23010399003|82310400026|36860700016|376014|56012099006|18002099003|22082099003|13003099007|261009223027099003|10067099003;
X-Microsoft-Antispam-Message-Info: 
	I4+OMZtBvgpF8hjnpDMEiyc6fmuPFAbZniCafN71MKJ0qt/od2TOMKs1Q9fRzAIGMzQ/4FGS234XZd0hdUysyhQueFmHebXmEHCB1gXTRkKkom9PN4HKvuo0V9Hqlfb8WuS855Cmo3f84prMkhROfCZLHO+YPFRibCN3xOub58NyjatyNBLIaRMxeEqCnW4dYlnHQBU68Kc0toc7Qdtt3tLTc6HizKzYjnk6stw5qAaTzZPlVbrX/82ObXx5dEMQLfVeXay6jKouWe4hWpSkNv7YlqtxiEBHGs+oaittB4+iQ9BzujhsaPBFsraUI6SjhBipJzCk6ro9OXROfAx+Osj+2mt+FAyOQFAaf+hnhf3OO8V/Qb3/Tcdzasga/EBgk5zOsi2oWOnVKxz/MuheUMfLOF7YVoFkNdS0eiQ+75P1FpFEO2yK5VYRFeAS6vhupThEa/OBD1Vbo2u2iyLFRmLA3By+aErBx8eic6j1TLXMKR9RX9EIg+LttIG9BG34VcPdyZlzqI9mn0as8haUWDZPJx/wmxbOImI528iHIo5f73Y7//DGulFIMTCRMRIcJjFkR1C+hE1krt5LCtUIqyq+0AGahvglq2z3xuk6pPoFCEZlbj/SkLqPIWsCiIDxK02J+bonHezCKS8UGZvEdQ==
X-Forefront-Antispam-Report: 
	CIP:198.47.23.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet200.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(23010399003)(82310400026)(36860700016)(376014)(56012099006)(18002099003)(22082099003)(13003099007)(261009223027099003)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	je18v+EZyMIHAqmQLTLhJi76gyNaHfDER0p8/kuoT6Ia3I9jJ7hgrUVlsoSi6kTVSAzPiiRDaZKLaPKwAFOO44UZIXrPN9SWFDM+fjhQU+Q6z1OmwjxcSMhe54mSvxPgIifXsWaP4Ij53qdngGS/Z8VK939UgODXSrb74oKR2adbDW+XCj7bSoP+zkG3iby11tGKb4bQbn+Jp9rYJ0XRW2erfTNGf4fneSexdHGOBkNnafKjcrlyDreiCgE2Q5Nq6phsHY2cKoxH5nzdXmyKrOLJ7J5GcJEj8kWY9QRkskyc1CTvps2FGMsxRe1r7+DrrKhUjhjw4z1UNCVoKEwe9pS2LbJMsEMSFrBUuomfyN4YViSNLTqM1uMcCG2kVkgb8npn5U1XXgbFYIraQmugE5lUJ3ok9wppmWej+z6/QT0oEXZHOEEUN8/bCOQBP1x2
X-Exchange-RoutingPolicyChecked: 
	fZt9J+4xGuvgzzGKcpkFYg7O9weNZVCveWOWQ4/XYAreSxSxOX/qhV9ThIIVYHm/nFGCQiAQgoPVdTu2g5hjiZ5tSQlucAg2itm87g7IkAyfkDIzJYryXWeU2R3jk9f2QCyFedif/tKciN2AwXBno6u9pS4IGkih1PNLeOtREMv+1X+Aj3fLokPukydse27kPhmSIyFSBE+Aus4/uEr4rKvNVDIbPCRQGPlC7sjTH5VeaQUmZIfsn1lL8SiXHi1PWigZyEJphduMP+p2n1czqcffOb+OdCQkD6kSANGTojWkh7U5iBBAPDj1qybS5ZTcv7NrhKVfmL3EY5V+/3Sfbg==
X-OriginatorOrg: list.ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Oct 2026 12:35:50.2057
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: acde18cb-3c6c-47a3-05f6-08df285d592c
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.194];Helo=[lewvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DM3PEPF000265C4.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR10MB6769
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDEyMDA0OSBTYWx0ZWRfXxrRZOrV2ULTm
 1eMVqgBkEbYWAvouFZsRBOoLOBVTJncD1Ei1gqLqdcJSuZgy8Yl7ryj6VweYXIxdUm4TAkRrbqB
 sFLAYcOtv28I0cjZIxEMx795X2wrmqrVnlAjdOMgybTxOSL3muKb87+BUhPH0kt2AK7UfloJGGq
 6MIqK/wcc4h9wzESdXTYSPGn+GR45lO526a1npm/ngoi4nv1XGk6QgKiVWu5Z6Djph8zJPCQLT8
 H+VCgAreCZP61qPEQzotB2AmNJeIks09T1LG9AN1Vy3iu4nf0akAJz8+w6YxJR+aUl8Fnen5GkU
 2UWxKx/EOmQ46QtE5Fs1IVBJQHzFJDmXfjQ+9hpyF+n6N2B3wYw3/1tJqqrGZ0301KoHvATyEmF
 NQfcVoq+CjtbxBSepj07i0FNPrPUlEOes00HwgNdvThtv+RZfR1L9UfkZx632bGZJzZFsKdxPhQ
 cL6pccN663EEwXJ7nVQ==
X-Authority-Analysis: v=2.4 cv=atcnmiZV c=1 sm=1 tr=0 ts=6accd428 cx=c_pps
 a=M67J7PRCWxeF1x+4vZEXtA==:117 a=WotqVVQAdb04rnGuttW3Kw==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=660iZSQnnn4A:10 a=s63m1ICgrNkA:10
 a=Vs-ZokuVWRQA:10 a=VkNPw1HP01LnGYTKEx00:22 a=Z8NIEmU8O1QQgoT56wFK:22
 a=fPAWb5peG099m5CrUpKH:22 a=iGHA9ds3AAAA:8 a=sozttTNsAAAA:8
 a=IKNrNcqIuV2uE8tSJIcA:9 a=nM-MV4yxpKKO9kiQg6Ot:22
X-Proofpoint-GUID: ZmmvoTljY2X5V_S8DammH847iZc0mJdV
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDEyMDA0OSBTYWx0ZWRfX56P5N8x6e1op
 kV7dqeszicaAPJJb3C9lRgTtAZkGyucAxb1LfU0ZEgc9Bxf04KRelylj0Y3WPQCd3IwT3sknVNw
 NHLAStkGN2X75UFEipq3brFPkHFEO6U=
X-Proofpoint-ORIG-GUID: ZmmvoTljY2X5V_S8DammH847iZc0mJdV
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-12_04,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 suspectscore=0 bulkscore=0 clxscore=1015 malwarescore=0
 priorityscore=1501 adultscore=0 lowpriorityscore=0 impostorscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2610080000
 definitions=main-2610120049
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Mon, 12 Oct 2026 12:36:03 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/17738

meta-arago / na / 20261012123204.4185891-1-s-vadapalli

PRC Results: FAIL

=========================================================
  check-yocto-patches: PASS
=========================================================
Patches
----------------------------------------
All patches passed



=========================================================
  apply-yocto-patch: PASS
=========================================================
master
=====================
Summary:
- Patch Series: [meta-arago][master][PATCH] tisdk-bundle: package EthFw for multi-core Ethernet
- Submitter: From: Siddharth Vadapalli <s-vadapalli@ti.com>
- Date: Date: Mon, 12 Oct 2026 18:02:02 +0530
- Num Patches: 1
- Mailing List (public inbox) Commit SHA: ebdfb3523a30d169966ccc6a2b6df0f29ea90dfb

Applied to:
- Repository: lcpd-prc-meta-arago
- Base Branch: master-wip
- Commit Author: Telukula Jeevan Kumar Sahu <j-sahu@ti.com>
- Commit Subject: onnx: fix do_install SOABI suffix for CMake 4.4+
- Commit SHA: c1fea6ed8db263c98549eadbccf9e24e216e6148

Patches
----------------------------------------
All patches applied



=========================================================
  check-yocto-repo: FAIL
=========================================================
master
=====================
FAIL
    WARN: You might need a " " as the first character for the :append. (APPEND-2)
        meta-arago-distro/recipes-graphics/emptty/emptty.bb:10
            GO_TAGS:append = "${@bb.utils.contains('PACKAGECONFIG', 'pam', '', ',nopam', d)}"
    
    WARN: You might need a " " as the first character for the :append. (APPEND-2)
        meta-arago-distro/recipes-graphics/emptty/emptty.bb:11
            GO_TAGS:append = "${@bb.utils.contains('PACKAGECONFIG', 'x11', '', ',noxlib', d)}"
    
    For details on the above errors/warnings visit: https://lists.yoctoproject.org/g/meta-ti/wiki/40887




