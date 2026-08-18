Return-Path: <prc@list.ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 478A1C5DF7D
	for <webhook@archiver.kernel.org>; Tue, 18 Aug 2026 20:30:01 +0000 (UTC)
Received: from mx0a-0002e601.pphosted.com (mx0a-0002e601.pphosted.com [148.163.150.75])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.18159.1787084990823115680
 for <meta-arago@lists.yoctoproject.org>;
 Tue, 18 Aug 2026 13:29:51 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=proofpoint-05-2026 header.b=OOtv6C5i;
 dkim=pass header.i=@list.ti.com header.s=selector1 header.b=UeOtWkGT;
 spf=pass (domain: list.ti.com, ip: 148.163.150.75, mailfrom: prc@list.ti.com)
Received: from pps.filterd (m0384305.ppops.net [127.0.0.1])
	by m0384305.ppops.net (8.18.1.11/8.18.1.11) with ESMTP id 67IJUo5M173249;
	Tue, 18 Aug 2026 15:29:49 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	proofpoint-05-2026; bh=4X78tZMhivt0mjnj5HrX7e7P7cnVRakspHE4iswPV
	Zk=; b=OOtv6C5iujLjZFMwGSrVubHVk6O+sDFM1VUFhgUFE0pFgNkD6e2aNM+eo
	JIerIGBrpLK2f6J9D+yP+c9M5FUjhhWPuws1ejS84epEv8bQac04dn98wUFTeXZM
	kjvId+5SGjr8QIHJhfc+jyA2PFIYZsXjWvAz2gioXXesV0DcdqyIB+2SzI149uPa
	qR5nE4gkh3fhGd2R0g5wTp6snGqnSAgl54OZ7hfB3NJYJkFXSQrYK05vAJmwxmZx
	LNs93JHdAopM8jhneEV3LfdeMQ43cBcmX8W9DRFosU9GF+EzCPXRsQiKBOUE58yt
	eQR+od+dXN2rrnB0V9C4trHxKgyMw==
Received: from ph0pr06cu001.outbound.protection.outlook.com (mail-westus3azon11011059.outbound.protection.outlook.com [40.107.208.59])
	by m0384305.ppops.net (PPS) with ESMTPS id 4g4sd8j6er-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Tue, 18 Aug 2026 15:29:48 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lsymGhexXx9zM96JqF0J8ydy+AT1OiTg9qDkUccvZeAdOs+ylFEUhCFZmZ0rrDR2h4Nzf4Y3sBfxLeBAtSJJdrtdKE/SpfveCFlLn/r6eKYId69F/h5RYqp+Y2yIZLdzFUCWvIgdhRqqrE0bPa+uJaqhITHgV/sQwESydZP9bpBizf7zWaGd35ZEBdyUlZfDISCSBrjGIDFqPzMRlWWTP2kMcu5GHhAJt5NWSIK/r3BYKp/fFDIwEEiGjJxyiK9EFiKtO8IkcU9NEfeOOs25NpvjZdecWppUzOFyyDbu9/zT7m9RWyBq5IGW9orNCwFp1rY39IvmhI9nCh6zap95og==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4X78tZMhivt0mjnj5HrX7e7P7cnVRakspHE4iswPVZk=;
 b=gW4JyxEDsdaqnn38xQyqubg4MabnaMJxEZAhmdNstFrOymX4lZ1Mu5aVPV6n9qbIKZuOTK6qBYA30X1uaag/l5xookH06fPjLnkLnmcAkvXMCTlrVnlHoYWKuFdb2JWw3Yv/+/0L6b6b7IFCF1YP/Q7MW4eKYKizz3QTZ/Ns3eYR1tDj/AaR3Tq9PaU63rXpeS172CZrB9jo5af8VasNjeFXX287Bppw7Sgcw/fx030XSz4dHRQ6PXpC6ytcrb+rN/0YW/A/sxyuv9hOfZN6APAp63jDRgnRns4obLbvb9Hm5kDhX6THFXEewDSiuXC8gPJijCy7wRr/zB4TC8iPfA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.195) smtp.rcpttodomain=lists.yoctoproject.org
 smtp.mailfrom=list.ti.com; dmarc=pass (p=quarantine sp=none pct=100)
 action=none header.from=list.ti.com; dkim=none (message not signed); arc=none
 (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=list.ti.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4X78tZMhivt0mjnj5HrX7e7P7cnVRakspHE4iswPVZk=;
 b=UeOtWkGT8IBnC36gOHaou7wuidJxAeeYDTJz4qxRZnruomPzan4RZpoOkgYzjUQbl87R0U2+Z0v0AHqmXneRhZdWQwmfEEA20/l2sDSVmAV0DYHrFT+YQ3lMOfovYDOEENP/ffqzDHqI2TbFHW9YbRFZl4UqdyNF5BZcKrsci49ekaS+RbX1ANiV5hVxHCj3iS7EN5haqTfmtSQapuZxYe68/LwwspDJZE+8RwnZfPo5EWEZRgR/doesIy+b/PiamPMdO8FrvQqeSx0GMrUgPh8DveF+4746+vRDI7Dd47D6i08iKOVkCf8jrFeZM81F/i9K48wqtRdIvaw40XWOCQ==
Received: from SJ0PR03CA0144.namprd03.prod.outlook.com (2603:10b6:a03:33c::29)
 by SN7PR10MB7045.namprd10.prod.outlook.com (2603:10b6:806:342::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.315.17; Tue, 18 Aug
 2026 20:29:43 +0000
Received: from BY1PEPF0001AE1A.namprd04.prod.outlook.com
 (2603:10b6:a03:33c:cafe::73) by SJ0PR03CA0144.outlook.office365.com
 (2603:10b6:a03:33c::29) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.315.17 via Frontend Transport; Tue,
 18 Aug 2026 20:29:43 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.195)
 smtp.mailfrom=list.ti.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=list.ti.com;
Received-SPF: Pass (protection.outlook.com: domain of list.ti.com designates
 198.47.23.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.195; helo=lewvzet201.ext.ti.com; pr=C
Received: from lewvzet201.ext.ti.com (198.47.23.195) by
 BY1PEPF0001AE1A.mail.protection.outlook.com (10.167.242.102) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.339.3 via Frontend Transport; Tue, 18 Aug 2026 20:29:42 +0000
Received: from DLEE212.ent.ti.com (157.170.170.114) by lewvzet201.ext.ti.com
 (10.4.14.104) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Tue, 18 Aug
 2026 15:29:41 -0500
Received: from DLEE201.ent.ti.com (157.170.170.76) by DLEE212.ent.ti.com
 (157.170.170.114) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Tue, 18 Aug
 2026 15:29:41 -0500
Received: from fllvem-mr08.itg.ti.com (10.64.41.88) by DLEE201.ent.ti.com
 (157.170.170.76) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45 via Frontend
 Transport; Tue, 18 Aug 2026 15:29:41 -0500
Received: from fllvdckhpci031.itg.ti.com (fllvdckhpci031.itg.ti.com [10.64.72.41])
	by fllvem-mr08.itg.ti.com (8.18.1/8.18.1) with ESMTP id 67IKTfFx1981197;
	Tue, 18 Aug 2026 15:29:41 -0500
Received: by fllvdckhpci031.itg.ti.com (Postfix, from userid 60899)
	id 021222A52; Tue, 18 Aug 2026 15:29:41 -0500 (CDT)
From: PRC Automation <prc@list.ti.com>
To: Ryan Eatmon <reatmon@ti.com>
CC: Praneeth Bajjuri <praneeth@ti.com>,
        Denys Dmytriyenko
	<denys@konsulko.com>,
        <meta-arago@lists.yoctoproject.org>
Subject: Re: [meta-arago][master][PATCH] open62541: Update verion to 1.5.6
Date: Tue, 18 Aug 2026 15:29:40 -0500
Message-ID: <20260818202940.4039301-1-prc@list.ti.com>
X-Mailer: git-send-email 2.43.5
In-Reply-To: <20260818200514.3960992-1-reatmon@ti.com>
References: <20260818200514.3960992-1-reatmon@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BY1PEPF0001AE1A:EE_|SN7PR10MB7045:EE_
X-MS-Office365-Filtering-Correlation-Id: c3130060-eda9-4913-4b64-08defd676f7b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|1800799024|23010399003|36860700016|82310400026|13003099007|56012099006|10067099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: 
	eUNjqBjNqGnT7r0QYlRnZk3kX/5tIRMsnXRRwlF5DMjue71kDV8FN4bwqcHzSnWSB57j3MSgEUCOODs0c1YlSwLTxGuMeLMclepg9IrTTcQ6f0q60SMu09vSymm2fyQsiFzKpomPOHPOg4n9QG2Tr06mDZ8Tkm9GTfv/O+bnJOY4X33BQq/cx3akq3t9p8NwQDJX6zdNSJb9zzpNyIjdecLgeQE+DnZhIY3ifKqct0UUpeV2kbOSf+GN1BqUBkMXMs/vk3YaC1vkJMmZRD2y+XFkMvYv2vEOId3Wbg+WenZHDzdZfMD3oCQKENv7Sk0aiKBgUiaWSYXK0Q2I/XutVic/2VBXo0zEB0Mpb7M557AspiMpq3uq370a8SZpj8tPpBScvvd7P+U/943RW2eKH/uuYJIXBgdXmHKXHt4dClzIQcMx7GPyG0epzS8QOuTq51FtfVB1GlAFEyJh+Adi5bbA3RO1X6tcL85gApFlje1KlJUr7SwA/k19pqNlNIWhqz1rU3okRPyt4pa0Dupyd1HIPIGD5RF2JX55vhYfEysQXYX32UiCxUKVOTjFTVXZj7/KZWhP9eoxeHlLaqRkQVsE6l58c66w8lmEK/Yu6iISlBMp2ecWbVlzkYvobPKBJvCawbNYjpIPkpbqha9pUHuQ4gwZUTq1W6G69VddBTaxGIoLaRuXzkXu+LYjsd5w682WZ2t9+lNJInH3YALzVg==
X-Forefront-Antispam-Report: 
	CIP:198.47.23.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet201.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(1800799024)(23010399003)(36860700016)(82310400026)(13003099007)(56012099006)(10067099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	DmU+L2OllNQSKN3sDjh1AwNVkP1ULjG9zp1fyur/BvpzR6rwbIxdvgX/8Mll5Gx1xfOebp9XFkeRZ1S2C3AKovFg3DH3UjbsH2JsJeFflWKDdwBKru+RECWJYAczsmXnCUbDQZdoX5SA50c/MAfJFNLP522xy66z1qghERVNwZUhQo3lnf5SYQkwRPU3TniKf68gtiqYm+PEZL/sGjHEY5rsM4ZhCrg7xbO5vCE2W6uwTmgJY/8D4n6AGENF/uCWN2jDNP7ngGo+AWq+VZBBABw2Ri88ySid7uYUrllN+MMEQgr2h5sykXoj5+hMmiF8hnbUUxKw50UIv6Sw4npWx9t5j/8y8z8l059dK8bVmWqDlW3PTEKSXHy3zE5zPamAeoUBz8HR8FfGgwKjGRJfvvKvfwqx2PWlUZz+grVGjvpNJUhDlpeJkoIY0xc6l0LE
X-Exchange-RoutingPolicyChecked: 
	bkbALbbVsypcAxx52058+1/h3/JcRo7vOvHzNTY1DjpFvUotumIp7TUVgo3okHlfRPOUejHUeStDOpYSQ/eNSBcVOpYzIu38ewTodhIsYSgCL9W472xkxhNdYrkCnMeIGL+40ZVU/SV1JhEc+gz58A3hHVEUbeRk0kNF+aecxE+S6+gLTxCHpPvLFI/IsUAfhcun1fZop1ogEoo+AJxQApqdIl990To1FXPk4QlcfYPIWSK2rX4amQJGmiCkHUEu6hkkMNEZ6nAdkjadA1v//Gctre6HdjPEDKvrkO0J3J8P1G0wxlJNj9MetsNSwlFFwS5JtuZWUr5/MrxI6usVYw==
X-OriginatorOrg: list.ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Aug 2026 20:29:42.5686
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c3130060-eda9-4913-4b64-08defd676f7b
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.195];Helo=[lewvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	BY1PEPF0001AE1A.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR10MB7045
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODE4MDE1MCBTYWx0ZWRfXxr6IhqYyHKUA
 euG412UCJrMc3VN3gpZn07QrK8o77HLVVLa2dlVMV2eRfKMsU9kSXlyetxjC4CID3q0v+hxSsMn
 ETqZWsmHQ+BFf1R5UM8AqWU2QE1iYOKa5UVbD79hsLf1olkxRkNocwrxg9z2jnmZFuehQSfphHf
 ApoJu1OYa1Jyhsjkl/zMQmdrHIeAnrgrsogPRTbjihtnozxeJfKUdhmE+WxU4bZ2j3QdB7Y6fAs
 FpVwpqJBQ62ZMjjAJij0mAebUCsGoALpoSM/gAKntIzAhkYD+FKy0sXzU408Y9komH/UIbdx4W/
 N0PkQrsTzU/MMshr0wze4WU51RKk1A0g9hRkw2LHqseW4k3M3XsNBeiCetkkC4NvT/VVOsPRspk
 39H2lGV84ACCICvgvwYyY6e726fjIWc5QmrBcB+6SzXnTY2dHEMsJMKPce41bNpiEdVlVrVwob/
 eQs4kLrq2ne4ZFdgdQw==
X-Proofpoint-Spam-Info: AW1haW4tMjYwODE4MDE1MCBTYWx0ZWRfX/MOA0IpSryW6
 kflLrnvlzem4r8SmX9usim8BymXoS9N88QNaXVwvYv4w5ppo/J61t+5403phNI4AeDSRsnnCfR6
 UN8jJlfJPotRxUk7QE55Hzi42ok6fd8=
X-Authority-Analysis: v=2.4 cv=e7o2j6p/ c=1 sm=1 tr=0 ts=6a84c0bc cx=c_pps
 a=mhFp5NV/8UFWlOcEKiO6Eg==:117 a=f+v6EHfkeJbVwR46tk4DMg==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=Sv0fKeRqtYgA:10 a=s63m1ICgrNkA:10
 a=Vs-ZokuVWRQA:10 a=VkNPw1HP01LnGYTKEx00:22 a=Z8NIEmU8O1QQgoT56wFK:22
 a=taLDd7a_hP9WKsMzeGRc:22 a=iGHA9ds3AAAA:8 a=sozttTNsAAAA:8
 a=WyDztqN3bz2GPKDHZVYA:9 a=nM-MV4yxpKKO9kiQg6Ot:22
X-Proofpoint-GUID: 5y67Yg3QH5XQ8_yWmjgLNGJFCI4aVXqt
X-Proofpoint-ORIG-GUID: 5y67Yg3QH5XQ8_yWmjgLNGJFCI4aVXqt
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-18_04,2026-08-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 adultscore=0 impostorscore=0 malwarescore=0 spamscore=0
 phishscore=0 clxscore=1015 priorityscore=1501 bulkscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608180150
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Tue, 18 Aug 2026 20:30:01 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/17602

meta-arago / na / 20260818200514.3960992-1-reatmon

PRC Results: FAIL

=========================================================
  check-yocto-patches: PASS
=========================================================
Patches
----------------------------------------
WARN - [meta-arago][master][PATCH] open62541: Update verion to 1.5.6
    WARN: Commit message does not include file/recipe name: open62541: Update verion to 1.5.6. (COMMIT-MESSAGE-2)
        patch
    
    For details on the above errors/warnings visit: https://lists.yoctoproject.org/g/meta-ti/wiki/40887



=========================================================
  apply-yocto-patch: PASS
=========================================================
master
=====================
Summary:
- Patch Series: [meta-arago][master][PATCH] open62541: Update verion to 1.5.6
- Submitter: From: Ryan Eatmon <reatmon@ti.com>
- Date: Date: Tue, 18 Aug 2026 15:05:14 -0500
- Num Patches: 1
- Mailing List (public inbox) Commit SHA: 6b540f9bc8ca935bf8ec0b21db0cf75c3b53021a

Applied to:
- Repository: lcpd-prc-meta-arago
- Base Branch: master-wip
- Commit Author: Ryan Eatmon <reatmon@ti.com>
- Commit Subject: open62541: Update verion to 1.5.6
- Commit SHA: 037e392cf0e0e89c0c8472c328fce21fc217f172

Patches
----------------------------------------
All patches applied



=========================================================
  check-yocto-repo: PASS
=========================================================
master
=====================
PASS



=========================================================
  yocto-check-layers: FAIL
=========================================================
master - FAIL
=====================

ERROR: Multiple recipes found for mesa-demos
    oe-core/meta/recipes-graphics/mesa/mesa-demos_9.0.0.bb
    meta-arago/meta-arago-distro/recipes-graphics/mesa/mesa-demos_git.bb




