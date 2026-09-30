Return-Path: <prc@list.ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C2F13CA5FC7
	for <webhook@archiver.kernel.org>; Wed, 30 Sep 2026 15:00:34 +0000 (UTC)
Received: from mx0a-0002e601.pphosted.com (mx0a-0002e601.pphosted.com [148.163.150.75])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.15649.1790780427281961665
 for <meta-arago@lists.yoctoproject.org>;
 Wed, 30 Sep 2026 08:00:27 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=proofpoint-05-2026 header.b=nnaA6Ohr;
 dkim=pass header.i=@list.ti.com header.s=selector1 header.b=SHi3LMbB;
 spf=pass (domain: list.ti.com, ip: 148.163.150.75, mailfrom: prc@list.ti.com)
Received: from pps.filterd (m0380145.ppops.net [127.0.0.1])
	by m0380145.ppops.net (8.18.1.11/8.18.1.11) with ESMTP id 68UE1Ii93333409;
	Wed, 30 Sep 2026 10:00:25 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	proofpoint-05-2026; bh=pFIl9gOeFBQHPIGWV1HghZKIcI6TxrqWDEjX9GehL
	E4=; b=nnaA6Ohr5khtMBcMH9lsMVFrVhJ4iWyET6aaUnojEjYoIDAXI1mfbrWdb
	jFwkXzOI9496aBkGqpwZ8kNsrxnKsSmdPyhQ9APYu9sxquUW667zX9veiGhDMmwM
	egjFPxbD25r3MCDsJaYZx2jS6LU7o4Z+DbXGy7MjACGWXQZudGtUerDn2kqswhrC
	PHKJr8i5iLuVbxMchO85iqTyEkFlEA4mBxTNiI7P37aWg12nr54aU/WztWpWuTzz
	9x30L4EmOyTvvxTLy+1mCUxb2uNMaufHRFbolME3DZdcv6HZs0SrNUICBoSpLHdi
	pYWrPY5gpXxZXjbo7OUBp7p95/ZzQ==
Received: from bn1pr04cu002.outbound.protection.outlook.com (mail-eastus2azon11010000.outbound.protection.outlook.com [52.101.56.0])
	by m0380145.ppops.net (PPS) with ESMTPS id 4h10t1sfmc-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Wed, 30 Sep 2026 10:00:25 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=XE0tHLl5ACAQ/hfiO0eT8fSescFPIVVczyBDt/htx9m53ubqjXIUEdch2Un7sDkBfJbwlwUqthIGsmUqyIOAs3hFkLygti6hyUv0+k20kWZJktjYfFxVtPT64LkznxR2G8JXSnir6keUKXe2TFiaWnEJ38h5aT3cv8ayOujbt9mucqOXVvhEMjMLl7oRVN6XRuEi971CxMMy0gVLeQlYGClDvROt+VwfWao8Ize73mkreinZLprTuXKCoI0/SvCdzG4/25/4Pherxj+j/9DFpA8ITboWi6eX1lS4PBe92v6OnOcNga4X2sKvX5hMIKEZtZGkK3yjTLbrih6/EdlyXg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pFIl9gOeFBQHPIGWV1HghZKIcI6TxrqWDEjX9GehLE4=;
 b=wn6L+/A+pgEDcCtpVVP+q78SWd5pACzYe4SQATZ2hRS+fXb07Tup+DIiLPgNTSV0Nd6rss/WJDrYdhcUcsrCoRENPsSzA5ggkY1Dg36aXWu37/BFJXNqDpcBUAMiX+yRHpa5qXkk65qpqyA4aUCjOLnzIH/8cTM+JL6PiWdHRCMhPTYC3wr6ANv0a/EeE/NswvEhyOfwiVaznsA5LqSBtm3CwIFP6vvq8BMM4Sv2Xmm/jjlCNEnGrzn8MorXO2HGiXabZ2gYmHT9Yosvi0vZV2+8Ak8GxeWqYIWBXZbSG0KnaTFATiOiJLus1yTdV3r75vGIwKxFpFVBCw2Ri/6axA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.194) smtp.rcpttodomain=lists.yoctoproject.org
 smtp.mailfrom=list.ti.com; dmarc=pass (p=quarantine sp=none pct=100)
 action=none header.from=list.ti.com; dkim=none (message not signed); arc=none
 (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=list.ti.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pFIl9gOeFBQHPIGWV1HghZKIcI6TxrqWDEjX9GehLE4=;
 b=SHi3LMbBqgGKYsqFKbVGjAneHPFYPZAm1ilA4u9nLcv6hX0cypa2Sp6B6uOg3Qj8qGzz33bSaNu5ky2U9AkaWj3qkoEz5NmchJDqQjneqj+cHfg47+Li9LkYIdzg1wHoSv4GOKP5gYTr33VEeP7jUZDIpN5hMewkkBuk8yNDmkYAFKhcMvYPbqUjRavUlzlt+5fk6nJFusmRXpGbxdL76jrYq1tUBNBd1inRa2np6RpBCbc4BUiiSkdnM30MfQac9Tzxxe0uwsFIHFmHgAiZ4haiA9c+7WYYPEjgcfRd286PKSiIQi11sr+kNTS5pcak29ptj1Ykc/YN0KJTAkLz/w==
Received: from MW4PR04CA0071.namprd04.prod.outlook.com (2603:10b6:303:6b::16)
 by CY8PR10MB7219.namprd10.prod.outlook.com (2603:10b6:930:77::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.472.14; Wed, 30 Sep
 2026 15:00:23 +0000
Received: from CO1PEPF000066EA.namprd05.prod.outlook.com
 (2603:10b6:303:6b:cafe::1a) by MW4PR04CA0071.outlook.office365.com
 (2603:10b6:303:6b::16) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.472.15 via Frontend Transport; Wed,
 30 Sep 2026 15:00:22 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 198.47.23.194) smtp.mailfrom=list.ti.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=list.ti.com;
Received-SPF: Pass (protection.outlook.com: domain of list.ti.com designates
 198.47.23.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.194; helo=lewvzet200.ext.ti.com; pr=C
Received: from lewvzet200.ext.ti.com (198.47.23.194) by
 CO1PEPF000066EA.mail.protection.outlook.com (10.167.249.5) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.472.14 via Frontend Transport; Wed, 30 Sep 2026 15:00:22 +0000
Received: from DLEE215.ent.ti.com (157.170.170.118) by lewvzet200.ext.ti.com
 (10.4.14.103) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Wed, 30 Sep
 2026 10:00:04 -0500
Received: from DLEE209.ent.ti.com (157.170.170.98) by DLEE215.ent.ti.com
 (157.170.170.118) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Wed, 30 Sep
 2026 10:00:04 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DLEE209.ent.ti.com
 (157.170.170.98) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45 via Frontend
 Transport; Wed, 30 Sep 2026 10:00:04 -0500
Received: from fllvdckhpci031.itg.ti.com (fllvdckhpci031.itg.ti.com [10.64.72.41])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 68UF04XC085806;
	Wed, 30 Sep 2026 10:00:04 -0500
Received: by fllvdckhpci031.itg.ti.com (Postfix, from userid 60899)
	id 7DD6A9A9C3; Wed, 30 Sep 2026 10:00:03 -0500 (CDT)
From: PRC Automation <prc@list.ti.com>
To: Ryan Eatmon <reatmon@ti.com>
CC: Praneeth Bajjuri <praneeth@ti.com>,
        Denys Dmytriyenko
	<denys@konsulko.com>,
        <meta-arago@lists.yoctoproject.org>
Subject: Re: [meta-arago][master][PATCH] open62541: upgrade 1.5.7 -> 1.5.8
Date: Wed, 30 Sep 2026 10:00:03 -0500
Message-ID: <20260930150003.1482808-1-prc@list.ti.com>
X-Mailer: git-send-email 2.43.5
In-Reply-To: <20260930143855.176265-1-reatmon@ti.com>
References: <20260930143855.176265-1-reatmon@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PEPF000066EA:EE_|CY8PR10MB7219:EE_
X-MS-Office365-Filtering-Correlation-Id: e6babe2d-95ea-4200-e7b0-08df1f038d0b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|23010399003|1800799024|36860700016|82310400026|376014|10067099003|56012099006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: 
	Nqx/mLRSeWC7g5aXnH3zK412MUm78MhrU/jUiMnnxHJg6gAj5AKaPJDcTm2eFVBw1HKkRLlCGZ7KFP3SfJUbd302hs98zRlu6aHYCXOMv9ExiaM7qpUgJ6FpmJ4xiA50akXAJvQPOD/UYXUx6MWIW2sARwpfBHo3By5+zjPimRlC0jKdnsQk5+Al5/sOZ48zHGdkAttRK4oAEkOIyVODoviatOo31Us2cwXsP5JGoS73MI+GzDnsu2T52zOkSxQKYE4sgmUNDrSTbzoau/+dzj9k5YJiw8y+CS/eJCsQrd7Lx4wHWzaZM/SHBpFwMa6+jexAWYbBYkYrlBeP97SQEGCmNpoE6W5BtOuEFHIIGLn7qTJWGYR7Y11m2qaAOITKiywzgEY/Vh1qUOPevZAubVAYKPXc1NQV6C+mQ87gnBPc1PrlADVuaXlIrl0FGHzt4j8ppjE00eXdJKqqEmmzatmYSoxv2CjD1UtRieNSiuce+svVL8YyUnDPOBFk/1ML1kE9RoDYXcoGNZZDWTNs15bur4/Lzh1TnXi7RD5BBeU755VwD/SpAu9STeeO6sWPHVoTTNF5u8z31RypZWl+r9lCrlNa+cxd7ubnHM0uuGHy2I6KY8wcbKIQTEWwnCf5DU2khF1DzqV8vl8UwlMaIg==
X-Forefront-Antispam-Report: 
	CIP:198.47.23.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet200.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(23010399003)(1800799024)(36860700016)(82310400026)(376014)(10067099003)(56012099006)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	OkZ0JYs5MlJDoy+UA8MPnXMK0WBUL+YE/MLaOJKsJz6PHOaAAzRSGjZNH6OJgBa2v46SaxhU2rzS+ZBTmlMMR0wcgQS1AbDQ+FQLr7fQZPzW7qXBuCmC7wznjpQ12anmvg/61xjQxFx117RLcqSFPD9PAZ0AmJ7/3t1ZC30VlvSE+h7f4ituGWfk1hJU+brBb8D/cZtQU6UPMxOEdBtQmbdbjwsRoPXY9cov8ZfvEiHUzMITPRGl9NamMMnFheg01RLq1IadNKmkv9TLyFsonCGLT/eqEdUvEB/I+I5IIwEJQS/HMJqkLedyRxExQnBJz4w6nbFGaZr4zvFBxkebg02oZBp6YTDmvwK1+ez/EB/CQc5VO7QJrcNRy4vDw4OnAuUAPAm1yodGztEDtuZNYB3rS63hMqf0lGoAsI3es/e69f6eLEadj7WOp2wrDdNz
X-Exchange-RoutingPolicyChecked: 
	fpGj5R8hZNu7wilDA+9nEe5kXvCz1b1iq4dSRgck4kiKPOFh+gzVnjsbJuc1TCb2Q+EOheBMNOcHYP7aFIMD+VMKljv1y6yR/2rXIzuKfcNJcDWsMvjDU0AHp5SEZsQxqmMK0Z/gr01BfJAQA22mvRUKIaRiifHHELka96BlUkquGvfcChOUI2nJ/Gw9ngS7XFEkQbTn/cQp32mptpcpTSYygS9im2Uo6fRI0jy6VRd+olt8FF3/sDIKHvHwJwVHjMlR9mkGCQAHErT7/L2M9SX+yjVIdWnvBdea3xWysI9KPgxPhYOx3FLweoDOqyvL2p32SD54ASmQDMdXZknpdQ==
X-OriginatorOrg: list.ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Sep 2026 15:00:22.0263
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e6babe2d-95ea-4200-e7b0-08df1f038d0b
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.194];Helo=[lewvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	CO1PEPF000066EA.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR10MB7219
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTMwMDA1OSBTYWx0ZWRfXxVgAUzTnAiaH
 1xf/TjnzA5h5+Re5sSRIEf76TlN/4fmEObByGJvEf5+x4n5xfzp0u9hB3z3GPycwfCVy8THBmA1
 UiRa7icKffakNzASwNNpMbEIJf6GQlI=
X-Proofpoint-ORIG-GUID: Kfl3zoshysa2PzTaLWY-OTfN8O4DgtBx
X-Authority-Analysis: v=2.4 cv=C7R8WgP+ c=1 sm=1 tr=0 ts=6abd2409 cx=c_pps
 a=EtrKi/+kAVY73poqiPL3VQ==:117 a=WotqVVQAdb04rnGuttW3Kw==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=VdqzKS8jKosA:10 a=s63m1ICgrNkA:10
 a=Vs-ZokuVWRQA:10 a=VkNPw1HP01LnGYTKEx00:22 a=Z8NIEmU8O1QQgoT56wFK:22
 a=gO1vWkAQAl3rybz1DQOp:22 a=iGHA9ds3AAAA:8 a=sozttTNsAAAA:8
 a=tKBOHgs7WzV1Bf6rbKAA:9 a=nM-MV4yxpKKO9kiQg6Ot:22
X-Proofpoint-GUID: Kfl3zoshysa2PzTaLWY-OTfN8O4DgtBx
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTMwMDA1OSBTYWx0ZWRfX9s7rWNpQZ5j6
 6Xv8Ni0dWeq8W70ev14/HOu7Fqgrc5e2NFbisbqCeLhTKPmyWwCOVGj02c5OguRZSeOZOskiCDv
 1XiS3G12/O8RiYothUmnLOTXGsMgh5hSL0WkKsGX250QKamhB987txEGpO+ESwcIbXwn73HviT+
 Q0pqOJQrxDt4DCG7WFKhy6Dr2nrgH5FTBfTOWt0Fwp8uDensBE7jwdtwmlK5ClkgUAa3ceHulR9
 Yn+JU+vwvayX6Y0xVEHeFoDBQmqeKfNtoSexVlYmekA1nkP18AsQyMEA2aAgKmF9w2Qm4Qoj1pO
 AwLVm+naBFY6/jiH+F3A7C7vFYbtL1C6a6GTBxCXBo0LZgDCRRekLBT7as7VRceLqsI/WMgP5qZ
 mvKardMUV0Eg21e3uAdTVlrqn/lBnNevLstAQr+Dr59tE6vCasHJfGV7l5C736EbOOSHy0HJMGF
 VITIkmP+PVJl9dahzcA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-30_03,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 adultscore=0 lowpriorityscore=0 malwarescore=0 bulkscore=0
 priorityscore=1501 impostorscore=0 spamscore=0 clxscore=1015 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609300059
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Wed, 30 Sep 2026 15:00:34 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/17717

meta-arago / na / 20260930143855.176265-1-reatmon

PRC Results: FAIL

=========================================================
  check-yocto-patches: PASS
=========================================================
Patches
----------------------------------------
WARN - [meta-arago][master][PATCH] open62541: upgrade 1.5.7 -> 1.5.8
    WARN: Commit message does not include file/recipe name: open62541: upgrade 1.5.7 -> 1.5.8. (COMMIT-MESSAGE-2)
        patch
    
    For details on the above errors/warnings visit: https://lists.yoctoproject.org/g/meta-ti/wiki/40887



=========================================================
  apply-yocto-patch: PASS
=========================================================
master
=====================
Summary:
- Patch Series: [meta-arago][master][PATCH] open62541: upgrade 1.5.7 -> 1.5.8
- Submitter: From: Ryan Eatmon <reatmon@ti.com>
- Date: Date: Wed, 30 Sep 2026 09:38:55 -0500
- Num Patches: 1
- Mailing List (public inbox) Commit SHA: e85493be333f10e8e2aaaee70023f28b55f9cb2b

Applied to:
- Repository: lcpd-prc-meta-arago
- Base Branch: master-wip
- Commit Author: Ryan Eatmon <reatmon@ti.com>
- Commit Subject: open62541: upgrade 1.5.7 -> 1.5.8
- Commit SHA: 170fff909c58178a4c21b76fb3866b17bd9b7cc3

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




