Return-Path: <prc@list.ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 375DDC4452B
	for <webhook@archiver.kernel.org>; Tue, 21 Jul 2026 21:20:45 +0000 (UTC)
Received: from mx0b-0002e601.pphosted.com (mx0b-0002e601.pphosted.com [148.163.154.28])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.34308.1784668834577027847
 for <meta-arago@lists.yoctoproject.org>;
 Tue, 21 Jul 2026 14:20:35 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=proofpoint-05-2026 header.b=bhgUFPAO;
 dkim=pass header.i=@list.ti.com header.s=selector1 header.b=IXkTDMHu;
 spf=pass (domain: list.ti.com, ip: 148.163.154.28, mailfrom: prc@list.ti.com)
Received: from pps.filterd (m0374956.ppops.net [127.0.0.1])
	by mx0b-0002e601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66LKkcHV1821329;
	Tue, 21 Jul 2026 16:20:33 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	proofpoint-05-2026; bh=xpqpEFeiIjqxdF7z0vjeWfR8de5P4WkZInkWdLp+R
	R8=; b=bhgUFPAO2yhvwCuYpbnvMcMIajzAl/sJHq1h+4cSHUC3SSqwI1/qT4b2j
	kzcFhS/JXke5oihVCMTk+FZE1g98/Fhc77fbtF3B4+M1C82UbQ9PWw5+hIsx0XP1
	PVBCO6pB80CdT8rsauf1fhIjsc2DWsAnEBZu8WRdyLlCk/E/7Qc8//EbO5fGrQVk
	hlV1aww4ThB4R95lE6jZodlH+XE8kIJAv4o3FLMI5o8c8rjXoHlutUnoE+fvBqwY
	bnkaDPNorUbneR50EcmQ1UVq6F+O+BWxvgIAmN0ASc9HRZ9VeOsjGG1n7zWm2kSH
	kuXkmjF5g7Hcp/3wdmbH4MlCUZuIg==
Received: from sn4pr0501cu005.outbound.protection.outlook.com (mail-southcentralusazon11011038.outbound.protection.outlook.com [40.93.194.38])
	by mx0b-0002e601.pphosted.com (PPS) with ESMTPS id 4fj7pvuphw-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Tue, 21 Jul 2026 16:20:32 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=OVfwYg8vkrYbKr1cpvZI7IVWB902GCWGw2fsiKzi37RuQHgzNQ9xCyOhNkreNNl19Kw5UI0JoL9vHbau09PUm4/sXQipnrKjgDmbiKg6QteUlFMZU0jjtsN3iB0HLwVf39WmMXYBfXad4Cw0wSB8x1TOOtN8SLOm+KbdVQW8WXtvlrhSXHdDLjwqMAK7widOB6WuwOC0jk0RHQGBnDWvlGGSlCpxc1Hs3SpcJ1QK6gbGpxP9yIdj+hFZyhlnb6cxTh7S+AjeVMVM4jnyWnr1Pn5hmAsTsmoO1nMDsxjpOVBE990AgR4mdVDkvMeBcEYBr0hb01N34sJ/pmPzY4e9zw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xpqpEFeiIjqxdF7z0vjeWfR8de5P4WkZInkWdLp+RR8=;
 b=c/7NCOMO2vtQXIix0F3m0FeWIPBbMB3WK7Mr9NpVb+t+TNxxAWdk16XGNoxnD9DrjPcpDBumfDCdFe/6Rq4rX4+B22XRKjcJVhRKbwxDImjDlsz/fZq39FDsH2TkHNiJ9iRWmEn7XSy3uFeEuANTqqISFsuWctyucbWuP1ImuBTmzJ5zOsFpH4FaaVK1EJ2k9eZUiQDE68KxgOt4F6dYa+kxt8IjAmb2UZ3lovbLBug/ZSr3tCnk2zR/7Fhub63QlngS/NOKDislnIladQZWZNmXhtBNCbdDJOQ7Iu4/Kbw9WdnxTwBR3L9Ydr7q1Z0NJ3Us7QkyMRaF0DfqLFHpFA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.195) smtp.rcpttodomain=lists.yoctoproject.org
 smtp.mailfrom=list.ti.com; dmarc=pass (p=quarantine sp=none pct=100)
 action=none header.from=list.ti.com; dkim=none (message not signed); arc=none
 (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=list.ti.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xpqpEFeiIjqxdF7z0vjeWfR8de5P4WkZInkWdLp+RR8=;
 b=IXkTDMHu1qGdywYmSz1PcKDLV3WkfapxDR1ASjMBi7TUowiE6jc3IrGNPQVWEEdpiurY5SNdvBvI6Rpnixxu5NyY4vh9yP+gsg5PRxaVkqR0hT9TX8jNCCYN8pQqHMwVGutWwy3N8o4gYlgc14bK9eC0HfrfecSW+3H8n7hxq32f8qf5GNShr2rXCH4FU3JETV9VesDrRipsGgQHdMyVabhtqI5w+ZjcJpowiFyVnD5Xwmwtym1GMnCoB7q9SJZFd9cxipKlP31vMWbhZU8RPacV0osnyUp4MMUYu1ApZ5SQMlcZzUu6DScKU/UhoMHPYPH3365Rl5KySmdZP3r7SQ==
Received: from BY3PR05CA0001.namprd05.prod.outlook.com (2603:10b6:a03:254::6)
 by DS0PR10MB6174.namprd10.prod.outlook.com (2603:10b6:8:c2::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.223.18; Tue, 21 Jul
 2026 21:20:24 +0000
Received: from SJ1PEPF000026C3.namprd04.prod.outlook.com
 (2603:10b6:a03:254:cafe::43) by BY3PR05CA0001.outlook.office365.com
 (2603:10b6:a03:254::6) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.245.10 via Frontend Transport; Tue,
 21 Jul 2026 21:20:24 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.195)
 smtp.mailfrom=list.ti.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=list.ti.com;
Received-SPF: Pass (protection.outlook.com: domain of list.ti.com designates
 198.47.23.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.195; helo=lewvzet201.ext.ti.com; pr=C
Received: from lewvzet201.ext.ti.com (198.47.23.195) by
 SJ1PEPF000026C3.mail.protection.outlook.com (10.167.244.100) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.245.5 via Frontend Transport; Tue, 21 Jul 2026 21:20:24 +0000
Received: from DLEE214.ent.ti.com (157.170.170.117) by lewvzet201.ext.ti.com
 (10.4.14.104) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Tue, 21 Jul
 2026 16:20:23 -0500
Received: from DLEE209.ent.ti.com (157.170.170.98) by DLEE214.ent.ti.com
 (157.170.170.117) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Tue, 21 Jul
 2026 16:20:23 -0500
Received: from fllvem-mr07.itg.ti.com (10.64.41.89) by DLEE209.ent.ti.com
 (157.170.170.98) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37 via Frontend
 Transport; Tue, 21 Jul 2026 16:20:23 -0500
Received: from fllvdckhpci031.itg.ti.com (fllvdckhpci031.itg.ti.com [10.64.72.41])
	by fllvem-mr07.itg.ti.com (8.18.1/8.18.1) with ESMTP id 66LLKN273061676;
	Tue, 21 Jul 2026 16:20:23 -0500
Received: by fllvdckhpci031.itg.ti.com (Postfix, from userid 60899)
	id 4DBA79ACF4; Tue, 21 Jul 2026 16:20:23 -0500 (CDT)
From: PRC Automation <prc@list.ti.com>
To: Ryan Eatmon <reatmon@ti.com>
CC: Praneeth Bajjuri <praneeth@ti.com>,
        Denys Dmytriyenko
	<denys@konsulko.com>,
        <meta-arago@lists.yoctoproject.org>
Subject: Re: [meta-arago][master][PATCH] meson: Fix patch for v1.11.2
Date: Tue, 21 Jul 2026 16:20:23 -0500
Message-ID: <20260721212023.3822190-1-prc@list.ti.com>
X-Mailer: git-send-email 2.43.5
In-Reply-To: <20260721211350.3360100-1-reatmon@ti.com>
References: <20260721211350.3360100-1-reatmon@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF000026C3:EE_|DS0PR10MB6174:EE_
X-MS-Office365-Filtering-Correlation-Id: d8fbcd72-524b-47c9-68e8-08dee76de0c8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|82310400026|376014|23010399003|36860700016|1800799024|6133799003|18002099003|22082099003|56012099006|10067099003;
X-Microsoft-Antispam-Message-Info: 
	E1AdSICEzlBWdNEBSmgYSKp/shnf6z+NB8l7BO4Ky7eXzam2hpzQZe9Pei1yfX8F12Qeuzkr7j3c7qjosFiV5RLoqHKFbGZL/ZuX6Hu7mn6Yas190LsXva64o7ER6f01GE7StH2dwH8/wObT0MfJNDA1fPYCBV1tsr1LCBQSBcXDf6TVYsfPOBlt0zFSxmWMZp3oYvYujXjwv/BrYNEbFBSfcsFVNbsNIT7NLSlzFTvF3YwiRperQMYz2d8NL7TX1ACB7f70+hI+h48+DC9xEWn0c97Iv2GtBl2gNw+7ftofMYEVNfHpYes+BoJWiSXbKslOT1UeJpNEDnRW13Scw7yYnDYxTrBM/F0Inw5gP0IREO9axt4JIXoEq+Kx+n2MxcO+QvPYgPRujRr+2n1Mbov+6OuDd5IeEAVyLtJAhwmusJXrdr7PZ9DSOW4tpcHUc02esOB43UsceXae2yEZKA5pBTRCR2frfMZ0bcZZSdntputRjWAnuchprzpAW36JzYvcF1iqZeK5+HSSaLEpRn1ysS4XIYyoPflevQS7ysImzY4Ztwlcfx31YU1ZDrxyMVlAA4gXYJo92dqwa9TN6v3KcYRNey00T16hSRC/A2bqPjP0PilKau87KtLO4hIY8aMy8mRWJGycwyREIV/ix90a8h7JEPJWw/OAhRiZ8DHhnyB6VAf7qBIH9aXlN9Sx59UmCFeHHjlDme0UbfbLew==
X-Forefront-Antispam-Report: 
	CIP:198.47.23.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet201.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(376014)(23010399003)(36860700016)(1800799024)(6133799003)(18002099003)(22082099003)(56012099006)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	jTxSsGYhm32PdzIpUq6m/AtHA2cJ2Pg/gJtXyMhwpidd0RYhK01iRjDDK8/yusX8o5zfshgcQ77533TLjaGvYFGhPUM3Qi88NDtLB4YizGj7aTY0HYDQgNCxjyUE1lF3MdAO98BE9zuAoKazq1M4AgqvBE/36S7pLLKUqO61TzzJtgAlgxCi9mSaAxub6b16oSLo4VZz58BWr7g7oWxMWgYFKGDTQn6eKQQXySHWkArxAiRbSBmBqt55kwYG48ONIxtegVKaYwsvq39cFNKKljjYB2qHrnObTaNv/EGdj3bvLdM4rEvkIZ7aBy6yzCoKCEhEf+ON0eFmy8fMBHHW02zIVXNRGJkEcgO1OSN7rE5HXfid2/FkZU9CP9zToY9L8FGwm39fB1NozvPFlKVMbLmSmf6QoFhBomCDvJnYg8jBdZZHX9sd1N67AAuIgHAO
X-Exchange-RoutingPolicyChecked: 
	J2/gsMK4IDX3640/qAYYF4ALeOMIWRx+Ok86QfNlR/VFVuoQ5OETkJGxBXqNwvdG9WXyKt/iQ8SI9mNYhCIlGAIS5ZdQ+xydAAIkpzamhJ8n3GfCTKshP7jaIVFRcClOuJi989O4NOHLHNDzT7/MvHzDL8a7+LdIhmhBjQ6wujzCU0mNm0m6s7iH8TbrZPs3g0MnvcUlFg4yGlAzOf3J3ZCvgNNHDjHJDMos83dvuOpnZGsCCWiktxLNl2j8QzcoLqvpLDgIQdGJLXr48LYx1EM8sUlkv3TbwrDxgEmDlVeEarxlDYNQujzd+aqr6G+uPyeZNbptv+peQv+uOut1tA==
X-OriginatorOrg: list.ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Jul 2026 21:20:24.0576
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d8fbcd72-524b-47c9-68e8-08dee76de0c8
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.195];Helo=[lewvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	SJ1PEPF000026C3.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR10MB6174
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIxMDIyMSBTYWx0ZWRfX7V31hvMS1VwH
 rjyLMwP9trz0p74Uvn8JCV+HysA4xS88Z/qxs/B+vwLDlhGIP1je2aOlIZokUaCtIak4f0vA/8v
 WWQVRfRwOhhltg9NAZ3X/4XHhr84mlI=
X-Proofpoint-ORIG-GUID: F1XnfYa0UWzdJ1ZnzeeTBpW2G-nUcZVl
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIxMDIyMSBTYWx0ZWRfX85anJ7jqyIvD
 2RqjlvwHmSHbun/J7Q3Uc2McLx8w10lbhnjLQzLta0X/s4p1ow6UsV63zT+iwIJ+lxQR/A5gOnk
 VSWe5r8Ts9Kp3FgcBNC71kP9bOzp4faVtiC816BzUflfKS9XbKkc8LM3HNYGB2Mv4U0V8/PgoaO
 HOREk9CdXdZy402iFMOIwdP3ianPbH+ub6cqQK+fynNFz7DY/nQ7xcFFbzg9TSJJrukwQFxoWx4
 xRTIDCQTJbsuaWGVdCe4EZWB6jr9mmeWU14MwdqoXkNJnPbxO11UWGq08TkqOVBPL0O4tg4nBZv
 WZR45s1lW7dNbJBk9qr9WDFHA0KfyIpDy29GRtwcUWx9Zlq37LDpPzkODMwuzLIUV4rDuFFgk2k
 Tnx6crnMdi7DsF7x1Sr2TNLkenhLIbLuuQf+yScsy0SqmED0jD+VXGHyM4gnF0Gcwhw/JTRcI5F
 UuUYqMpMIpyS/C2DOuA==
X-Proofpoint-GUID: F1XnfYa0UWzdJ1ZnzeeTBpW2G-nUcZVl
X-Authority-Analysis: v=2.4 cv=MbFcfZ/f c=1 sm=1 tr=0 ts=6a5fe2a0 cx=c_pps
 a=w8e6fJRD9yN2bKWo9pBaJQ==:117 a=f+v6EHfkeJbVwR46tk4DMg==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=RAioF0-LDSMA:10 a=s63m1ICgrNkA:10
 a=Vs-ZokuVWRQA:10 a=VkNPw1HP01LnGYTKEx00:22 a=Z8NIEmU8O1QQgoT56wFK:22
 a=jwouBfj2j3NM8CExmVVE:22 a=sozttTNsAAAA:8 a=XYHafqtSOsTbNBGIUeMA:9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-21_04,2026-07-21_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 adultscore=0 phishscore=0 bulkscore=0 impostorscore=0
 lowpriorityscore=0 priorityscore=1501 malwarescore=0 spamscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607210221
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Tue, 21 Jul 2026 21:20:45 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/17593

meta-arago / na / 20260721211350.3360100-1-reatmon

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
- Patch Series: [meta-arago][master][PATCH] meson: Fix patch for v1.11.2
- Submitter: From: Ryan Eatmon <reatmon@ti.com>
- Date: Date: Tue, 21 Jul 2026 16:13:50 -0500
- Num Patches: 1
- Mailing List (public inbox) Commit SHA: 0ca687912a745903b1f59f6c7850ccd18b70ded3

Applied to:
- Repository: lcpd-prc-meta-arago
- Base Branch: master-wip
- Commit Author: Ryan Eatmon <reatmon@ti.com>
- Commit Subject: meson: Fix patch for v1.11.2
- Commit SHA: 5786515d7dd3dbced3968f963d039c6bd5298bfd

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
ERROR: <build-dir>/sources/meta-ti/meta-ti-extras/recipes-ti/devtools/ti-cgt470_4.6.6.bb: QA Issue: ti-cgt470: LICENSE contains a reference to license(s) LicenseRef-TI for which no generic license was found [license-format]




