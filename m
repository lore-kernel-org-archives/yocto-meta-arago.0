Return-Path: <prc@list.ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0F3DFC79FB6
	for <webhook@archiver.kernel.org>; Thu, 10 Sep 2026 01:19:39 +0000 (UTC)
Received: from mx0b-0002e601.pphosted.com (mx0b-0002e601.pphosted.com [148.163.154.28])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.3759.1789003171094985361
 for <meta-arago@lists.yoctoproject.org>;
 Wed, 09 Sep 2026 18:19:31 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=proofpoint-05-2026 header.b=JTF5oi28;
 dkim=pass header.i=@list.ti.com header.s=selector1 header.b=YAam8+k+;
 spf=pass (domain: list.ti.com, ip: 148.163.154.28, mailfrom: prc@list.ti.com)
Received: from pps.filterd (m0374955.ppops.net [127.0.0.1])
	by mx0b-0002e601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 689MAX341694320;
	Wed, 9 Sep 2026 20:19:29 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	proofpoint-05-2026; bh=IYOp/Za4OBxeQubK4ul1ACIvGdmAQhHw9xoaZSKjn
	OQ=; b=JTF5oi28pi1HuV9nkOfEi6x8Qnd9HAKh7lTwFIS/KGA9VTNXKDSK2Ja8/
	VrVLJKnIEkWCt29HXr40mv5CnDmirtYpAbB2GvLdfti+VGN1phMCDNrnIgPJm/ID
	VUSKHrmgNeipnRteQNq7kDdAvdcn4opdIvpEf4gpNmRRPQgJh7J/LmPjIinqmkBc
	o3jcaq6RxcUmRb5gLd0/JcJ3rclI1xmATwQoSe4LgVlWZJ8mTqbbYNA9O/6/K3wU
	YirSS7Ll+IWqoqJzU/iukl7goETtuLx/T92IZf/Oveo03vIB2hFqUKlOySja21Wt
	xZDCCDXvh3ElHQlOYesr4s47xlvZQ==
Received: from ph0pr06cu001.outbound.protection.outlook.com (mail-westus3azon11011059.outbound.protection.outlook.com [40.107.208.59])
	by mx0b-0002e601.pphosted.com (PPS) with ESMTPS id 4gkcxg2cmf-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Wed, 09 Sep 2026 20:19:28 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=sHnjTfhspuIaTUxjP3yC5nOGx9zQNDLqORf/syXlE81ulSBtABH876+85HhYw025QV4esVAWGlkhxLJMYpaN6yOfEff8Y5G4DwUuYy5bC/FHuK4lTncLBLAGPSOSYcln7ZVCdncK+/fovTp3DLulYEzs/JWFPP1+G5NCIfqdseuD/YfvvS0yWKpXJQqTezq6XnCb95jqysz7iybUtaumh96+/o47rGN+VSiCnJDODkycu80U3ATL1rIzXCzmRMy7M5PFlRHAui1BBnqYi65er7Taxm/MNGPFECesYdr6pPOvhKOsqwhii5EVdLAOdh9RzPslMHWoq7/U+FQ/GSmVrw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IYOp/Za4OBxeQubK4ul1ACIvGdmAQhHw9xoaZSKjnOQ=;
 b=WhEWD5muCd2JvZkuYyvBKSuPFNGJooMSZ7TFyW1dMvpSkVvnWS2xCLhiYAbbBQzbLjhLss5ly8XuVHvkAKOwkmdKRCkXODAPPnkoi0N42U9FEEMWxMPem3v7qxiORKfjc64LZORenCkoixsvZhmrScCok0JXmLMZAhzalP3kPiEVouigZyD9JSFr+6a+ZwHu75o3PkcDzT/yw+sTI6XrFt2xb52Abc07lEhdGSicqQobtccGeh1HQIkrdby4+JFTRdILXjOHK4Rk9QpVTSmd9lZzhcAYoIr5LamNPPWOe4MDvj0T2IEGNPyHUYSI72Zumy8G04dSXHvAM0j7cnzA9w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.194) smtp.rcpttodomain=lists.yoctoproject.org
 smtp.mailfrom=list.ti.com; dmarc=pass (p=quarantine sp=none pct=100)
 action=none header.from=list.ti.com; dkim=none (message not signed); arc=none
 (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=list.ti.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IYOp/Za4OBxeQubK4ul1ACIvGdmAQhHw9xoaZSKjnOQ=;
 b=YAam8+k+y/lbYqhHKrHlVsA4WCiHU/Gt3/5VJqhYQ4pRnwCyxrXnApxjzzQtxPqBF0hrF1A5NATHe7XOf8CBe48JRa4cTFZmpjM8KN7sbFHTgNX+rujYSfYhDquoDWKflH27QJWfR/f+GHr38DZplI9bw2UY3dUeCMX6bmexqSyKQ22gW6AeDAmJ+d4VEGAhW8GHIsWrnvnxKPs6SL5HKCZCTz2d9Xqa9Dw55Cp6fqDjJ4T0sViqpsjWj6JqFhnicB5y90/I0C+6Zo2qhUk7wTM0ghQgfvYXMIZsuzGtRMkLtpKZxIUVexGr4+Ba9DQdsKbOG+SkeeMjb9+L5CMA7w==
Received: from BN0PR04CA0054.namprd04.prod.outlook.com (2603:10b6:408:e8::29)
 by IA1PR10MB8210.namprd10.prod.outlook.com (2603:10b6:208:463::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.406.5; Thu, 10 Sep
 2026 01:19:26 +0000
Received: from BN1PEPF00004682.namprd03.prod.outlook.com
 (2603:10b6:408:e8:cafe::9f) by BN0PR04CA0054.outlook.office365.com
 (2603:10b6:408:e8::29) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.406.7 via Frontend Transport; Thu, 10
 Sep 2026 01:19:26 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.194)
 smtp.mailfrom=list.ti.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=list.ti.com;
Received-SPF: Pass (protection.outlook.com: domain of list.ti.com designates
 198.47.21.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.194; helo=flwvzet200.ext.ti.com; pr=C
Received: from flwvzet200.ext.ti.com (198.47.21.194) by
 BN1PEPF00004682.mail.protection.outlook.com (10.167.243.88) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.406.5 via Frontend Transport; Thu, 10 Sep 2026 01:19:25 +0000
Received: from DFLE209.ent.ti.com (10.64.6.67) by flwvzet200.ext.ti.com
 (10.248.192.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Wed, 9 Sep
 2026 20:19:03 -0500
Received: from DFLE209.ent.ti.com (10.64.6.67) by DFLE209.ent.ti.com
 (10.64.6.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Wed, 9 Sep
 2026 20:19:03 -0500
Received: from fllvem-mr07.itg.ti.com (10.64.41.89) by DFLE209.ent.ti.com
 (10.64.6.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45 via Frontend
 Transport; Wed, 9 Sep 2026 20:19:03 -0500
Received: from fllvdckhpci031.itg.ti.com (fllvdckhpci031.itg.ti.com [10.64.72.41])
	by fllvem-mr07.itg.ti.com (8.18.1/8.18.1) with ESMTP id 68A1J24Z3915581;
	Wed, 9 Sep 2026 20:19:02 -0500
Received: by fllvdckhpci031.itg.ti.com (Postfix, from userid 60899)
	id 435D99A9C4; Wed,  9 Sep 2026 20:19:02 -0500 (CDT)
From: PRC Automation <prc@list.ti.com>
To: Ryan Eatmon <reatmon@ti.com>
CC: Praneeth Bajjuri <praneeth@ti.com>,
        Denys Dmytriyenko
	<denys@konsulko.com>,
        <meta-arago@lists.yoctoproject.org>
Subject: Re: [meta-arago][master][PATCH 1/3] conf: Remove openssl engines
Date: Wed, 9 Sep 2026 20:19:02 -0500
Message-ID: <20260910011902.1235218-1-prc@list.ti.com>
X-Mailer: git-send-email 2.43.5
In-Reply-To: <20260910005856.3904973-1-reatmon@ti.com>
References: <20260910005856.3904973-1-reatmon@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN1PEPF00004682:EE_|IA1PR10MB8210:EE_
X-MS-Office365-Filtering-Correlation-Id: 6924cac0-4d51-49b6-07d6-08df0ed98d95
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|36860700016|1800799024|82310400026|23010399003|10067099003|56012099006|22082099003|18002099003|13003099007;
X-Microsoft-Antispam-Message-Info: 
	iedXghrUbBIgIA0OFfCxJynytF8FP1cCY35v0k6nidLHARP8rOFijQwlZAVDOiaNKKfHqrKQNbxEfcIw12T33hwt5ze2uVmCpMaC/VPWQfI4JIC1MTUBHAY/rBC2/246bvRTETYGItuy8P3GhO+nveF+lp7B8/yjcmLsIVWO46uqir2u9eIbHgTNES1jYV4JBS8cBrNNTDWNjxI9hLb7ASllzulUucumyf2enkRzrer4aCW07ei+Wa2YWpHHWMdF/y7Gq+nbUbFcLqMGEM/Pl7h53xsW8gsJRZf2fmc/Q36BFJpqfa849v/eHbk+8MNN5L3h6JE3C3HicJG8KF+Tk3XU2Mnlta3REWfa8GObvD0zXOzZAqof6QRKJs6DFXjs1/yhUv0YVOCjvikzTr7VDGOgRvYj6/fFZv+gl4Lo9QAEPhox34TeuxJgrDsczmPG95UzW3MdS2OEktYViGtmlJP6tjWJwRGfCHK7l4WQNeFmF7INStlynJVRtCMIwrVZCXvhP5a0WK1VenYofbeACMe8zXKyIxZlKE/ieimVnBA5LKwv+YKGVe4WK5NsLXdtGu2Oa8pn/0Ie/BsuJoMAjj7HxP8cGFtcvhOIvlH/629PI5Qj7twGVuwNvINNktjtyzlO32zV2n6/LonigISjUw==
X-Forefront-Antispam-Report: 
	CIP:198.47.21.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet200.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(376014)(36860700016)(1800799024)(82310400026)(23010399003)(10067099003)(56012099006)(22082099003)(18002099003)(13003099007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	rf9qLNpprAFX8ytqMz3x8NZ6TkycQri9kPiXLaqYDpzHVquvBjcBN3Fs4PtrWF/RcoyQtgeVGFQC2TlHcT5q4ERf2RXSOf8DfphlbzXVWit9Hpx+egSq7HTq5kiv3pHcXhBlRMwsB3SmKV1i71iiK3JBNDwJ9cR6+9XTm9ijA78e9Jd3IQNhdYmk1OWZ+qwUNzf5YekhzyseBsjQkAs6/DyG81EoX03Vl9Wvticvktj/zsANF7uIIHZkIIVCzzhVw3RQzG7wbWLxAib/K9lVKUSeY/GJTdSZr8jR6fO7hh3xaEwXvfAb5ru/ydqA4WcbdPpGIZiAvaTgCD6QtNKY6zKPMdgmBbH5L9F3PiFRS6ZE4Jo9c7tKjCr+lFy3AMUPFvrgrz2wS7/mzfyxZ0XKRgqUsTstWDHVJjtWT27zmQCsAukiT/voZHYMPk/vQHvQ
X-Exchange-RoutingPolicyChecked: 
	rRyepEhn1oSOiSm4Ed2lDwD4m7PF8aPsUdk1dc3UVOGU31OSBFjl4Hyc7rF7YrzAq3Yc/UMBdwMfFbp627QrQ2awsmsJHBiiPxWIQEugCl5sP0Imehd9y9GbmTl//Y0QaRbpYaVgCb3GusD9m2u5Lf9/wsuju2H/O7mMLSIZVsD5EEBQEdJ+E2Lgn/4kryiExd0uPj78AaWJYbqUU3niR90vwZVBM6MMUkMESyrO5ou5raiCf/XomSmpWz9KDXV0+IqfTWssl1dH5sCvF89cfwj14v9jokLPOjFHWxGalzi6Cygwg6D/c4IH0MpKr7JEbNzHh+wx4QE7WWTfRzgA4A==
X-OriginatorOrg: list.ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Sep 2026 01:19:25.4770
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 6924cac0-4d51-49b6-07d6-08df0ed98d95
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.194];Helo=[flwvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	BN1PEPF00004682.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR10MB8210
X-Authority-Analysis: v=2.4 cv=MpPHeGae c=1 sm=1 tr=0 ts=6aa205a0 cx=c_pps
 a=mhFp5NV/8UFWlOcEKiO6Eg==:117 a=iwqwCZQqcuTv3JOpYdM7/Q==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=VdqzKS8jKosA:10 a=Vs-ZokuVWRQA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Z8NIEmU8O1QQgoT56wFK:22 a=fPAWb5peG099m5CrUpKH:22
 a=iGHA9ds3AAAA:8 a=sozttTNsAAAA:8 a=JWSAbJZnMq0dUbX48C8A:9
 a=nM-MV4yxpKKO9kiQg6Ot:22
X-Proofpoint-ORIG-GUID: YZY-OuBFifbyEDDhaVg4JIFX7DxWbyfM
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTEwMDAxMyBTYWx0ZWRfXwGqKXxWfRmi1
 2EGDRL8JiK5OAN4bY+mVQqO8Wag34v32Nf6j2TmgKw1dljZpv3hpcbw8b3vYSQ8w9tLV+WrruGM
 mrspfmVKy4USwTlCXKFEgqSZr4Q4+LU=
X-Proofpoint-GUID: YZY-OuBFifbyEDDhaVg4JIFX7DxWbyfM
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTEwMDAxMyBTYWx0ZWRfXxfaHG/2ABjkJ
 DW/qbXiGTZ9udpLAl0o0w9RtXqRxUVT+/u1rfu7botGG+NBHhn4UNrKGG+SbRD090a7UucCTYv2
 wZVM6Iy09Gxzh5IdKVvgaqtuCv9YbUOhnp134xZyNMpGEDe873heg+/SCvLsvZ88rS3DEgBhPCD
 xQWDTfmFWyZZsdeNwn1UY5kX0ZwJpVll2L4VQxDRvxvOdyb3QXVbyfjw6URe3dt8t/IMbbhQoHK
 vSbPgwZMneRNACZOHWkONbKCi+RzSexyum5C9k8a41O+oK8rIbO7yPIODz/FLquRWkQ3r+/c8xk
 lMN1+tT8ljMFPmv0UNpSwaDEkPV9YaBIqJXZp9XdtOJRu/igoQDuktr0GhUomx0e5hApj7MG864
 hcozlsS3HW7nidpmPf/fLvBGkRy5LSkIm9T7ygxxEBe3ZN9lAPjL1mpEF07QrWN5T0BbzbxHCi7
 ciA6KhGejzm3h+ho9tQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-09_02,2026-09-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 lowpriorityscore=0 adultscore=0 suspectscore=0
 malwarescore=0 impostorscore=0 phishscore=0 clxscore=1015 spamscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609100013
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Thu, 10 Sep 2026 01:19:39 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/17659

meta-arago / na / 20260910005856.3904973-1-reatmon

PRC Results: FAIL

=========================================================
  check-yocto-patches: PASS
=========================================================
Patches
----------------------------------------
WARN - [meta-arago][master][PATCH 1/3] conf: Remove openssl engines
    WARN: Commit message does not include file/recipe name: conf: Remove openssl engines. (COMMIT-MESSAGE-2)
        patch
    
    WARN: Commit message should not include directory path to recipe: conf: Remove openssl engines.
              conf (COMMIT-MESSAGE-3)
        patch
    
    For details on the above errors/warnings visit: https://lists.yoctoproject.org/g/meta-ti/wiki/40887



=========================================================
  apply-yocto-patch: PASS
=========================================================
master
=====================
Summary:
- Patch Series: [meta-arago][master][PATCH 1/3] conf: Remove openssl engines
- Submitter: From: Ryan Eatmon <reatmon@ti.com>
- Date: Date: Wed, 9 Sep 2026 19:58:54 -0500
- Num Patches: 3
- Mailing List (public inbox) Commit SHA: 0cb90220913a019aba79d2cd3ada3f1eea052881

Applied to:
- Repository: lcpd-prc-meta-arago
- Base Branch: master-wip
- Commit Author: Ryan Eatmon <reatmon@ti.com>
- Commit Subject: netopeer2-server: Patch for OpenSSL 4.0
- Commit SHA: 745d80a58f87d57cbccbf78d4a956b5611488a02

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




