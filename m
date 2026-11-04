Received: from mx0a-0002e601.pphosted.com (mx0a-0002e601.pphosted.com [148.163.150.75])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.5208.1793783208233092580
 for <meta-arago@lists.yoctoproject.org>;
 Wed, 04 Nov 2026 01:06:48 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=proofpoint-05-2026 header.b=KYm6D6eM;
 dkim=pass header.i=@list.ti.com header.s=selector1 header.b=p4Y6vgB4;
 spf=pass (domain: list.ti.com, ip: 148.163.150.75, mailfrom: prc@list.ti.com)
Received: from pps.filterd (m0384305.ppops.net [127.0.0.1])
	by m0384305.ppops.net (8.18.1.11/8.18.1.11) with ESMTP id 6A48IxGi3486840
	for <meta-arago@lists.yoctoproject.org>; Wed, 4 Nov 2026 03:06:47 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	proofpoint-05-2026; bh=gfMWsu2kxSHqTA7RbSbjTkN0Beb0xE45edbuU/SiQ
	40=; b=KYm6D6eM647LJYhjTmQd/gD4jy2TU2sDSpcp3mJesVI3+t9sH053xK53n
	aUcOl7l7wWQ24We6znBXaEASvXxHxQb8toiKd9M4MzCzJ9QQEFCOXLMy7ZeO8Wff
	tRa/T7qfpW5ZUYZeWC24l3nyPJ4NhqBPL/yrazCmd8lORZtayuZ4N2vCTZjRWklf
	RpAAJSv7YaSEAMRFZTpwUCw+yPJ+SECqX4+wUtSO6X3vTPCbbHJuhdiW0pxCnohw
	6cjF2LWaPJ7G4iwOF4XTvwsPgRAqGO5qdcH/YhDVANEFsnuTQfF+d/XNKO1TJ0Zm
	b0pXIRm3uRFzcNd2mXNWDXj3Racvw==
Received: from sn4pr0501cu005.outbound.protection.outlook.com (mail-southcentralusazon11011001.outbound.protection.outlook.com [40.93.194.1])
	by m0384305.ppops.net (PPS) with ESMTPS id 4hqnf541kt-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <meta-arago@lists.yoctoproject.org>; Wed, 04 Nov 2026 03:06:47 -0600 (CST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Y4yZyRYx38Jk9lZdvJakXNI4/SZCrAQL1UylgE8Tu7j3APn7OvGk3eSM2J0MhTHyIchf9eKDDq0GeqfSB1UPRcn7LEijISP7/zcqVsMc3WQIik3+mgv0b8o7KyrXmZQoIPHjklPrjqNUPbrUStpn5o9EjrptC2d/13iOaT0hF3zvzYZEGkS/rbWcE3RM86u8wuVpOP5dvzhXlFyFUw7MTRl4H2/SJjUKYGVSGn6/I7K8EtwK3k5DYROpmQ7OcTtoRQpOF8QqUvojEe08hgjLdk+B/jCHD5f/B+JqOh4v/wCLu+grI9MiIkXKg9TM1BbZk8qgIlnw/QkSodZRJji5ig==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gfMWsu2kxSHqTA7RbSbjTkN0Beb0xE45edbuU/SiQ40=;
 b=Abm2MrvcnxvhaDalKofn0up7jsE1vly/bjMitKBEmpDbarUXtLk2xqZ5s6uPjnUGvJKFual+uHXMl/h8gN0z/BEduZ/d7lFcId67NSa+TquVxZ5WwDBKvhLTq+AUrsxqdMxnk5Qx/oWLyYLSdlUaIB/NwE4RjbqS3KTTBoAZTnstFS20RBnhfLeoynuhsQR/W3nhAMLjuFf6ylr0262ZVfuaeIvUD1TEUyuUy2NmITByd/VJh4sKq5CX1hxc7HcSXLk4f0mOmEQ05kDZIEBFp351QgtJ5d+FHNHwerXlrSAknv987D1PSi/KfHylGUQ458Y+WtrnXwqXqtWzIps9KA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.195) smtp.rcpttodomain=lists.yoctoproject.org
 smtp.mailfrom=list.ti.com; dmarc=pass (p=quarantine sp=none pct=100)
 action=none header.from=list.ti.com; dkim=none (message not signed); arc=none
 (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=list.ti.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gfMWsu2kxSHqTA7RbSbjTkN0Beb0xE45edbuU/SiQ40=;
 b=p4Y6vgB4Lbb/Tgo4ynTUU65Ff0bxb9JDDxP6XhcI+QrvQrT/SuncKhkhMsE7YEi0MKUmEFAdEMFVCkrF1fBjUXn/m3ktaGKZiT7ftx9maIcbSz/iHlMxyhraWxd+DHp8kmWA7tsnymaD/Wr+bE324ocGLO8NlxbgPoJyM2YyzAYMxgABmfykNvHmHmGASg3Qjp5ScPQb2yWu+3mlMQgscMq3fy3z/G3XJL4yzAN2fvO4+ZZiNOfA/MQcVorQpHkYHVeZI8psbepqhFmq7MexNqMT/8ZEu7JG+D7ySmCFiyxLaVuhl6xce790wMvLpp6zsFP2NMJGIpABoVRi+/6nsg==
Received: from BN8PR04CA0056.namprd04.prod.outlook.com (2603:10b6:408:d4::30)
 by DSAPR10MB414093.namprd10.prod.outlook.com (2603:10b6:8:51d::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.569.12; Wed, 4 Nov
 2026 09:06:45 +0000
Received: from BL2PEPF000352D5.namprd02.prod.outlook.com
 (2603:10b6:408:d4:cafe::85) by BN8PR04CA0056.outlook.office365.com
 (2603:10b6:408:d4::30) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.592.9 via Frontend Transport; Wed, 4
 Nov 2026 09:06:45 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 198.47.21.195) smtp.mailfrom=list.ti.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=list.ti.com;
Received-SPF: Pass (protection.outlook.com: domain of list.ti.com designates
 198.47.21.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.195; helo=flwvzet201.ext.ti.com; pr=C
Received: from flwvzet201.ext.ti.com (198.47.21.195) by
 BL2PEPF000352D5.mail.protection.outlook.com (10.167.254.4) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.592.5 via Frontend Transport; Wed, 4 Nov 2026 09:06:43 +0000
Received: from DFLE209.ent.ti.com (10.64.6.67) by flwvzet201.ext.ti.com
 (10.248.192.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Wed, 4 Nov
 2026 03:06:00 -0600
Received: from DFLE200.ent.ti.com (10.64.6.58) by DFLE209.ent.ti.com
 (10.64.6.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Wed, 4 Nov
 2026 03:05:59 -0600
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DFLE200.ent.ti.com
 (10.64.6.58) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45 via Frontend
 Transport; Wed, 4 Nov 2026 03:05:59 -0600
Received: from fllvdckhpci021.itg.ti.com (fllvdckhpci021.itg.ti.com [10.64.72.33])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 6A495xTt861136;
	Wed, 4 Nov 2026 03:05:59 -0600
Received: by fllvdckhpci021.itg.ti.com (Postfix, from userid 60899)
	id 0F1112C8E; Wed,  4 Nov 2026 03:05:59 -0600 (CST)
From: PRC Automation <prc@list.ti.com>
To: Yogesh Hegde <y-hegde@ti.com>
CC: <meta-arago@lists.yoctoproject.org>, <reatmon@ti.com>, <praneeth@ti.com>,
        <prudhvi@ti.com>, <r-sharma3@ti.com>, <devarsht@ti.com>
Subject: Re: [master/wrynose][PATCH] packagegroup-arago-multimedia: add application to debug drm
Date: Wed, 4 Nov 2026 03:05:59 -0600
Message-ID: <20261104090559.2330116-1-prc@list.ti.com>
X-Mailer: git-send-email 2.43.5
In-Reply-To: <20261104090108.2136937-1-y-hegde@ti.com>
References: <20261104090108.2136937-1-y-hegde@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL2PEPF000352D5:EE_|DSAPR10MB414093:EE_
X-MS-Office365-Filtering-Correlation-Id: f69db39c-b80b-4b2e-062c-08df3a52f288
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|36860700016|82310400026|23010399003|376014|1800799024|10067099003|18002099003|22082099003|13003099007|261009223027099003|261026140227099003|56012099006|261022105027099003|261028144727099003;
X-Microsoft-Antispam-Message-Info: 2BpDWbRlavhHTAv24/jXWoLwkmfZwP+bJg9CFkavlpghAb5woFLeLRA39+p3C4vIAc5ST9LKGH+tzaI1686Hj/3Im1MHaLTpXOvtZyrhxE8a/4tFsq2vQAzTeQT1g1aXcnwMZ9xxfRK3P4rb7+2HFcrgpMiHmKFaO8kTY6nllFfr49yV2bb++qomjMbIOWEdC3kQZz0TbIrHfIxIaGmYmXbTjU944fEpWVd40gNUqMRgch963O1hpQgn+tc2yDffQICZB/26Fz6T9E/SvvrNdEsvIBjhK+wEYS7YOy8wnhtYMmUeMc1rWf36W0obtXnXnHviHOXEdiT1QIsReY+OUVrTGpVVN1UsvOqS5HgCSQcejB+yThoxjUjCKZc/ZpBJI+j3RaU1Dlv47cdAXg06Xy8jlLBXjVAS/swuzmxGJmEmPvHVrFtRsfmtNLNFvLneXSmpUWG77kc/6tWiL41BjYHSD/w1fPFjdjkcuSrtq9RP5BBgFGo3IsftMNMhJRVmm2R3hfcQuF8ZIQjMGufI4+CLnT5hlfBwGdJaighRZjSxOd9t736HkzTCDSbKP4uw6jl0dHr0RQEasI+HZ5AdBnWe2xeGjhmm5C8mGP6x5aLqrFbKnU6Y472/Y1GDSzN/cEdW9BpG1sPhlXlTFRFfb+bcIvToFBqxcEI/qV1lxnE=
X-Forefront-Antispam-Report: CIP:198.47.21.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet201.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(36860700016)(82310400026)(23010399003)(376014)(1800799024)(10067099003)(18002099003)(22082099003)(13003099007)(261009223027099003)(261026140227099003)(56012099006)(261022105027099003)(261028144727099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: GLZ7X89oeZw2Utk85KedT5lcuTFPT9iTGnJHS5CUXWIr5EDaU7MgNOAi78H5z/OUEvV76QNPNYAcEHfMcDR6ToxQnjEVO0ZfeOPVtataGB3cyrEsph19k9fTkudU2HBSjhVAyachaSee7PyHJJWW+hLDAGrBgQ/vFI9Rsdn0GWA1ZcnNmtNDZGM0MpZ0KGFdz9m9hMv3LAWlncS563MC+vW1pnb72GO2EasjRKhzNogHSTf+VjLcKdpT28hO8ErzO+rdnjRInX5KLTQ2BTj0diTLyF8tRZKpQs9L9+FsblTXpQZxz7Xs5mPOywityutVXT18BWjJNkTAgZnz0ceE6fJPOsCkzjQvVSgjhhuyo4Xn85BaI8J8gmLDZWpP7M9pI+rJGumfZ/JnVkQ30tWv0HIYyBjxdKAUg4F3uFt3/ybs9aNmeRM6sAmFLov+6h6p
X-Exchange-RoutingPolicyChecked: NWnC3qU5420i25FHlVkso4tmpau4YN1c8EU3BDr6pFjsE+494HtVvAqwOd/pmZbdYIZLP86ZyeXFmCzytXg8sYVyjMt4ZoXOCdFLUOYXwOjFwvlJgZ3oUrxWvm7zU3JDcg0n52AzW4ntsYVtFueNwDjXsY1fLUAOBMLfvDU/Zq+ZcKJ5zPz7ZxRc3MAvlsYKYjjZ+bulTpKan48dPwwsAyRzoKzgl02xlTXK0DA5QUWedXF6Z5WF3+52gNIB6Haf3MqfFpqF89xa+CeiDQu8KGI7BsdgUrlgbRFjsjsLWPo3yXla/TTSuGtHCGnAbiVtzm1fvjVQP1PGHq1fycVMtg==
X-OriginatorOrg: list.ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Nov 2026 09:06:43.9530
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f69db39c-b80b-4b2e-062c-08df3a52f288
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.195];Helo=[flwvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: BL2PEPF000352D5.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DSAPR10MB414093
X-Proofpoint-GUID: GkBhHD60f_mPBjy5u4L8ySPFi--3QIuE
X-Authority-Analysis: v=2.4 cv=XcYcX455 c=1 sm=1 tr=0 ts=6aeaf5a7 cx=c_pps
 a=gt+0rivs0JJaOpoC1YDK5g==:117 a=tJyPKKxUohctrY4NYmUjkA==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=zJRp6_cAMcgA:10 a=Vs-ZokuVWRQA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Z8NIEmU8O1QQgoT56wFK:22 a=taLDd7a_hP9WKsMzeGRc:22
 a=iGHA9ds3AAAA:8 a=sozttTNsAAAA:8 a=eDEQeEJPEMgO8krWrdMA:9
 a=nM-MV4yxpKKO9kiQg6Ot:22
X-Proofpoint-ORIG-GUID: GkBhHD60f_mPBjy5u4L8ySPFi--3QIuE
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA0MDAzNSBTYWx0ZWRfX+WZYXDMFyB84
 IvU4PGuG8MjztAT3jVV3w5zoALNNbFcAYQzppFREDnZYU7b7tf35Eshd7Il6ZucDHhvwrkS6K19
 lG3noHNThbAxB3liiVUQiUrqXXASJ60=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA0MDAzNSBTYWx0ZWRfXyqUtvjmr06aB
 qbqH5OJQyzIxOm6gCNsw9SRw+3iYEFGJWRyBsKpFDTc1TfgjV9F+hXa7w7RHoigPdCvUh7N20H8
 +8s6dLR0Z4ysT2lod+Bnq1c3qwJx2E+V5YJ/ZLzaCV3okQr7fhNPV6Qp/0fU23RTEZeytJBZOD9
 98HiSBBEmjOYBl+r/aE5unt3Qy8zQm8kz/nOrEXwL5BQ6zR6JZjfyqsJFNegL4FKqOxWlQAKjV6
 HlOG8AbPnt8/NVzKdFlaZU0EtTCXbXZandYBTJRgzKciP+wRyoX0GKa7E7MsY9uMN7QNDgp7Y5w
 VwRTACbg961hhdlW2Ab8ZJYsu3qGUKsPweDYuU8QNcCMxjtcjHQ6FIk7WH9hP3OdrfJ1pcaWama
 TMgqhCT/APhJ9vkvNHrwTf+6t2v6f8tAWszF/XUg6GPGHDW9st+D/wrWMqqXjn3o4oD5rfzyUOt
 8m/zx5ejHVPjoCvMazQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-04_02,2026-11-03_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 clxscore=1015 priorityscore=1501 malwarescore=0 adultscore=0
 spamscore=0 phishscore=0 impostorscore=0 lowpriorityscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611040035
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <meta-arago@lists.yoctoproject.org>; Wed, 04 Nov 2026 09:06:49 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/17756
Content-Type: text/plain; charset="utf-8"

meta-arago / na / 20261104090108.2136937-1-y-hegde

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
- Patch Series: [master/wrynose][PATCH] packagegroup-arago-multimedia: add application to debug drm
- Submitter: From: Yogesh Hegde <y-hegde@ti.com>
- Date: Date: Wed, 4 Nov 2026 14:31:08 +0530
- Num Patches: 1
- Mailing List (public inbox) Commit SHA: 68e0063d5e41c534f86490509a7f052876b507e2

Applied to:
- Repository: lcpd-prc-meta-arago
- Base Branch: master-wip
- Commit Author: Ryan Eatmon <reatmon@ti.com>
- Commit Subject: tisdk-bundle: Remove unneeded ; from *_COMMAND variables
- Commit SHA: 4b006662694490151ff274a7042e42446f2e9268

Patches
----------------------------------------
All patches applied

wrynose
=====================
Summary:
- Patch Series: [master/wrynose][PATCH] packagegroup-arago-multimedia: add application to debug drm
- Submitter: From: Yogesh Hegde <y-hegde@ti.com>
- Date: Date: Wed, 4 Nov 2026 14:31:08 +0530
- Num Patches: 1
- Mailing List (public inbox) Commit SHA: 68e0063d5e41c534f86490509a7f052876b507e2

Applied to:
- Repository: lcpd-prc-meta-arago
- Base Branch: wrynose-wip
- Commit Author: Paresh Bhagat <p-bhagat@ti.com>
- Commit Subject: wireplumber: Remove set-audio-defaults service and script
- Commit SHA: daccd2a6943b3c785c606987292a0431d586f7b4

Patches
----------------------------------------
All patches applied



=========================================================
  check-yocto-repo: FAIL
=========================================================
master
=====================
PASS

wrynose
=====================
FAIL
    WARN: You might need a " " as the first character for the :append. (APPEND-2)
        meta-arago-distro/recipes-graphics/emptty/emptty.bb:10
            GO_TAGS:append = "${@bb.utils.contains('PACKAGECONFIG', 'pam', '', ',nopam', d)}"
    
    WARN: You might need a " " as the first character for the :append. (APPEND-2)
        meta-arago-distro/recipes-graphics/emptty/emptty.bb:11
            GO_TAGS:append = "${@bb.utils.contains('PACKAGECONFIG', 'x11', '', ',noxlib', d)}"
    
    For details on the above errors/warnings visit: https://lists.yoctoproject.org/g/meta-ti/wiki/40887



