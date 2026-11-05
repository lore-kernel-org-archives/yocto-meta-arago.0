Received: from mx0b-0002e601.pphosted.com (mx0b-0002e601.pphosted.com [148.163.154.28])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.6440.1793913311332769946
 for <meta-arago@lists.yoctoproject.org>;
 Thu, 05 Nov 2026 13:15:11 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=proofpoint-05-2026 header.b=SkFciSpO;
 dkim=pass header.i=@list.ti.com header.s=selector1 header.b=JR63shEB;
 spf=pass (domain: list.ti.com, ip: 148.163.154.28, mailfrom: prc@list.ti.com)
Received: from pps.filterd (m0374956.ppops.net [127.0.0.1])
	by mx0b-0002e601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A5L8H7k1398915;
	Thu, 5 Nov 2026 15:15:09 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	proofpoint-05-2026; bh=tBGnN13CKW1mZ7lM07jQjIhpAGHkf2Apq/S+lGslA
	VQ=; b=SkFciSpOIXeYU3o2XHoEEYYA1WxL+w0q7I0RNN295fETVoQXEZCIC11Xm
	Xrg07QSTrc+Q3yBxFSzyn3ZCmfe5EjlGoQ825yaWe97hBY7glitqOaOzyUT4dV0C
	H36nDSCG4KUV+Vav5/VgeftrPDch/lpiljwytYqi4IKLtC/iW6ZCy8PGwKgERCUV
	qhpVcXkuHJ8jxNE/dOpc9d2LLDb1P/L/iichMmt/AXoDn/wm6iCn4GB6xYobodTY
	VNW/UgEDv8ozZh1J3EgE6AE8Hb31Jm07t4E1lFKX7W1SA3T3b0biTZsYQsfUiVtA
	Tgz2gSa9xC2YNR5mK9I8umfb2dLNg==
Received: from sj2pr03cu001.outbound.protection.outlook.com (mail-westusazon11012009.outbound.protection.outlook.com [52.101.43.9])
	by mx0b-0002e601.pphosted.com (PPS) with ESMTPS id 4hrrp0kqkr-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Thu, 05 Nov 2026 15:15:09 -0600 (CST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=A+ygP2IZ8Bx2vxiX3aDi8JQcgdGTmn9A+ljTP/FvOz+5C33vmVcekSPwAZzXu3L7jWb9DtQPnqi32wxUQ3vKK20y2nliSyYZtwIharZo8JP+rRiUBbPvc5CWaWjYxk9x9UY5F4dz9bGDLbpF7hkN6lqc+kPkucAXpcKsbvjS9IeEpzOgz3Tm8XkLN1Ic8tJhKjVkw1LHCKhR20Jn4IXZ4gbC+TkrM4sYpJoaqPXI+E5LG6qnBTcetIpCySFQD2X4Y+aBSKr+dWTABlXV/NCO9QaiMUkaWIhqsrx5eonrkkT7R0lmgdLav9DJ4kUEYS9aTszur0y6M7RW0MQI4OXbcw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tBGnN13CKW1mZ7lM07jQjIhpAGHkf2Apq/S+lGslAVQ=;
 b=jpZU0EwQMJTPyhrtO0is/z2EzjMe6VEgITndeUlJwJbzxmE2laWKMnflXSIjWaUS6M/KS1aP0fg4FFXrTRmIWRHXazWCwgA+mxtQ9hR51aIzGWrDZrD26MICQOwlD7WDls+OlJIRY4DhGviqB+UlI9pUrCMgSXNABx1jLvP4tQSVj5YV1unZ5KKxer0matc4olY+eNwwwvbM791k1AS+t+X3tZ69dNfT9+2mp4h120H8NGZGNuryypwgEaXgm3ZXRTn9c8LmzW+gYPtbp2KRI3hjfzKDaPmiJwaxxypBll0qnVXGLGCzckeKlHDb7L3UMIRu8t/hEjpQ+RSJuMpgsQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.194) smtp.rcpttodomain=lists.yoctoproject.org
 smtp.mailfrom=list.ti.com; dmarc=pass (p=quarantine sp=none pct=100)
 action=none header.from=list.ti.com; dkim=none (message not signed); arc=none
 (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=list.ti.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tBGnN13CKW1mZ7lM07jQjIhpAGHkf2Apq/S+lGslAVQ=;
 b=JR63shEBnJzUM9+XLLyi343OobeYRrpthqfJObb6zzzcatCcLObn5O1deG9ARUu+IfoHf0zLX6ADKpFwcuQKXy5iI27nyYyIqy4ws6GQxBLK+owkvvC4MXDDVallH/ByfXC2GEEMJIGDt/J6Qyvss0iuC+qsB6rpkhOPm+wV6YMng/qpcfV98zrs6FqMu3SK1skkEbkXSxvyKGEgLqR9EQOhQ5jVX5q85LtYuP/bkAkCVmpLU2gblFg4sc+KnlgG9ueQjFzgss2uGpfdbQI9fbxAAOTa4WnmabB1/t3PCfxtOexjR+GSpcDcE52fz8gzjZQDj59psu5U6I1l+s4nyw==
Received: from BL1P221CA0044.NAMP221.PROD.OUTLOOK.COM (2603:10b6:208:5b5::16)
 by MW4PR10MB6394.namprd10.prod.outlook.com (2603:10b6:303:1eb::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.569.12; Thu, 5 Nov
 2026 21:15:03 +0000
Received: from IA0PEPF00000039.namprd03.prod.outlook.com
 (2603:10b6:208:5b5:cafe::2e) by BL1P221CA0044.outlook.office365.com
 (2603:10b6:208:5b5::16) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.592.10 via Frontend Transport; Thu, 5
 Nov 2026 21:15:03 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 198.47.23.194) smtp.mailfrom=list.ti.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=list.ti.com;
Received-SPF: Pass (protection.outlook.com: domain of list.ti.com designates
 198.47.23.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.194; helo=lewvzet200.ext.ti.com; pr=C
Received: from lewvzet200.ext.ti.com (198.47.23.194) by
 IA0PEPF00000039.mail.protection.outlook.com (10.167.249.70) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.615.4 via Frontend Transport; Thu, 5 Nov 2026 21:15:02 +0000
Received: from DLEE210.ent.ti.com (157.170.170.112) by lewvzet200.ext.ti.com
 (10.4.14.103) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Thu, 5 Nov
 2026 15:14:58 -0600
Received: from DLEE200.ent.ti.com (157.170.170.75) by DLEE210.ent.ti.com
 (157.170.170.112) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Thu, 5 Nov
 2026 15:14:58 -0600
Received: from fllvem-mr07.itg.ti.com (10.64.41.89) by DLEE200.ent.ti.com
 (157.170.170.75) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45 via Frontend
 Transport; Thu, 5 Nov 2026 15:14:58 -0600
Received: from fllvdckhpci021.itg.ti.com (fllvdckhpci021.itg.ti.com [10.64.72.33])
	by fllvem-mr07.itg.ti.com (8.18.1/8.18.1) with ESMTP id 6A5LEwtE476631;
	Thu, 5 Nov 2026 15:14:58 -0600
Received: by fllvdckhpci021.itg.ti.com (Postfix, from userid 60899)
	id C503C2C86; Thu,  5 Nov 2026 15:14:57 -0600 (CST)
From: PRC Automation <prc@list.ti.com>
To: Andrew Davis <afd@ti.com>
CC: Denys Dmytriyenko <denys@konsulko.com>, Ryan Eatmon <reatmon@ti.com>,
        <meta-arago@lists.yoctoproject.org>
Subject: Re: [meta-arago][master][PATCH] bash: Remove time command workaround
Date: Thu, 5 Nov 2026 15:14:57 -0600
Message-ID: <20261105211457.3124585-1-prc@list.ti.com>
X-Mailer: git-send-email 2.43.5
In-Reply-To: <20261105204458.1308514-1-afd@ti.com>
References: <20261105204458.1308514-1-afd@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA0PEPF00000039:EE_|MW4PR10MB6394:EE_
X-MS-Office365-Filtering-Correlation-Id: 262df050-b59b-4c5c-0b40-08df3b81db22
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|82310400026|36860700016|1800799024|23010399003|10067099003|18002099003|22082099003|260925021311599003|56012099006|261022105027099003|261026140227099003|261009223027099003|261028144727099003|260925022911599003|260925021911599003;
X-Microsoft-Antispam-Message-Info: lKgbxFau5H6sS+UnahWl+BJkZjMd02KTc1q1jWcIOhK1hu+h6Bw51+g1nMf1YaUHpbOCjg3EXYUG7lOxp6xCs2w9637QT//zoyqOjWljotMYK9aQ9eyC/pf//hq0qReE0PyCk/FtrAUeXCcOGJbBN0eh4KlZvjsY3/iKyQwstajzzS6fg/EIm69r7LVkjDL+d6cJiC5E6ricirNcQrv7auhtf6BORBkx4juwUC4PNY0WTe1HqJ97sjeCgH+QPMPfflfLLMuwTTjz4tYYpqUzkV/hBkhhLZPHhefCBDIC++HJlPrO9n6bxLc+sH9x1rkp6uCWTOqAHY5NXv+H0DPGY0FyOMr90a6dLHK3N+dIGQCIG2y8c69pkCy+tIT25KZK8jYyIWON2Wact6Dct6SM8TY54NMeDU+89pog+uAkkIwaXCFSq/xj9y8fa+cvpVAYJDyPyn0w0tfEVqeEY5DwSDJE+EsOrK2VOeiAeA5KLDy+Toi6g8Cog0Py2zqXtUV/R5e8ZC22MlIYGSvFQGjCjrEQAj30OHdaBa54Gs1Su2JIUo7ygP0tQfvnKR84ejAEzBgfhsAlxlX7Y0o7vAoxbRWDV+/dbHr93kCgnXhpuzgsju1qohAWNJGkj30fONpw/6bVF2IvKRnwuDVs2Rv5Wmrn81uFnzUPNeVMDePa97eBI+gItL7yKZRDfcw/txP/uS+wDAR0Jq6HbjdGDIHDNQ==
X-Forefront-Antispam-Report: CIP:198.47.23.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet200.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(82310400026)(36860700016)(1800799024)(23010399003)(10067099003)(18002099003)(22082099003)(260925021311599003)(56012099006)(261022105027099003)(261026140227099003)(261009223027099003)(261028144727099003)(260925022911599003)(260925021911599003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: AVZtgynbVzXJCHpuKmhkO0yx3ualfWNcNvFI6OxyMKaqh51yu1bMUT0lGbDgfyrm1uh7413AVxOOcJdR+J0gLpSj/cP0aty0Yvcj9qVF0Al6Y7KLWiX6HIFS0zPDyDcqyWgEY2GC17pAqiVv7tjCFr7C6mVDtB0SyYSOcsRhr9ZExb81ypLA4m+YCv3Yw+oUJAE2Nb6V/ofyU97J3Myi1yIk9MmJvJ8wL4fxYMMZYtYN9/aOvBS/LetGqQVBXe5kTwOFtyXtmITKWN+XFrb+wrWayzFyvQou0VLxU+Nm2tlxLyblOwHUr0ctG8WAgmaSyZ/7sdLOnAppAjiEdoP5SIxKDoRlXcdh5mTVhM4nkE0epPmRl0v4n4hb7zkmMvYkc1im3NA2liJAqtDD0E9L7TsLPmcDcyhebZ4P7hLKyaii4rfnhZc3wnZAOnLexK9R
X-Exchange-RoutingPolicyChecked: Fn9Fj1Yh2upoSOSM4f/B+8wWal1mzbHIuLClAuUNRsVtgJU7ke80BGXqfo+xJBjC8TW06nwNoIqGi33IhEfux0ZtJA0CMsF3ThC7VH9Hta9LAy1J4Zwe05dWzGqIQyPP+vMYjShzliYqth/0DhykZaFGkJrdbCC5a+jqzIBves7ZQynBASBU1iob3/+z6pHT1CVj2grqhqTHyg5O64BuSFj1Db++DtDZHx7MFeZ1uWC1PZkxpPCXWMnzNC/AkIymZFac4+aitv1tOzOKGevsfkvjCcUeDhGuHbQKVx/CuU41XCfwRst8zEatIk/ctepVFT/pE1gBiMceuWA3OMPQxQ==
X-OriginatorOrg: list.ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Nov 2026 21:15:02.1886
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 262df050-b59b-4c5c-0b40-08df3b81db22
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.194];Helo=[lewvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: IA0PEPF00000039.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR10MB6394
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA1MDA4NCBTYWx0ZWRfX9CNCfkaIALcA
 e00O8OT2DR76tp5ga/C8A2UtxqGWRWYB0+fsqWIvOstbYHoIc3cNLuN0vO+KKq+cClt45JOjTfM
 rMoupMAvXxKda6m5OaQiAJgsfM/OuQo=
X-Authority-Analysis: v=2.4 cv=MIz1C8Zl c=1 sm=1 tr=0 ts=6aecf1dd cx=c_pps
 a=rl9QZQJB4f+cLtFzzj7oTw==:117 a=WotqVVQAdb04rnGuttW3Kw==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=zJRp6_cAMcgA:10 a=s63m1ICgrNkA:10
 a=Vs-ZokuVWRQA:10 a=VkNPw1HP01LnGYTKEx00:22 a=Z8NIEmU8O1QQgoT56wFK:22
 a=jwouBfj2j3NM8CExmVVE:22 a=sozttTNsAAAA:8 a=ypsaGzSaMLG94TvFeNQA:9
X-Proofpoint-ORIG-GUID: CdXITBwCH_AUDrjulmp5hNj_zXz-6Ngb
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA1MDA4NCBTYWx0ZWRfX0gPnJRXa1X2G
 f13OL5lbUwJYO8pdX1Bbzrb/hF6FCbrVFh+ySb1u3zIsLsxW2gwCZo7jNy1TVaZmSfeiaWGcpOX
 3NErto27ytptKtcKBvZE7rYO97i+zI40OQt0myh50ZoHEFxx/Wr1IBBfxWl3Yuq0YeYHurlI1w9
 OXXeKRbV+1/YFzirl2jtAO1HstDMDYkZyIQwuCvOBzknBpnzAwOV/lEka5hL+ZNs/afXcM31AuP
 2dPmhusT9Se2Xy1WKJr83sfdy8iX1Ategyz1xssQ9AYy3iRb+RWsk/55WdOEMwXQGHCa6oQPhkM
 zg00UrrkGjd9N2nmF3dDSRrE5L4ABjnCe28XmnCNkfNcBzqTVlktFSchcV87fVsb8cBxEvnH/is
 eWw4toCnvdlFoEuNNvrN4TKzYJKPaLe8lpppuM/NmarUGQLZPWqLkjfT9C8P0KW1oqAPQkFQDpB
 XbVfJxLrK1KvrD7xaEQ==
X-Proofpoint-GUID: CdXITBwCH_AUDrjulmp5hNj_zXz-6Ngb
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-05_06,2026-11-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 bulkscore=0 impostorscore=0 malwarescore=0
 phishscore=0 lowpriorityscore=0 adultscore=0 suspectscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611050084
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <meta-arago@lists.yoctoproject.org>; Thu, 05 Nov 2026 21:15:20 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/17771
Content-Type: text/plain; charset="utf-8"

meta-arago / na / 20261105204458.1308514-1-afd

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
- Patch Series: [meta-arago][master][PATCH] bash: Remove time command workaround
- Submitter: From: Andrew Davis <afd@ti.com>
- Date: Date: Thu, 5 Nov 2026 14:44:58 -0600
- Num Patches: 1
- Mailing List (public inbox) Commit SHA: 1011604369b6332ceaf6f3bb3ffbeec3b7b935d3

Applied to:
- Repository: lcpd-prc-meta-arago
- Base Branch: master-wip
- Commit Author: Ryan Eatmon <reatmon@ti.com>
- Commit Subject: tisdk-bundle: Remove unneeded ; from *_COMMAND variables
- Commit SHA: 4b006662694490151ff274a7042e42446f2e9268

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
  yocto-check-layers: PASS
=========================================================
master - PASS
=====================
All checks passed



