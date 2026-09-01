Return-Path: <prc@list.ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7CBB3C624A4
	for <webhook@archiver.kernel.org>; Tue,  1 Sep 2026 03:25:55 +0000 (UTC)
Received: from mx0a-0002e601.pphosted.com (mx0a-0002e601.pphosted.com [148.163.150.75])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.1228.1788233132364260453
 for <meta-arago@lists.yoctoproject.org>;
 Mon, 31 Aug 2026 20:25:32 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=proofpoint-05-2026 header.b=Vr4fhF5z;
 dkim=pass header.i=@list.ti.com header.s=selector1 header.b=PN7n/vII;
 spf=pass (domain: list.ti.com, ip: 148.163.150.75, mailfrom: prc@list.ti.com)
Received: from pps.filterd (m0380145.ppops.net [127.0.0.1])
	by m0380145.ppops.net (8.18.1.11/8.18.1.11) with ESMTP id 68133ArG2619343;
	Mon, 31 Aug 2026 22:25:30 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	proofpoint-05-2026; bh=BcE30z+dhKaoTdgYgLEzmdtyL5+5AYEM4QKOmO/P0
	88=; b=Vr4fhF5zsOuwaZgFjLceJ8wnIxVPS1TbUtCVzKLzIZ/vs4oZdHEpBub1Y
	zIEl+1aXVbUTBV565tuZWGoLZoe8ocpLAQt14UKEKAAFthabw2bTV6jRAQl95a7n
	hrJRbOmwlBv8v5UbrqvAh1ZeTHbPvEcJTkjyRbYbs0AabPpH2u72Iv+61/tOiApT
	TqYOY71v50Y1opGta/haK8tslipKhR30A66p/AOOGikiKVh6PS62lC60zwcLK8a9
	S2O5kEiPJzEVjpPC3/vgqHpHGC6g3WPMP7h+Q9koRBSFef9BLqt23BUT113LF9ad
	+tY2eTVS4Tn4OJmgxMNs+Cm0qCCLA==
Received: from ch1pr05cu001.outbound.protection.outlook.com (mail-northcentralusazon11010024.outbound.protection.outlook.com [52.101.193.24])
	by m0380145.ppops.net (PPS) with ESMTPS id 4gdpfag3aq-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Mon, 31 Aug 2026 22:25:29 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=F5/Pb9TfpxvbqjqxCSTi90AREcybX80t+8tmP3aP168V23Ti0vuewr1NrPD1d3Nb1IZ5Cdgr5qd6v7JKlX0c8xC9udYITfCgW2buegKkt2O7U8HjLY9LWrrXveiZ6TjUOD+VWcexVDkwj/lJ+rnKynaAiChhAQ33038GdLPTtetKnIqCLGUOG93cta4ojd1bsYmT6SBHKYe+zqNIHLhZBA64anNLx4b+P5HXcYsgBlbmJh70HdYUCSs5m4Pb8YQ0yi79gobOS5JHlmBCl1m/oOflwyIrlThOaS7+FvQTuDzkvgCc9CpS5OwLrE1wShJgd5bdtLAABNmJ6okzzjK4LQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BcE30z+dhKaoTdgYgLEzmdtyL5+5AYEM4QKOmO/P088=;
 b=aw8ZZHviyzpYHBNeMgygxYgizX0m0EPskwRlgmXAFpW0Ce1JLNFKLLd7WJAi1E6nEnK5oix3ikbfzP9+VoFTRwODnWXshncjItsYJzu0lpMG3gnMVY8G8VBApIhcA5V1KRIbJR+P9Mn6VUOFJip36+SJXuqOLS+uAzxMpLlrzhPVSMhqMQ6sIKZHquXdVxOCHj3sPrEP275SJ06uiA9RpT9Cro++efmQTAlY03O3mBD7VjmvGiUUFy3NuJhQ4YdjWMmEkME3li8whRd0prsNFEeM84CEJJi4t0PdCTOUswIdnO/5lb32txsvSetEX73xc5bA3EwbYVFFvcjeNFKqSA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.195) smtp.rcpttodomain=lists.yoctoproject.org
 smtp.mailfrom=list.ti.com; dmarc=pass (p=quarantine sp=none pct=100)
 action=none header.from=list.ti.com; dkim=none (message not signed); arc=none
 (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=list.ti.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BcE30z+dhKaoTdgYgLEzmdtyL5+5AYEM4QKOmO/P088=;
 b=PN7n/vII7hmD2NASXPb1n5dFqaj1YXYXS61XxMgw8J56PFIMCGx059EPwSd90X/iPbT2YJ+j/zGvZk09j/jw/v5rnsrXOBLGcKin7j9VALq1IBNrQP8WlMw0v1R39j8JM4gr6I4PqRQjo3XHGeOSrM6BRJiFp820WaAZH54Uhac7MFLlS0sBmhRiCrlrcmguDMMpC2Tqzab73CoKHG2g8AQQq4yoCfVKKbjqVeN6dC5coNcRXNZvXk0rf/BVaZ0Om9F5iDfQZ98RwwqqJqyDWML0uUuC64gUne6YLB2gAjsvZGfyqHuUEXo0p4C7dF26etc8I8CaFfU80nbn0ebzRw==
Received: from BN9P222CA0012.NAMP222.PROD.OUTLOOK.COM (2603:10b6:408:10c::17)
 by DSVPR10MB998076.namprd10.prod.outlook.com (2603:10b6:8:41c::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.382.10; Tue, 1 Sep
 2026 03:25:27 +0000
Received: from BL02EPF0001A0FD.namprd03.prod.outlook.com
 (2603:10b6:408:10c:cafe::34) by BN9P222CA0012.outlook.office365.com
 (2603:10b6:408:10c::17) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.360.13 via Frontend Transport; Tue, 1
 Sep 2026 03:25:27 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.195)
 smtp.mailfrom=list.ti.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=list.ti.com;
Received-SPF: Pass (protection.outlook.com: domain of list.ti.com designates
 198.47.21.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.195; helo=flwvzet201.ext.ti.com; pr=C
Received: from flwvzet201.ext.ti.com (198.47.21.195) by
 BL02EPF0001A0FD.mail.protection.outlook.com (10.167.242.104) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.382.8 via Frontend Transport; Tue, 1 Sep 2026 03:25:26 +0000
Received: from DFLE210.ent.ti.com (10.64.6.68) by flwvzet201.ext.ti.com
 (10.248.192.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Mon, 31 Aug
 2026 22:25:02 -0500
Received: from DFLE204.ent.ti.com (10.64.6.62) by DFLE210.ent.ti.com
 (10.64.6.68) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Mon, 31 Aug
 2026 22:25:02 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DFLE204.ent.ti.com
 (10.64.6.62) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45 via Frontend
 Transport; Mon, 31 Aug 2026 22:25:02 -0500
Received: from fllvdckhpci031.itg.ti.com (fllvdckhpci031.itg.ti.com [10.64.72.41])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 6813P2f91993880;
	Mon, 31 Aug 2026 22:25:02 -0500
Received: by fllvdckhpci031.itg.ti.com (Postfix, from userid 60899)
	id 8B4449ACF4; Mon, 31 Aug 2026 22:25:01 -0500 (CDT)
From: PRC Automation <prc@list.ti.com>
To: Paresh Bhagat <p-bhagat@ti.com>
CC: <meta-arago@lists.yoctoproject.org>, <denis@denix.org>, <reatmon@ti.com>,
        <v-singh1@ti.com>, <c-shilwant@ti.com>, <y-hegde@ti.com>, <afd@ti.com>,
        <j-sahu@ti.com>, <praneeth@ti.com>, <s-sinha@ti.com>,
        <s-kapoor@ti.com>, <p-gupta5@ti.com>, <r-soni@ti.com>, <sen@ti.com>
Subject: Re: [master/wrynose][PATCH 0/4] Add PipeWire audio stack
Date: Mon, 31 Aug 2026 22:25:01 -0500
Message-ID: <20260901032501.2414269-1-prc@list.ti.com>
X-Mailer: git-send-email 2.43.5
In-Reply-To: <20260901030233.686017-1-p-bhagat@ti.com>
References: <20260901030233.686017-1-p-bhagat@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL02EPF0001A0FD:EE_|DSVPR10MB998076:EE_
X-MS-Office365-Filtering-Correlation-Id: 7f4dc6f9-a6c7-4e7d-5805-08df07d8aa55
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|36860700016|82310400026|23010399003|1800799024|376014|10067099003|6133799003|22082099003|18002099003|56012099006|13003099007;
X-Microsoft-Antispam-Message-Info: 
	cLVOqSXyrzbWtV9hnK0E1KbcmT8Ue+z+5Xw7gIfYGEEpVw0DIxn+1buAsIAyXM3AgZLNNf2OFekb/SMMRndpJelSlFoVTtIz9YANkbh/AwGQfrk+4dR9nVhIvr2c4LXeewX7ekyez37agJoUR5AmlsXIh6aCpRCzOI/X4fdP/ralcy/BSgD4Ya6Muy3DLhHgvahpZ19sOeFIl1Muc62mDjsCHFmwTqT3Q6rFPy6GhEDuwFEYgOwpaoMqOwu7dKnthv2hTi39efsYxaeQAH/YUMnrCt0is6kt6A0zOuiDu7LmUQtzg0balfXxcB0dDgO91ehzJkHCoWLoJs3Ms1ofvjFezwBx/On/xnzIUp8gChgNt7BgsWRwg9tZnqQYxOdNVLU1QA1AZfN18hDuypejLp+UbIprSWj6ca7UkTtitVUffyBcFMjFfv9fuZ3M1NNmbY6IuMSDjQO2JgqZcGWMfVlRNYe3fKCCspnNE714YZ0IrDO3jYfulY0Ha9HQE+USvZBhISHmEnekG6uzr+Q0kRJNGW4gfI02XV0M/a1zVBfQTTO6DmaLqxmm+EgFAR7cB/MUz0ChB+Ww0xlp+MHdwZzO0Oo7oVVNfokGBLMzYZcXc7hmXPvj5Eaw4trrJqvnmJFrAp1E7foUmTmFfPgtQQ==
X-Forefront-Antispam-Report: 
	CIP:198.47.21.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet201.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(36860700016)(82310400026)(23010399003)(1800799024)(376014)(10067099003)(6133799003)(22082099003)(18002099003)(56012099006)(13003099007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	39ULg8go5Llf1RTHsmnll+FPkvopDx2Qrmr++qImUjqqtpeDvBgF+Fq/Ef5O3PteMMfGcKcKxSnidbSZI5DtE9udPZyi68yIP3NWcxY/RdyGLZlyDVCnzsQvu06m6g7JwVm/5fYSdBSq9x6mu6p59AKrZcXi0+ln5EuXiVP1ozzjGEhdQrK5MD0F1LnC59aARBZwW6on736HfgbJRTAptWRXw4qnviaTolZP1PwjIxpEUPKgGNCYvlcjAJEML7fWC0JQKomq5sZosroi2Fm3uaIBAx/E9Rm7rzCRijzpRVbisnxtjaw8pqBjzPa6eTQdmSgdx6uu7eev0xOgpmfKM1ZpURjqcyCuuHj9IlQ4N0ONt/7Msa9Uq9X4x8m7xLacZ/8UyDVBV7DwJ9Wf33rFSpg61HVA4LEJLybdVQQNI8ZY1/YRYyGzvzpTO8n7qExo
X-Exchange-RoutingPolicyChecked: 
	LYbxIr9KgRJ/PKk6oJXwDvN+5y9XHS4d3E6Vnl6eNd+H+ku0ezqUm+rua+NSOVvMUJmo2AmyDWG9RV7/qcOK4ziqEbddv7rXPHdyEFzsEBCd8U3tOVJI8MiYB3Uf5uMOi9KIligsCenfqX80WA/xW2HRFcDYtQVPkO1fmTEGBK7uegHL9TItYxTY4jlUJ0H3lY3m/Pbaj6WJGq86qOqLg7GqzOjPiRd/oEe4ThxCQEsTFuTKQrPWDhUHKYyPuOg+ToL5+LQoSpHSn94EOZTFsbFRmN96MDmcPYSVEEH8HnTyC171s6tg1IiVSutH86ibqukdDiCCIWuoCcejA5qkvQ==
X-OriginatorOrg: list.ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Sep 2026 03:25:26.0699
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 7f4dc6f9-a6c7-4e7d-5805-08df07d8aa55
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.195];Helo=[flwvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	BL02EPF0001A0FD.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DSVPR10MB998076
X-Authority-Analysis: v=2.4 cv=Cp2PtH4D c=1 sm=1 tr=0 ts=6a9645a9 cx=c_pps
 a=T1Ebi/dL4O4Qy7Yf5tf31Q==:117 a=tJyPKKxUohctrY4NYmUjkA==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=Sv0fKeRqtYgA:10 a=Vs-ZokuVWRQA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Z8NIEmU8O1QQgoT56wFK:22 a=gO1vWkAQAl3rybz1DQOp:22
 a=iGHA9ds3AAAA:8 a=sozttTNsAAAA:8 a=K6qyBjeut-PFKYyrIgAA:9
 a=nM-MV4yxpKKO9kiQg6Ot:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTAxMDAyOCBTYWx0ZWRfX6H479gAv/gWs
 EgRmrkq4CR/yBZuVk7uQqDna0Q0PZArgwEqmJt6XUnRj3uMCWm+Gs6IDRYjndG95KeHbwas1n+P
 SdhoG8ji//xvNASmG3IwbZQsSxnMqk1HhlLreE3xZd+kMzZBEODtFaNGAf8lrn1VGqC4254QkpO
 MxHISF7VxOZZT8urU9DzjrLd1rT0fMPv1Z0YqEP4YTIvbt2KBCltBhEQUsGcwA+Cv09l0Rd0MaK
 OyDkBZDM2v6AOEYLCy974YUPfhR20MJg2nzyCwzYx907bwIxJTu4e/0ZEpkqhojd251an2NRb0j
 Z/Z4fgZEUAHrIpZ26/asfG/DnvaKi9rsc+3IQM42wkONCeoPp7P5a1w7QQTZhWQumvaDoJk5IRe
 eD6dTUCLWtckjUcV2nBmuwfUyxGHJx6BN6Gj+YNsDQpnVZWaKKh/7kKicRNtcmJ0D3NmGciAkJ8
 8aXoKfbPz+6+n5T/cMw==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTAxMDAyOCBTYWx0ZWRfX3Qvk3Z0JinHE
 SrmObONVolbHOKswpSlKHQU51j2RCpjksDTDeO8wlL81DjLIKcPI90aHXyfdq2myaNoFonbNE35
 RsgjX8Uq0/hN1tw97869QpQ7hUbYIIo=
X-Proofpoint-ORIG-GUID: LyDxHanOfuMQ_Tep8-ghHxopjXFT4iVt
X-Proofpoint-GUID: LyDxHanOfuMQ_Tep8-ghHxopjXFT4iVt
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-01_01,2026-08-31_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 spamscore=0 phishscore=0 adultscore=0
 bulkscore=0 clxscore=1015 lowpriorityscore=0 impostorscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609010028
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Tue, 01 Sep 2026 03:25:55 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/17642

meta-arago / na / 20260901030233.686017-1-p-bhagat

PRC Results: FAIL

=========================================================
  check-yocto-patches: PASS
=========================================================
Patches
----------------------------------------
WARN - [master/wrynose][PATCH 2/4] recipes-multimedia: Add PipeWire bbappend, service and config files
    WARN: Commit message does not include file/recipe name: recipes-multimedia: Add PipeWire bbappend, service and config files. (COMMIT-MESSAGE-2)
        patch
    
    WARN: Commit message should not include directory path to recipe: recipes-multimedia: Add PipeWire bbappend, service and config files.
              recipes-multimedia (COMMIT-MESSAGE-3)
        patch
    
    For details on the above errors/warnings visit: https://lists.yoctoproject.org/g/meta-ti/wiki/40887
WARN - [master/wrynose][PATCH 3/4] recipes-multimedia: Add wireplumber audio configuration
    WARN: Commit message does not include file/recipe name: recipes-multimedia: Add wireplumber audio configuration. (COMMIT-MESSAGE-2)
        patch
    
    WARN: Commit message should not include directory path to recipe: recipes-multimedia: Add wireplumber audio configuration.
              recipes-multimedia (COMMIT-MESSAGE-3)
        patch
    
    For details on the above errors/warnings visit: https://lists.yoctoproject.org/g/meta-ti/wiki/40887
WARN - [master/wrynose][PATCH 4/4] recipes-core: arago-default-image: Add PipeWire audio stack
    WARN: Commit message should not include directory path to recipe: recipes-core: arago-default-image: Add PipeWire audio stack.
              recipes-core (COMMIT-MESSAGE-3)
        patch
    
    For details on the above errors/warnings visit: https://lists.yoctoproject.org/g/meta-ti/wiki/40887



=========================================================
  apply-yocto-patch: PASS
=========================================================
master
=====================
Summary:
- Patch Series: [master/wrynose][PATCH 0/4] Add PipeWire audio stack
- Submitter: From: Paresh Bhagat <p-bhagat@ti.com>
- Date: Date: Tue, 1 Sep 2026 08:32:29 +0530
- Num Patches: 4
- Mailing List (public inbox) Commit SHA: fe10703c89c003bb13078d38f4737fd4d21d6861

Applied to:
- Repository: lcpd-prc-meta-arago
- Base Branch: master-wip
- Commit Author: Ryan Eatmon <reatmon@ti.com>
- Commit Subject: gstreamer1.0-plugins-good: Drop unneeded patches
- Commit SHA: 0122872fbf4cf57798351d7d0ef8f9a6a3712423

Patches
----------------------------------------
All patches applied

wrynose
=====================
Summary:
- Patch Series: [master/wrynose][PATCH 0/4] Add PipeWire audio stack
- Submitter: From: Paresh Bhagat <p-bhagat@ti.com>
- Date: Date: Tue, 1 Sep 2026 08:32:29 +0530
- Num Patches: 4
- Mailing List (public inbox) Commit SHA: fe10703c89c003bb13078d38f4737fd4d21d6861

Applied to:
- Repository: lcpd-prc-meta-arago
- Base Branch: wrynose-wip
- Commit Author: Yogesh Hegde <y-hegde@ti.com>
- Commit Subject: websocketd: update to main branch
- Commit SHA: ba7131a2864954a76e7d74869800cb43a2d0e0b8

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
  yocto-check-layers: FAIL
=========================================================
master - FAIL
=====================

ERROR: Multiple recipes found for mesa-demos
    oe-core/meta/recipes-graphics/mesa/mesa-demos_9.0.0.bb
    meta-arago/meta-arago-distro/recipes-graphics/mesa/mesa-demos_git.bb

wrynose - PASS
=====================
All checks passed




