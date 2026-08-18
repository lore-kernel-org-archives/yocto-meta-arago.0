Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 20AAAC5DF81
	for <webhook@archiver.kernel.org>; Tue, 18 Aug 2026 20:05:51 +0000 (UTC)
Received: from mx0b-0002e601.pphosted.com (mx0b-0002e601.pphosted.com [148.163.154.28])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.17650.1787083546057572362
 for <meta-arago@lists.yoctoproject.org>;
 Tue, 18 Aug 2026 13:05:46 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=proofpoint-05-2026 header.b=cTCWapZk;
 dkim=pass header.i=@ti.com header.s=selector1 header.b=czpceKKl;
 spf=pass (domain: ti.com, ip: 148.163.154.28, mailfrom: reatmon@ti.com)
Received: from pps.filterd (m0374955.ppops.net [127.0.0.1])
	by mx0b-0002e601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67IJUxxW487901;
	Tue, 18 Aug 2026 15:05:43 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=
	content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=proofpoint-05-2026; bh=HpIDjdUadBwqR
	8hzDbXJfgSrPZA55/FNoUf6AZMVMFY=; b=cTCWapZkssxESQ6songZK7N+nhMYx
	J2nuVFpMLmHmTCGU8Zq1ywiOhlXU6lOkmHKNsDV4lw8tuDIoVaQYHw3CaOe32Ip9
	yQIO2aQZvF5M1ENIu/wmSXKZ4TpEVN25xoeAIbs94E3ZxoY2JnhzXWs57CR2/KJE
	OPNEnypn/oAlvaw866qtOODZcVkmbqScfTqgZ8n9GoBLnf4+HTdQh6Jeyxm0nux5
	1ZU1A/x7dDmnoJT5a0Mder01rr+Vb72difjlS6WXQc/GDOD0tGYdvx63pisL0JWs
	DUP6mHaoy+W79pNtgaA9dp+8lwFMhtDQo51KHcvmXnm5dr8ACScTC2VCA==
Received: from bn8pr05cu002.outbound.protection.outlook.com (mail-eastus2azon11011047.outbound.protection.outlook.com [52.101.57.47])
	by mx0b-0002e601.pphosted.com (PPS) with ESMTPS id 4g4k73v49p-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Tue, 18 Aug 2026 15:05:42 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WBHWK/nMoIzRHbLVNRmKf7W5M+iTo/lbVRhp4tqAn9wkrwRMAqc+xKaiLQCM0WgsrHc6dsgzPLnkntdGqUJCftPuSxVVqa9FpogM0NPV6CP8jk0AWbQDxnQGOtsC/QRFaCeQQ2gr9DIoCS0bLa6qIq+okzRSwb96UVpKR6DP1MrnyZXS1Gpcgv0spsA1N6POz12y2u/y7pD+1a9ObDLcPV81hDDL7PtvsQummq6ERFkKrkliPHbIBBWTNQoYaUVvpZuy+khg+wnZhpfrxysyxWJdnetkspm9wTcCFpWnO7bInMd2HvOtMipSUX55Ga1g1ly71geXZ774bLkHOljhVw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HpIDjdUadBwqR8hzDbXJfgSrPZA55/FNoUf6AZMVMFY=;
 b=kZMlHXcZlMVMee97OvAdOdWNLrGiKAoWoUba3tYm8r3+UHyY8v71/Ue31OtELPRVU3YQILubpAkkjhYjaP2kYImM5r6SscH4HrVPG4p4Xt31JT5+VtMCo6CDHwFcEZrdswtNwHoieco9YFlj2CW+huS36QoPUn4hv3670cRT04Nv+K8NSg+MpRfnyITJYEj2pHWejkP/yhzSjH1Nq6uLwpycJB7cDp+lXTa9kaDri49DlkVJ2N41iLCpuLMhaAe1/63yoG2ooqxDJdGS5kySaDHsWJgg6F/ATef5ZR8QjF1eqf7X0nEjVA2jvHq/EMujGY1kSNclmiEfGn5NMXVcsw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.195) smtp.rcpttodomain=lists.yoctoproject.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HpIDjdUadBwqR8hzDbXJfgSrPZA55/FNoUf6AZMVMFY=;
 b=czpceKKlIlZZs9rMLOov7z7baZiJphYXMGhD8zkZYD21+wtHgxesE9cEPnux84HBIvFDVCTnIR9+RI4tmiPEJL6IslxMUTAntOJVUzmkRi0aCtu5jmU+oBJpEUiLelm22zNbfMDXNpP2f6jF5+4qvcicsAC85bW+smQRP7u/ipc=
Received: from DS1PR03CA0013.namprd03.prod.outlook.com (2603:10b6:8:450::6) by
 DM6PR10MB4363.namprd10.prod.outlook.com (2603:10b6:5:21e::21) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.339.8; Tue, 18 Aug 2026 20:05:40 +0000
Received: from DM2PEPF00003FC2.namprd04.prod.outlook.com
 (2603:10b6:8:450:cafe::87) by DS1PR03CA0013.outlook.office365.com
 (2603:10b6:8:450::6) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.339.8 via Frontend Transport; Tue, 18
 Aug 2026 20:05:40 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.195; helo=flwvzet201.ext.ti.com; pr=C
Received: from flwvzet201.ext.ti.com (198.47.21.195) by
 DM2PEPF00003FC2.mail.protection.outlook.com (10.167.23.20) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.339.3 via Frontend Transport; Tue, 18 Aug 2026 20:05:40 +0000
Received: from DFLE213.ent.ti.com (10.64.6.71) by flwvzet201.ext.ti.com
 (10.248.192.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Tue, 18 Aug
 2026 15:05:14 -0500
Received: from DFLE205.ent.ti.com (10.64.6.63) by DFLE213.ent.ti.com
 (10.64.6.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Tue, 18 Aug
 2026 15:05:14 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DFLE205.ent.ti.com
 (10.64.6.63) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45 via Frontend
 Transport; Tue, 18 Aug 2026 15:05:14 -0500
Received: from grumpy (grumpy.dhcp.ti.com [128.247.81.229])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 67IK5EKN1001011;
	Tue, 18 Aug 2026 15:05:14 -0500
Received: from reatmon by grumpy with local (Exim 4.97)
	(envelope-from <reatmon@ti.com>)
	id 1wwQ3e-0000000GcR9-1bxP;
	Tue, 18 Aug 2026 15:05:14 -0500
From: Ryan Eatmon <reatmon@ti.com>
To: Praneeth Bajjuri <praneeth@ti.com>,
        Denys Dmytriyenko
	<denys@konsulko.com>,
        <meta-arago@lists.yoctoproject.org>
Subject: [meta-arago][master][PATCH] open62541: Update verion to 1.5.6
Date: Tue, 18 Aug 2026 15:05:14 -0500
Message-ID: <20260818200514.3960992-1-reatmon@ti.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM2PEPF00003FC2:EE_|DM6PR10MB4363:EE_
X-MS-Office365-Filtering-Correlation-Id: 99088730-765c-4370-6717-08defd6413a4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|36860700016|376014|82310400026|23010399003|18002099003|10067099003|56012099006;
X-Microsoft-Antispam-Message-Info: 
	+U9gP6LfKdwV/FntgaBZ1WGQTd+vuL2rvaeLXDY5dc3suHiki9pq11lT1zK5JpEt1n7s/2ZPCte4F83l/2O9j02yM5A3geA6nhGPcSVM4YdL2L1AVlXqa+vFQYBt9RNsE2umwCeNpULisfQbhoxK2fXP4JT+oRtEp+5agGHtXbr3NVd83dpItDjT4U0UybUxwFH2MOcJIN6+C1xp9qeWtzvuU9iC6rR6OBKNLDiM8nfDr+aHcgm5NGDpwj6k89I7HowinrgAvrobpS7FSUqHhvdCuG7szpzyvO/V3j7ibecs2HrKT3IyoKewQ+7MdX+NBpYdyXKzQJhZy1ITPsB8aspvkP6oI1D7HquCoMjeP+Q1tfLZk0u58azBt6jsCSKBYw6rr/41thPfXsQC5sPvJqvDkYM58BSbAtHsef6CZsSPWiinO5Mmc4ZdZmRZ0GhjOzTf6lHPKZUg2WrhBzI7ftPI7JSbry7GngidIylkJo8/scm3zEnk4P+i8VWIdtxGRIANw0Hr87ZykNqYc0o8DI8qGQWE0ahc+k/4EvduhPgH6cOtMzIFyWUfmEcuywPWTqIThPIEqNJ0MHiFyYK3iBSYxVUPKpHD5ayvJ+fHIpLn7ESKweg2ra+giqeGJLl6rYHqwp6PuYMT1T6rV53ooXnHHmldhsu3LVsGt/okXBJckzvZeZ8sNmmnSWWUSMb7ouUeSwVwSwbpOsN7+9Kw+w==
X-Forefront-Antispam-Report: 
	CIP:198.47.21.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet201.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(1800799024)(36860700016)(376014)(82310400026)(23010399003)(18002099003)(10067099003)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	ffnQ7/wWkN9pDol7/BSNMq0jvF81HtL69Ppfk/r3KewUR3tYbxMjvd8OwZbY4YyZIJUYRcxMrF13PM49oMQAMs7DJ92t95vNuDOFeIZM8NtEgjnI5lFSwEe5vEfXSzHSBASVfPgc1IBjiMN4O5LcJVCfwhNXiYv/9QsNxJ5pAKxxLQzba5Ov2wYdL2XTcn5XzFw0L36/vHC/ukEhOjBTPw0IkLA70AtbiI58REwy0N/Q8wAQjxpWS6C9Tkia+CymEtYYuuT8foMZMVIHZbsFgSx24xTNuWP/0VRmbH/6l3omJ25aNb8/kL14l+KBt9buPPa7ufv3rfo5m1ueEfyErip74lL855hozUuRAYsqMb/t3L8lXIXoHC7IqO3gzpbdoZEaFm3LewhQLb8LHXZasUHqc3iAqi9olK8AmisCkvY3P4bOGz3ctXl6fye+zn7n
X-Exchange-RoutingPolicyChecked: 
	sQzrWXiXmIvt4qBo1pQ6yexq7Y2+WlbAsyN881sImwAJ9OdIq0aj2V98fSYSsfRDycioZKwbrmOZCWmJbHuI4QQOgLEoAhVjGMMsf/h9Pw7kB63/W14+uSce2CxXaQsegbJ/dKV42CNySeK4o/dIgUUMJc/DHR2tjONhEOdbSesyynfaP01jt0gDOCkHsOt90Xc8phRlNjlQtdl+q5dzALqchc/mALooA/FPYkch33IspbMcbzlpIu8LbirQ4G1uQr1r1dngrdhcxpo8IZ5VwBwuZTgl4YELnVwGF/g0hMUmRAllyMQFd8M3sHXAbBKQKcV3i9VpOLtfYWR13KW17w==
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Aug 2026 20:05:40.0268
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 99088730-765c-4370-6717-08defd6413a4
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.195];Helo=[flwvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DM2PEPF00003FC2.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR10MB4363
X-Proofpoint-Spam-Info: AW1haW4tMjYwODE4MDE0NyBTYWx0ZWRfXwjKRD3o6xV94
 8O37YPrPFEOPHveLNxEZbTUkYW/4TkRnvAdnd/iVN6aFIVyb+xM7v3Ml2p7OKRPYXvB8L/CqGx+
 CnwhuxXJwASsamlnqLwZoxlEWJCag6g=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODE4MDE0NyBTYWx0ZWRfX6iMdwFJcH7o1
 xLNFOR+Kava0P1eLJCfrd9kjQ77gardrYClmZTPsaajJLmm+D/OgcpOAVcQvBz7qzQrBja5JyfW
 IZAIYrGIsg90p7KUag3QjdSrvPRxp8GjdO9abuUdjyjucv1Gz2WD1jfscJnZvfLsaN8ONvDa9MP
 h9mfErVVxybAvIvxqBYQYXZX7XqvC0HGogQE2P4O2TCVknTPr6ZKcvi/a4aBSTuO9HGjx5NPOgT
 XkHgqHFiAu7X1iIozkNcTDa4Vq4TDjYbb5nKcB0LtS+Ev50E0um2Ilc3jQFYC574LByYJ6Ws4HA
 hMrkiaeXvGzXH714XnQGNcc81Op9GD/TezLinp2w9EGaI5vQF0f/Nbp53sxxUuJeT5Rq2rsSQFy
 yJMUWGW9YVCeNZ0OB5jlt1xCIJVHUE/N4bg2MQgXr2N4JQnMqwXPsfGM3YS51Z9SIf499FKp+fR
 W8yWsndC4BPgIHsEE4g==
X-Proofpoint-GUID: hx_z8xQpX9qATGR8ot2xldtNj8LFnUwx
X-Authority-Analysis: v=2.4 cv=CZI4Irrl c=1 sm=1 tr=0 ts=6a84bb16 cx=c_pps
 a=ss0k+GDJiFel2I5peBRHfg==:117 a=tJyPKKxUohctrY4NYmUjkA==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=Sv0fKeRqtYgA:10 a=V5UXEbMT0ywA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Z8NIEmU8O1QQgoT56wFK:22 a=fPAWb5peG099m5CrUpKH:22
 a=Q4-j1AaZAAAA:8 a=sozttTNsAAAA:8 a=vwKekD3E4piFQ179sXAA:9
 a=9H3Qd4_ONW2Ztcrla5EB:22
X-Proofpoint-ORIG-GUID: hx_z8xQpX9qATGR8ot2xldtNj8LFnUwx
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-18_04,2026-08-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 clxscore=1015 malwarescore=0 impostorscore=0 adultscore=0
 suspectscore=0 lowpriorityscore=0 spamscore=0 priorityscore=1501 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608180147
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Tue, 18 Aug 2026 20:05:51 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/17601

A recent change in meta-openembedded [1] buped the version to 1.5.6.  We
need to update our bbappend to match.

[1] https://git.openembedded.org/meta-openembedded/commit/?id=a65f087d1e8eec478481bc53dbbd5bbd6bc5a7de

Signed-off-by: Ryan Eatmon <reatmon@ti.com>
---
 .../{open62541_1.5.4.bbappend => open62541_1.5.6.bbappend}        | 0
 1 file changed, 0 insertions(+), 0 deletions(-)
 rename meta-arago-extras/recipes-connectivity/open62541/{open62541_1.5.4.bbappend => open62541_1.5.6.bbappend} (100%)

diff --git a/meta-arago-extras/recipes-connectivity/open62541/open62541_1.5.4.bbappend b/meta-arago-extras/recipes-connectivity/open62541/open62541_1.5.6.bbappend
similarity index 100%
rename from meta-arago-extras/recipes-connectivity/open62541/open62541_1.5.4.bbappend
rename to meta-arago-extras/recipes-connectivity/open62541/open62541_1.5.6.bbappend
-- 
2.43.0


