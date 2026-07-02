Return-Path: <prc@list.ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 934DEC43458
	for <webhook@archiver.kernel.org>; Thu,  2 Jul 2026 15:20:38 +0000 (UTC)
Received: from mx0a-0002e601.pphosted.com (mx0a-0002e601.pphosted.com [148.163.150.75])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.71720.1783005628650716942
 for <meta-arago@lists.yoctoproject.org>;
 Thu, 02 Jul 2026 08:20:29 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=proofpoint-05-2026 header.b=edT8dv7i;
 dkim=pass header.i=@list.ti.com header.s=selector1 header.b=Pn6syKB3;
 spf=pass (domain: list.ti.com, ip: 148.163.150.75, mailfrom: prc@list.ti.com)
Received: from pps.filterd (m0380145.ppops.net [127.0.0.1])
	by m0380145.ppops.net (8.18.1.11/8.18.1.11) with ESMTP id 662E1ZoT2612671;
	Thu, 2 Jul 2026 10:20:27 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	proofpoint-05-2026; bh=VB/PQS5lpk+2LzT8xNrnOqB8hItYsQT2Gu2l515cK
	ko=; b=edT8dv7idrPHxyuymtn4PlytX1ArkBmPYK5fXIHDJAdviYvMywTih5FYz
	mtfY+aRVlw0aw6Jarc/sU6pwndnxureCttCtUoDl0ewsRzZ6paf5C+uKX4kSJATt
	CA6DEYkPBaGULtDaUSVNF1uVESZxeEG9PqMAASmatc31IPm8S18/M5zmPdFIk9vi
	+FUZY2mqrb+zsRGyynTVqzf/kd9PSFzDAJ6D2rB9noOlF2TE0xxGlqdBwe/AhJcB
	Nr86jfSkvn8lkzkfKE0WRGPg/CPNmmKQBR+WC4Qv6IG9N0VyGbbSJB7OGFIPdgIg
	r6Ol4gWA3WFYab8c5P2IP2ac/KzaQ==
Received: from sn4pr0501cu005.outbound.protection.outlook.com (mail-southcentralusazon11011050.outbound.protection.outlook.com [40.93.194.50])
	by m0380145.ppops.net (PPS) with ESMTPS id 4f5mn5a601-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Thu, 02 Jul 2026 10:20:27 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Na6hsCo0TmenIATZjQNercuPXT1UkFRpko4/BkgxCOU+RVMHTk7dCLbUPwIuxiLzpcEDqCjaQRz3qw9vFoUmygFswhcxjvSPpkDQOeu9LhDQRm1gB2XppS4bxIRcw2Fo3Qcx7KBZgeINBh54tzt6H+dPjbic2zsgmljUzFYdJ4Edbk+zyCSdBILl6rfZ6CaT6lUvxORFU8cmBNqdyArJqk/5LY4XrMEqcsQH8QVEPzQAQe5daOTE9cXPYlzURIsLacayNeyfdn0RGMMBga4MDo2/33A3lzVdst0G6R1mOuCYaDn6dzUrj1TuNhaQ4ZsxGURbVsE6rwYhpLQW0t8L5Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VB/PQS5lpk+2LzT8xNrnOqB8hItYsQT2Gu2l515cKko=;
 b=VAmlrDP/7gAOT5fNnkId2cxJO5ket723wSmuRWOcVEmGKF4P/L/+4fU1dbacJ5MYb8jkle3RIjMM9nn88heDUPzLaN+JIO5eGg7HFK+3jeuuUHmQq05ZK5vJUqjBi9rbHcZy+3zCdi0mK6K1MaVQG+KCbLqkBTskykGheaU0pV7V/lY02vWYYfq8ljQJ6xkTm7Rc29wdSkjsbWJNdK25d6HQcJSAMax+yF8wDcXe0PIA4NIvHRAAMVASoMK3tOvCq+ToccmwODMjmvSTYaBwfVYHQgYvqbdbLrw+IP0wTixT2rTNTQk2OzaUGdwG2on4SGDoShVSM8yaKR5gGOE4aA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.195) smtp.rcpttodomain=lists.yoctoproject.org
 smtp.mailfrom=list.ti.com; dmarc=pass (p=quarantine sp=none pct=100)
 action=none header.from=list.ti.com; dkim=none (message not signed); arc=none
 (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=list.ti.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VB/PQS5lpk+2LzT8xNrnOqB8hItYsQT2Gu2l515cKko=;
 b=Pn6syKB3PS5IFb5Xix7kOel/OiS57tfOb2vm1O93Vn7PxMhA/aoNB5g8phx1NY4kJFrlAOsRc4UoC0zg/Vnmp6ReyHkGa1dZeqMD9cm6G0Kkcun7680NA+oEWU5EwUid/Zw9zUIlJJz7nTqJ3YKVVn+PggX17wfurJ6A2GgKF2CwnSNpowf79jbpS09c74Bn1Zl0aVg0OHZ/7JTo75SncFS7q3NhbUO/FUcWinK8yni4A233oGVhQ1LMtIXhu9w/KAOXq76X89G3PcSbF8KEHMOhtPOKka2M6vMJtart2XzA4csDKHrAupAc+/d3vqwwuSrMYxKEb1ymFnXFDz45jA==
Received: from CH0PR03CA0059.namprd03.prod.outlook.com (2603:10b6:610:b3::34)
 by PH0PR10MB5660.namprd10.prod.outlook.com (2603:10b6:510:ff::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.10; Thu, 2 Jul
 2026 15:20:19 +0000
Received: from CH2PEPF00000145.namprd02.prod.outlook.com
 (2603:10b6:610:b3:cafe::84) by CH0PR03CA0059.outlook.office365.com
 (2603:10b6:610:b3::34) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.181.10 via Frontend Transport; Thu, 2
 Jul 2026 15:20:19 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.195)
 smtp.mailfrom=list.ti.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=list.ti.com;
Received-SPF: Pass (protection.outlook.com: domain of list.ti.com designates
 198.47.23.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.195; helo=lewvzet201.ext.ti.com; pr=C
Received: from lewvzet201.ext.ti.com (198.47.23.195) by
 CH2PEPF00000145.mail.protection.outlook.com (10.167.244.102) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.181.6 via Frontend Transport; Thu, 2 Jul 2026 15:20:19 +0000
Received: from DLEE213.ent.ti.com (157.170.170.116) by lewvzet201.ext.ti.com
 (10.4.14.104) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Thu, 2 Jul
 2026 10:20:17 -0500
Received: from DLEE214.ent.ti.com (157.170.170.117) by DLEE213.ent.ti.com
 (157.170.170.116) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Thu, 2 Jul
 2026 10:20:17 -0500
Received: from fllvem-mr08.itg.ti.com (10.64.41.88) by DLEE214.ent.ti.com
 (157.170.170.117) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37 via Frontend
 Transport; Thu, 2 Jul 2026 10:20:17 -0500
Received: from fllvdckhpci031.itg.ti.com (fllvdckhpci031.itg.ti.com [10.64.72.41])
	by fllvem-mr08.itg.ti.com (8.18.1/8.18.1) with ESMTP id 662FKGNU3429904;
	Thu, 2 Jul 2026 10:20:17 -0500
Received: by fllvdckhpci031.itg.ti.com (Postfix, from userid 60899)
	id 99D0A9ACF4; Thu,  2 Jul 2026 10:20:16 -0500 (CDT)
From: PRC Automation <prc@list.ti.com>
To: Andrew Davis <afd@ti.com>
CC: Denys Dmytriyenko <denys@konsulko.com>, Ryan Eatmon <reatmon@ti.com>,
        <meta-arago@lists.yoctoproject.org>
Subject: Re: [meta-arago][master/wrynose][PATCH]  packagegroup-arago-addons-sdk-target: Remove ti-rpmsg-char-staticdev
Date: Thu, 2 Jul 2026 10:20:16 -0500
Message-ID: <20260702152016.971518-1-prc@list.ti.com>
X-Mailer: git-send-email 2.43.5
In-Reply-To: <20260702143519.495226-1-afd@ti.com>
References: <20260702143519.495226-1-afd@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PEPF00000145:EE_|PH0PR10MB5660:EE_
X-MS-Office365-Filtering-Correlation-Id: 33647e76-7b8c-4eab-59c7-08ded84d6d5a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|23010399003|36860700016|1800799024|82310400026|376014|56012099006|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: 
	rQSe85ZRosYIkwlHxgidWPSf91qiNwesjdzfFeDT288mL+ilgvO8lX3Fbtg5dDq9IJFCTlCoshEyW6yWdIe4mQ8uipDG81viyeW9oX9Vx3eS3Rl/rcXR6dPaDK9XFCkkbCbelTzaGksW9PQedFzM4RFcpZy0s2qElbRy85C+0qoeRlE0OhSMk1VT5hulx9v3PL29FHAdJZ0mG6uSokUQTzUiZ3Jt9QffwsV38vAayQ57UaLOx00BBKYuzEvBwN9jmWhmB/jyldk5lGBDtkbDn3OyGKtLpUXV3nDb1LNtIRUDy6HqxvhmjEReJL1yrAbm1dfyuZgDMpYvH7kOVO4b1Ve6Gf2aG+gBaxruUiOc1wkyjijHMLgPr0rVRsybxbjtnqHUaQLsr0jcYqVrOPIavHxcEI/3euav1BO84W4GXAoR1ngStsfB31XF+4nCYwleq8mWn3S28/ajt4sPWnTFiRLROBn5/keJsBf/Vc+2W99joCVqtOt55YQtWrDIiVxP1M8IYmvEjsN3vhbJ+fdeEGi6X7BWwHF0nGo+mpffILczwpAqD6Gq9h639KmsAJeDZIM9hHqN5mayGfr/82/lAjQyUY3EgqC2wCTU8Lvgjfbgs1QzkHGgf/8Vk/pjFQ+h3NrURJF8EiZFxJ2ehoSigA+hCnwqUIpjPz3XNerv8nbe0C3mU3LkjG9bQrLjMjNu
X-Forefront-Antispam-Report: 
	CIP:198.47.23.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet201.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(23010399003)(36860700016)(1800799024)(82310400026)(376014)(56012099006)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	G13FapuS9vNHeVVeg56FWhqDVyEfMT8GlZqKEyB2jJrWVCtgl8TNHIJO8nFkXNK7jgtHBVmHW+NtfdM2JnHvDpZPEOB3IFa6V3YvyCDKkm6Je7lw3w9RIa//9kPJuL2OMrvGRFww7sm0oXigCSrBRa75djXe6L41cIQx/r+Pkhspm5pFIzrcCt8cKSSUoFyH9vGebSTqCP1LmA5JLZWUKEKL42Fpcob4VCFR1PIsl1tVIhm6gYnEcRVMtfODwb3v4/ujnlTMki3YAaid5HwFVM/Q9GWDrWDNp42b4bhM6XvVUoaFjIuYB9jzxM3bR+azX2tT6RW3SreBX3MOE3ASFbQK/5BoGPXqbj7VlI5RvxLi+8Asvr/NqCQl+uV7lYvYl9wclRbFP5lg+tnqXIsqvr2tzaHyny+KqTheIqzW+UMURypo2/HwXDIYJgFm4MJ6
X-Exchange-RoutingPolicyChecked: 
	O55bG2IelsDQNuTg/0P9dYaztIKyBemXQHz2JgqeUiYFWwZICdIE23btavGt+xBD98EiFOq5WA3QOAW36VOd4b92kuBDfwyJ7cbIN1miaWUsBytH3I6y/YYGCg+ZQYN2TBAitXuo72qGMORLbAPHUjx4EOgiDT78/SGfLhOss+/t10EcqCaS9nynzWcHdyXdFOs6WLxvypt9hWtdTDGR0H2yNDSBYYpfIJHCyzsrIuL6mdATPn1wGhha6PpU2aMUPnDxEmeijrXlFNKcBsmCL/IKVVbBG0XfcsxlonqlwgMVtt4RcVqfFxq8PwB1g62jXn8q6I1wk2e3XOmK+vS/qg==
X-OriginatorOrg: list.ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Jul 2026 15:20:19.0987
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 33647e76-7b8c-4eab-59c7-08ded84d6d5a
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.195];Helo=[lewvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	CH2PEPF00000145.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR10MB5660
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzAyMDE2MSBTYWx0ZWRfX2HO89LVUKA2v
 31zmWiJRa62FRZftF4uFgInnlxXiNBns6RFgJAl38RhZOCpY97oRaSItFUSlzAv889z1A09kPIK
 girRQqnNum9741uB9qhW/mfKU8Bov3NnDBkxup/DEFr5TvhEytwe6l8+7OJQuKubuALcyc7aPCC
 5tRyJ8o43r1B0f+s+xzHkQ8eenWQd1V+r3BKyE0WaIl3xI7w2MnNL2tXf+xyij9QJT1eslNM+Na
 mbCmNLE7bfkwv7FJqNx2NfHk26U1V6KGSmzrnzS4t4gNFoRJFRPxSUK5ExeI4CBoBjxbm+edPKz
 QgAnKMmjkdTUWDERw+r5I8R1Aec8vEgfBpjY4BPXZFImSoEla7f6d9jnU07j5TyGokd7HWzoEyW
 GsQvNVOq4sFh2VmblVhxKdd4dcl+7eDrZ7+K4N8f40YYEG/eyDu/WxdbqCzZJfVpgcLBFw43fTH
 VhxpKjn5RNki1JLhOUA==
X-Authority-Analysis: v=2.4 cv=EMA2FVZC c=1 sm=1 tr=0 ts=6a4681bb cx=c_pps
 a=UNZgSj2+zgRPHH//f1mBVA==:117 a=f+v6EHfkeJbVwR46tk4DMg==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=RAioF0-LDSMA:10 a=s63m1ICgrNkA:10
 a=Vs-ZokuVWRQA:10 a=VkNPw1HP01LnGYTKEx00:22 a=Z8NIEmU8O1QQgoT56wFK:22
 a=gO1vWkAQAl3rybz1DQOp:22 a=sozttTNsAAAA:8 a=g2kLcKwOYA4aNGWnFMcA:9
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzAyMDE2MSBTYWx0ZWRfX0/WDTpQhTPgn
 IW7DN583trL5M4mqT6GL48fLtqPQk3a5QW+ey7mzNmR1YVG1SVyBCiwBQUalFneMuzssR7h4jkZ
 QkFCjc4RTauc8aNfXeVL8/uPO8GAePc=
X-Proofpoint-GUID: YCkKfjZ1BjfkxCg3x0LncrGDhqe4carj
X-Proofpoint-ORIG-GUID: YCkKfjZ1BjfkxCg3x0LncrGDhqe4carj
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-02_02,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 bulkscore=0 priorityscore=1501 clxscore=1015 spamscore=0
 adultscore=0 suspectscore=0 malwarescore=0 phishscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607020161
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Thu, 02 Jul 2026 15:20:38 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/17580

meta-arago / na / 20260702143519.495226-1-afd

PRC Results: PASS

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
- Patch Series: [meta-arago][master/wrynose][PATCH]  packagegroup-arago-addons-sdk-target: Remove ti-rpmsg-char-staticdev
- Submitter: From: Andrew Davis <afd@ti.com>
- Date: Date: Thu, 2 Jul 2026 09:35:19 -0500
- Num Patches: 1
- Mailing List (public inbox) Commit SHA: 97a9c4e0edacc035eacc25182d8aa5e05a79b898

Applied to:
- Repository: lcpd-prc-meta-arago
- Base Branch: master-wip
- Commit Author: Andrew Davis <afd@ti.com>
- Commit Subject: linux-firmware: Move this to meta-ti-bsp
- Commit SHA: 5665f4b52096b5229aa20d8bb9ce1defce94563f

Patches
----------------------------------------
All patches applied

wrynose
=====================
Summary:
- Patch Series: [meta-arago][master/wrynose][PATCH]  packagegroup-arago-addons-sdk-target: Remove ti-rpmsg-char-staticdev
- Submitter: From: Andrew Davis <afd@ti.com>
- Date: Date: Thu, 2 Jul 2026 09:35:19 -0500
- Num Patches: 1
- Mailing List (public inbox) Commit SHA: 97a9c4e0edacc035eacc25182d8aa5e05a79b898

Applied to:
- Repository: lcpd-prc-meta-arago
- Base Branch: wrynose-wip
- Commit Author: Andrew Davis <afd@ti.com>
- Commit Subject: linux-firmware: Move this to meta-ti-bsp
- Commit SHA: 1da06293123c3dbaedfd8dca6f350454870abc32

Patches
----------------------------------------
All patches applied



=========================================================
  check-yocto-repo: PASS
=========================================================
master
=====================
PASS

wrynose
=====================
PASS



=========================================================
  yocto-check-layers: PASS
=========================================================
master - PASS
=====================
All checks passed

wrynose - PASS
=====================
All checks passed




